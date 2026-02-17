defmodule Mix.Tasks.Twilio.Generate do
  @moduledoc "Generate Twilio SDK modules from OpenAPI specs."
  @shortdoc "Generate Twilio SDK from OpenAPI specs"

  use Mix.Task

  alias Twilio.Generator.{Naming, OpenAPI, RegistryGenerator, ResourceGenerator, ServiceGenerator}

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
      all_generated = ["lib/twilio/object_types.ex" | generated_globs]
      Mix.Task.rerun("format", all_generated)

      # Post-format: add credo disables for unavoidably long lines, then re-format
      fix_long_lines(all_generated)
      Mix.Task.rerun("format", all_generated)
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
        generate_service_file(resource, spec, dry_run)
        rc = rc + generate_resource_file(resource, spec, dry_run)
        {sc + 1, rc}
      end)
    end)
  end

  defp generate_service_file(resource, spec, dry_run) do
    nesting = resource[:nesting] || []
    path = Naming.service_file_path(spec.product, spec.version, resource.name, nesting)

    if dry_run do
      Mix.shell().info("  [dry-run] #{path}")
    else
      source = ServiceGenerator.generate(resource, spec.product, spec.version, spec.base_url)
      write_file(path, source)
    end
  end

  defp generate_resource_file(%{properties: []}, _spec, _dry_run), do: 0

  defp generate_resource_file(resource, spec, dry_run) do
    nesting = resource[:nesting] || []
    path = Naming.resource_file_path(spec.product, spec.version, resource.name, nesting)

    if dry_run do
      Mix.shell().info("  [dry-run] #{path}")
    else
      source = ResourceGenerator.generate(resource, spec.product, spec.version)
      write_file(path, source)
    end

    1
  end

  defp write_file(path, content) do
    dir = Path.dirname(path)
    File.mkdir_p!(dir)
    File.write!(path, content)
  end

  defp clean_generated_files do
    Mix.shell().info("Cleaning generated files...")

    generated_dirs()
    |> Enum.filter(&File.dir?/1)
    |> Enum.each(&File.rm_rf!/1)

    _ = File.rm("lib/twilio/object_types.ex")

    :ok
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

  @max_line_length 120
  @credo_disable "# credo:disable-for-next-line Credo.Check.Readability.MaxLineLength"

  defp fix_long_lines(globs) do
    globs
    |> Enum.flat_map(&Path.wildcard/1)
    |> Enum.each(fn path ->
      original = File.read!(path)
      fixed = insert_credo_disables(original)

      if fixed != original do
        File.write!(path, fixed)
      end
    end)
  end

  defp insert_credo_disables(source) do
    source
    |> String.split("\n")
    |> Enum.reduce([], fn line, acc ->
      if String.length(line) > @max_line_length and
           not String.contains?(line, "credo:disable") and
           not preceded_by_disable?(acc) do
        indent = String.length(line) - String.length(String.trim_leading(line))
        disable = String.duplicate(" ", indent) <> @credo_disable
        [line, disable | acc]
      else
        [line | acc]
      end
    end)
    |> Enum.reverse()
    |> Enum.join("\n")
  end

  defp preceded_by_disable?([prev | _]) do
    String.contains?(prev, "credo:disable")
  end

  defp preceded_by_disable?([]), do: false
end
