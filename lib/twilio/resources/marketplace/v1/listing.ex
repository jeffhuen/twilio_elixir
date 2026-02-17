# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Marketplace.V1.Listing do
  @moduledoc """
  Listing resource.

  SID prefix: `XB`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `configuration` | A JSON object for providing listing specific configuration. Contains button setup, notification url, among others. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `description` | A JSON object describing the module and is displayed under the Description tab of the Module detail page. You can define the main body of the description, highlight key features or aspects of the module and if applicable, provide code samples for developers |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `documentation` | A JSON object for providing comprehensive information, instructions, and resources related to the module |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `module_info` | A JSON object containing essential attributes that define a module. This information is presented on the Module detail page in the Twilio Marketplace Catalog. You can pass the following attributes in the JSON object |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `policies` | A JSON object describing the module's privacy and legal policies and is displayed under the Policies tab of the Module detail page. The maximum file size for Policies is 5MB |
  | `pricing` | A JSON object for providing Listing specific pricing information. |
  | `sid` | ModuleSid that identifies this Listing. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `support` | A JSON object containing information on how customers can obtain support for the module. Use this parameter to provide details such as contact information and support description. |
  | `url` | URL to query the subresource.. Format: uri |
  """

  @type t :: %__MODULE__{
          configuration: map() | nil,
          description: map() | nil,
          documentation: map() | nil,
          module_info: map() | nil,
          policies: map() | nil,
          pricing: map() | nil,
          sid: String.t() | nil,
          support: map() | nil,
          url: String.t() | nil
        }

  defstruct [
    :configuration,
    :description,
    :documentation,
    :module_info,
    :policies,
    :pricing,
    :sid,
    :support,
    :url
  ]

  @object_name "marketplace.v1.module_data_management"
  def object_name, do: @object_name

  @sid_prefix "XB"
  def sid_prefix, do: @sid_prefix
end
