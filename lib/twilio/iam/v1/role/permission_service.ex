# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Iam.V1.Role.PermissionService do
  @moduledoc """
  Service for Permission API operations.

  Operations: `list`
  """

  alias Twilio.Client
  alias Twilio.Deserializer

  @doc """
  List resolved permissions for a role

  Operation: `ListRolePermission` | Tags: IamV1RolePermission
  """
  @spec list(Client.t(), String.t(), map(), keyword()) ::
          {:ok, Twilio.Page.t()} | {:ok, map(), map()} | :ok | {:error, Twilio.Error.t()}
  def list(client, role_sid, params \\ %{}, opts \\ []) do
    case Client.request(client, :get, "/v1/Roles/#{role_sid}/Permissions",
           params: params,
           opts: opts,
           base_url: "https://iam.twilio.com"
         ) do
      {:ok, data} ->
        page = Twilio.Page.from_response(data, "permissions")

        {:ok,
         %{
           page
           | items:
               Deserializer.deserialize_list(page.items, Twilio.Resources.Iam.V1.Role.Permission)
         }}

      error ->
        error
    end
  end

  @doc "Stream: List resolved permissions for a role (lazy auto-pagination)."
  @spec stream(Client.t(), String.t(), map(), keyword()) :: Enumerable.t()
  def stream(client, role_sid, params \\ %{}, opts \\ []) do
    Twilio.Page.stream(
      fn page_opts ->
        list(client, role_sid, Map.merge(params, page_opts), opts)
      end,
      "permissions"
    )
  end
end
