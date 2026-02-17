defmodule Twilio.Deserializer do
  @moduledoc false

  @doc """
  Convert a raw API response map to a typed struct.

  Twilio responses don't include an object type discriminator,
  so the caller passes the expected resource module explicitly.
  """
  @spec deserialize(map(), module()) :: struct()
  def deserialize(data, module) when is_map(data) do
    fields =
      module.__struct__()
      |> Map.keys()
      |> Enum.reject(&(&1 == :__struct__))

    attrs =
      Enum.reduce(fields, %{}, fn field, acc ->
        key = Atom.to_string(field)

        case Map.fetch(data, key) do
          {:ok, value} -> Map.put(acc, field, value)
          :error -> acc
        end
      end)

    struct(module, attrs)
  end

  @doc """
  Deserialize a list of maps into structs.
  """
  @spec deserialize_list([map()], module()) :: [struct()]
  def deserialize_list(items, module) when is_list(items) do
    Enum.map(items, &deserialize(&1, module))
  end
end
