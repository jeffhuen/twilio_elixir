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

    field_names = Enum.map(properties, fn p -> ":#{p.name}" end)
    field_list = Enum.join(field_names, ", ")

    type_fields = generate_type_fields(properties)
    moduledoc = generate_moduledoc(resource)
    sid_prefix_attr = generate_sid_prefix_attr(resource.sid_prefix)

    """
    # File generated from Twilio's OpenAPI spec — do not edit manually
    defmodule #{inspect(module_name)} do
      @moduledoc \"\"\"
    #{moduledoc}
      \"\"\"

      @type t :: %__MODULE__{
    #{type_fields}
            }

      defstruct [#{field_list}]

      @object_name "#{schema_name}"
      def object_name, do: @object_name
    #{sid_prefix_attr}
    end
    """
  end

  defp generate_moduledoc(resource) do
    lines = []

    # Resource description from path-level description
    desc = resource[:description] || "#{resource.name} resource."
    lines = lines ++ ["  #{desc}"]

    # Schema-level description (if different from path description and present)
    lines =
      case resource[:schema_description] do
        nil ->
          lines

        schema_desc when schema_desc == desc ->
          lines

        schema_desc ->
          lines ++ ["", "  #{sanitize_table_cell(schema_desc)}"]
      end

    # SID prefix
    lines =
      case resource.sid_prefix do
        nil -> lines
        prefix -> lines ++ ["", "  SID prefix: `#{prefix}`"]
      end

    # Parent resource
    lines =
      case resource[:parent] do
        nil -> lines
        parent -> lines ++ ["", "  Parent: `#{parent}`"]
      end

    # Dependent sub-resources
    lines =
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

    # Properties table
    documented_props =
      (resource.properties || [])
      |> Enum.filter(fn p -> p.description || p.enum_values || p.format end)

    lines =
      if documented_props != [] do
        header = [
          "",
          "  ## Properties",
          "",
          "  | Field | Description |",
          "  |-------|-------------|"
        ]

        rows =
          Enum.map(documented_props, fn prop ->
            desc_text = sanitize_table_cell(prop.description || "")

            # Use enum description if the property itself has no description
            desc_text =
              case {desc_text, prop[:enum_description]} do
                {"", nil} -> ""
                {"", enum_desc} -> sanitize_table_cell(enum_desc)
                {d, _} -> d
              end

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

            cell =
              case {desc_text, extras} do
                {"", []} -> ""
                {"", _} -> Enum.join(extras, ". ")
                {d, []} -> d
                {d, _} -> d <> ". " <> Enum.join(extras, ". ")
              end

            "  | `#{prop.name}` | #{cell} |"
          end)

        lines ++ header ++ rows
      else
        lines
      end

    Enum.join(lines, "\n")
  end

  defp generate_type_fields(properties) do
    properties
    |> Enum.map(fn prop ->
      elixir_type = type_to_spec(prop.type, prop.format)
      nullable = if prop.nullable, do: " | nil", else: ""
      "          #{prop.name}: #{elixir_type}#{nullable}"
    end)
    |> Enum.join(",\n")
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
end
