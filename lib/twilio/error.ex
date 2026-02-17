defmodule Twilio.Error do
  @moduledoc """
  Twilio API error.

  Represents both API errors (4xx/5xx responses with Twilio error bodies)
  and connection-level errors (network failures, timeouts).
  """

  @type error_type ::
          :api_error
          | :authentication_error
          | :rate_limit_error
          | :not_found_error
          | :invalid_request_error
          | :connection_error

  @type t :: %__MODULE__{
          type: error_type(),
          message: String.t() | nil,
          code: integer() | nil,
          http_status: integer() | nil,
          http_body: String.t() | nil,
          more_info: String.t() | nil,
          details: map() | nil,
          request_id: String.t() | nil,
          retry_after: integer() | nil
        }

  defstruct [
    :type,
    :message,
    :code,
    :http_status,
    :http_body,
    :more_info,
    :details,
    :request_id,
    :retry_after
  ]

  @doc "Build error from HTTP response status, body, and headers."
  @spec from_response(integer(), String.t(), list()) :: t()
  def from_response(status, body, headers) do
    request_id = get_header(headers, "x-twilio-request-id")
    retry_after_raw = get_header(headers, "retry-after")

    error_data =
      case JSON.decode(body) do
        {:ok, data} -> data
        _ -> %{}
      end

    %__MODULE__{
      type: error_type_from_status(status),
      message: error_data["message"],
      code: error_data["code"],
      http_status: status,
      http_body: body,
      more_info: error_data["more_info"],
      details: error_data["details"],
      request_id: request_id,
      retry_after: parse_retry_after(retry_after_raw)
    }
  end

  @doc "Build a connection error."
  @spec connection_error(String.t()) :: t()
  def connection_error(message) do
    %__MODULE__{type: :connection_error, message: message}
  end

  @doc "Is this error retryable?"
  @spec retryable?(t()) :: boolean()
  def retryable?(%__MODULE__{type: :rate_limit_error}), do: true

  def retryable?(%__MODULE__{http_status: status}) when is_integer(status) and status >= 500,
    do: true

  def retryable?(%__MODULE__{type: :connection_error}), do: true
  def retryable?(_), do: false

  defp error_type_from_status(401), do: :authentication_error
  defp error_type_from_status(403), do: :authentication_error
  defp error_type_from_status(404), do: :not_found_error
  defp error_type_from_status(429), do: :rate_limit_error

  defp error_type_from_status(status) when status >= 400 and status < 500,
    do: :invalid_request_error

  defp error_type_from_status(_), do: :api_error

  defp get_header(headers, name) do
    Enum.find_value(headers, fn {k, v} ->
      if String.downcase(k) == name, do: v
    end)
  end

  defp parse_retry_after(nil), do: nil

  defp parse_retry_after(value) do
    case Integer.parse(value) do
      {seconds, _} -> seconds
      :error -> nil
    end
  end
end
