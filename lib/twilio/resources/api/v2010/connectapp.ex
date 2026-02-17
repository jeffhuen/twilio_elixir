# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.Connectapp do
  @moduledoc """
  Twilio Connect apps

  SID prefix: `CN`

  Parent: `/Accounts/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the ConnectApp resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `authorize_redirect_url` | The URL we redirect the user to after we authenticate the user and obtain authorization to access the Connect App.. Format: uri. PII: standard |
  | `company_name` | The company name set for the Connect App.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `deauthorize_callback_method` | The HTTP method we use to call `deauthorize_callback_url`.. Values: `GET`, `POST`. Format: http-method |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `deauthorize_callback_url` | The URL we call using the `deauthorize_callback_method` to de-authorize the Connect App.. Format: uri. PII: standard |
  | `description` | The description of the Connect App.. PII: standard |
  | `friendly_name` | The string that you assigned to describe the resource.. PII: standard |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `homepage_url` | The public URL where users can obtain more information about this Connect App.. Format: uri. PII: standard |
  | `permissions` | The set of permissions that your ConnectApp requests. |
  | `sid` | The unique string that that we created to identify the ConnectApp resource. |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          authorize_redirect_url: String.t() | nil,
          company_name: String.t() | nil,
          deauthorize_callback_method: String.t() | nil,
          deauthorize_callback_url: String.t() | nil,
          description: String.t() | nil,
          friendly_name: String.t() | nil,
          homepage_url: String.t() | nil,
          permissions: list() | nil,
          sid: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :authorize_redirect_url,
    :company_name,
    :deauthorize_callback_method,
    :deauthorize_callback_url,
    :description,
    :friendly_name,
    :homepage_url,
    :permissions,
    :sid,
    :uri
  ]

  @object_name "api.v2010.account.connect_app"
  def object_name, do: @object_name

  @sid_prefix "CN"
  def sid_prefix, do: @sid_prefix
end
