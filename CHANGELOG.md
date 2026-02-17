# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - Unreleased

### Added

#### API Coverage
- Auto-generated SDK from Twilio's 54 OpenAPI spec files (v2.6.3)
- 440+ service modules covering 37+ Twilio products (Messaging, Voice, Verify,
  Conversations, Flex, Insights, Video, and more)
- 420+ typed resource structs with automatic JSON-to-struct deserialization
- Object types registry mapping schema names to Elixir modules

#### Client & HTTP
- `Twilio.Client` with HTTP Basic auth (Account SID + Auth Token)
- Region and edge URL construction (e.g. `ie1`, `dublin`)
- Subaccount support via `:account_sid` option
- Connection pooling via Finch (auto-sized: `max(schedulers_online, 10)`)
- Request encoding: form-encoded for mutations, query params for reads
- Opt-in response metadata (`return_response: true`) exposing status,
  headers, and request ID

#### Retry & Resilience
- Unified retry covering 429, 5xx, and connection errors (opt-in, default: 0)
- `Retry-After` header parsing on 429 responses
- Exponential backoff with full jitter
- Idempotency token auto-generation (`I-Twilio-Idempotency-Token`) on
  retryable POST requests
- `Twilio.Error` typed error struct with `retryable?/1` helper

#### Pagination
- `Twilio.Page` with dual-format auto-detection:
  - v2010 flat format (`next_page_uri`)
  - v1/v2/v3 meta wrapper format (`meta.next_page_url`)
- `stream/1` for lazy auto-pagination via `Stream.unfold`

#### Webhooks
- `Twilio.Webhook` HMAC-SHA1 signature verification
- Form-encoded webhook validation (`valid?/4`)
- JSON body webhook validation (`valid_body?/4`)
- Constant-time comparison to prevent timing attacks

#### TwiML
- `Twilio.TwiML.VoiceResponse` — Say, Play, Gather, Dial, Record, Redirect,
  Hangup, Reject, Pause, Enqueue, plus nested nouns (Number, Client, Sip,
  Queue)
- `Twilio.TwiML.MessagingResponse` — Message (with Body/Media children),
  Redirect
- Automatic snake_case to camelCase attribute conversion
- XML escaping for text content and attribute values

#### Testing
- `Twilio.Test` per-process HTTP stubs via NimbleOwnership
- Full `async: true` support with process isolation
- `allow/1` for sharing stubs with child processes

#### Observability
- Structured `:telemetry` events: start, stop, exception, retry

#### Code Generation
- `mix twilio.generate` Mix task with `--clean`, `--dry-run`, `--stats`
- `scripts/sync_openapi.sh` for downloading specs from `twilio/twilio-oai`
- Auto-formatting of generated code

#### CI & Automation
- GitHub Actions CI: test matrix (Elixir 1.19-1.20, OTP 27-28), quality
  checks (Credo, format, Dialyzer), codegen determinism verification
- Weekly OpenAPI spec sync workflow with auto-PR generation
- `scripts/parity_report.sh` for endpoint coverage reporting

#### Documentation
- Guides: Getting Started, Webhooks, TwiML, Testing, Telemetry
- ExDoc with module grouping by category
