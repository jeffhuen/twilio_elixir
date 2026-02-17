defmodule Twilio.TwiML.MessagingResponse do
  @moduledoc """
  TwiML for messaging webhooks.

  ## Example

      alias Twilio.TwiML.MessagingResponse

      MessagingResponse.new()
      |> MessagingResponse.message("Thanks for your message!")
      |> MessagingResponse.to_xml()
  """

  alias Twilio.TwiML

  @type t :: TwiML.t()

  @spec new() :: t()
  def new, do: %TwiML{}

  @spec to_xml(t()) :: String.t()
  def to_xml(twiml), do: TwiML.to_xml(twiml, "Response")

  @doc "Send a message."
  @spec message(t(), String.t(), keyword()) :: t()
  def message(twiml, body, opts \\ []) do
    {children, opts} = Keyword.pop(opts, :children, [])
    attrs = opts_to_attrs(opts, [:to, :from, :action, :method, :status_callback])
    all_children = [{"Body", %{}, [body]} | children]
    TwiML.add_element(twiml, "Message", attrs, all_children)
  end

  @doc "Create a Media element for use inside Message."
  @spec media(String.t()) :: TwiML.element()
  def media(url), do: {"Media", %{}, [url]}

  @doc "Redirect to another TwiML URL."
  @spec redirect(t(), String.t(), keyword()) :: t()
  def redirect(twiml, url, opts \\ []) do
    attrs = opts_to_attrs(opts, [:method])
    TwiML.add_element(twiml, "Redirect", attrs, [url])
  end

  defp opts_to_attrs(opts, allowed_keys) do
    opts
    |> Keyword.take(allowed_keys)
    |> Enum.into(%{}, fn {k, v} -> {camelize_key(k), v} end)
  end

  defp camelize_key(key) do
    key
    |> Atom.to_string()
    |> String.split("_")
    |> then(fn [first | rest] ->
      first <> Enum.map_join(rest, "", &String.capitalize/1)
    end)
  end
end
