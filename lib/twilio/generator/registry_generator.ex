defmodule Twilio.Generator.RegistryGenerator do
  @moduledoc false

  alias Twilio.Generator.Naming

  @doc "Generate the object types registry module."
  @spec generate([{String.t(), module()}]) :: String.t()
  def generate(mappings) do
    entries =
      mappings
      |> Enum.sort_by(fn {schema, _mod} -> schema end)
      |> Enum.map_join(",\n", fn {schema, mod} ->
        ~s(      "#{schema}" => #{inspect(mod)})
      end)

    """
    # File generated from Twilio's OpenAPI spec — do not edit manually
    # credo:disable-for-this-file Credo.Check.Readability.MaxLineLength
    defmodule Twilio.ObjectTypes do
      @moduledoc false

      def schema_to_module do
        %{
    #{entries}
        }
      end
    end
    """
  end

  @doc "Collect all schema-to-module mappings from parsed specs."
  @spec collect_mappings([map()]) :: [{String.t(), module()}]
  def collect_mappings(parsed_specs) do
    for spec <- parsed_specs,
        resource <- spec.resources,
        resource.schema_name != nil do
      nesting = resource[:nesting] || []
      mod = Naming.resource_module(spec.product, spec.version, resource.name, nesting)
      {resource.schema_name, mod}
    end
    |> Map.new()
    |> Map.to_list()
  end
end
