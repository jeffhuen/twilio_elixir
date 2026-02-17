# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Api.V2010.Usage.Record.YesterdayService do
  @moduledoc """
  Usage records for yesterday

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """


  Operation: `ListUsageRecordYesterday` | Tags: Api20100401Yesterday

  ## Query Parameters

  | Parameter | Type | Description |
  |-----------|------|-------------|
  | `Category` | string | The [usage category](https://www.twilio.com/docs/usage/api/usage-record#usage-categories) of the UsageRecord resources to read. Only UsageRecord resources in the specified category are retrieved. |
  | `StartDate` | string (date) | Only include usage that has occurred on or after this date. Specify the date in GMT and format as `YYYY-MM-DD`. You can also specify offsets from the current date, such as: `-30days`, which will set the start date to be 30 days before the current date. |
  | `EndDate` | string (date) | Only include usage that occurred on or before this date. Specify the date in GMT and format as `YYYY-MM-DD`.  You can also specify offsets from the current date, such as: `+30days`, which will set the end date to 30 days from the current date. |
  | `IncludeSubaccounts` | boolean | Whether to include usage from the master account and all its subaccounts. Can be: `true` (the default) to include usage from the master account and all subaccounts or `false` to retrieve usage from only the specified account. |
  """
  @spec list(Client.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:error, Twilio.Error.t()}
  def list(client, params \\ %{}, opts \\ []) do
    case Client.request(
           client,
           :get,
           "/2010-04-01/Accounts/#{client.account_sid}/Usage/Records/Yesterday.json",
           params: params,
           opts: opts,
           base_url: "https://api.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "usage_records")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(
                 page.items,
                 Twilio.Resources.Api.V2010.Usage.Record.Yesterday
               )
         }}

      error ->
        error
    end
  end

  @doc "Stream:  (lazy auto-pagination)."
  @spec stream(Client.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, Map.merge(params, page_opts), opts)
      end,
      "usage_records"
    )
  end
end
