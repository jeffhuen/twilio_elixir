# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p.Usecase do
  @moduledoc """
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  Messaging Service Use Case resource. Fetch possible use cases for service. The Use Cases API returns an empty list if there is an issue with the customer's A2P brand registration. This Brand cannot register any campaign use cases. Customers are requested to contact support with their A2P brand information.

  Parent: `/Services/{Sid}`

  ## Properties

  | Field | Description |
  |-------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `us_app_to_person_usecases` | Human readable name, code, description and post_approval_required (indicates whether or not post approval is required for this Use Case) of A2P Campaign Use Cases. |
  """

  @type t :: %__MODULE__{
          us_app_to_person_usecases: list() | nil
        }

  defstruct [:us_app_to_person_usecases]

  @object_name "messaging.v1.service.us_app_to_person_usecase"
  def object_name, do: @object_name
end
