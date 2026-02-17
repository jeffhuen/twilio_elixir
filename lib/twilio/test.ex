defmodule Twilio.Test do
  @moduledoc """
  Test helpers for stubbing Twilio HTTP requests.

  Uses NimbleOwnership for per-process stub isolation,
  enabling `async: true` tests.

  ## Usage

      setup do
        Twilio.Test.stub(fn method, url, headers, body ->
          {200, [], ~s({"sid": "SM123"})}
        end)

        client = Twilio.client("ACtest", "token")
        {:ok, client: client}
      end

      test "sends a message", %{client: client} do
        assert {:ok, msg} = Twilio.Api.V2010.MessageService.create(client, params)
        assert msg["sid"] == "SM123"
      end
  """

  @ownership Twilio.Test.Ownership

  @doc """
  Start the ownership server. Called from test_helper.exs.
  """
  def start do
    NimbleOwnership.start_link(name: @ownership)
  end

  @doc """
  Register a stub function for the current test process.

  The function receives `(method, url, headers, body)` and must return
  `{status, headers, body}`.
  """
  @spec stub((String.t(), String.t(), list(), String.t() | nil ->
                {integer(), list(), String.t()})) ::
          :ok
  def stub(fun) when is_function(fun, 4) do
    NimbleOwnership.get_and_update(@ownership, self(), :stub, fn
      nil -> {:ok, fun}
      _existing -> {:ok, fun}
    end)

    :ok
  end

  @doc false
  def fetch_stub(pid) do
    if GenServer.whereis(@ownership) do
      with {:ok, owner_pid} <- NimbleOwnership.fetch_owner(@ownership, [pid], :stub),
           {:ok, fun} <- NimbleOwnership.get_and_update(@ownership, owner_pid, :stub, &{&1, &1}) do
        {:ok, fun}
      else
        _ -> :error
      end
    else
      :error
    end
  end

  @doc """
  Allow another process to use the current process's stub.
  """
  @spec allow(pid()) :: :ok
  def allow(pid) do
    NimbleOwnership.allow(@ownership, self(), pid, :stub)
    :ok
  end
end
