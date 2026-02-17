# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Insights.V1.Voice.AnnotationService do
  @moduledoc """
  Service for Annotation API operations.

  Operations: `fetch`, `update`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  Get the Annotation for a specific Call.

  Operation: `FetchAnnotation` | Tags: InsightsV1Annotation
  """
  @spec fetch(Client.t(), String.t(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V1.Voice.Annotation.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def fetch(client, call_sid, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :get, "/v1/Voice/#{call_sid}/Annotation",
             opts: opts,
             base_url: "https://insights.twilio.com"
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V1.Voice.Annotation)}
    end
  end

  @doc """
  Update an Annotation for a specific Call.

  Operation: `UpdateAnnotation` | Tags: InsightsV1Annotation

  ## Optional Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `AnsweredBy` | string | Specify which entity answered the call as determined by Answering Machine Detection. Use this to provide feedback on Answering Machine Detection accuracy. Possible enumerated values, one of: `human`, `machine`. `human` indicates the call was answered by a person. `machine` indicates the call was answered by an answering machine. Values: `unknown_answered_by`, `human`, `machine` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `CallScore` | integer | Specify the call score. This is of type integer. Use a range of 1-5 to indicate the call experience score, with the following mapping as a reference for rating the call [5: Excellent, 4: Good, 3 : Fair, 2 : Poor, 1: Bad]. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Comment` | string | Specify any comments pertaining to the call. `comment` has a maximum character limit of 100. Twilio does not treat this field as PII, so no PII should be included in the `comment`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `ConnectivityIssue` | string | Specify if the call had any connectivity issues. Possible enumerated values, one of `no_connectivity_issue`, `invalid_number`, `caller_id`, `dropped_call`, or `number_reachability`. Values: `unknown_connectivity_issue`, `no_connectivity_issue`, `invalid_number`, `caller_id`, `dropped_call`, `number_reachability` |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Incident` | string | Associate this call with an incident or support ticket. The `incident` parameter is of type string with a maximum character limit of 100. Twilio does not treat this field as PII, so no PII should be included in `incident`. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `QualityIssues` | string | Specify if the call had any subjective quality issues. Possible values, one or more of `no_quality_issue`, `low_volume`, `choppy_robotic`, `echo`, `dtmf`, `latency`, `owa`, `static_noise`. Use comma separated values to indicate multiple quality issues for the same call. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `Spam` | boolean | A boolean flag to indicate if the call was a spam call. Use this to provide feedback on whether calls placed from your account were marked as spam, or if inbound calls received by your account were unwanted spam. Use `true` if the call was a spam call. |
  """
  @spec update(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Resources.Insights.V1.Voice.Annotation.t()}
          | {:ok, map(), map()}
          | :ok
          | {:error, Twilio.Error.t()}
  def update(client, call_sid, params \\ %{}, opts \\ []) do
    with {:ok, data} <-
           Client.request(client, :post, "/v1/Voice/#{call_sid}/Annotation",
             params: params,
             opts: opts,
             base_url: "https://insights.twilio.com",
             content_type: :form
           ) do
      {:ok, Deserializer.deserialize(data, Twilio.Resources.Insights.V1.Voice.Annotation)}
    end
  end
end
