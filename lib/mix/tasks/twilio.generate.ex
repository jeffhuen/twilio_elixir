defmodule Mix.Tasks.Twilio.Generate do
  @moduledoc "Generate Twilio SDK modules from OpenAPI specs."
  @shortdoc "Generate Twilio SDK from OpenAPI specs"

  use Mix.Task

  alias Twilio.Generator.{Naming, OpenAPI, ServiceGenerator, ResourceGenerator, RegistryGenerator}

  @spec_dir "priv/openapi"

  @impl Mix.Task
  def run(args) do
    clean = "--clean" in args
    stats = "--stats" in args
    dry_run = "--dry-run" in args

    Mix.shell().info("Parsing OpenAPI specs from #{@spec_dir}...")
    parsed_specs = OpenAPI.parse_all(@spec_dir)

    Mix.shell().info("Parsed #{length(parsed_specs)} spec files")

    if clean and not dry_run do
      clean_generated_files()
    end

    {service_count, resource_count} = generate_all(parsed_specs, dry_run)

    if not dry_run do
      # Generate registry
      mappings = RegistryGenerator.collect_mappings(parsed_specs)
      registry_source = RegistryGenerator.generate(mappings)
      write_file("lib/twilio/object_types.ex", registry_source)

      # Format all generated files
      Mix.shell().info("Running mix format on generated files...")
      generated_globs = generated_dirs() |> Enum.map(&(&1 <> "/**/*.ex"))
      Mix.Task.rerun("format", ["lib/twilio/object_types.ex" | generated_globs])
    end

    if stats do
      Mix.shell().info("")
      Mix.shell().info("=== Generation Stats ===")
      Mix.shell().info("Spec files parsed:  #{length(parsed_specs)}")
      Mix.shell().info("Services generated: #{service_count}")
      Mix.shell().info("Resources generated: #{resource_count}")

      Mix.shell().info(
        "Registry entries:   #{if dry_run, do: "N/A", else: length(RegistryGenerator.collect_mappings(parsed_specs))}"
      )
    end
  end

  defp generate_all(parsed_specs, dry_run) do
    Enum.reduce(parsed_specs, {0, 0}, fn spec, {svc_count, res_count} ->
      Enum.reduce(spec.resources, {svc_count, res_count}, fn resource, {sc, rc} ->
        nesting = resource[:nesting] || []

        # Generate service
        svc_path = Naming.service_file_path(spec.product, spec.version, resource.name, nesting)

        if not dry_run do
          source = ServiceGenerator.generate(resource, spec.product, spec.version, spec.base_url)
          write_file(svc_path, source)
        else
          Mix.shell().info("  [dry-run] #{svc_path}")
        end

        # Generate resource (only if it has properties)
        rc =
          if length(resource.properties) > 0 do
            res_path =
              Naming.resource_file_path(spec.product, spec.version, resource.name, nesting)

            if not dry_run do
              source = ResourceGenerator.generate(resource, spec.product, spec.version)
              write_file(res_path, source)
            else
              Mix.shell().info("  [dry-run] #{res_path}")
            end

            rc + 1
          else
            rc
          end

        {sc + 1, rc}
      end)
    end)
  end

  defp write_file(path, content) do
    dir = Path.dirname(path)
    File.mkdir_p!(dir)
    File.write!(path, content)
  end

  defp clean_generated_files do
    Mix.shell().info("Cleaning generated files...")

    for dir <- generated_dirs(), File.dir?(dir) do
      File.rm_rf!(dir)
    end

    File.rm("lib/twilio/object_types.ex")
  end

  @infra_dirs ~w(generator resources twiml)
  defp generated_dirs do
    # Discover product directories (everything under lib/twilio except infrastructure)
    product_dirs =
      Path.wildcard("lib/twilio/*/")
      |> Enum.map(&String.trim_trailing(&1, "/"))
      |> Enum.reject(fn dir ->
        basename = Path.basename(dir)
        basename in @infra_dirs
      end)
      |> Enum.filter(fn dir ->
        # Only include directories that contain generated _service.ex or resource .ex files
        Path.wildcard(Path.join(dir, "**/*_service.ex")) != [] or
          Path.wildcard(Path.join(dir, "**/*.ex")) != []
      end)

    ["lib/twilio/resources" | product_dirs]
  end
end
