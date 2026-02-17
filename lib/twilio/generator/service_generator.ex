defmodule Twilio.Generator.ServiceGenerator do
  @moduledoc false

  alias Twilio.Generator.Naming

  @doc "Generate a service module source string."
  @spec generate(map(), String.t(), String.t() | nil, String.t()) :: String.t()
  def generate(resource, product, version, base_url) do
    nesting = resource[:nesting] || []
    module_name = Naming.service_module(product, version, resource.name, nesting)
    has_operations = resource.operations != []

    # Resource module for deserialization (only when properties exist)
    resource_mod =
      if resource.properties != [],
        do: Naming.resource_module(product, version, resource.name, nesting),
        else: nil

    operations = generate_operations(resource, base_url, resource_mod)

    aliases =
      if has_operations do
        lines = ["  alias Twilio.Client"]
        lines = if resource_mod, do: lines ++ ["  alias Twilio.Deserializer"], else: lines
        "\n" <> Enum.join(lines, "\n") <> "\n"
      else
        ""
      end

    moduledoc_attr =
      if has_operations do
        moduledoc = generate_moduledoc(resource)
        "  @moduledoc \"\"\"\n#{moduledoc}\n  \"\"\""
      else
        "  @moduledoc false"
      end

    defmodule_line = "defmodule #{inspect(module_name)} do"
    credo_disable = credo_line_length_disable(defmodule_line)

    """
    # File generated from Twilio's OpenAPI spec — do not edit manually
    #{credo_disable}#{defmodule_line}
    #{moduledoc_attr}
    #{aliases}
    #{operations}
    end
    """
  end

  defp generate_moduledoc(resource) do
    desc =
      case resource[:description] do
        nil -> "Service for #{resource.name} API operations."
        "" -> "Service for #{resource.name} API operations."
        d -> d
      end

    lines = ["  #{desc}"]

    # List available operations
    op_names = Enum.map(resource.operations, fn op -> "`#{op.name}`" end)

    lines =
      if op_names != [] do
        lines ++ ["", "  Operations: #{Enum.join(op_names, ", ")}"]
      else
        lines
      end

    Enum.join(lines, "\n")
  end

  defp generate_operations(resource, base_url, resource_mod) do
    sid_param = Map.get(resource, :sid_param)

    Enum.map_join(resource.operations, "\n", fn op ->
      generate_operation(op, resource, base_url, sid_param, resource_mod)
    end)
  end

  defp generate_operation(%{name: :create} = op, resource, base_url, sid_param, resource_mod) do
    parent_params = build_parent_params(resource.path_params)
    path_expr = build_path_expr(op.path, sid_param)
    content_type = op.content_type
    return_type = return_type(resource_mod)
    doc = generate_operation_doc(op, resource.name)

    body =
      request_with_deserialize(
        "Client.request(client, :post, #{path_expr},
          params: params,
          opts: opts,
          base_url: \"#{base_url}\",
          content_type: #{inspect(content_type)}
        )",
        resource_mod
      )

    """
    #{doc}
      @spec create(Client.t(), #{parent_spec(resource.path_params)}map(), keyword()) ::
              {:ok, #{return_type}} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
      def create(client#{parent_params}, params \\\\ %{}, opts \\\\ []) do
        #{body}
      end
    """
  end

  defp generate_operation(%{name: :list} = op, resource, base_url, sid_param, resource_mod) do
    parent_args = build_parent_args(resource.path_params)
    parent_params = build_parent_params(resource.path_params)
    path_expr = build_path_expr(op.path, sid_param)
    page_key = resource.page_key || "items"
    doc = generate_operation_doc(op, resource.name)

    stream_doc = generate_stream_doc(op)

    stream_fn = """
    #{stream_doc}
      @spec stream(Client.t(), #{parent_spec(resource.path_params)}map(), keyword()) :: Enumerable.t()
      def stream(client#{parent_params}, params \\\\ %{}, opts \\\\ []) do
        Twilio.Page.stream(fn page_opts ->
          list(client#{parent_args}, Map.merge(params, page_opts), opts)
        end, "#{page_key}")
      end
    """

    page_ok =
      if resource_mod do
        mod_str = inspect(resource_mod)

        """
              {:ok, data} ->
                page = Twilio.Page.from_response(data, "#{page_key}")
                {:ok, %{page | items: Deserializer.deserialize_list(page.items, #{mod_str})}}
        """
      else
        "      {:ok, data} -> {:ok, Twilio.Page.from_response(data, \"#{page_key}\")}"
      end

    """
    #{doc}
      @spec list(Client.t(), #{parent_spec(resource.path_params)}map(), keyword()) ::
              {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
      def list(client#{parent_params}, params \\\\ %{}, opts \\\\ []) do
        case Client.request(client, :get, #{path_expr},
               params: params,
               opts: opts,
               base_url: "#{base_url}"
             ) do
    #{page_ok}
          error -> error
        end
      end

    #{stream_fn}
    """
  end

  defp generate_operation(%{name: :fetch} = op, resource, base_url, sid_param, resource_mod) do
    parent_params = build_parent_params(resource.path_params)
    path_expr = build_path_expr(op.path, sid_param)
    return_type = return_type(resource_mod)
    doc = generate_operation_doc(op, resource.name)

    request = "Client.request(client, :get, #{path_expr},
          opts: opts,
          base_url: \"#{base_url}\"
        )"

    body = request_with_deserialize(request, resource_mod)

    if sid_param do
      """
      #{doc}
        @spec fetch(Client.t(), #{parent_spec(resource.path_params)}String.t(), keyword()) ::
                {:ok, #{return_type}} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
        def fetch(client#{parent_params}, sid, opts \\\\ []) do
          #{body}
        end
      """
    else
      """
      #{doc}
        @spec fetch(Client.t(), #{parent_spec(resource.path_params)}keyword()) ::
                {:ok, #{return_type}} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
        def fetch(client#{parent_params}, opts \\\\ []) do
          #{body}
        end
      """
    end
  end

  defp generate_operation(%{name: :update} = op, resource, base_url, sid_param, resource_mod) do
    parent_params = build_parent_params(resource.path_params)
    path_expr = build_path_expr(op.path, sid_param)
    content_type = op.content_type
    return_type = return_type(resource_mod)
    doc = generate_operation_doc(op, resource.name)

    request = "Client.request(client, :post, #{path_expr},
          params: params,
          opts: opts,
          base_url: \"#{base_url}\",
          content_type: #{inspect(content_type)}
        )"

    body = request_with_deserialize(request, resource_mod)

    if sid_param do
      """
      #{doc}
        @spec update(Client.t(), #{parent_spec(resource.path_params)}String.t(), map(), keyword()) ::
                {:ok, #{return_type}} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
        def update(client#{parent_params}, sid, params \\\\ %{}, opts \\\\ []) do
          #{body}
        end
      """
    else
      """
      #{doc}
        @spec update(Client.t(), #{parent_spec(resource.path_params)}map(), keyword()) ::
                {:ok, #{return_type}} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
        def update(client#{parent_params}, params \\\\ %{}, opts \\\\ []) do
          #{body}
        end
      """
    end
  end

  defp generate_operation(%{name: :delete} = op, resource, base_url, sid_param, _resource_mod) do
    parent_params = build_parent_params(resource.path_params)
    path_expr = build_path_expr(op.path, sid_param)
    doc = generate_operation_doc(op, resource.name)

    if sid_param do
      """
      #{doc}
        @spec delete(Client.t(), #{parent_spec(resource.path_params)}String.t(), keyword()) ::
                {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
        def delete(client#{parent_params}, sid, opts \\\\ []) do
          Client.request(client, :delete, #{path_expr},
            opts: opts,
            base_url: "#{base_url}"
          )
        end
      """
    else
      """
      #{doc}
        @spec delete(Client.t(), #{parent_spec(resource.path_params)}keyword()) ::
                {:ok, map()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
        def delete(client#{parent_params}, opts \\\\ []) do
          Client.request(client, :delete, #{path_expr},
            opts: opts,
            base_url: "#{base_url}"
          )
        end
      """
    end
  end

  defp generate_operation_doc(op, resource_name) do
    desc = op.description || default_description(op.name, resource_name)

    [desc]
    |> append_meta_line(op)
    |> append_request_params_doc(op.request_params)
    |> append_query_params_doc(op.query_params)
    |> Enum.join("\n")
    |> then(fn doc_text -> "  @doc \"\"\"\n  #{doc_text}\n  \"\"\"" end)
  end

  defp append_meta_line(sections, op) do
    meta_parts =
      []
      |> maybe_append_meta(op[:operation_id], fn id -> "Operation: `#{id}`" end)
      |> maybe_append_meta(op[:tags], fn
        [] -> nil
        tags -> "Tags: #{Enum.join(tags, ", ")}"
      end)
      |> Enum.reject(&is_nil/1)

    if meta_parts != [] do
      sections ++ ["", Enum.join(meta_parts, " | ")]
    else
      sections
    end
  end

  defp append_request_params_doc(sections, []), do: sections

  defp append_request_params_doc(sections, params) do
    required = Enum.filter(params, & &1.required)
    optional = Enum.reject(params, & &1.required)

    parts =
      param_section("Required Parameters", required) ++
        param_section("Optional Parameters", optional)

    sections ++ ["" | parts]
  end

  defp param_section(_title, []), do: []

  defp param_section(title, params) do
    rows = Enum.map(params, &param_table_row/1)

    [
      "## #{title}\n",
      "| Parameter | Type | Description |",
      "|-----------|------|-------------|"
      | rows
    ]
  end

  defp append_query_params_doc(sections, []), do: sections

  defp append_query_params_doc(sections, params) do
    filter_params =
      Enum.reject(params, fn p -> p.name in ["PageSize", "Page", "PageToken"] end)

    if filter_params == [] do
      sections
    else
      rows = Enum.map(filter_params, &query_param_table_row/1)

      sections ++
        [
          "",
          "## Query Parameters\n",
          "| Parameter | Type | Description |",
          "|-----------|------|-------------|"
          | rows
        ]
    end
  end

  defp generate_stream_doc(list_op) do
    desc =
      case list_op.description do
        nil -> "Stream all resources with lazy auto-pagination."
        d -> "Stream: #{d} (lazy auto-pagination)."
      end

    "  @doc \"#{sanitize_doc_string(desc)}\""
  end

  defp param_table_row(param) do
    type_str = format_param_type(param)
    desc = sanitize_table_cell(param.description || "")

    desc =
      case param.enum_values do
        nil -> desc
        values -> desc <> " Values: `#{Enum.join(values, "`, `")}`"
      end

    "| `#{param.name}` | #{type_str} | #{desc} |"
  end

  defp query_param_table_row(param) do
    type_str = format_param_type(param)
    desc = sanitize_table_cell(param.description || "")
    "| `#{param.name}` | #{type_str} | #{desc} |"
  end

  defp format_param_type(param) do
    base = type_label(param.type)

    case param[:format] do
      nil -> base
      fmt -> "#{base} (#{fmt})"
    end
  end

  defp type_label(:string), do: "string"
  defp type_label(:integer), do: "integer"
  defp type_label(:float), do: "number"
  defp type_label(:boolean), do: "boolean"
  defp type_label(:list), do: "array"
  defp type_label(:map), do: "object"
  defp type_label(_), do: "string"

  defp default_description(:create, name), do: "Create a new #{name}."
  defp default_description(:list, name), do: "List #{name} resources."
  defp default_description(:fetch, name), do: "Fetch a #{name}."
  defp default_description(:update, name), do: "Update a #{name}."
  defp default_description(:delete, name), do: "Delete a #{name}."

  # Generate request call with optional deserialization wrapping
  defp request_with_deserialize(request, nil), do: request

  defp request_with_deserialize(request, resource_mod) do
    mod_str = inspect(resource_mod)

    "with {:ok, data} <- #{request} do\n      {:ok, Deserializer.deserialize(data, #{mod_str})}\n    end"
  end

  defp return_type(nil), do: "map()"
  defp return_type(mod), do: "#{inspect(mod)}.t()"

  # Build interpolated path expression.
  defp build_path_expr(path, sid_param) do
    result =
      Regex.replace(~r/\{(\w+)\}/, path, fn _full, param ->
        cond do
          param == "AccountSid" -> "\#{client.account_sid}"
          param == sid_param -> "\#{sid}"
          true -> "\#{#{Macro.underscore(param)}}"
        end
      end)

    ~s("#{result}")
  end

  defp build_parent_params([]), do: ""

  defp build_parent_params(params) do
    Enum.map_join(params, fn p -> ", #{Macro.underscore(p)}" end)
  end

  defp build_parent_args([]), do: ""

  defp build_parent_args(params) do
    Enum.map_join(params, fn p -> ", #{Macro.underscore(p)}" end)
  end

  defp parent_spec([]), do: ""

  defp parent_spec(params) do
    Enum.map_join(params, fn _ -> "String.t(), " end)
  end

  defp sanitize_table_cell(text) do
    text
    |> String.replace("\n", " ")
    |> String.replace("|", "\\|")
  end

  defp sanitize_doc_string(text) do
    text
    |> String.replace("\\", "\\\\")
    |> String.replace("\"", "\\\"")
  end

  defp maybe_append_meta(list, nil, _fun), do: list
  defp maybe_append_meta(list, value, fun), do: list ++ [fun.(value)]

  @max_line_length 120

  defp credo_line_length_disable(line) do
    if String.length(line) > @max_line_length do
      "# credo:disable-for-next-line Credo.Check.Readability.MaxLineLength\n"
    else
      ""
    end
  end
end
