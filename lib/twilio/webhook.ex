defmodule Twilio.Webhook do
  @moduledoc """
  Webhook request validation.

  Verifies that incoming HTTP requests are genuinely from Twilio
  using HMAC-SHA1 signature verification.

  ## Form-encoded webhooks (standard)

      url = "https://myapp.com/webhooks/twilio"
      signature = get_req_header(conn, "x-twilio-signature") |> List.first()

      Twilio.Webhook.valid?(url, params, signature, auth_token)

  ## JSON-bodied webhooks

      Twilio.Webhook.valid_body?(url, raw_body, signature, auth_token)
  """

  import Bitwise

  @doc """
  Validate an incoming webhook request signature.

  Concatenates the URL with sorted POST parameters, computes
  HMAC-SHA1 with the auth token, and compares to the signature.
  """
  @spec valid?(String.t(), map(), String.t(), String.t()) :: boolean()
  def valid?(url, params, signature, auth_token) do
    expected = build_signature(url, params, auth_token)
    secure_compare(expected, signature)
  end

  @doc """
  Validate a webhook with a JSON body.

  For JSON-bodied requests, Twilio signs the URL with the body's SHA256 hash
  appended as a `bodySHA256` query parameter.
  """
  @spec valid_body?(String.t(), String.t(), String.t(), String.t()) :: boolean()
  def valid_body?(url, body, signature, auth_token) do
    body_hash = build_body_hash(body)
    url_with_hash = append_body_hash(url, body_hash)
    expected = build_signature(url_with_hash, %{}, auth_token)
    secure_compare(expected, signature)
  end

  @doc """
  Build the expected HMAC-SHA1 signature for a request.
  """
  @spec build_signature(String.t(), map(), String.t()) :: String.t()
  def build_signature(url, params, auth_token) do
    data = url <> sorted_params_string(params)

    :crypto.mac(:hmac, :sha, auth_token, data)
    |> Base.encode64()
  end

  @doc """
  Build the SHA256 hash of a request body (for JSON webhook validation).
  """
  @spec build_body_hash(String.t()) :: String.t()
  def build_body_hash(body) do
    :crypto.hash(:sha256, body)
    |> Base.encode16(case: :lower)
  end

  defp sorted_params_string(params) when map_size(params) == 0, do: ""

  defp sorted_params_string(params) do
    params
    |> Enum.sort_by(fn {key, _} -> to_string(key) end)
    |> Enum.map_join(fn {key, value} -> "#{key}#{value}" end)
  end

  defp append_body_hash(url, hash) do
    separator = if String.contains?(url, "?"), do: "&", else: "?"
    "#{url}#{separator}bodySHA256=#{hash}"
  end

  # Constant-time comparison to prevent timing attacks
  defp secure_compare(a, b) when byte_size(a) != byte_size(b), do: false

  defp secure_compare(a, b) do
    a_bytes = :binary.bin_to_list(a)
    b_bytes = :binary.bin_to_list(b)

    Enum.zip(a_bytes, b_bytes)
    |> Enum.reduce(0, fn {x, y}, acc -> bor(acc, bxor(x, y)) end)
    |> Kernel.==(0)
  end
end
