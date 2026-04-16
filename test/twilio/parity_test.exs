defmodule Twilio.ParityTest do
  use ExUnit.Case, async: true

  alias Twilio.Generator.{Naming, OpenAPI}

  @spec_dir "priv/openapi"

  test "all spec files exist" do
    specs = Path.wildcard(Path.join(@spec_dir, "twilio_*.json"))
    assert length(specs) >= 50, "Expected at least 50 spec files, got #{length(specs)}"
  end

  test "every generatable spec produces service files" do
    # A spec is "generatable" if the generator extracts at least one resource
    # from it. Upstream Twilio occasionally ships stub/preview specs without
    # `x-twilio.pathType` annotations or with empty operation objects; those
    # parse to zero resources and are correctly skipped here.
    uncovered =
      Path.wildcard(Path.join(@spec_dir, "twilio_*.json"))
      |> Enum.filter(fn path -> OpenAPI.parse_file(path).resources != [] end)
      |> Enum.reject(fn spec_path ->
        filename = Path.basename(spec_path, ".json")
        {product, version} = Naming.product_version(filename)

        dir =
          if version do
            "lib/twilio/#{String.downcase(product)}/#{String.downcase(version)}"
          else
            "lib/twilio/#{String.downcase(product)}"
          end

        Path.wildcard(Path.join(dir, "**/*_service.ex")) != []
      end)

    assert uncovered == [],
           "Specs that parsed to resources but produced no service files: " <>
             Enum.map_join(uncovered, ", ", &Path.basename/1)
  end

  test "service modules compile and export expected functions" do
    services = [
      {Twilio.Api.V2010.MessageService, [:create, :fetch, :list, :delete]},
      {Twilio.Api.V2010.CallService, [:create, :fetch, :list]}
    ]

    for {mod, expected_funs} <- services do
      assert Code.ensure_loaded?(mod), "#{inspect(mod)} not loaded"

      for fun <- expected_funs do
        assert function_exported?(mod, fun, 2) or function_exported?(mod, fun, 3),
               "#{inspect(mod)}.#{fun} not exported"
      end
    end
  end

  test "resource structs have expected fields" do
    assert Code.ensure_loaded?(Twilio.Resources.Api.V2010.Message)
    msg = struct(Twilio.Resources.Api.V2010.Message)
    assert Map.has_key?(msg, :sid)
    assert Map.has_key?(msg, :body)
    assert Map.has_key?(msg, :status)
  end

  test "object type registry maps schema names to modules" do
    assert Code.ensure_loaded?(Twilio.ObjectTypes)

    types = Twilio.ObjectTypes.schema_to_module()
    assert map_size(types) > 400, "Expected 400+ object types, got #{map_size(types)}"
  end
end
