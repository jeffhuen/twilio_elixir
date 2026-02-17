# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trusthub.V1.Policies do
  @moduledoc """


  SID prefix: `RN`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `friendly_name` | A human-readable description that is assigned to describe the Policy resource. Examples can include Primary Customer profile policy |
  | `requirements` | The SID of an object that holds the policy information |
  | `sid` | The unique string that identifies the Policy resource. |
  | `url` | The absolute URL of the Policy resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          friendly_name: String.t() | nil,
          requirements: String.t() | nil,
          sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:friendly_name, :requirements, :sid, :url]

  @object_name "trusthub.v1.policies"
  def object_name, do: @object_name

  @sid_prefix "RN"
  def sid_prefix, do: @sid_prefix
end
