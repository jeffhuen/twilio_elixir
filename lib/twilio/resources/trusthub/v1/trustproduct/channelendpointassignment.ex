# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Trusthub.V1.Trustproduct.Channelendpointassignment do
  @moduledoc """


  SID prefix: `RA`

  Parent: `/TrustProducts/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Item Assignment resource. |
  | `channel_endpoint_sid` | The SID of an channel endpoint |
  | `channel_endpoint_type` | The type of channel endpoint. eg: phone-number |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `sid` | The unique string that we created to identify the Item Assignment resource. |
  | `trust_product_sid` | The unique string that we created to identify the CustomerProfile resource. |
  | `url` | The absolute URL of the Identity resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          channel_endpoint_sid: String.t() | nil,
          channel_endpoint_type: String.t() | nil,
          date_created: String.t() | nil,
          sid: String.t() | nil,
          trust_product_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :account_sid,
    :channel_endpoint_sid,
    :channel_endpoint_type,
    :date_created,
    :sid,
    :trust_product_sid,
    :url
  ]

  @object_name "trusthub.v1.trust_product.trust_product_channel_endpoint_assignment"
  def object_name, do: @object_name

  @sid_prefix "RA"
  def sid_prefix, do: @sid_prefix
end
