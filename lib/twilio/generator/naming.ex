defmodule Twilio.Generator.Naming do
  @moduledoc false

  @doc "Extract {product, version} from spec filename (without extension)."
  @spec product_version(String.t()) :: {String.t(), String.t() | nil}
  def product_version("twilio_api_v2010"), do: {"Api", "V2010"}
  def product_version("twilio_iam_organizations"), do: {"Iam", "Organizations"}
  def product_version("twilio_iam_scim"), do: {"Iam", "Scim"}
  def product_version("twilio_preview"), do: {"Preview", nil}

  def product_version("twilio_" <> rest) do
    case String.split(rest, "_v", parts: 2) do
      [product, version] -> {camelize(product), "V" <> version}
      [product] -> {camelize(product), nil}
    end
  end

  @doc "Build service module name with optional nesting."
  @spec service_module(String.t(), String.t() | nil, String.t(), [String.t()]) :: module()
  def service_module(product, version, resource_name, nesting \\ []) do
    parts = ["Twilio", product]
    parts = if version, do: parts ++ [version], else: parts
    parts = parts ++ nesting ++ ["#{resource_name}Service"]

    parts
    |> Enum.map(&String.to_atom/1)
    |> Module.concat()
  end

  @doc "Build resource module name with optional nesting."
  @spec resource_module(String.t(), String.t() | nil, String.t(), [String.t()]) :: module()
  def resource_module(product, version, resource_name, nesting \\ []) do
    parts = ["Twilio", "Resources", product]
    parts = if version, do: parts ++ [version], else: parts
    parts = parts ++ nesting ++ [resource_name]

    parts
    |> Enum.map(&String.to_atom/1)
    |> Module.concat()
  end

  @doc "Extract resource name from path."
  @spec resource_name_from_path(String.t()) :: String.t()
  def resource_name_from_path(path) do
    path
    |> String.split("/")
    |> Enum.reject(fn seg -> String.starts_with?(seg, "{") or seg == "" end)
    |> List.last()
    |> String.replace(".json", "")
    |> singularize()
    |> camelize()
  end

  @doc "Extract path parameters from a path string."
  @spec extract_path_params(String.t()) :: [String.t()]
  def extract_path_params(path) do
    Regex.scan(~r/\{(\w+)\}/, path)
    |> Enum.map(fn [_, param] -> param end)
  end

  @doc "Convert a snake_case string to CamelCase. Already-camelized strings are uppercased at the first character only."
  @spec camelize(String.t()) :: String.t()
  def camelize(str) do
    if String.contains?(str, ["_", "-"]) do
      str
      |> String.split(~r/[_\-]/)
      |> Enum.map_join(&upcase_first/1)
    else
      upcase_first(str)
    end
  end

  defp upcase_first(<<first::utf8, rest::binary>>), do: String.upcase(<<first::utf8>>) <> rest
  defp upcase_first(""), do: ""

  @doc "Naive singularize — handles common Twilio resource plurals."
  @spec singularize(String.t()) :: String.t()
  def singularize(str) do
    cond do
      String.ends_with?(str, "ies") -> String.replace_suffix(str, "ies", "y")
      String.ends_with?(str, "sses") -> String.replace_suffix(str, "es", "")
      String.ends_with?(str, "ses") -> String.replace_suffix(str, "ses", "se")
      ends_with_removable_s?(str) -> String.replace_suffix(str, "s", "")
      true -> str
    end
  end

  defp ends_with_removable_s?(str) do
    String.ends_with?(str, "s") and
      not String.ends_with?(str, "ss") and
      not String.ends_with?(str, "us") and
      not String.ends_with?(str, "is")
  end

  @doc "Convert path to a service file path."
  @spec service_file_path(String.t(), String.t() | nil, String.t(), [String.t()]) :: String.t()
  def service_file_path(product, version, resource_name, nesting \\ []) do
    dir =
      if version do
        "lib/twilio/#{String.downcase(product)}/#{String.downcase(version)}"
      else
        "lib/twilio/#{String.downcase(product)}"
      end

    dir = append_nesting(dir, nesting)

    file = Macro.underscore(resource_name) <> "_service.ex"
    Path.join(dir, file)
  end

  @doc "Convert path to a resource file path."
  @spec resource_file_path(String.t(), String.t() | nil, String.t(), [String.t()]) :: String.t()
  def resource_file_path(product, version, resource_name, nesting \\ []) do
    dir =
      if version do
        "lib/twilio/resources/#{String.downcase(product)}/#{String.downcase(version)}"
      else
        "lib/twilio/resources/#{String.downcase(product)}"
      end

    dir = append_nesting(dir, nesting)

    file = Macro.underscore(resource_name) <> ".ex"
    Path.join(dir, file)
  end

  defp append_nesting(dir, []), do: dir

  defp append_nesting(dir, nesting) do
    nesting_path = nesting |> Enum.map(&Macro.underscore/1) |> Path.join()
    Path.join(dir, nesting_path)
  end

  @doc """
  Derive nesting path segments from an API list path.

  Extracts the intermediate static resource segments between the root and the
  final resource, singularized and camelized, to mirror the Twilio REST API
  hierarchy in the file/module structure.

  ## Examples

      iex> nesting_from_path("/2010-04-01/Accounts/{AccountSid}/Messages.json")
      []

      iex> nesting_from_path("/2010-04-01/Accounts/{AccountSid}/Messages/{MessageSid}/Feedback.json")
      ["Message"]

      iex> nesting_from_path("/v1/Services/{ChatServiceSid}/Conversations/{Sid}")
      ["Service"]
  """
  @spec nesting_from_path(String.t()) :: [String.t()]
  def nesting_from_path(path) do
    segments =
      path
      |> String.replace(".json", "")
      |> String.split("/")
      |> Enum.reject(fn seg -> seg == "" end)
      # Drop version prefix (e.g., "2010-04-01", "v1", "v2")
      |> Enum.drop_while(fn seg -> Regex.match?(~r/^(v\d+|\d{4}-\d{2}-\d{2})$/i, seg) end)
      # Drop param segments and implicit "Accounts" root
      |> Enum.reject(fn seg -> String.starts_with?(seg, "{") or seg == "Accounts" end)

    case segments do
      # No segments or just the resource itself — root level
      [] ->
        []

      [_resource] ->
        []

      # Multiple static segments: intermediate ones are the nesting
      segments ->
        intermediate = Enum.drop(segments, -1)
        Enum.map(intermediate, fn seg -> seg |> singularize() |> camelize() end)
    end
  end
end
