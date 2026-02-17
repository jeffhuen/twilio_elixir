# File generated from Twilio's OpenAPI spec — do not edit manually
defmodule Twilio.Resources.Flex.V1.Configuration do
  @moduledoc """
  Configuration for a Flex instance

  ## Properties

  | Field | Description |
  |-------|-------------|
  | `taskrouter_offline_activity_sid` | The TaskRouter SID of the offline activity. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `account_sid` | The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Configuration resource. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_updated` | The date and time in GMT when the Configuration resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `taskrouter_worker_attributes` | The TaskRouter Worker attributes. |
  | `taskrouter_target_taskqueue_sid` | The SID of the TaskRouter Target TaskQueue. |
  | `ui_dependencies` | The object that defines the NPM packages and versions to be used in Hosted Flex. |
  | `public_attributes` | The list of public attributes, which are visible to unauthenticated clients. |
  | `crm_fallback_url` | The CRM Fallback URL. |
  | `plugin_service_attributes` | The plugin service attributes. |
  | `citrix_voice_vdi` | Citrix voice vdi configuration and settings. |
  | `flex_insights_drilldown` | Setting this to true will redirect Flex UI to the URL set in flex_url |
  | `flex_ui_status_report` | Configurable parameters for Flex UI Status report. |
  | `messaging_service_instance_sid` | The SID of the Messaging service instance. |
  | `flex_url` | URL to redirect to in case drilldown is enabled. |
  | `taskrouter_taskqueues` | The list of TaskRouter TaskQueues. |
  | `agent_conv_end_methods` | Agent conversation end methods. |
  | `call_recording_enabled` | Whether call recording is enabled. |
  | `url` | The absolute URL of the Configuration resource.. Format: uri |
  | `ui_attributes` | The object that describes Flex UI characteristics and settings. |
  | `chat_service_instance_sid` | The SID of the chat service this user belongs to. |
  | `service_version` | The Flex Service version. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `integrations` | A list of objects that contain the configurations for the Integrations supported in this configuration. |
  | `taskrouter_skills` | The Skill description for TaskRouter workers. |
  | `crm_enabled` | Whether CRM is present for Flex. |
  | `runtime_domain` | The URL where the Flex instance is hosted. |
  | `channel_configs` | Settings for different limits for Flex Conversations channels attachments. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `date_created` | The date and time in GMT when the Configuration resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.. Format: date-time |
  | `taskrouter_worker_channels` | The TaskRouter default channel capacities and availability for workers. |
  | `taskrouter_workspace_sid` | The SID of the TaskRouter Workspace. |
  | `queue_stats_configuration` | Configurable parameters for Queues Statistics. |
  | `flex_instance_sid` | The SID of the Flex instance. |
  # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
  | `status` | The status of the Flex onboarding. Can be: `ok`, `inprogress`,`notstarted`.. Values: `ok`, `inprogress`, `notstarted` |
  | `crm_callback_url` | The CRM Callback URL. |
  | `debugger_integration` | Configurable parameters for Debugger Integration. |
  | `ui_version` | The Pinned UI version. |
  | `notifications` | Configurable parameters for Notifications. |
  | `offline_config` | Presence and presence ttl configuration |
  | `crm_attributes` | An object that contains the CRM attributes. |
  | `outbound_call_flows` | The list of outbound call flows. |
  | `markdown` | Configurable parameters for Markdown. |
  | `crm_type` | The CRM type. |
  | `plugin_service_enabled` | Whether the plugin service enabled. |
  | `call_recording_webhook_url` | The call recording webhook URL. |
  | `ui_language` | The primary language of the Flex UI. |
  | `attributes` | An object that contains application-specific data. |
  | `flex_insights_hr` | Object with enabled/disabled flag with list of workspaces. |
  | `flex_service_instance_sid` | The SID of the Flex service instance. |
  | `serverless_service_sids` | The list of serverless service SIDs. |
  | `taskrouter_target_workflow_sid` | The SID of the TaskRouter target Workflow. |
  """

  @type t :: %__MODULE__{
          taskrouter_offline_activity_sid: String.t() | nil,
          account_sid: String.t() | nil,
          date_updated: String.t() | nil,
          taskrouter_worker_attributes: String.t() | nil,
          taskrouter_target_taskqueue_sid: String.t() | nil,
          ui_dependencies: String.t() | nil,
          public_attributes: String.t() | nil,
          crm_fallback_url: String.t() | nil,
          plugin_service_attributes: String.t() | nil,
          citrix_voice_vdi: String.t() | nil,
          flex_insights_drilldown: boolean() | nil,
          flex_ui_status_report: String.t() | nil,
          messaging_service_instance_sid: String.t() | nil,
          flex_url: String.t() | nil,
          taskrouter_taskqueues: list() | nil,
          agent_conv_end_methods: String.t() | nil,
          call_recording_enabled: boolean() | nil,
          url: String.t() | nil,
          ui_attributes: String.t() | nil,
          chat_service_instance_sid: String.t() | nil,
          service_version: String.t() | nil,
          integrations: list() | nil,
          taskrouter_skills: list() | nil,
          crm_enabled: boolean() | nil,
          runtime_domain: String.t() | nil,
          channel_configs: list() | nil,
          date_created: String.t() | nil,
          taskrouter_worker_channels: String.t() | nil,
          taskrouter_workspace_sid: String.t() | nil,
          queue_stats_configuration: String.t() | nil,
          flex_instance_sid: String.t() | nil,
          status: String.t(),
          crm_callback_url: String.t() | nil,
          debugger_integration: String.t() | nil,
          ui_version: String.t() | nil,
          notifications: String.t() | nil,
          offline_config: String.t() | nil,
          crm_attributes: String.t() | nil,
          outbound_call_flows: String.t() | nil,
          markdown: String.t() | nil,
          crm_type: String.t() | nil,
          plugin_service_enabled: boolean() | nil,
          call_recording_webhook_url: String.t() | nil,
          ui_language: String.t() | nil,
          attributes: String.t() | nil,
          flex_insights_hr: String.t() | nil,
          flex_service_instance_sid: String.t() | nil,
          serverless_service_sids: list() | nil,
          taskrouter_target_workflow_sid: String.t() | nil
        }

  # credo:disable-for-next-line Credo.Check.Warning.StructFieldAmount
  defstruct [
    :taskrouter_offline_activity_sid,
    :account_sid,
    :date_updated,
    :taskrouter_worker_attributes,
    :taskrouter_target_taskqueue_sid,
    :ui_dependencies,
    :public_attributes,
    :crm_fallback_url,
    :plugin_service_attributes,
    :citrix_voice_vdi,
    :flex_insights_drilldown,
    :flex_ui_status_report,
    :messaging_service_instance_sid,
    :flex_url,
    :taskrouter_taskqueues,
    :agent_conv_end_methods,
    :call_recording_enabled,
    :url,
    :ui_attributes,
    :chat_service_instance_sid,
    :service_version,
    :integrations,
    :taskrouter_skills,
    :crm_enabled,
    :runtime_domain,
    :channel_configs,
    :date_created,
    :taskrouter_worker_channels,
    :taskrouter_workspace_sid,
    :queue_stats_configuration,
    :flex_instance_sid,
    :status,
    :crm_callback_url,
    :debugger_integration,
    :ui_version,
    :notifications,
    :offline_config,
    :crm_attributes,
    :outbound_call_flows,
    :markdown,
    :crm_type,
    :plugin_service_enabled,
    :call_recording_webhook_url,
    :ui_language,
    :attributes,
    :flex_insights_hr,
    :flex_service_instance_sid,
    :serverless_service_sids,
    :taskrouter_target_workflow_sid
  ]

  @object_name "flex.v1.configuration"
  def object_name, do: @object_name
end
