defmodule Twilio.ParityTest do
  use ExUnit.Case, async: true

  alias Twilio.Generator.Naming

  @spec_dir "priv/openapi"

  test "all spec files exist" do
    specs = Path.wildcard(Path.join(@spec_dir, "twilio_*.json"))
    assert length(specs) >= 50, "Expected at least 50 spec files, got #{length(specs)}"
  end

  test "generated services exist for most specs" do
    specs = Path.wildcard(Path.join(@spec_dir, "twilio_*.json"))

    {covered, uncovered} =
      Enum.split_with(specs, fn spec_path ->
        filename = Path.basename(spec_path, ".json")
        {product, version} = Naming.product_version(filename)

        dir =
          if version do
            "lib/twilio/#{String.downcase(product)}/#{String.downcase(version)}"
          else
            "lib/twilio/#{String.downcase(product)}"
          end

        services = Path.wildcard(Path.join(dir, "**/*_service.ex"))
        length(services) > 0
      end)

    coverage_pct = length(covered) / length(specs) * 100

    assert coverage_pct >= 90,
           "Spec coverage is #{Float.round(coverage_pct, 1)}% " <>
             "(#{length(covered)}/#{length(specs)}). " <>
             "Uncovered: #{Enum.map(uncovered, &Path.basename/1) |> Enum.join(", ")}"
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
