# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Content.V1.Content.ApprovalRequestService do
  @moduledoc """
  An Approval Fetch resource represents the approval status of a Content resource.

  Operations: `fetch`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Fetch a Content resource's approval status by its unique Content Sid

  Operation: `FetchApprovalFetch` | Tags: Contentv1ApprovalFetch
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Content.V1.Content.ApprovalRequest.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Content/#{sid}/ApprovalRequests",
             opts: opts,
             base_url: "https://content.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Content.V1.Content.ApprovalRequest)}
    end
  end
end
