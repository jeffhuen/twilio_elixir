defmodule Twilio.TwiML.VoiceResponse do
  @moduledoc """
  TwiML for voice calls.

  ## Example

      alias Twilio.TwiML.VoiceResponse

      VoiceResponse.new()
      |> VoiceResponse.say("Hello!", voice: "alice")
      |> VoiceResponse.gather(num_digits: 1, children: [
        VoiceResponse.say_element("Press 1 for sales.")
      ])
      |> VoiceResponse.to_xml()
  """

  alias Twilio.TwiML

  @type t :: TwiML.t()

  @spec new() :: t()
  def new, do: %TwiML{}

  @spec to_xml(t()) :: String.t()
  def to_xml(twiml), do: TwiML.to_xml(twiml, "Response")

  @doc "Say text to the caller."
  @spec say(t(), String.t(), keyword()) :: t()
  def say(twiml, message, opts \\ []) do
    attrs = opts_to_attrs(opts, [:voice, :language, :loop])
    TwiML.add_element(twiml, "Say", attrs, [message])
  end

  @doc "Create a Say element for use as a child (e.g. inside Gather)."
  @spec say_element(String.t(), keyword()) :: TwiML.element()
  def say_element(message, opts \\ []) do
    attrs = opts_to_attrs(opts, [:voice, :language, :loop])
    {"Say", attrs, [message]}
  end

  @doc "Play an audio file."
  @spec play(t(), String.t(), keyword()) :: t()
  def play(twiml, url, opts \\ []) do
    attrs = opts_to_attrs(opts, [:loop, :digits])
    TwiML.add_element(twiml, "Play", attrs, [url])
  end

  @doc "Gather input from the caller (DTMF or speech)."
  @spec gather(t(), keyword()) :: t()
  def gather(twiml, opts \\ []) do
    {children, opts} = Keyword.pop(opts, :children, [])

    attrs =
      opts_to_attrs(opts, [
        :input,
        :timeout,
        :num_digits,
        :action,
        :method,
        :finish_on_key,
        :speech_timeout,
        :speech_model,
        :hints,
        :language,
        :profanity_filter,
        :barge_in,
        :enhanced
      ])

    TwiML.add_element(twiml, "Gather", attrs, children)
  end

  @doc "Dial a phone number or SIP endpoint."
  @spec dial(t(), String.t() | nil, keyword()) :: t()
  def dial(twiml, number \\ nil, opts \\ []) do
    {children, opts} = Keyword.pop(opts, :children, [])

    attrs =
      opts_to_attrs(opts, [
        :action,
        :method,
        :timeout,
        :hang_up_on_star,
        :time_limit,
        :caller_id,
        :record,
        :ring_tone,
        :answer_on_bridge
      ])

    all_children = if number, do: [number | children], else: children
    TwiML.add_element(twiml, "Dial", attrs, all_children)
  end

  @doc "Record the caller."
  @spec record(t(), keyword()) :: t()
  def record(twiml, opts \\ []) do
    attrs =
      opts_to_attrs(opts, [
        :action,
        :method,
        :timeout,
        :finish_on_key,
        :max_length,
        :play_beep,
        :trim,
        :transcribe
      ])

    TwiML.add_element(twiml, "Record", attrs, [])
  end

  @doc "Redirect to another TwiML URL."
  @spec redirect(t(), String.t(), keyword()) :: t()
  def redirect(twiml, url, opts \\ []) do
    attrs = opts_to_attrs(opts, [:method])
    TwiML.add_element(twiml, "Redirect", attrs, [url])
  end

  @doc "Hang up the call."
  @spec hangup(t()) :: t()
  def hangup(twiml), do: TwiML.add_element(twiml, "Hangup")

  @doc "Reject an incoming call."
  @spec reject(t(), keyword()) :: t()
  def reject(twiml, opts \\ []) do
    attrs = opts_to_attrs(opts, [:reason])
    TwiML.add_element(twiml, "Reject", attrs, [])
  end

  @doc "Pause for a number of seconds."
  @spec pause(t(), keyword()) :: t()
  def pause(twiml, opts \\ []) do
    attrs = opts_to_attrs(opts, [:length])
    TwiML.add_element(twiml, "Pause", attrs, [])
  end

  @doc "Enqueue a call."
  @spec enqueue(t(), String.t(), keyword()) :: t()
  def enqueue(twiml, name, opts \\ []) do
    attrs = opts_to_attrs(opts, [:action, :method, :wait_url, :wait_url_method, :workflow_sid])
    TwiML.add_element(twiml, "Enqueue", attrs, [name])
  end

  # Nested Dial elements

  @doc "Create a Client noun for use inside Dial."
  @spec client(String.t(), keyword()) :: TwiML.element()
  def client(identity, opts \\ []) do
    attrs = opts_to_attrs(opts, [:method, :status_callback_event, :status_callback, :url])
    {"Client", attrs, [identity]}
  end

  @doc "Create a Number noun for use inside Dial."
  @spec number(String.t(), keyword()) :: TwiML.element()
  def number(phone_number, opts \\ []) do
    attrs =
      opts_to_attrs(opts, [:send_digits, :url, :method, :status_callback_event, :status_callback])

    {"Number", attrs, [phone_number]}
  end

  @doc "Create a Sip noun for use inside Dial."
  @spec sip(String.t(), keyword()) :: TwiML.element()
  def sip(uri, opts \\ []) do
    attrs = opts_to_attrs(opts, [:url, :method, :username, :password])
    {"Sip", attrs, [uri]}
  end

  @doc "Create a Queue noun for use inside Dial."
  @spec queue(String.t(), keyword()) :: TwiML.element()
  def queue(name, opts \\ []) do
    attrs = opts_to_attrs(opts, [:url, :method])
    {"Queue", attrs, [name]}
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
