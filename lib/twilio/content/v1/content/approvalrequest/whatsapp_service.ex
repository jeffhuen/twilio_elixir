# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Content.V1.Content.Approvalrequest.WhatsappService do
  @moduledoc """


  Operations: `create`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Create a ContentApprovalRequest for a content item

  Operation: `CreateApprovalCreate` | Tags: Contentv1ApprovalCreate
  """
  @spec create(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Content.V1.Content.Approvalrequest.Whatsapp.t()}
          | {:error, Twilio.Error.t()}
  def create(client, content_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Content/#{content_sid}/ApprovalRequests/whatsapp",
             params: params,
             opts: opts,
             base_url: "https://content.twilio.com",
             content_type: :json
           ) do
      {:ok,
       Deserializer.deserialize(
         data,
         Twilio.Resources.Content.V1.Content.Approvalrequest.Whatsapp
       )}
    end
  end
end
