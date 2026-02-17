# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Voice.V1.Sourceipmapping do
  @moduledoc """
  With Source IP Mappings, Twilio can recognize your SIP requests based on where they are sent from. The Request-URI no longer has to have the FQDN (Fully Qualified Domain Name) of your SIP Domain.

  SID prefix: `IB`

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `date_created` | The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `date_updated` | The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.. Format: date-time |
  | `ip_record_sid` | The Twilio-provided string that uniquely identifies the IP Record resource to map from. |
  | `sid` | The unique string that we created to identify the IP Record resource. |
  | `sip_domain_sid` | The SID of the SIP Domain that the IP Record is mapped to. |
  | `url` | The absolute URL of the resource.. Format: uri |
  """

  @type t :: %__MODULE__{
          date_created: String.t() | nil,
          date_updated: String.t() | nil,
          ip_record_sid: String.t() | nil,
          sid: String.t() | nil,
          sip_domain_sid: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:date_created, :date_updated, :ip_record_sid, :sid, :sip_domain_sid, :url]

  @object_name "voice.v1.source_ip_mapping"
  def object_name, do: @object_name

  @sid_prefix "IB"
  def sid_prefix, do: @sid_prefix
end
