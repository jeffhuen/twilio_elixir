# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Supersim.V1.Networkaccessprofile do
  @moduledoc """


  SID prefix: `HA`

  ## Sub-resources
  - `networks` — `/v1/NetworkAccessProfiles/{network_access_profile_sid}/Networks`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that the Network Access Profile belongs to. |
  | `date_created` | The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `date_updated` | The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `links` | Format: uri-map |
  | `sid` | The unique string that identifies the Network Access Profile resource. |
  | `unique_name` | An application-defined string that uniquely identifies the resource. It can be used in place of the resource's `sid` in the URL to address the resource. |
  | `url` | The absolute URL of the Network Access Profile resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          links: map() | nil,
          sid: String.t() | nil,
          unique_name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:account_sid, :date_created, :date_updated, :links, :sid, :unique_name, :url]

  @object_name "supersim.v1.network_access_profile"
  def object_name, do: @object_name

  @sid_prefix "HA"
  def sid_prefix, do: @sid_prefix
end
