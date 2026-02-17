# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Wireless.V1.Sim.DataSession do
  @moduledoc """
  Data session information for SIMs

  Parent: `/Sims/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the DataSession resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `cell_id` | The unique ID of the cellular tower that the device was attached to at the moment when the Data Session was last updated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `cell_location_estimate` | An object that describes the estimated location in latitude and longitude where the device's Data Session took place. The location is derived from the `cell_id` when the Data Session was last updated. See [Cell Location Estimate Object](https://www.twilio.com/docs/iot/wireless/api/datasession-resource#cell-location-estimate-object).  |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `end` | The date that the record ended, given as GMT in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `imei` | The 'international mobile equipment identity' is the unique ID of the device using the SIM to connect. An IMEI is a 15-digit string: 14 digits for the device identifier plus a check digit calculated using the Luhn formula. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `last_updated` | The date that the resource was last updated, given as GMT in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.. Format: date-time |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `operator_country` | The three letter country code representing where the device's Data Session took place. This is determined by looking up the `operator_mcc`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `operator_mcc` | The 'mobile country code' is the unique ID of the home country where the Data Session took place. See: [MCC/MNC lookup](http://mcc-mnc.com/). |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `operator_mnc` | The 'mobile network code' is the unique ID specific to the mobile operator network where the Data Session took place. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `operator_name` | The friendly name of the mobile operator network that the [SIM](https://www.twilio.com/docs/iot/wireless/api/sim-resource)-connected device is attached to. This is determined by looking up the `operator_mnc`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `packets_downloaded` | The number of packets downloaded by the device between the `start` time and when the Data Session was last updated. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `packets_uploaded` | The number of packets uploaded by the device between the `start` time and when the Data Session was last updated. |
  | `radio_link` | The generation of wireless technology that the device was using. |
  | `sid` | The unique string that we created to identify the DataSession resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `sim_sid` | The SID of the [Sim resource](https://www.twilio.com/docs/iot/wireless/api/sim-resource) that the Data Session is for. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `start` | The date that the Data Session started, given as GMT in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.. Format: date-time |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          cell_id: String.t() | nil,
          cell_location_estimate: String.t() | nil,
          end: String.t() | nil,
          imei: String.t() | nil,
          last_updated: String.t() | nil,
          operator_country: String.t() | nil,
          operator_mcc: String.t() | nil,
          operator_mnc: String.t() | nil,
          operator_name: String.t() | nil,
          packets_downloaded: integer(),
          packets_uploaded: integer(),
          radio_link: String.t() | nil,
          sid: String.t() | nil,
          sim_sid: String.t() | nil,
          start: String.t() | nil
        }

  defstruct [
    :account_sid,
    :cell_id,
    :cell_location_estimate,
    :end,
    :imei,
    :last_updated,
    :operator_country,
    :operator_mcc,
    :operator_mnc,
    :operator_name,
    :packets_downloaded,
    :packets_uploaded,
    :radio_link,
    :sid,
    :sim_sid,
    :start
  ]

  @object_name "wireless.v1.sim.data_session"
  def object_name, do: @object_name
end
