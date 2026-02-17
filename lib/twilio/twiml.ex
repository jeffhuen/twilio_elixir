defmodule Twilio.TwiML do
  @moduledoc """
  Base module for TwiML XML generation.

  TwiML (Twilio Markup Language) is the set of XML instructions
  Twilio uses to handle incoming calls and messages.

  Use `Twilio.TwiML.VoiceResponse` or `Twilio.TwiML.MessagingResponse`
  to build TwiML documents.
  """

  @type element :: {String.t(), map(), [element() | String.t()]}

  @type t :: %__MODULE__{
          elements: [element()]
        }

  defstruct elements: []

  @doc """
  Add an element to the TwiML document.
  """
  @spec add_element(t(), String.t(), map(), [element() | String.t()]) :: t()
  def add_element(%__MODULE__{elements: elements} = twiml, name, attrs \\ %{}, children \\ []) do
    %{twiml | elements: elements ++ [{name, attrs, children}]}
  end

  @doc """
  Render TwiML to an XML string.
  """
  @spec to_xml(t(), String.t()) :: String.t()
  def to_xml(%__MODULE__{elements: elements}, root_tag) do
    children_xml = Enum.map_join(elements, "", &render_element/1)
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?><#{root_tag}>#{children_xml}</#{root_tag}>"
  end

  defp render_element({name, attrs, []}) do
    "<#{name}#{render_attrs(attrs)}/>"
  end

  defp render_element({name, attrs, children}) do
    children_str =
      Enum.map_join(children, "", fn
        child when is_binary(child) -> xml_escape(child)
        child -> render_element(child)
      end)

    "<#{name}#{render_attrs(attrs)}>#{children_str}</#{name}>"
  end

  defp render_attrs(attrs) when map_size(attrs) == 0, do: ""

  defp render_attrs(attrs) do
    attrs
    |> Enum.sort()
    |> Enum.map_join(fn {k, v} -> " #{k}=\"#{xml_escape_attr(to_string(v))}\"" end)
  end

  defp xml_escape(str) do
    str
    |> String.replace("&", "&amp;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
  end

  defp xml_escape_attr(str) do
    str
    |> xml_escape()
    |> String.replace("\"", "&quot;")
    |> String.replace("'", "&apos;")
  end
end
