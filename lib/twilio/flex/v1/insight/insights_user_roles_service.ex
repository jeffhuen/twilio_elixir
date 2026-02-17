# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Flex.V1.Insight.InsightsUserRolesService do
  @moduledoc """
  Service for InsightsUserRoles API operations.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  This is used by Flex UI and Quality Management to fetch the Flex Insights roles for the user

  Operation: `FetchInsightsUserRoles` | Tags: FlexV1InsightsUserRoles
  """
  @spec fetch(Client.t(), keyword()) ::
          {:ok, Twilio.Resources.Flex.V1.Insight.InsightsUserRoles.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Insights/UserRoles",
             opts: opts,
             base_url: "https://flex-api.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Flex.V1.Insight.InsightsUserRoles)}
    end
  end
end
