# OpenClaw Control App — Architecture Overview

## 1. System Topology (Textual Diagram)
```
+-------------------+        MethodChannels / FFI        +---------------------+
| Flutter UI Layer  | <--------------------------------> | Background Service   |
| (Dart)            |                                     | (Rust/Go daemon)     |
+-------------------+                                     +----------+----------+
        |                                                               |
        | Secure Intents / Binder                                      | gRPC / CLI bridge
        v                                                               v
+-------------------+   Unix socket / TLS   +---------------------+   +-----------------+
| Termux Session    | <-------------------> | OpenClaw CLI Stack  |   | OpenClaw Cloud  |
| (Android sandbox) |                       | (Python + binaries) |   | & Channels      |
+-------------------+                       +---------------------+   +-----------------+
        ^                          ^                         ^
        |                          |                         |
        | Jetpack Room / SQLCipher |                         | HTTPS/WebSockets
        |                          |                         |
+-------------------+              |              +----------------------+ 
| Encrypted Storage |--------------+--------------| Permissions / Android |
| (Keystore + Room) |                             | OS Services (battery, |
+-------------------+                             | connectivity, notif.) |
                                                  +----------------------+
```
**Description:**
1. **Flutter UI Layer** renders onboarding, dashboard, configuration, and troubleshooting flows. It issues commands via MethodChannels to the native service and listens to reactive streams (EventChannels) for health/status updates.
2. **Background Service (daemon)** runs as a long-lived foreground service written in Rust (preferred) co-packaged via the Android NDK. It exposes a gRPC-like API over Unix domain sockets to the Flutter layer and orchestrates Termux, OpenClaw, and telemetry tasks.
3. **Termux/OpenClaw bridge**: The service controls a dedicated Termux session, invoking the OpenClaw CLI (Python + shell tooling) through wrapped commands, monitoring stdout/stderr, and restarting processes on failure.
4. **Local storage**: Config metadata, audit logs, and cached health metrics live in a SQLCipher-encrypted Room database. Secrets (API keys, tokens) are stored in Android Keystore-backed secure blobs.
5. **Permissions & OS services**: The app requests network, foreground service, notifications, storage (scoped), and biometric permissions. Battery optimization exemptions are prompted during onboarding to keep the daemon alive.

## 2. Technology Choices
| Layer | Technology | Rationale |
|-------|------------|-----------|
| Mobile UI | Flutter 3.x (Material 3, Responsive Layout) | Cross-platform reach (Android-first, iOS later), fast iteration, unified component library. |
| Native bridge | MethodChannels + pigeon-generated interfaces | Strong typing between Dart and platform code; enables async command batching. |
| Background daemon | Rust (Tokio runtime) packaged as Android shared library, invoked via JNI | Memory safety, lightweight footprint, easy to embed CLI invocations, good async/concurrency story. Go is fallback if team proficiency requires it. |
| Termux automation | `Termux:Tasker` intents or direct shell via `com.termux` APIs | Maintains compatibility with existing OpenClaw setup scripts; allows advanced users to still access Termux app. |
| CLI invocation | Direct execution of `openclaw` CLI inside Termux via `ssh`-like pseudo-terminal or `termux-exec`; command responses streamed back to daemon. |
| Local DB | Room ORM + SQLCipher | Structured config/history; encryption-at-rest. |
| Secure storage | Android Keystore + BiometricPrompt | Hardware-backed keys, biometric/PIN gate on retrieval. |
| Telemetry/log upload | Rust daemon batches JSON bundles and uploads via HTTPS with exponential backoff; optional S3/HTTPS endpoint. |
| Notifications | Jetpack WorkManager + Android notification channels | Reliability for alert delivery, background-safe scheduling. |

## 3. Configuration & Data Model
- **Secrets vault**
  - Keys: `openai_api_key`, `anthropic_api_key`, `telegram_bot_token`, `signal_service_token`, `custom_webhook_secret`.
  - Storage: Wrapped with AES-256 keys generated via Android Keystore (StrongBox when available). Retrieval requires biometric or app PIN, logged via audit table.
- **Channel configuration**
  - Entities: `channel_id`, `type` (telegram/signal/webhook), `status`, `linked_at`, `last_check`, `scopes` (send/receive), `device_binding`.
  - Persisted inside Room DB, synced to YAML/JSON files consumed by OpenClaw CLI. Daemon writes config deltas into Termux filesystem (`~/openclaw/config/channels.yaml`).
- **Model presets**
  - Entities: `preset_id`, `model_name`, `provider`, `temperature`, `max_tokens`, `plugins_enabled`, `version_pin`.
  - UI surfaces human-readable names. Selection updates both local DB and CLI config (`config/models.toml`).
- **Operational metrics**
  - Tables for `health_snapshots` (battery, storage, service uptime), `alerts`, `audit_logs` (who changed what, when).
  - Logs older than 30 days rolled into compressed bundles.
- **Encryption & backup**
  - DB encrypted with user-specific passphrase stored in Keystore.
  - Optional export generates encrypted ZIP protected by operator-provided passphrase; secrets redacted unless explicitly included.

## 4. Update & Maintenance Strategy
1. **OpenClaw version pinning**
   - Each device records `openclaw_version_pin` in config. Updates happen via staged packages downloaded to Termux and applied via CLI (`openclaw update --version X`). Compatibility matrix stored in app to prevent incompatible upgrades.
2. **App updates**
   - Delivered through Managed Google Play (enterprise) with staged rollout toggles. In-app "Check for updates" triggers Play Core in-app update flow (flexible for minor, immediate for critical security).
3. **Daemon/service updates**
   - Rust shared library versioned alongside app; migration scripts handle Termux dependencies. On startup, daemon runs self-check to ensure Termux packages (Python, pip deps) match expected versions (defined in `assets/provisioning-lock.json`).
4. **Telemetry & log uploads**
   - Operators opt-in during onboarding. Rust daemon captures: service uptime, failure codes, anonymized device metrics. Logs uploaded nightly or on-demand via diagnostics screen. Upload endpoint configurable (default: OpenClaw support S3 presigned URL). All PII scrubbed; secrets never transmitted.
5. **Rollback plan**
   - If an update fails health checks (service can't start, CLI errors), daemon automatically reverts to prior OpenClaw package (kept in cache) and notifies operator.
6. **Monitoring hooks**
   - Heartbeat loop (every 15s) ensures CLI responds; if unresponsive >60s, alert raised + auto-restart. Metrics surfaced via EventChannel to UI for near-real-time dashboards.

## 5. Permissions & Security Considerations
- **Permissions**: `android.permission.FOREGROUND_SERVICE`, `POST_NOTIFICATIONS`, `USE_FULL_SCREEN_INTENT` (for critical alerts), `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`, `READ/WRITE_EXTERNAL_STORAGE` (scoped for log exports), `USE_BIOMETRIC`.
- **Least privilege**: Termux runs under its own UID; daemon communicates via explicit sockets to avoid privilege escalation.
- **Operator controls**: Advanced actions (embedded Termux, log export including secrets, remote commands) gated behind secondary confirmation + biometric.
- **Compliance**: Audit logs retained locally; optional export to support server for compliance reviews.
