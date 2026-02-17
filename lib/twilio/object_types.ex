# File generated from Twilio's OpenAPI spec — do not edit manually
# credo:disable-for-this-file Credo.Check.Readability.MaxLineLength
defmodule Twilio.ObjectTypes do
  @moduledoc false

  def schema_to_module do
    %{
      "LookupResponse" => Twilio.Resources.Lookups.V2.PhoneNumber,
      "V2Oauth2TokenResponse" => Twilio.Resources.Oauth.V2.Token,
      "accounts.v1.auth_token_promotion" => Twilio.Resources.Accounts.V1.AuthToken.Promote,
      "accounts.v1.bulk_consents" => Twilio.Resources.Accounts.V1.Consent.BulkConsents,
      "accounts.v1.bulk_contacts" => Twilio.Resources.Accounts.V1.Contact.BulkContacts,
      "accounts.v1.credential.credential_aws" => Twilio.Resources.Accounts.V1.Credential.AWS,
      "accounts.v1.credential.credential_public_key" =>
        Twilio.Resources.Accounts.V1.Credential.PublicKey,
      "accounts.v1.messaging_geopermissions" =>
        Twilio.Resources.Accounts.V1.Messaging.MessagingGeopermissions,
      "accounts.v1.safelist" => Twilio.Resources.Accounts.V1.SafeList.Number,
      "accounts.v1.secondary_auth_token" => Twilio.Resources.Accounts.V1.AuthToken.Secondary,
      "api.v2010.account" => Twilio.Resources.Api.V2010.Account,
      "api.v2010.account.address" => Twilio.Resources.Api.V2010.Address,
      "api.v2010.account.address.dependent_phone_number" =>
        Twilio.Resources.Api.V2010.Address.DependentPhoneNumber,
      "api.v2010.account.application" => Twilio.Resources.Api.V2010.Application,
      "api.v2010.account.authorized_connect_app" =>
        Twilio.Resources.Api.V2010.AuthorizedConnectApp,
      "api.v2010.account.available_phone_number_country" =>
        Twilio.Resources.Api.V2010.AvailablePhoneNumberCountry,
      "api.v2010.account.available_phone_number_country.available_phone_number_local" =>
        Twilio.Resources.Api.V2010.AvailablePhoneNumber.Local,
      "api.v2010.account.available_phone_number_country.available_phone_number_machine_to_machine" =>
        Twilio.Resources.Api.V2010.AvailablePhoneNumber.MachineToMachine,
      "api.v2010.account.available_phone_number_country.available_phone_number_mobile" =>
        Twilio.Resources.Api.V2010.AvailablePhoneNumber.Mobile,
      "api.v2010.account.available_phone_number_country.available_phone_number_national" =>
        Twilio.Resources.Api.V2010.AvailablePhoneNumber.National,
      "api.v2010.account.available_phone_number_country.available_phone_number_shared_cost" =>
        Twilio.Resources.Api.V2010.AvailablePhoneNumber.SharedCost,
      "api.v2010.account.available_phone_number_country.available_phone_number_toll_free" =>
        Twilio.Resources.Api.V2010.AvailablePhoneNumber.TollFree,
      "api.v2010.account.available_phone_number_country.available_phone_number_voip" =>
        Twilio.Resources.Api.V2010.AvailablePhoneNumber.Voip,
      "api.v2010.account.balance" => Twilio.Resources.Api.V2010.Balance,
      "api.v2010.account.call" => Twilio.Resources.Api.V2010.Call,
      "api.v2010.account.call.call_event" => Twilio.Resources.Api.V2010.Call.Event,
      "api.v2010.account.call.call_notification-instance" =>
        Twilio.Resources.Api.V2010.Call.Notification,
      "api.v2010.account.call.call_recording" => Twilio.Resources.Api.V2010.Call.Recording,
      "api.v2010.account.call.payments" => Twilio.Resources.Api.V2010.Call.Payment,
      "api.v2010.account.call.realtime_transcription" =>
        Twilio.Resources.Api.V2010.Call.Transcription,
      "api.v2010.account.call.siprec" => Twilio.Resources.Api.V2010.Call.Siprec,
      "api.v2010.account.call.stream" => Twilio.Resources.Api.V2010.Call.Stream,
      "api.v2010.account.call.user_defined_message" =>
        Twilio.Resources.Api.V2010.Call.UserDefinedMessage,
      "api.v2010.account.call.user_defined_message_subscription" =>
        Twilio.Resources.Api.V2010.Call.UserDefinedMessageSubscription,
      "api.v2010.account.conference" => Twilio.Resources.Api.V2010.Conference,
      "api.v2010.account.conference.conference_recording" =>
        Twilio.Resources.Api.V2010.Conference.Recording,
      "api.v2010.account.conference.participant" =>
        Twilio.Resources.Api.V2010.Conference.Participant,
      "api.v2010.account.connect_app" => Twilio.Resources.Api.V2010.ConnectApp,
      "api.v2010.account.incoming_phone_number" => Twilio.Resources.Api.V2010.IncomingPhoneNumber,
      "api.v2010.account.incoming_phone_number.incoming_phone_number_assigned_add_on" =>
        Twilio.Resources.Api.V2010.IncomingPhoneNumber.AssignedAddOn,
      # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
      "api.v2010.account.incoming_phone_number.incoming_phone_number_assigned_add_on.incoming_phone_number_assigned_add_on_extension" =>
        Twilio.Resources.Api.V2010.IncomingPhoneNumber.AssignedAddOn.AssignedAddOnExtension,
      "api.v2010.account.incoming_phone_number.incoming_phone_number_local" =>
        Twilio.Resources.Api.V2010.IncomingPhoneNumber.Local,
      "api.v2010.account.incoming_phone_number.incoming_phone_number_mobile" =>
        Twilio.Resources.Api.V2010.IncomingPhoneNumber.Mobile,
      "api.v2010.account.incoming_phone_number.incoming_phone_number_toll_free" =>
        Twilio.Resources.Api.V2010.IncomingPhoneNumber.TollFree,
      "api.v2010.account.key" => Twilio.Resources.Api.V2010.Key,
      "api.v2010.account.message" => Twilio.Resources.Api.V2010.Message,
      "api.v2010.account.message.media" => Twilio.Resources.Api.V2010.Message.Media,
      "api.v2010.account.message.message_feedback" => Twilio.Resources.Api.V2010.Message.Feedback,
      "api.v2010.account.notification-instance" => Twilio.Resources.Api.V2010.Notification,
      "api.v2010.account.outgoing_caller_id" => Twilio.Resources.Api.V2010.OutgoingCallerId,
      "api.v2010.account.queue" => Twilio.Resources.Api.V2010.Queue,
      "api.v2010.account.queue.member" => Twilio.Resources.Api.V2010.Queue.Member,
      "api.v2010.account.recording" => Twilio.Resources.Api.V2010.Recording,
      "api.v2010.account.recording.recording_add_on_result" =>
        Twilio.Resources.Api.V2010.Recording.AddOnResult,
      "api.v2010.account.recording.recording_add_on_result.recording_add_on_result_payload" =>
        Twilio.Resources.Api.V2010.Recording.AddOnResult.Payload,
      "api.v2010.account.recording.recording_transcription" =>
        Twilio.Resources.Api.V2010.Recording.Transcription,
      "api.v2010.account.short_code" => Twilio.Resources.Api.V2010.SMS.ShortCode,
      "api.v2010.account.signing_key" => Twilio.Resources.Api.V2010.SigningKey,
      "api.v2010.account.sip.sip_credential_list" =>
        Twilio.Resources.Api.V2010.SIP.CredentialList,
      "api.v2010.account.sip.sip_credential_list.sip_credential" =>
        Twilio.Resources.Api.V2010.SIP.CredentialList.Credential,
      "api.v2010.account.sip.sip_domain" => Twilio.Resources.Api.V2010.SIP.Domain,
      "api.v2010.account.sip.sip_domain.sip_auth.sip_auth_calls.sip_auth_calls_credential_list_mapping" =>
        Twilio.Resources.Api.V2010.SIP.Domain.Auth.Call.AuthCallsCredentialListMapping,
      "api.v2010.account.sip.sip_domain.sip_auth.sip_auth_calls.sip_auth_calls_ip_access_control_list_mapping" =>
        Twilio.Resources.Api.V2010.SIP.Domain.Auth.Call.AuthCallsIpAccessControlListMapping,
      # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
      "api.v2010.account.sip.sip_domain.sip_auth.sip_auth_registrations.sip_auth_registrations_credential_list_mapping" =>
        Twilio.Resources.Api.V2010.SIP.Domain.Auth.Registration.AuthRegistrationsCredentialListMapping,
      "api.v2010.account.sip.sip_domain.sip_credential_list_mapping" =>
        Twilio.Resources.Api.V2010.SIP.Domain.CredentialListMapping,
      "api.v2010.account.sip.sip_domain.sip_ip_access_control_list_mapping" =>
        Twilio.Resources.Api.V2010.SIP.Domain.IpAccessControlListMapping,
      "api.v2010.account.sip.sip_ip_access_control_list" =>
        Twilio.Resources.Api.V2010.SIP.IpAccessControlList,
      "api.v2010.account.sip.sip_ip_access_control_list.sip_ip_address" =>
        Twilio.Resources.Api.V2010.SIP.IpAccessControlList.IpAddress,
      "api.v2010.account.token" => Twilio.Resources.Api.V2010.Token,
      "api.v2010.account.transcription" => Twilio.Resources.Api.V2010.Transcription,
      "api.v2010.account.usage.usage_record" => Twilio.Resources.Api.V2010.Usage.Record,
      "api.v2010.account.usage.usage_record.usage_record_all_time" =>
        Twilio.Resources.Api.V2010.Usage.Record.AllTime,
      "api.v2010.account.usage.usage_record.usage_record_daily" =>
        Twilio.Resources.Api.V2010.Usage.Record.Daily,
      "api.v2010.account.usage.usage_record.usage_record_last_month" =>
        Twilio.Resources.Api.V2010.Usage.Record.LastMonth,
      "api.v2010.account.usage.usage_record.usage_record_monthly" =>
        Twilio.Resources.Api.V2010.Usage.Record.Monthly,
      "api.v2010.account.usage.usage_record.usage_record_this_month" =>
        Twilio.Resources.Api.V2010.Usage.Record.ThisMonth,
      "api.v2010.account.usage.usage_record.usage_record_today" =>
        Twilio.Resources.Api.V2010.Usage.Record.Today,
      "api.v2010.account.usage.usage_record.usage_record_yearly" =>
        Twilio.Resources.Api.V2010.Usage.Record.Yearly,
      "api.v2010.account.usage.usage_record.usage_record_yesterday" =>
        Twilio.Resources.Api.V2010.Usage.Record.Yesterday,
      "api.v2010.account.usage.usage_trigger" => Twilio.Resources.Api.V2010.Usage.Trigger,
      "assistants.v1.service.assistant_send_message_response" =>
        Twilio.Resources.Assistants.V1.Assistant.Message,
      "assistants.v1.service.assistant_with_tools_and_knowledge" =>
        Twilio.Resources.Assistants.V1.Assistant,
      "assistants.v1.service.feedback" => Twilio.Resources.Assistants.V1.Assistant.Feedback,
      "assistants.v1.service.knowledge" => Twilio.Resources.Assistants.V1.Assistant.Knowledge,
      "assistants.v1.service.knowledge_chunk" => Twilio.Resources.Assistants.V1.Knowledge.Chunk,
      "assistants.v1.service.knowledge_status" => Twilio.Resources.Assistants.V1.Knowledge.Status,
      "assistants.v1.service.message" => Twilio.Resources.Assistants.V1.Session.Message,
      "assistants.v1.service.tool" => Twilio.Resources.Assistants.V1.Assistant.Tool,
      "bulkexports.v1.export" => Twilio.Resources.Bulkexports.V1.Export,
      "bulkexports.v1.export.day" => Twilio.Resources.Bulkexports.V1.Export.Day,
      "bulkexports.v1.export.export_custom_job" => Twilio.Resources.Bulkexports.V1.Export.Job,
      "bulkexports.v1.export.job" => Twilio.Resources.Bulkexports.V1.Export.Job,
      "bulkexports.v1.export_configuration" =>
        Twilio.Resources.Bulkexports.V1.Export.Configuration,
      "chat.v1.credential" => Twilio.Resources.Chat.V1.Credential,
      "chat.v1.service" => Twilio.Resources.Chat.V1.Service,
      "chat.v1.service.channel" => Twilio.Resources.Chat.V1.Service.Channel,
      "chat.v1.service.channel.invite" => Twilio.Resources.Chat.V1.Service.Channel.Invite,
      "chat.v1.service.channel.member" => Twilio.Resources.Chat.V1.Service.Channel.Member,
      "chat.v1.service.channel.message" => Twilio.Resources.Chat.V1.Service.Channel.Message,
      "chat.v1.service.role" => Twilio.Resources.Chat.V1.Service.Role,
      "chat.v1.service.user" => Twilio.Resources.Chat.V1.Service.User,
      "chat.v1.service.user.user_channel" => Twilio.Resources.Chat.V1.Service.User.Channel,
      "chat.v2.credential" => Twilio.Resources.Chat.V2.Credential,
      "chat.v2.service" => Twilio.Resources.Chat.V2.Service,
      "chat.v2.service.binding" => Twilio.Resources.Chat.V2.Service.Binding,
      "chat.v2.service.channel" => Twilio.Resources.Chat.V2.Service.Channel,
      "chat.v2.service.channel.channel_webhook" =>
        Twilio.Resources.Chat.V2.Service.Channel.Webhook,
      "chat.v2.service.channel.invite" => Twilio.Resources.Chat.V2.Service.Channel.Invite,
      "chat.v2.service.channel.member" => Twilio.Resources.Chat.V2.Service.Channel.Member,
      "chat.v2.service.channel.message" => Twilio.Resources.Chat.V2.Service.Channel.Message,
      "chat.v2.service.role" => Twilio.Resources.Chat.V2.Service.Role,
      "chat.v2.service.user" => Twilio.Resources.Chat.V2.Service.User,
      "chat.v2.service.user.user_binding" => Twilio.Resources.Chat.V2.Service.User.Binding,
      "chat.v2.service.user.user_channel" => Twilio.Resources.Chat.V2.Service.User.Channel,
      "chat.v3.channel" => Twilio.Resources.Chat.V3.Service.Channel,
      "content.v1.content" => Twilio.Resources.Content.V2.Content,
      "content.v1.content.approval_create" =>
        Twilio.Resources.Content.V1.Content.ApprovalRequest.Whatsapp,
      "content.v1.content.approval_fetch" => Twilio.Resources.Content.V1.Content.ApprovalRequest,
      "content.v1.content_and_approvals" => Twilio.Resources.Content.V2.ContentAndApprovals,
      "content.v1.legacy_content" => Twilio.Resources.Content.V1.LegacyContent,
      "conversations.v1.configuration" => Twilio.Resources.Conversations.V1.Configuration,
      "conversations.v1.configuration.configuration_webhook" =>
        Twilio.Resources.Conversations.V1.Configuration.Webhook,
      "conversations.v1.configuration_address" =>
        Twilio.Resources.Conversations.V1.Configuration.Address,
      "conversations.v1.conversation" => Twilio.Resources.Conversations.V1.Conversation,
      "conversations.v1.conversation.conversation_message" =>
        Twilio.Resources.Conversations.V1.Conversation.Message,
      "conversations.v1.conversation.conversation_message.conversation_message_receipt" =>
        Twilio.Resources.Conversations.V1.Conversation.Message.Receipt,
      "conversations.v1.conversation.conversation_participant" =>
        Twilio.Resources.Conversations.V1.Conversation.Participant,
      "conversations.v1.conversation.conversation_scoped_webhook" =>
        Twilio.Resources.Conversations.V1.Conversation.Webhook,
      "conversations.v1.conversation_with_participants" =>
        Twilio.Resources.Conversations.V1.ConversationWithParticipants,
      "conversations.v1.credential" => Twilio.Resources.Conversations.V1.Credential,
      "conversations.v1.participant_conversation" =>
        Twilio.Resources.Conversations.V1.ParticipantConversation,
      "conversations.v1.role" => Twilio.Resources.Conversations.V1.Role,
      "conversations.v1.service" => Twilio.Resources.Conversations.V1.Service,
      "conversations.v1.service.service_binding" =>
        Twilio.Resources.Conversations.V1.Service.Binding,
      "conversations.v1.service.service_configuration" =>
        Twilio.Resources.Conversations.V1.Service.Configuration,
      "conversations.v1.service.service_configuration.service_notification" =>
        Twilio.Resources.Conversations.V1.Service.Configuration.Notification,
      "conversations.v1.service.service_configuration.service_webhook_configuration" =>
        Twilio.Resources.Conversations.V1.Service.Configuration.Webhook,
      "conversations.v1.service.service_conversation" =>
        Twilio.Resources.Conversations.V1.Service.Conversation,
      "conversations.v1.service.service_conversation.service_conversation_message" =>
        Twilio.Resources.Conversations.V1.Service.Conversation.Message,
      # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
      "conversations.v1.service.service_conversation.service_conversation_message.service_conversation_message_receipt" =>
        Twilio.Resources.Conversations.V1.Service.Conversation.Message.Receipt,
      "conversations.v1.service.service_conversation.service_conversation_participant" =>
        Twilio.Resources.Conversations.V1.Service.Conversation.Participant,
      "conversations.v1.service.service_conversation.service_conversation_scoped_webhook" =>
        Twilio.Resources.Conversations.V1.Service.Conversation.Webhook,
      "conversations.v1.service.service_conversation_with_participants" =>
        Twilio.Resources.Conversations.V1.Service.ConversationWithParticipants,
      "conversations.v1.service.service_participant_conversation" =>
        Twilio.Resources.Conversations.V1.Service.ParticipantConversation,
      "conversations.v1.service.service_role" => Twilio.Resources.Conversations.V1.Service.Role,
      "conversations.v1.service.service_user" => Twilio.Resources.Conversations.V1.Service.User,
      "conversations.v1.service.service_user.service_user_conversation" =>
        Twilio.Resources.Conversations.V1.Service.User.Conversation,
      "conversations.v1.user" => Twilio.Resources.Conversations.V1.User,
      "conversations.v1.user.user_conversation" =>
        Twilio.Resources.Conversations.V1.User.Conversation,
      "events.v1.event_type" => Twilio.Resources.Events.V1.Type,
      "events.v1.schema" => Twilio.Resources.Events.V1.Schema,
      "events.v1.schema.schema_version" => Twilio.Resources.Events.V1.Schema.SchemaVersion,
      "events.v1.sink" => Twilio.Resources.Events.V1.Sink,
      "events.v1.sink.sink_test" => Twilio.Resources.Events.V1.Sink.Test,
      "events.v1.sink.sink_validate" => Twilio.Resources.Events.V1.Sink.Validate,
      "events.v1.subscription" => Twilio.Resources.Events.V1.Subscription,
      "events.v1.subscription.subscribed_event" =>
        Twilio.Resources.Events.V1.Subscription.SubscribedEvent,
      "flex.v1.channel" => Twilio.Resources.Flex.V1.Channel,
      "flex.v1.configuration" => Twilio.Resources.Flex.V1.Configuration,
      "flex.v1.flex_flow" => Twilio.Resources.Flex.V1.FlexFlow,
      "flex.v1.insights_assessments" =>
        Twilio.Resources.Flex.V1.Insight.QualityManagement.Assessments,
      "flex.v1.insights_assessments_comment" =>
        Twilio.Resources.Flex.V1.Insight.QualityManagement.Assessment.Comment,
      "flex.v1.insights_conversations" => Twilio.Resources.Flex.V1.Insight.InsightsConversations,
      "flex.v1.insights_questionnaires" =>
        Twilio.Resources.Flex.V1.Insight.QualityManagement.InsightsQuestionnaires,
      "flex.v1.insights_questionnaires_category" =>
        Twilio.Resources.Flex.V1.Insight.QualityManagement.Category,
      "flex.v1.insights_questionnaires_question" =>
        Twilio.Resources.Flex.V1.Insight.QualityManagement.Question,
      "flex.v1.insights_segments" => Twilio.Resources.Flex.V1.Insight.InsightsSegments,
      "flex.v1.insights_session" => Twilio.Resources.Flex.V1.Insight.Session,
      "flex.v1.insights_settings_answersets" =>
        Twilio.Resources.Flex.V1.Insight.QualityManagement.Setting.InsightsSettingsAnswerSets,
      "flex.v1.insights_settings_comment" =>
        Twilio.Resources.Flex.V1.Insight.QualityManagement.Setting.CommentTag,
      "flex.v1.insights_user_roles" => Twilio.Resources.Flex.V1.Insight.InsightsUserRoles,
      "flex.v1.instance" => Twilio.Resources.Flex.V1.Instance,
      "flex.v1.interaction" => Twilio.Resources.Flex.V1.Interaction,
      "flex.v1.interaction.interaction_channel" =>
        Twilio.Resources.Flex.V1.Interaction.InteractionChannel,
      "flex.v1.interaction.interaction_channel.interaction_channel_invite" =>
        Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelInvite,
      "flex.v1.interaction.interaction_channel.interaction_channel_participant" =>
        Twilio.Resources.Flex.V1.Interaction.Channel.InteractionChannelParticipant,
      "flex.v1.interaction.interaction_channel.interaction_transfer" =>
        Twilio.Resources.Flex.V1.Interaction.Channel.InteractionTransfer,
      "flex.v1.plugin" => Twilio.Resources.Flex.V1.PluginService.Plugin,
      "flex.v1.plugin.plugin_version" =>
        Twilio.Resources.Flex.V1.PluginService.Plugin.PluginVersions,
      "flex.v1.plugin_archive" => Twilio.Resources.Flex.V1.PluginService.Plugin.Archive,
      "flex.v1.plugin_configuration" => Twilio.Resources.Flex.V1.PluginService.Configuration,
      "flex.v1.plugin_configuration.configured_plugin" =>
        Twilio.Resources.Flex.V1.PluginService.Configuration.ConfiguredPlugin,
      "flex.v1.plugin_configuration_archive" =>
        Twilio.Resources.Flex.V1.PluginService.Configuration.Archive,
      "flex.v1.plugin_release" => Twilio.Resources.Flex.V1.PluginService.Release,
      "flex.v1.plugin_version_archive" =>
        Twilio.Resources.Flex.V1.PluginService.Plugin.Version.Archive,
      "flex.v1.provisioning_status" => Twilio.Resources.Flex.V1.Account.Provision.Status,
      "flex.v1.web_channel" => Twilio.Resources.Flex.V1.WebChannel,
      "flex.v2.flex_user" => Twilio.Resources.Flex.V2.Instance.User,
      "flex.v2.web_channel" => Twilio.Resources.Flex.V2.WebChannels,
      "frontline.v1.user" => Twilio.Resources.Frontline.V1.User,
      "iam.v1.key" => Twilio.Resources.Iam.V1.GetApiKeys,
      "insights.v1.account_settings" => Twilio.Resources.Insights.V1.Voice.Setting,
      "insights.v1.call" => Twilio.Resources.Insights.V1.Voice,
      "insights.v1.call.annotation" => Twilio.Resources.Insights.V1.Voice.Annotation,
      "insights.v1.call.event" => Twilio.Resources.Insights.V1.Voice.Event,
      "insights.v1.call.metric" => Twilio.Resources.Insights.V1.Voice.Metric,
      "insights.v1.call.summary" => Twilio.Resources.Insights.V1.Voice.CallSummary,
      "insights.v1.call_summaries" => Twilio.Resources.Insights.V1.Voice.CallSummaries,
      "insights.v1.conference" => Twilio.Resources.Insights.V1.Conference,
      "insights.v1.conference.conference_participant" =>
        Twilio.Resources.Insights.V1.Conference.Participant,
      "insights.v1.video_room_summary" => Twilio.Resources.Insights.V1.Video.Room,
      "insights.v1.video_room_summary.video_participant_summary" =>
        Twilio.Resources.Insights.V1.Video.Room.Participant,
      "intelligence.v2.custom_operator" => Twilio.Resources.Intelligence.V2.Operator.Custom,
      "intelligence.v2.operator" => Twilio.Resources.Intelligence.V2.Operator,
      "intelligence.v2.operator_attachments" =>
        Twilio.Resources.Intelligence.V2.Service.OperatorAttachments,
      "intelligence.v2.operator_type" => Twilio.Resources.Intelligence.V2.OperatorType,
      "intelligence.v2.prebuilt_operator" => Twilio.Resources.Intelligence.V2.Operator.PreBuilt,
      "intelligence.v2.service" => Twilio.Resources.Intelligence.V2.Service,
      "intelligence.v2.transcript" => Twilio.Resources.Intelligence.V2.Transcript,
      "intelligence.v2.transcript.encrypted_operator_results" =>
        Twilio.Resources.Intelligence.V2.Transcript.OperatorResult,
      "intelligence.v2.transcript.encrypted_sentences" =>
        Twilio.Resources.Intelligence.V2.Transcript.Sentence,
      "intelligence.v2.transcript.media" => Twilio.Resources.Intelligence.V2.Transcript.Media,
      "ip_messaging.v1.credential" => Twilio.Resources.IpMessaging.V1.Credential,
      "ip_messaging.v1.service" => Twilio.Resources.IpMessaging.V1.Service,
      "ip_messaging.v1.service.channel" => Twilio.Resources.IpMessaging.V1.Service.Channel,
      "ip_messaging.v1.service.channel.invite" =>
        Twilio.Resources.IpMessaging.V1.Service.Channel.Invite,
      "ip_messaging.v1.service.channel.member" =>
        Twilio.Resources.IpMessaging.V1.Service.Channel.Member,
      "ip_messaging.v1.service.channel.message" =>
        Twilio.Resources.IpMessaging.V1.Service.Channel.Message,
      "ip_messaging.v1.service.role" => Twilio.Resources.IpMessaging.V1.Service.Role,
      "ip_messaging.v1.service.user" => Twilio.Resources.IpMessaging.V1.Service.User,
      "ip_messaging.v1.service.user.user_channel" =>
        Twilio.Resources.IpMessaging.V1.Service.User.Channel,
      "ip_messaging.v2.credential" => Twilio.Resources.IpMessaging.V2.Credential,
      "ip_messaging.v2.service" => Twilio.Resources.IpMessaging.V2.Service,
      "ip_messaging.v2.service.binding" => Twilio.Resources.IpMessaging.V2.Service.Binding,
      "ip_messaging.v2.service.channel" => Twilio.Resources.IpMessaging.V2.Service.Channel,
      "ip_messaging.v2.service.channel.channel_webhook" =>
        Twilio.Resources.IpMessaging.V2.Service.Channel.Webhook,
      "ip_messaging.v2.service.channel.invite" =>
        Twilio.Resources.IpMessaging.V2.Service.Channel.Invite,
      "ip_messaging.v2.service.channel.member" =>
        Twilio.Resources.IpMessaging.V2.Service.Channel.Member,
      "ip_messaging.v2.service.channel.message" =>
        Twilio.Resources.IpMessaging.V2.Service.Channel.Message,
      "ip_messaging.v2.service.role" => Twilio.Resources.IpMessaging.V2.Service.Role,
      "ip_messaging.v2.service.user" => Twilio.Resources.IpMessaging.V2.Service.User,
      "ip_messaging.v2.service.user.user_binding" =>
        Twilio.Resources.IpMessaging.V2.Service.User.Binding,
      "ip_messaging.v2.service.user.user_channel" =>
        Twilio.Resources.IpMessaging.V2.Service.User.Channel,
      "knowledge.v1.service.knowledge_chunk" => Twilio.Resources.Knowledge.V1.Knowledge.Chunk,
      "knowledge.v1.service.knowledge_status" => Twilio.Resources.Knowledge.V1.Knowledge.Status,
      "lookups.v1.phone_number" => Twilio.Resources.Lookups.V1.PhoneNumber,
      "marketplace.v1.available_add_on" => Twilio.Resources.Marketplace.V1.AvailableAddOn,
      "marketplace.v1.available_add_on.available_add_on_extension" =>
        Twilio.Resources.Marketplace.V1.AvailableAddOn.AvailableAddOnExtension,
      "marketplace.v1.installed_add_on" => Twilio.Resources.Marketplace.V1.InstalledAddOn,
      "marketplace.v1.installed_add_on.installed_add_on_extension" =>
        Twilio.Resources.Marketplace.V1.InstalledAddOn.InstalledAddOnExtension,
      "marketplace.v1.module_data_management" => Twilio.Resources.Marketplace.V1.Listing,
      "marketplace.v1.referral_conversion" => Twilio.Resources.Marketplace.V1.ReferralConversion,
      "messaging.v1.brand_registrations" => Twilio.Resources.Messaging.V1.A2p.BrandRegistration,
      "messaging.v1.brand_registrations.brand_registration_otp" =>
        Twilio.Resources.Messaging.V1.A2p.BrandRegistration.SmsOtp,
      "messaging.v1.brand_registrations.brand_vetting" =>
        Twilio.Resources.Messaging.V1.A2p.BrandRegistration.Vetting,
      "messaging.v1.domain_cert_v4" =>
        Twilio.Resources.Messaging.V1.LinkShortening.Domain.DomainCerts,
      "messaging.v1.domain_config" => Twilio.Resources.Messaging.V1.LinkShortening.Domain.Config,
      "messaging.v1.domain_config_messaging_service" =>
        Twilio.Resources.Messaging.V1.LinkShortening.MessagingService.DomainConfig,
      "messaging.v1.domain_dns_validation" =>
        Twilio.Resources.Messaging.V1.LinkShortening.Domain.ValidateDn,
      "messaging.v1.external_campaign" =>
        Twilio.Resources.Messaging.V1.Service.PreregisteredUsa2p,
      "messaging.v1.linkshortening_messaging_service" =>
        Twilio.Resources.Messaging.V1.LinkShortening.Domain.MessagingService,
      "messaging.v1.linkshortening_messaging_service_domain_association" =>
        Twilio.Resources.Messaging.V1.LinkShortening.MessagingService.Domain,
      "messaging.v1.request_managed_cert" =>
        Twilio.Resources.Messaging.V1.LinkShortening.Domain.RequestManagedCert,
      "messaging.v1.service" => Twilio.Resources.Messaging.V1.Service,
      "messaging.v1.service.alpha_sender" => Twilio.Resources.Messaging.V1.Service.AlphaSender,
      "messaging.v1.service.channel_sender" =>
        Twilio.Resources.Messaging.V1.Service.ChannelSender,
      "messaging.v1.service.destination_alpha_sender" =>
        Twilio.Resources.Messaging.V1.Service.DestinationAlphaSender,
      "messaging.v1.service.phone_number" => Twilio.Resources.Messaging.V1.Service.PhoneNumber,
      "messaging.v1.service.short_code" => Twilio.Resources.Messaging.V1.Service.ShortCode,
      "messaging.v1.service.us_app_to_person" =>
        Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p,
      "messaging.v1.service.us_app_to_person_usecase" =>
        Twilio.Resources.Messaging.V1.Service.Compliance.Usa2p.Usecase,
      "messaging.v1.tollfree_verification" => Twilio.Resources.Messaging.V1.Tollfree.Verification,
      "messaging.v1.usecase" => Twilio.Resources.Messaging.V1.Service.Usecase,
      "messaging.v2.channels_sender_response" => Twilio.Resources.Messaging.V2.Channel.Sender,
      "messaging.v2.domain_cert_v4" =>
        Twilio.Resources.Messaging.V2.LinkShortening.Domain.DomainCerts,
      "monitor.v1.alert-instance" => Twilio.Resources.Monitor.V1.Alert,
      "monitor.v1.event" => Twilio.Resources.Monitor.V1.Event,
      "notify.v1.credential" => Twilio.Resources.Notify.V1.Credential,
      "notify.v1.service" => Twilio.Resources.Notify.V1.Service,
      "notify.v1.service.binding" => Twilio.Resources.Notify.V1.Service.Binding,
      "notify.v1.service.notification" => Twilio.Resources.Notify.V1.Service.Notification,
      "numbers.v1.bulk_eligibility" => Twilio.Resources.Numbers.V1.HostedNumber.Eligibility.Bulk,
      "numbers.v1.eligibility" => Twilio.Resources.Numbers.V1.HostedNumber.Eligibility,
      "numbers.v1.port_in_request_list" =>
        Twilio.Resources.Numbers.V1.Porting.PortIn.PortInRequest,
      "numbers.v1.porting_port_in" => Twilio.Resources.Numbers.V1.Porting.PortIn,
      "numbers.v1.porting_port_in_phone_number" =>
        Twilio.Resources.Numbers.V1.Porting.PortIn.PhoneNumber,
      "numbers.v1.porting_portability" =>
        Twilio.Resources.Numbers.V1.Porting.Portability.PhoneNumber,
      "numbers.v1.porting_webhook_configuration_fetch" =>
        Twilio.Resources.Numbers.V1.Porting.Configuration.Webhook,
      "numbers.v1.signing_request_configuration" =>
        Twilio.Resources.Numbers.V1.SigningRequest.Configuration,
      "numbers.v2.authorization_document" =>
        Twilio.Resources.Numbers.V2.HostedNumber.AuthorizationDocument,
      "numbers.v2.authorization_document.dependent_hosted_number_order" =>
        Twilio.Resources.Numbers.V2.HostedNumber.AuthorizationDocument.DependentHostedNumberOrder,
      "numbers.v2.bulk_hosted_number_order" =>
        Twilio.Resources.Numbers.V2.HostedNumber.Order.Bulk,
      "numbers.v2.bundle_clone" => Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle.Clone,
      "numbers.v2.hosted_number_order" => Twilio.Resources.Numbers.V2.HostedNumber.Order,
      "numbers.v2.regulatory_compliance.bundle" =>
        Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle,
      "numbers.v2.regulatory_compliance.bundle.bundle_copy" =>
        Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle.Copy,
      "numbers.v2.regulatory_compliance.bundle.evaluation" =>
        Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle.Evaluation,
      "numbers.v2.regulatory_compliance.bundle.item_assignment" =>
        Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle.ItemAssignment,
      "numbers.v2.regulatory_compliance.bundle.replace_items" =>
        Twilio.Resources.Numbers.V2.RegulatoryCompliance.Bundle.ReplaceItems,
      "numbers.v2.regulatory_compliance.end_user" =>
        Twilio.Resources.Numbers.V2.RegulatoryCompliance.EndUser,
      "numbers.v2.regulatory_compliance.end_user_type" =>
        Twilio.Resources.Numbers.V2.RegulatoryCompliance.EndUserType,
      "numbers.v2.regulatory_compliance.regulation" =>
        Twilio.Resources.Numbers.V2.RegulatoryCompliance.Regulation,
      "numbers.v2.regulatory_compliance.supporting_document" =>
        Twilio.Resources.Numbers.V2.RegulatoryCompliance.SupportingDocument,
      "numbers.v2.regulatory_compliance.supporting_document_type" =>
        Twilio.Resources.Numbers.V2.RegulatoryCompliance.SupportingDocumentType,
      "oauth.v1.token" => Twilio.Resources.Oauth.V1.Token,
      "preview.hosted_numbers.authorization_document" =>
        Twilio.Resources.Preview.HostedNumber.AuthorizationDocument,
      "preview.hosted_numbers.authorization_document.dependent_hosted_number_order" =>
        Twilio.Resources.Preview.HostedNumber.AuthorizationDocument.DependentHostedNumberOrder,
      "preview.hosted_numbers.hosted_number_order" =>
        Twilio.Resources.Preview.HostedNumber.HostedNumberOrder,
      "preview.marketplace.available_add_on" =>
        Twilio.Resources.Preview.Marketplace.AvailableAddOn,
      "preview.marketplace.available_add_on.available_add_on_extension" =>
        Twilio.Resources.Preview.Marketplace.AvailableAddOn.AvailableAddOnExtension,
      "preview.marketplace.installed_add_on" =>
        Twilio.Resources.Preview.Marketplace.InstalledAddOn,
      "preview.marketplace.installed_add_on.installed_add_on_extension" =>
        Twilio.Resources.Preview.Marketplace.InstalledAddOn.InstalledAddOnExtension,
      "preview.wireless.command" => Twilio.Resources.Preview.Wireless.Command,
      "preview.wireless.rate_plan" => Twilio.Resources.Preview.Wireless.RatePlan,
      "preview.wireless.sim" => Twilio.Resources.Preview.Wireless.Sim,
      "preview.wireless.sim.usage" => Twilio.Resources.Preview.Wireless.Sim.Usage,
      "pricing.v1.messaging.messaging_country-instance" =>
        Twilio.Resources.Pricing.V1.Messaging.Country,
      "pricing.v1.phone_number.phone_number_country-instance" =>
        Twilio.Resources.Pricing.V1.PhoneNumber.Country,
      "pricing.v1.voice.voice_country-instance" => Twilio.Resources.Pricing.V1.Voice.Country,
      "pricing.v1.voice.voice_number" => Twilio.Resources.Pricing.V1.Voice.Number,
      "pricing.v2.trunking_country-instance" => Twilio.Resources.Pricing.V2.Trunking.Country,
      "pricing.v2.trunking_number" => Twilio.Resources.Pricing.V2.Trunking.Number,
      "pricing.v2.voice.voice_country-instance" => Twilio.Resources.Pricing.V2.Voice.Country,
      "pricing.v2.voice.voice_number" => Twilio.Resources.Pricing.V2.Voice.Number,
      "proxy.v1.service" => Twilio.Resources.Proxy.V1.Service,
      "proxy.v1.service.phone_number" => Twilio.Resources.Proxy.V1.Service.PhoneNumber,
      "proxy.v1.service.session" => Twilio.Resources.Proxy.V1.Service.Session,
      "proxy.v1.service.session.interaction" =>
        Twilio.Resources.Proxy.V1.Service.Session.Interaction,
      "proxy.v1.service.session.participant" =>
        Twilio.Resources.Proxy.V1.Service.Session.Participant,
      "proxy.v1.service.session.participant.message_interaction" =>
        Twilio.Resources.Proxy.V1.Service.Session.Participant.MessageInteraction,
      "routes.v2.phone_number" => Twilio.Resources.Routes.V2.PhoneNumber,
      "routes.v2.sip_domain" => Twilio.Resources.Routes.V2.SipDomain,
      "routes.v2.trunks" => Twilio.Resources.Routes.V2.Trunk,
      "serverless.v1.service" => Twilio.Resources.Serverless.V1.Service,
      "serverless.v1.service.asset" => Twilio.Resources.Serverless.V1.Service.Asset,
      "serverless.v1.service.asset.asset_version" =>
        Twilio.Resources.Serverless.V1.Service.Asset.Version,
      "serverless.v1.service.build" => Twilio.Resources.Serverless.V1.Service.Build,
      "serverless.v1.service.build.build_status" =>
        Twilio.Resources.Serverless.V1.Service.Build.Status,
      "serverless.v1.service.environment" => Twilio.Resources.Serverless.V1.Service.Environment,
      "serverless.v1.service.environment.deployment" =>
        Twilio.Resources.Serverless.V1.Service.Environment.Deployment,
      "serverless.v1.service.environment.log" =>
        Twilio.Resources.Serverless.V1.Service.Environment.Log,
      "serverless.v1.service.environment.variable" =>
        Twilio.Resources.Serverless.V1.Service.Environment.Variable,
      "serverless.v1.service.function" => Twilio.Resources.Serverless.V1.Service.Function,
      "serverless.v1.service.function.function_version" =>
        Twilio.Resources.Serverless.V1.Service.Function.Version,
      "serverless.v1.service.function.function_version.function_version_content" =>
        Twilio.Resources.Serverless.V1.Service.Function.Version.Content,
      "studio.v1.flow" => Twilio.Resources.Studio.V1.Flow,
      "studio.v1.flow.engagement" => Twilio.Resources.Studio.V1.Flow.Engagement,
      "studio.v1.flow.engagement.engagement_context" =>
        Twilio.Resources.Studio.V1.Flow.Engagement.Context,
      "studio.v1.flow.engagement.step" => Twilio.Resources.Studio.V1.Flow.Engagement.Step,
      "studio.v1.flow.engagement.step.step_context" =>
        Twilio.Resources.Studio.V1.Flow.Engagement.Step.Context,
      "studio.v1.flow.execution" => Twilio.Resources.Studio.V1.Flow.Execution,
      "studio.v1.flow.execution.execution_context" =>
        Twilio.Resources.Studio.V1.Flow.Execution.Context,
      "studio.v1.flow.execution.execution_step" =>
        Twilio.Resources.Studio.V1.Flow.Execution.ExecutionStep,
      "studio.v1.flow.execution.execution_step.execution_step_context" =>
        Twilio.Resources.Studio.V1.Flow.Execution.Step.ExecutionStepContext,
      "studio.v2.flow" => Twilio.Resources.Studio.V2.Flow,
      "studio.v2.flow.execution" => Twilio.Resources.Studio.V2.Flow.Execution,
      "studio.v2.flow.execution.execution_context" =>
        Twilio.Resources.Studio.V2.Flow.Execution.Context,
      "studio.v2.flow.execution.execution_step" =>
        Twilio.Resources.Studio.V2.Flow.Execution.ExecutionStep,
      "studio.v2.flow.execution.execution_step.execution_step_context" =>
        Twilio.Resources.Studio.V2.Flow.Execution.Step.ExecutionStepContext,
      "studio.v2.flow.flow_revision" => Twilio.Resources.Studio.V2.Flow.FlowRevision,
      "studio.v2.flow.test_user" => Twilio.Resources.Studio.V2.Flow.FlowTestUser,
      "studio.v2.flow_validate" => Twilio.Resources.Studio.V2.Flow.Validate,
      "supersim.v1.esim_profile" => Twilio.Resources.Supersim.V1.ESimProfile,
      "supersim.v1.fleet" => Twilio.Resources.Supersim.V1.Fleet,
      "supersim.v1.ip_command" => Twilio.Resources.Supersim.V1.IpCommand,
      "supersim.v1.network" => Twilio.Resources.Supersim.V1.Network,
      "supersim.v1.network_access_profile" => Twilio.Resources.Supersim.V1.NetworkAccessProfile,
      "supersim.v1.network_access_profile.network_access_profile_network" =>
        Twilio.Resources.Supersim.V1.NetworkAccessProfile.NetworkAccessProfileNetwork,
      "supersim.v1.settings_update" => Twilio.Resources.Supersim.V1.SettingsUpdate,
      "supersim.v1.sim" => Twilio.Resources.Supersim.V1.Sim,
      "supersim.v1.sim.billing_period" => Twilio.Resources.Supersim.V1.Sim.BillingPeriod,
      "supersim.v1.sim.sim_ip_address" => Twilio.Resources.Supersim.V1.Sim.IpAddress,
      "supersim.v1.sms_command" => Twilio.Resources.Supersim.V1.SmsCommand,
      "supersim.v1.usage_record" => Twilio.Resources.Supersim.V1.UsageRecord,
      "sync.v1.service" => Twilio.Resources.Sync.V1.Service,
      "sync.v1.service.document" => Twilio.Resources.Sync.V1.Service.Document,
      "sync.v1.service.document.document_permission" =>
        Twilio.Resources.Sync.V1.Service.Document.Permission,
      "sync.v1.service.sync_list" => Twilio.Resources.Sync.V1.Service.List,
      "sync.v1.service.sync_list.sync_list_item" => Twilio.Resources.Sync.V1.Service.List.Item,
      "sync.v1.service.sync_list.sync_list_permission" =>
        Twilio.Resources.Sync.V1.Service.List.Permission,
      "sync.v1.service.sync_map" => Twilio.Resources.Sync.V1.Service.Map,
      "sync.v1.service.sync_map.sync_map_item" => Twilio.Resources.Sync.V1.Service.Map.Item,
      "sync.v1.service.sync_map.sync_map_permission" =>
        Twilio.Resources.Sync.V1.Service.Map.Permission,
      "sync.v1.service.sync_stream" => Twilio.Resources.Sync.V1.Service.Stream,
      "sync.v1.service.sync_stream.stream_message" =>
        Twilio.Resources.Sync.V1.Service.Stream.Message,
      "taskrouter.v1.workspace" => Twilio.Resources.Taskrouter.V1.Workspace,
      "taskrouter.v1.workspace.activity" => Twilio.Resources.Taskrouter.V1.Workspace.Activity,
      "taskrouter.v1.workspace.event" => Twilio.Resources.Taskrouter.V1.Workspace.Event,
      "taskrouter.v1.workspace.task" => Twilio.Resources.Taskrouter.V1.Workspace.Task,
      "taskrouter.v1.workspace.task.task_reservation" =>
        Twilio.Resources.Taskrouter.V1.Workspace.Task.Reservation,
      "taskrouter.v1.workspace.task_channel" =>
        Twilio.Resources.Taskrouter.V1.Workspace.TaskChannel,
      "taskrouter.v1.workspace.task_queue" => Twilio.Resources.Taskrouter.V1.Workspace.TaskQueue,
      "taskrouter.v1.workspace.task_queue.task_queue_bulk_real_time_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.TaskQueue.TaskQueueBulkRealTimeStatistics,
      "taskrouter.v1.workspace.task_queue.task_queue_cumulative_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.TaskQueue.TaskQueueCumulativeStatistics,
      "taskrouter.v1.workspace.task_queue.task_queue_real_time_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.TaskQueue.TaskQueueRealTimeStatistics,
      "taskrouter.v1.workspace.task_queue.task_queue_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.TaskQueue.TaskQueueStatistics,
      "taskrouter.v1.workspace.task_queue.task_queues_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.TaskQueue.TaskQueuesStatistics,
      "taskrouter.v1.workspace.worker" => Twilio.Resources.Taskrouter.V1.Workspace.Worker,
      "taskrouter.v1.workspace.worker.worker_channel" =>
        Twilio.Resources.Taskrouter.V1.Workspace.Worker.Channel,
      "taskrouter.v1.workspace.worker.worker_instance_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.Worker.WorkerStatistics,
      "taskrouter.v1.workspace.worker.worker_reservation" =>
        Twilio.Resources.Taskrouter.V1.Workspace.Worker.Reservation,
      "taskrouter.v1.workspace.workflow" => Twilio.Resources.Taskrouter.V1.Workspace.Workflow,
      "taskrouter.v1.workspace.workflow.workflow_cumulative_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.Workflow.WorkflowCumulativeStatistics,
      "taskrouter.v1.workspace.workflow.workflow_real_time_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.Workflow.WorkflowRealTimeStatistics,
      "taskrouter.v1.workspace.workflow.workflow_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.Workflow.WorkflowStatistics,
      "taskrouter.v1.workspace.workspace_cumulative_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.WorkspaceCumulativeStatistics,
      "taskrouter.v1.workspace.workspace_real_time_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.WorkspaceRealTimeStatistics,
      "taskrouter.v1.workspace.workspace_statistics" =>
        Twilio.Resources.Taskrouter.V1.Workspace.WorkspaceStatistics,
      "trunking.v1.trunk" => Twilio.Resources.Trunking.V1.Trunk,
      "trunking.v1.trunk.credential_list" => Twilio.Resources.Trunking.V1.Trunk.CredentialList,
      "trunking.v1.trunk.ip_access_control_list" =>
        Twilio.Resources.Trunking.V1.Trunk.IpAccessControlList,
      "trunking.v1.trunk.origination_url" => Twilio.Resources.Trunking.V1.Trunk.OriginationUrl,
      "trunking.v1.trunk.phone_number" => Twilio.Resources.Trunking.V1.Trunk.PhoneNumber,
      "trunking.v1.trunk.recording" => Twilio.Resources.Trunking.V1.Trunk.Recording,
      "trusthub.v1.compliance_inquiry" =>
        Twilio.Resources.Trusthub.V1.ComplianceInquiry.Customer.ComplianceInquiries,
      # credo:disable-for-next-line Credo.Check.Readability.MaxLineLength
      "trusthub.v1.compliance_registration" =>
        Twilio.Resources.Trusthub.V1.ComplianceInquiry.Registration.RegulatoryCompliance.GB.ComplianceRegistrationInquiries,
      "trusthub.v1.compliance_tollfree_inquiry" =>
        Twilio.Resources.Trusthub.V1.ComplianceInquiry.Tollfree.ComplianceTollfreeInquiries,
      "trusthub.v1.customer_profile" => Twilio.Resources.Trusthub.V1.CustomerProfiles,
      "trusthub.v1.customer_profile.customer_profile_channel_endpoint_assignment" =>
        Twilio.Resources.Trusthub.V1.CustomerProfile.ChannelEndpointAssignment,
      "trusthub.v1.customer_profile.customer_profile_entity_assignment" =>
        Twilio.Resources.Trusthub.V1.CustomerProfile.CustomerProfilesEntityAssignments,
      "trusthub.v1.customer_profile.customer_profile_evaluation" =>
        Twilio.Resources.Trusthub.V1.CustomerProfile.CustomerProfilesEvaluations,
      "trusthub.v1.end_user" => Twilio.Resources.Trusthub.V1.EndUser,
      "trusthub.v1.end_user_type" => Twilio.Resources.Trusthub.V1.EndUserType,
      "trusthub.v1.policies" => Twilio.Resources.Trusthub.V1.Policies,
      "trusthub.v1.supporting_document" => Twilio.Resources.Trusthub.V1.SupportingDocument,
      "trusthub.v1.supporting_document_type" =>
        Twilio.Resources.Trusthub.V1.SupportingDocumentType,
      "trusthub.v1.trust_product" => Twilio.Resources.Trusthub.V1.TrustProducts,
      "trusthub.v1.trust_product.trust_product_channel_endpoint_assignment" =>
        Twilio.Resources.Trusthub.V1.TrustProduct.ChannelEndpointAssignment,
      "trusthub.v1.trust_product.trust_product_entity_assignment" =>
        Twilio.Resources.Trusthub.V1.TrustProduct.TrustProductsEntityAssignments,
      "trusthub.v1.trust_product.trust_product_evaluation" =>
        Twilio.Resources.Trusthub.V1.TrustProduct.TrustProductsEvaluations,
      "verify.v2.form" => Twilio.Resources.Verify.V2.Form,
      "verify.v2.safelist" => Twilio.Resources.Verify.V2.SafeList.Number,
      "verify.v2.service" => Twilio.Resources.Verify.V2.Service,
      "verify.v2.service.access_token" => Twilio.Resources.Verify.V2.Service.AccessToken,
      "verify.v2.service.entity" => Twilio.Resources.Verify.V2.Service.Entity,
      "verify.v2.service.entity.challenge" => Twilio.Resources.Verify.V2.Service.Entity.Challenge,
      "verify.v2.service.entity.challenge.notification" =>
        Twilio.Resources.Verify.V2.Service.Entity.Challenge.Notification,
      "verify.v2.service.entity.factor" => Twilio.Resources.Verify.V2.Service.Entity.Factor,
      "verify.v2.service.messaging_configuration" =>
        Twilio.Resources.Verify.V2.Service.MessagingConfiguration,
      "verify.v2.service.rate_limit" => Twilio.Resources.Verify.V2.Service.RateLimit,
      "verify.v2.service.rate_limit.bucket" =>
        Twilio.Resources.Verify.V2.Service.RateLimit.Bucket,
      "verify.v2.service.verification" => Twilio.Resources.Verify.V2.Service.Verification,
      "verify.v2.service.verification_check" =>
        Twilio.Resources.Verify.V2.Service.VerificationCheck,
      "verify.v2.service.webhook" => Twilio.Resources.Verify.V2.Service.Webhook,
      "verify.v2.verification_attempt" => Twilio.Resources.Verify.V2.Attempt,
      "verify.v2.verification_template" => Twilio.Resources.Verify.V2.Template,
      "video.v1.composition" => Twilio.Resources.Video.V1.Composition,
      "video.v1.composition_hook" => Twilio.Resources.Video.V1.CompositionHook,
      "video.v1.composition_settings" =>
        Twilio.Resources.Video.V1.CompositionSetting.CompositionSettings,
      "video.v1.recording" => Twilio.Resources.Video.V1.Recording,
      "video.v1.recording_settings" =>
        Twilio.Resources.Video.V1.RecordingSetting.RecordingSettings,
      "video.v1.room" => Twilio.Resources.Video.V1.Room,
      "video.v1.room.room_participant" => Twilio.Resources.Video.V1.Room.Participant,
      "video.v1.room.room_participant.room_participant_anonymize" =>
        Twilio.Resources.Video.V1.Room.Participant.Anonymize,
      "video.v1.room.room_participant.room_participant_published_track" =>
        Twilio.Resources.Video.V1.Room.Participant.PublishedTrack,
      "video.v1.room.room_participant.room_participant_subscribe_rule" =>
        Twilio.Resources.Video.V1.Room.Participant.SubscribeRules,
      "video.v1.room.room_participant.room_participant_subscribed_track" =>
        Twilio.Resources.Video.V1.Room.Participant.SubscribedTrack,
      "video.v1.room.room_recording" => Twilio.Resources.Video.V1.Room.RoomRecording,
      "video.v1.room.room_recording_rule" => Twilio.Resources.Video.V1.Room.RecordingRules,
      "video.v1.room.room_transcriptions" => Twilio.Resources.Video.V1.Room.Transcriptions,
      "voice.v1.byoc_trunk" => Twilio.Resources.Voice.V1.ByocTrunk,
      "voice.v1.connection_policy" => Twilio.Resources.Voice.V1.ConnectionPolicy,
      "voice.v1.connection_policy.connection_policy_target" =>
        Twilio.Resources.Voice.V1.ConnectionPolicy.ConnectionPolicyTarget,
      "voice.v1.dialing_permissions.dialing_permissions_country-instance" =>
        Twilio.Resources.Voice.V1.DialingPermission.Country,
      "voice.v1.dialing_permissions.dialing_permissions_country.dialing_permissions_hrs_prefixes" =>
        Twilio.Resources.Voice.V1.DialingPermission.Country.HighRiskSpecialPrefixe,
      "voice.v1.dialing_permissions.dialing_permissions_country_bulk_update" =>
        Twilio.Resources.Voice.V1.DialingPermission.BulkCountryUpdate,
      "voice.v1.dialing_permissions.dialing_permissions_settings" =>
        Twilio.Resources.Voice.V1.Settings,
      "voice.v1.ip_record" => Twilio.Resources.Voice.V1.IpRecord,
      "voice.v1.source_ip_mapping" => Twilio.Resources.Voice.V1.SourceIpMapping,
      "wireless.v1.account_usage_record" => Twilio.Resources.Wireless.V1.UsageRecord,
      "wireless.v1.command" => Twilio.Resources.Wireless.V1.Command,
      "wireless.v1.rate_plan" => Twilio.Resources.Wireless.V1.RatePlan,
      "wireless.v1.sim" => Twilio.Resources.Wireless.V1.Sim,
      "wireless.v1.sim.data_session" => Twilio.Resources.Wireless.V1.Sim.DataSession,
      "wireless.v1.sim.usage_record" => Twilio.Resources.Wireless.V1.Sim.UsageRecord
    }
  end
end
