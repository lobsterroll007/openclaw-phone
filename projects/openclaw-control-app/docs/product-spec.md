# OpenClaw Control App — MVP Product Spec

## 1. Overview
An Android-first companion app that wraps the OpenClaw + Termux stack with a guided UI so non-technical operators can deploy, monitor, and maintain their agent phone without opening a terminal. The MVP focuses on on-device setup, status visibility, light configuration, and first-line troubleshooting while preserving access to the underlying Termux session for advanced users.

## 2. Target Users & Core Use Cases
| User segment | Context | Primary jobs-to-be-done |
|--------------|---------|-------------------------|
| **Ops Lead / Installer** | Pre-configured phones shipped to customers; needs to validate connectivity and handoff. | 1) Run device readiness checks, 2) Pair channels (Telegram/Signal), 3) Capture API keys securely, 4) Verify OpenClaw agent is online before shipping. |
| **Agent Operator (non-technical)** | Daily controller of one or more agent phones in the field. | 1) Monitor status/health, 2) Switch models/plugins, 3) View high-level logs, 4) Apply updates without terminal. |
| **Advanced Power User** | Comfortable with CLI but prefers convenience UI. | 1) Access embedded Termux when needed, 2) Pull/upload logs, 3) Manually restart services, 4) Run diagnostics. |

## 3. User Stories
### Setup & Activation
1. **As an installer**, I can launch a setup wizard that confirms Wi-Fi/LTE connectivity, battery >20%, and storage >2 GB, so I know the phone is ready for provisioning.
2. **As an installer**, I can enter and validate API keys (OpenAI, Anthropic, etc.) with inline status, so mistakes are caught before services start.
3. **As an operator**, I can link Telegram and Signal accounts through guided steps (QR / token entry) and see confirmation that each channel is connected to OpenClaw.
4. **As an installer**, I can run a final readiness checklist (services running, latest OpenClaw version) and export it as a shareable summary.

### Daily Use & Monitoring
1. **As an operator**, I can open the dashboard to view OpenClaw service status, last heartbeat, current model, active channels, storage/battery health at a glance.
2. **As an operator**, I can toggle available models/plugins or update API keys from a configuration panel with validation and success/error toasts.
3. **As an operator**, I receive proactive alerts (banner + notification) when OpenClaw stops, when storage/battery thresholds are crossed, or when a channel disconnects.
4. **As an operator**, I can trigger safe restarts of OpenClaw services without leaving the app and confirm when the service is back online.

### Troubleshooting & Advanced Control
1. **As a power user**, I can open an embedded Termux pane (hidden behind “Advanced Tools”) for direct CLI access while keeping context with the dashboard.
2. **As an operator**, I can capture diagnostics (logs + config snapshot) and send/share them for support with one action.
3. **As an operator**, I can run guided troubleshooting flows (e.g., “Agent down” → check network → restart services → escalate) with step tracking.
4. **As support**, I can see an “Update & Maintenance” page showing current OpenClaw version, available updates, and last update timestamp with ability to apply OTA package.

## 4. Feature List & Acceptance Criteria

### Must-Have (MVP Launch)
| Feature | Description | Acceptance Criteria |
|---------|-------------|---------------------|
| Onboarding Wizard | Multi-step flow (Connectivity → Keys → Channels → Summary). | All steps persist partial progress; each step shows pass/fail; wizard cannot finish until critical checks succeed; summary screen exportable (share intent or copy). |
| Secure Key Vault | Local encrypted storage + UI for adding/updating API keys. | Keys stored via Android Keystore; validation via test call; UI masks values; editing requires biometric/PIN confirmation. |
| Channel Linking Cards | Guided link flows for Telegram & Signal. | Each card shows status (linked/pending/error); provides link instructions (QR/text); app verifies connection via OpenClaw API before marking linked. |
| Status Dashboard | Home screen with service card, resource health, active agents, recent alerts. | Updates within 5s of service status change; offline state clearly indicated; battery/storage thresholds configurable; last heartbeat timestamp shown. |
| Service Controls | Start/stop/restart OpenClaw & Termux daemon. | Buttons disabled during action; spinner + toast on success/failure; restart confirms service returns within 60s or shows escalation message. |
| Config Panels | Model & plugin selection, channel toggles, API key management in organized tabs. | Changes synced to OpenClaw config files; invalid combinations blocked with inline error; audit log entry created per change. |
| Update & Diagnostics | Check for updates, view current version, run diagnostics bundle. | Update check hits OTA endpoint; diagnostics bundles logs + config (minus secrets) and offers share sheet; progress indicator for running checks. |
| Embedded Termux (Advanced) | In-app terminal view gated behind advanced toggle. | Hidden by default; requires confirmation before first use; terminal inherits auth/session; supports copy/paste. |
| Alerting & Notifications | Threshold-based alerts + service/channel downtime notifications. | Alerts appear in-app banner + Android notification; grouped per category; user can mark resolved; logs accessible later. |

### Could-Have (Stretch for MVP if time permits)
| Feature | Description | Acceptance Criteria |
|---------|-------------|---------------------|
| Multi-device Fleet View | Switch between multiple agent phones (if same account). | Account picker; remote status polling; read-only for non-local devices. |
| Remote Commands | Send simple commands (restart, update) to paired phones. | Secure auth; confirmation of remote execution; audit log. |
| Guided Tutorials | Embedded video/gif walkthroughs per setup step. | Offline cached assets; progress tracking. |
| Health Timeline | Historical graphs for uptime, battery, storage. | 24h/7d views; data persisted locally; exportable chart. |

### Later (Post-MVP)
| Feature | Rationale | Success Criteria |
|---------|-----------|------------------|
| Cloud dashboard integration | Provide centralized fleet management. | ≥3 devices manageable remotely; live alerts to web console. |
| Plugin marketplace | Allow quick install/update of OpenClaw plugins. | In-app catalog, install flow, semantic version checks. |
| Voice-guided setup | Hands-free provisioning for field teams. | 90%+ commands recognized; setup time reduced by 30%. |
| Policy/role management | Granular permissions for teams. | Role-based access; audit logs tied to users. |

## 5. Success Metrics
- **Activation:** 90% of shipped phones complete setup wizard without human support within 24 hours.
- **Reliability:** <2% weekly incidents of “agent offline” longer than 10 minutes (auto-detected via app metrics).
- **Usability:** SUS score ≥80 from first 10 operators; average NPS ≥30 after first month.
- **Support Efficiency:** 50% reduction in support tickets that previously required CLI instructions (baseline from last quarter).
- **Update Adoption:** 80% of devices install new OpenClaw release within 72 hours of availability.

## 6. Rollout Plan
1. **Internal Alpha (Weeks 1-4)**
   - Implement core flows with mock data, then connect to local OpenClaw instance.
   - Dogfood on 5 internal devices; capture friction via structured QA template.
2. **Pilot Cohort (Weeks 5-8)**
   - Ship to 10 friendly customers receiving pre-configured phones.
   - Weekly check-ins; instrument analytics + crash reporting; iterate on onboarding copy and alerts.
3. **Public MVP Launch (Week 9)**
   - Publish to managed Play Store track for shipped phones only (closed listing).
   - Release support playbook + troubleshooting scripts; monitor success metrics daily for first two weeks.
4. **Post-Launch Iteration (Weeks 10-12)**
   - Prioritize top 3 issues/feature requests from pilot + launch feedback.
   - Plan roadmap for could-have items and begin architecture for fleet/cloud integration.

---
**Ownership:** Product + Engineering share responsibility for MVP scope adherence; QA owns readiness checklist. Customer Success manages pilot feedback loop.
