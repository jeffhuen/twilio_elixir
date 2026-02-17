# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Content.V1.Content.Approvalrequest.Whatsapp do
  @moduledoc """
  Whatsapp resource.

  Parent: `/Content/{Sid}`
  """

  @type t :: %__MODULE__{
          allow_category_change: boolean() | nil,
          category: String.t() | nil,
          content_type: String.t() | nil,
          name: String.t() | nil,
          rejection_reason: String.t() | nil,
          status: String.t() | nil
        }

  defstruct [:allow_category_change, :category, :content_type, :name, :rejection_reason, :status]

  @object_name "content.v1.content.approval_create"
  def object_name, do: @object_name
end
