# Development Roadmap

## Phase 1 — MVP (Target: Internal Alpha → Pilot)
| Workstream | Key Tasks | Owner(s) |
|------------|-----------|----------|
| Provisioning & Setup | Build onboarding wizard, device readiness checks, key capture, channel linking scaffolding. | _Owner: TBD (Mobile Lead)_ |
| Secure Storage & Config Sync | Implement Keystore-backed vault, Room models, CLI config writers with validation. | _Owner: TBD (Platform)_ |
| Background Daemon | Implement Rust service (process supervision, Termux control, health polling) + MethodChannel surface. | _Owner: TBD (Systems)_ |
| Dashboard & Controls | Status cards, service controls, alerting UI with EventChannel streams. | _Owner: TBD (Frontend)_ |
| Diagnostics & Updates | Diagnostics bundle creator, OTA checker (OpenClaw + app), embedded Termux pane. | _Owner: TBD (DevOps)_ |
| QA & Pilot Enablement | Test harness, provisioning scripts, pilot documentation + support playbook. | _Owner: TBD (QA/CS)_ |

**Exit criteria:** Installer completes setup on test device without CLI, daemon maintains OpenClaw uptime for 72h, diagnostics bundle shareable.

## Phase 2 — Beta (Target: Managed Play Track)
| Workstream | Key Tasks | Owner(s) |
|------------|-----------|----------|
| Telemetry & Alerting | Opt-in telemetry pipeline, alert routing (push + email), log upload automation. | _Owner: TBD (Data)_ |
| Resilience & Recovery | Auto-retry provisioning, watchdog restarts, rollback tooling, improved error surfaces. | _Owner: TBD (Systems)_ |
| UX Polish & Accessibility | Material 3 polish, localization scaffolding, accessibility pass (TalkBack, large fonts). | _Owner: TBD (Design/Frontend)_ |
| Remote Support Hooks | Secure remote commands, support visibility for pilot customers, audit reporting. | _Owner: TBD (Platform)_ |
| Security Hardening | Pen-test fixes, enhanced biometric gating, encrypted exports, compliance logging. | _Owner: TBD (Security)_ |
| Metrics & Analytics | Instrumentation (activation funnel, alert frequency), dashboards for ops team. | _Owner: TBD (Data/Analytics)_ |

**Exit criteria:** 10+ external devices running ≥4 weeks with <2% downtime, telemetry enabled, support can resolve 80% issues via app.

## Phase 3 — GA (Target: Public Controlled Rollout)
| Workstream | Key Tasks | Owner(s) |
|------------|-----------|----------|
| Fleet Management | Multi-device view, remote status polling, role-based access, organization accounts. | _Owner: TBD (Product/Backend)_ |
| Update Orchestration | Staged OpenClaw/package rollout, policy-based pinning, compliance reporting. | _Owner: TBD (DevOps)_ |
| Plugin & Model Marketplace | Catalog UI, version checks, dependency installer, marketplace APIs. | _Owner: TBD (Ecosystem)_ |
| Advanced Health Insights | Historical graphs, anomaly detection, predictive alerts, export APIs. | _Owner: TBD (Data Science)_ |
| Support Automation | Guided troubleshooting flows v2, knowledge base integration, ticket handoff. | _Owner: TBD (Support Ops)_ |
| Compliance & Certification | SOC2/ISO readiness artifacts, legal reviews, documentation for enterprise buyers. | _Owner: TBD (Legal/Compliance)_ |

**Exit criteria:** Scalable to 100+ devices, compliance package complete, marketplace live with first-party plugins, customer SLA commitments met.
