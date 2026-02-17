defmodule Twilio.CodegenDeterminismTest do
  use ExUnit.Case

  @moduletag :codegen

  @generated_dirs ~w(lib/twilio/api lib/twilio/resources)

  test "codegen produces identical output across two runs" do
    Mix.Task.rerun("twilio.generate", ["--clean"])
    first_run = hash_generated_files()

    assert first_run != [], "No generated files found"

    Mix.Task.rerun("twilio.generate", ["--clean"])
    second_run = hash_generated_files()

    assert first_run == second_run,
           "Codegen is not deterministic — file hashes differ between runs"
  end

  defp hash_generated_files do
    @generated_dirs
    |> Enum.flat_map(&Path.wildcard(Path.join(&1, "**/*.ex")))
    |> Enum.sort()
    |> Enum.map(fn path ->
      hash = :crypto.hash(:sha256, File.read!(path)) |> Base.encode16(case: :lower)
      {path, hash}
    end)
  end
end
