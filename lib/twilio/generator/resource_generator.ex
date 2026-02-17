defmodule Twilio.Generator.ResourceGenerator do
  @moduledoc false

  alias Twilio.Generator.Naming

  @doc "Generate a resource struct module source string."
  @spec generate(map(), String.t(), String.t() | nil) :: String.t()
  def generate(resource, product, version) do
    nesting = resource[:nesting] || []
    module_name = Naming.resource_module(product, version, resource.name, nesting)
    properties = resource.properties

    schema_name =
      resource.schema_name ||
        "#{String.downcase(product)}.#{String.downcase(version || "")}.#{Macro.underscore(resource.name)}"

    field_list = Enum.map_join(properties, ", ", fn p -> ":#{p.name}" end)

    type_fields = generate_type_fields(properties)
    moduledoc = generate_moduledoc(resource)
    sid_prefix_attr = generate_sid_prefix_attr(resource.sid_prefix)

    defmodule_line = "defmodule #{inspect(module_name)} do"
    defmodule_disable = credo_line_length_disable(defmodule_line)
    struct_disable = credo_struct_field_disable(properties)

    """
    # File generated from Twilio's OpenAPI spec — do not edit manually
    #{defmodule_disable}#{defmodule_line}
      @moduledoc \"\"\"
    #{moduledoc}
      \"\"\"

      @type t :: %__MODULE__{
    #{type_fields}
            }

    #{struct_disable}  defstruct [#{field_list}]

      @object_name "#{schema_name}"
      def object_name, do: @object_name
    #{sid_prefix_attr}
    end
    """
  end

  defp generate_moduledoc(resource) do
    desc =
      case resource[:description] do
        nil -> "#{resource.name} resource."
        "" -> "#{resource.name} resource."
        d -> d
      end

    ["  #{desc}"]
    |> append_schema_description(resource, desc)
    |> append_sid_prefix(resource)
    |> append_parent(resource)
    |> append_dependent_properties(resource)
    |> append_properties_table(resource)
    |> Enum.join("\n")
  end

  defp append_schema_description(lines, resource, desc) do
    case resource[:schema_description] do
      nil -> lines
      ^desc -> lines
      schema_desc -> lines ++ ["", "  #{sanitize_table_cell(schema_desc)}"]
    end
  end

  defp append_sid_prefix(lines, resource) do
    case resource.sid_prefix do
      nil -> lines
      prefix -> lines ++ ["", "  SID prefix: `#{prefix}`"]
    end
  end

  defp append_parent(lines, resource) do
    case resource[:parent] do
      nil -> lines
      parent -> lines ++ ["", "  Parent: `#{parent}`"]
    end
  end

  defp append_dependent_properties(lines, resource) do
    case resource[:dependent_properties] do
      nil ->
        lines

      deps when map_size(deps) == 0 ->
        lines

      deps ->
        dep_lines =
          Enum.map(deps, fn {name, info} ->
            url = info["resource_url"] || ""
            "  - `#{name}` — `#{url}`"
          end)

        lines ++ ["", "  ## Sub-resources" | dep_lines]
    end
  end

  defp append_properties_table(lines, resource) do
    documented_props =
      (resource.properties || [])
      |> Enum.filter(fn p -> p.description || p.enum_values || p.format end)

    if documented_props == [] do
      lines
    else
      header = [
        "",
        "  ## Properties",
        "",
        "  | Field | Description |",
        "  |-------|-------------|"
      ]

      rows = Enum.map(documented_props, &property_table_row/1)
      lines ++ header ++ rows
    end
  end

  defp property_table_row(prop) do
    desc_text = prop_description(prop)

    extras =
      []
      |> maybe_append(prop.enum_values, fn vals ->
        "Values: `#{Enum.join(vals, "`, `")}`"
      end)
      |> maybe_append(prop.format, fn fmt -> "Format: #{fmt}" end)
      |> maybe_append(prop.pii, fn
        %{"handling" => h} -> "PII: #{h}"
        _ -> nil
      end)
      |> Enum.reject(&is_nil/1)

    cell = combine_desc_and_extras(desc_text, extras)
    "  | `#{prop.name}` | #{cell} |"
  end

  defp prop_description(prop) do
    case {sanitize_table_cell(prop.description || ""), prop[:enum_description]} do
      {"", nil} -> ""
      {"", enum_desc} -> sanitize_table_cell(enum_desc)
      {d, _} -> d
    end
  end

  defp combine_desc_and_extras("", []), do: ""
  defp combine_desc_and_extras("", extras), do: Enum.join(extras, ". ")
  defp combine_desc_and_extras(desc, []), do: desc
  defp combine_desc_and_extras(desc, extras), do: desc <> ". " <> Enum.join(extras, ". ")

  defp generate_type_fields(properties) do
    Enum.map_join(properties, ",\n", fn prop ->
      elixir_type = type_to_spec(prop.type, prop.format)
      nullable = if prop.nullable, do: " | nil", else: ""
      "          #{prop.name}: #{elixir_type}#{nullable}"
    end)
  end

  defp generate_sid_prefix_attr(nil), do: ""

  defp generate_sid_prefix_attr(prefix) do
    "\n  @sid_prefix \"#{prefix}\"\n  def sid_prefix, do: @sid_prefix\n"
  end

  defp type_to_spec(:string, _), do: "String.t()"
  defp type_to_spec(:integer, _), do: "integer()"
  defp type_to_spec(:float, _), do: "float()"
  defp type_to_spec(:boolean, _), do: "boolean()"
  defp type_to_spec(:list, _), do: "list()"
  defp type_to_spec(:map, _), do: "map()"
  defp type_to_spec(_, _), do: "term()"

  defp sanitize_table_cell(text) do
    text
    |> String.replace("\n", " ")
    |> String.replace("|", "\\|")
  end

  defp maybe_append(list, nil, _fun), do: list
  defp maybe_append(list, value, fun), do: list ++ [fun.(value)]

  @max_line_length 120
  @max_struct_fields 31

  defp credo_line_length_disable(line) do
    if String.length(line) > @max_line_length do
      "# credo:disable-for-next-line Credo.Check.Readability.MaxLineLength\n"
    else
      ""
    end
  end

  defp credo_struct_field_disable(properties) do
    if length(properties) > @max_struct_fields do
      "  # credo:disable-for-next-line Credo.Check.Warning.StructFieldAmount\n"
    else
      ""
    end
  end
end
