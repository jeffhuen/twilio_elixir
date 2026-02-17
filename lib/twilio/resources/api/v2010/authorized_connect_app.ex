# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Api.V2010.AuthorizedConnectApp do
  @moduledoc """
  Authorized Twilio Connect apps

  Parent: `/Accounts/{Sid}.json`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the AuthorizedConnectApp resource. |
  | `connect_app_company_name` | The company name set for the Connect App. |
  | `connect_app_description` | A detailed description of the Connect App. |
  | `connect_app_friendly_name` | The name of the Connect App. |
  | `connect_app_homepage_url` | The public URL for the Connect App.. Format: uri |
  | `connect_app_sid` | The SID that we assigned to the Connect App. |
  | `permissions` | The set of permissions that you authorized for the Connect App.  Can be: `get-all` or `post-all`. |
  | `uri` | The URI of the resource, relative to `https://api.twilio.com`. |
  """

  @type t :: %__MODULE__{
          account_sid: String.t() | nil,
          connect_app_company_name: String.t() | nil,
          connect_app_description: String.t() | nil,
          connect_app_friendly_name: String.t() | nil,
          connect_app_homepage_url: String.t() | nil,
          connect_app_sid: String.t() | nil,
          permissions: list() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :account_sid,
    :connect_app_company_name,
    :connect_app_description,
    :connect_app_friendly_name,
    :connect_app_homepage_url,
    :connect_app_sid,
    :permissions,
    :uri
  ]

  @object_name "api.v2010.account.authorized_connect_app"
  def object_name, do: @object_name
end
