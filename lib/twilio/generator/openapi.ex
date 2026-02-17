defmodule Twilio.Generator.OpenAPI do
  @moduledoc false

  alias Twilio.Generator.Naming

  @type parsed_spec :: %{
          product: String.t(),
          version: String.t() | nil,
          base_url: String.t(),
          resources: [map()]
        }

  @doc "Parse all spec files in a directory."
  @spec parse_all(String.t()) :: [parsed_spec()]
  def parse_all(spec_dir) do
    Path.wildcard(Path.join(spec_dir, "twilio_*.json"))
    |> Enum.map(&parse_file/1)
    |> Enum.reject(&is_nil/1)
  end

  @doc "Parse a single spec file."
  @spec parse_file(String.t()) :: parsed_spec() | nil
  def parse_file(path) do
    filename = Path.basename(path, ".json")
    {product, version} = Naming.product_version(filename)

    raw = File.read!(path)
    spec = JSON.decode!(raw)

    base_url = extract_base_url(spec)
    resources = parse_resources(spec, product, version)

    %{
      product: product,
      version: version,
      base_url: base_url,
      resources: resources
    }
  end

  defp extract_base_url(spec) do
    case get_in(spec, ["servers"]) do
      [%{"url" => url} | _] -> url
      _ -> "https://api.twilio.com"
    end
  end

  defp parse_resources(spec, product, version) do
    paths = spec["paths"] || %{}
    schemas = spec["components"]["schemas"] || %{}

    # Group paths by resource: pair list paths with instance paths
    {list_paths, instance_paths} = partition_paths(paths)

    # Build resources from list paths (which define the resource)
    resources = build_resources_from_lists(list_paths, instance_paths, schemas, product, version)

    # Also capture instance-only resources (no list path)
    instance_only =
      build_instance_only_resources(instance_paths, list_paths, schemas, product, version)

    resources ++ instance_only
  end

  defp partition_paths(paths) do
    Enum.reduce(paths, {%{}, %{}}, fn {path, path_item}, {lists, instances} ->
      x_twilio = path_item["x-twilio"] || %{}

      case x_twilio["pathType"] do
        "list" -> {Map.put(lists, path, path_item), instances}
        "instance" -> {lists, Map.put(instances, path, path_item)}
        _ -> {lists, instances}
      end
    end)
  end

  defp build_resources_from_lists(list_paths, instance_paths, schemas, _product, _version) do
    Enum.map(list_paths, fn {list_path, list_item} ->
      resource_name = Naming.resource_name_from_path(list_path)
      x_twilio = list_item["x-twilio"] || %{}

      # Find matching instance path
      instance_path = find_instance_path(list_path, instance_paths)
      instance_item = if instance_path, do: Map.get(instance_paths, instance_path), else: nil

      # Apply className override
      resource_name =
        case x_twilio["className"] do
          nil -> resource_name
          name -> Naming.camelize(name)
        end

      # Extract operations with full metadata
      operations =
        extract_operations(list_path, list_item, instance_path, instance_item, schemas)

      # Extract schema and properties
      schema_name = find_schema_name(list_item, instance_item, schemas)
      properties = extract_properties(schema_name, schemas)
      sid_prefix = extract_sid_prefix(schema_name, schemas)

      # Extract page key from list response
      page_key = extract_page_key(list_item, list_path)

      # Determine parent SID params (path params excluding the resource's own SID)
      path_params = extract_parent_params(list_path, :list)

      # Detect the resource's own SID param name from the instance path
      sid_param = detect_sid_param(instance_path)

      # Path-level description (shared by list and instance items)
      description =
        list_item["description"] ||
          (instance_item && instance_item["description"])

      # Derive nesting from the list path for hierarchical file/module structure
      nesting = Naming.nesting_from_path(list_path)

      %{
        name: resource_name,
        nesting: nesting,
        description: description,
        list_path: list_path,
        instance_path: instance_path,
        operations: operations,
        properties: properties,
        schema_name: schema_name,
        schema_description: extract_schema_description(schema_name, schemas),
        sid_prefix: sid_prefix,
        sid_param: sid_param,
        page_key: page_key,
        path_params: path_params,
        parent: x_twilio["parent"],
        default_output_properties: x_twilio["defaultOutputProperties"] || [],
        dependent_properties: extract_dependent_properties(x_twilio)
      }
    end)
  end

  defp build_instance_only_resources(instance_paths, list_paths, schemas, _product, _version) do
    # Find instance paths that have no corresponding list path
    list_base_paths = Map.keys(list_paths) |> MapSet.new()

    instance_paths
    |> Enum.reject(fn {inst_path, _} ->
      Enum.any?(list_base_paths, fn list_path ->
        instance_matches_list?(list_path, inst_path)
      end)
    end)
    |> Enum.map(fn {inst_path, inst_item} ->
      resource_name = Naming.resource_name_from_path(inst_path)
      x_twilio = inst_item["x-twilio"] || %{}

      resource_name =
        case x_twilio["className"] do
          nil -> resource_name
          name -> Naming.camelize(name)
        end

      operations = extract_instance_operations(inst_path, inst_item, schemas)
      schema_name = find_schema_name(nil, inst_item, schemas)
      properties = extract_properties(schema_name, schemas)
      sid_prefix = extract_sid_prefix(schema_name, schemas)
      path_params = extract_parent_params(inst_path, :instance)
      sid_param = detect_sid_param(inst_path)

      nesting = Naming.nesting_from_path(inst_path)

      %{
        name: resource_name,
        nesting: nesting,
        description: inst_item["description"],
        list_path: nil,
        instance_path: inst_path,
        operations: operations,
        properties: properties,
        schema_name: schema_name,
        schema_description: extract_schema_description(schema_name, schemas),
        sid_prefix: sid_prefix,
        sid_param: sid_param,
        page_key: nil,
        path_params: path_params,
        parent: x_twilio["parent"],
        default_output_properties: x_twilio["defaultOutputProperties"] || [],
        dependent_properties: extract_dependent_properties(x_twilio)
      }
    end)
  end

  defp find_instance_path(list_path, instance_paths) do
    # Instance path is typically list_path + /{Sid} or /{Sid}.json
    possible_suffixes = ["/{Sid}", "/{Sid}.json"]

    base = String.replace_suffix(list_path, ".json", "")

    Enum.find_value(possible_suffixes, fn suffix ->
      candidate = base <> suffix
      json_candidate = base <> "/{Sid}.json"

      cond do
        Map.has_key?(instance_paths, candidate) -> candidate
        Map.has_key?(instance_paths, json_candidate) -> json_candidate
        true -> nil
      end
    end) || find_instance_by_pattern(list_path, instance_paths)
  end

  defp find_instance_by_pattern(list_path, instance_paths) do
    # Match by finding an instance path that is the list path + one more segment
    list_segments =
      list_path |> String.replace(".json", "") |> String.split("/") |> Enum.reject(&(&1 == ""))

    list_count = length(list_segments)

    Enum.find_value(instance_paths, fn {inst_path, _} ->
      inst_segments =
        inst_path
        |> String.replace(".json", "")
        |> String.split("/")
        |> Enum.reject(&(&1 == ""))

      if length(inst_segments) == list_count + 1 and
           Enum.take(inst_segments, list_count) == list_segments do
        inst_path
      end
    end)
  end

  defp instance_matches_list?(list_path, inst_path) do
    list_segments =
      list_path |> String.replace(".json", "") |> String.split("/") |> Enum.reject(&(&1 == ""))

    inst_segments =
      inst_path |> String.replace(".json", "") |> String.split("/") |> Enum.reject(&(&1 == ""))

    length(inst_segments) == length(list_segments) + 1 and
      Enum.take(inst_segments, length(list_segments)) == list_segments
  end

  defp extract_operations(list_path, list_item, instance_path, instance_item, schemas) do
    list_ops =
      Enum.flat_map(["get", "post"], fn method ->
        case list_item[method] do
          nil ->
            []

          operation ->
            op_name = if method == "get", do: :list, else: :create

            [
              %{
                name: op_name,
                method: String.to_atom(method),
                path: list_path,
                content_type: detect_content_type(operation),
                description: operation["description"],
                operation_id: operation["operationId"],
                tags: operation["tags"] || [],
                request_params: extract_request_params(operation, schemas),
                query_params: extract_query_params(operation)
              }
            ]
        end
      end)

    instance_ops =
      if instance_item do
        Enum.flat_map(["get", "post", "delete"], fn method ->
          case instance_item[method] do
            nil ->
              []

            operation ->
              op_name =
                case method do
                  "get" -> :fetch
                  "post" -> :update
                  "delete" -> :delete
                end

              [
                %{
                  name: op_name,
                  method: String.to_atom(method),
                  path: instance_path,
                  content_type: detect_content_type(operation),
                  description: operation["description"],
                  operation_id: operation["operationId"],
                  tags: operation["tags"] || [],
                  request_params: extract_request_params(operation, schemas),
                  query_params: extract_query_params(operation)
                }
              ]
          end
        end)
      else
        []
      end

    list_ops ++ instance_ops
  end

  defp extract_instance_operations(inst_path, inst_item, schemas) do
    Enum.flat_map(["get", "post", "delete"], fn method ->
      case inst_item[method] do
        nil ->
          []

        operation ->
          op_name =
            case method do
              "get" -> :fetch
              "post" -> :update
              "delete" -> :delete
            end

          [
            %{
              name: op_name,
              method: String.to_atom(method),
              path: inst_path,
              content_type: detect_content_type(operation),
              description: operation["description"],
              operation_id: operation["operationId"],
              tags: operation["tags"] || [],
              request_params: extract_request_params(operation, schemas),
              query_params: extract_query_params(operation)
            }
          ]
      end
    end)
  end

  defp detect_content_type(nil), do: :form

  defp detect_content_type(operation) do
    case get_in(operation, ["requestBody", "content"]) do
      %{"application/json" => _} -> :json
      _ -> :form
    end
  end

  defp find_schema_name(list_item, instance_item, _schemas) do
    # Try to find the schema from the response of a fetch/create operation
    items = [instance_item, list_item] |> Enum.reject(&is_nil/1)

    Enum.find_value(items, fn item ->
      Enum.find_value(["get", "post"], fn method ->
        case get_in(item, [method, "responses", "200", "content", "application/json", "schema"]) ||
               get_in(item, [method, "responses", "201", "content", "application/json", "schema"]) do
          %{"$ref" => ref} ->
            ref |> String.split("/") |> List.last()

          %{"properties" => props} ->
            # List response — find the array item ref
            Enum.find_value(props, fn
              {_key, %{"type" => "array", "items" => %{"$ref" => ref}}} ->
                ref |> String.split("/") |> List.last()

              _ ->
                nil
            end)

          _ ->
            nil
        end
      end)
    end)
  end

  defp extract_properties(nil, _schemas), do: []

  defp extract_properties(schema_name, schemas) do
    case schemas[schema_name] do
      %{"properties" => props} ->
        Enum.map(props, fn {name, prop} ->
          enum_values = resolve_enum_values(prop, schemas)
          enum_description = resolve_enum_description(prop, schemas)

          %{
            name: name,
            type: map_type(prop),
            format: prop["format"],
            nullable: prop["nullable"] || false,
            description: prop["description"],
            enum_values: enum_values,
            enum_description: enum_description,
            pattern: prop["pattern"],
            pii: get_in(prop, ["x-twilio", "pii"])
          }
        end)

      _ ->
        []
    end
  end

  defp resolve_enum_values(%{"$ref" => ref}, schemas) do
    schema_name = ref |> String.split("/") |> List.last()

    case schemas[schema_name] do
      %{"type" => "string", "enum" => values} -> values
      _ -> nil
    end
  end

  defp resolve_enum_values(%{"enum" => values}, _schemas), do: values
  defp resolve_enum_values(_, _schemas), do: nil

  # Resolve enum schema description (richer than just listing values)
  defp resolve_enum_description(%{"$ref" => ref}, schemas) do
    schema_name = ref |> String.split("/") |> List.last()

    case schemas[schema_name] do
      %{"description" => desc} when is_binary(desc) and desc != "" -> desc
      _ -> nil
    end
  end

  defp resolve_enum_description(_, _schemas), do: nil

  defp extract_schema_description(nil, _schemas), do: nil

  defp extract_schema_description(schema_name, schemas) do
    case schemas[schema_name] do
      %{"description" => desc} when is_binary(desc) and desc != "" -> desc
      _ -> nil
    end
  end

  defp map_type(%{"type" => "string"}), do: :string
  defp map_type(%{"type" => "integer"}), do: :integer
  defp map_type(%{"type" => "number"}), do: :float
  defp map_type(%{"type" => "boolean"}), do: :boolean
  defp map_type(%{"type" => "array"}), do: :list
  defp map_type(%{"type" => "object"}), do: :map
  defp map_type(%{"$ref" => _}), do: :string
  defp map_type(_), do: :string

  defp extract_sid_prefix(nil, _schemas), do: nil

  defp extract_sid_prefix(schema_name, schemas) do
    case schemas[schema_name] do
      %{"properties" => %{"sid" => %{"pattern" => pattern}}} ->
        # Match ^(XX|YY)... or ^XX...
        cond do
          match = Regex.run(~r/^\^\(([A-Z]{2}(?:\|[A-Z]{2})*)\)/, pattern) ->
            Enum.at(match, 1)

          match = Regex.run(~r/^\^([A-Z]{2})\[/, pattern) ->
            Enum.at(match, 1)

          true ->
            nil
        end

      _ ->
        nil
    end
  end

  # Extract request body parameters (POST create/update operations)
  defp extract_request_params(operation, schemas) do
    case get_in(operation, ["requestBody", "content"]) do
      nil ->
        []

      content ->
        schema =
          get_in(content, ["application/x-www-form-urlencoded", "schema"]) ||
            get_in(content, ["application/json", "schema"]) ||
            %{}

        required = MapSet.new(schema["required"] || [])
        props = schema["properties"] || %{}

        Enum.map(props, fn {name, prop} ->
          enum_values =
            case prop do
              %{"$ref" => ref} ->
                enum_name = ref |> String.split("/") |> List.last()

                case schemas[enum_name] do
                  %{"type" => "string", "enum" => values} -> values
                  _ -> nil
                end

              %{"enum" => values} ->
                values

              _ ->
                nil
            end

          %{
            name: name,
            type: map_type(prop),
            format: prop["format"],
            description: prop["description"],
            required: MapSet.member?(required, name),
            enum_values: enum_values
          }
        end)
        |> Enum.sort_by(fn p -> {!p.required, p.name} end)
    end
  end

  # Extract query parameters from GET operations (filtering/pagination)
  defp extract_query_params(operation) do
    (operation["parameters"] || [])
    |> Enum.filter(fn p -> p["in"] == "query" end)
    |> Enum.map(fn p ->
      schema = p["schema"] || %{}

      %{
        name: p["name"],
        type: map_type(schema),
        format: schema["format"],
        description: p["description"]
      }
    end)
  end

  defp extract_dependent_properties(x_twilio) do
    case x_twilio["dependentProperties"] do
      nil -> %{}
      deps when is_map(deps) -> deps
    end
  end

  defp extract_page_key(list_item, list_path) do
    # Try to get from list response schema
    case get_in(list_item, [
           "get",
           "responses",
           "200",
           "content",
           "application/json",
           "schema",
           "properties"
         ]) do
      %{} = props ->
        # Find the array property (that's the page key)
        Enum.find_value(props, fn
          {key, %{"type" => "array"}} -> key
          _ -> nil
        end)

      _ ->
        # Fall back to deriving from path
        list_path
        |> String.split("/")
        |> Enum.reject(fn seg -> String.starts_with?(seg, "{") or seg == "" end)
        |> List.last()
        |> String.replace(".json", "")
        |> String.downcase()
    end
  end

  # For resources with a list path, extract parent params from the list path.
  # List paths contain only parent params (no resource SID), so keep all after removing AccountSid.
  defp extract_parent_params(path, :list) do
    Naming.extract_path_params(path)
    |> Enum.reject(fn p -> p == "AccountSid" end)
  end

  # For instance-only resources, check if the last path segment is a parameter.
  # If so, it's the resource's own SID — drop it. If it's a static name (e.g.
  # "Configuration"), there's no resource SID and all params are parents.
  defp extract_parent_params(path, :instance) do
    last_segment =
      path
      |> String.replace(".json", "")
      |> String.split("/")
      |> List.last()

    params =
      Naming.extract_path_params(path)
      |> Enum.reject(fn p -> p == "AccountSid" end)

    if String.starts_with?(last_segment, "{") do
      Enum.drop(params, -1)
    else
      params
    end
  end

  # Detect the resource's own SID param from the instance path.
  # Returns the param name if the last segment is a {Param}, nil otherwise.
  defp detect_sid_param(nil), do: nil

  defp detect_sid_param(instance_path) do
    last_segment =
      instance_path
      |> String.replace(".json", "")
      |> String.split("/")
      |> List.last()

    if String.starts_with?(last_segment, "{") do
      String.trim(last_segment, "{") |> String.trim("}")
    end
  end
end
