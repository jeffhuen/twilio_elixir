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
      if length(resource.properties) > 0,
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

    moduledoc = generate_moduledoc(resource)

    """
    # File generated from Twilio's OpenAPI spec — do not edit manually
    defmodule #{inspect(module_name)} do
      @moduledoc \"\"\"
    #{moduledoc}
      \"\"\"
    #{aliases}
    #{operations}
    end
    """
  end

  defp generate_moduledoc(resource) do
    desc = resource[:description] || "Service for #{resource.name} API operations."
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

    resource.operations
    |> Enum.map(fn op -> generate_operation(op, resource, base_url, sid_param, resource_mod) end)
    |> Enum.join("\n")
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
              {:ok, #{return_type}} | {:error, Twilio.Error.t()}
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
              {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
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
                {:ok, #{return_type}} | {:error, Twilio.Error.t()}
        def fetch(client#{parent_params}, sid, opts \\\\ []) do
          #{body}
        end
      """
    else
      """
      #{doc}
        @spec fetch(Client.t(), #{parent_spec(resource.path_params)}keyword()) ::
                {:ok, #{return_type}} | {:error, Twilio.Error.t()}
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
                {:ok, #{return_type}} | {:error, Twilio.Error.t()}
        def update(client#{parent_params}, sid, params \\\\ %{}, opts \\\\ []) do
          #{body}
        end
      """
    else
      """
      #{doc}
        @spec update(Client.t(), #{parent_spec(resource.path_params)}map(), keyword()) ::
                {:ok, #{return_type}} | {:error, Twilio.Error.t()}
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
                :ok | {:error, Twilio.Error.t()}
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
                :ok | {:error, Twilio.Error.t()}
        def delete(client#{parent_params}, opts \\\\ []) do
          Client.request(client, :delete, #{path_expr},
            opts: opts,
            base_url: "#{base_url}"
          )
        end
      """
    end
  end

  # Generate @doc for an operation, including description and param tables
  defp generate_operation_doc(op, resource_name) do
    desc = op.description || default_description(op.name, resource_name)

    sections = [desc]

    # Operation metadata line (operationId + tags)
    meta_parts =
      []
      |> maybe_append_meta(op[:operation_id], fn id -> "Operation: `#{id}`" end)
      |> maybe_append_meta(op[:tags], fn
        [] -> nil
        tags -> "Tags: #{Enum.join(tags, ", ")}"
      end)
      |> Enum.reject(&is_nil/1)

    sections =
      if meta_parts != [] do
        sections ++ ["", Enum.join(meta_parts, " | ")]
      else
        sections
      end

    # Request body parameters
    sections =
      case op.request_params do
        [] ->
          sections

        params ->
          required = Enum.filter(params, & &1.required)
          optional = Enum.reject(params, & &1.required)

          parts = []

          parts =
            if required != [] do
              rows = Enum.map(required, &param_table_row/1)

              parts ++
                [
                  "## Required Parameters\n",
                  "| Parameter | Type | Description |",
                  "|-----------|------|-------------|"
                  | rows
                ]
            else
              parts
            end

          parts =
            if optional != [] do
              rows = Enum.map(optional, &param_table_row/1)

              parts ++
                [
                  "## Optional Parameters\n",
                  "| Parameter | Type | Description |",
                  "|-----------|------|-------------|"
                  | rows
                ]
            else
              parts
            end

          sections ++ ["" | parts]
      end

    # Query parameters (for list operations)
    sections =
      case op.query_params do
        [] ->
          sections

        params ->
          # Exclude pagination params from docs (they're handled by the SDK)
          filter_params =
            Enum.reject(params, fn p -> p.name in ["PageSize", "Page", "PageToken"] end)

          if filter_params != [] do
            rows = Enum.map(filter_params, &query_param_table_row/1)

            sections ++
              [
                "",
                "## Query Parameters\n",
                "| Parameter | Type | Description |",
                "|-----------|------|-------------|"
                | rows
              ]
          else
            sections
          end
      end

    doc_text = Enum.join(sections, "\n")
    "  @doc \"\"\"\n  #{doc_text}\n  \"\"\""
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
    base =
      case param.type do
        :string -> "string"
        :integer -> "integer"
        :float -> "number"
        :boolean -> "boolean"
        :list -> "array"
        :map -> "object"
        _ -> "string"
      end

    case param[:format] do
      nil -> base
      fmt -> "#{base} (#{fmt})"
    end
  end

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
    params
    |> Enum.map(fn p -> ", #{Macro.underscore(p)}" end)
    |> Enum.join()
  end

  defp build_parent_args([]), do: ""

  defp build_parent_args(params) do
    params
    |> Enum.map(fn p -> ", #{Macro.underscore(p)}" end)
    |> Enum.join()
  end

  defp parent_spec([]), do: ""

  defp parent_spec(params) do
    params
    |> Enum.map(fn _ -> "String.t(), " end)
    |> Enum.join()
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
end
