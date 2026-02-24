# OpenClaw Control App (MVP)

Goal: ship our own Android app that wraps the OpenClaw + Termux stack with a friendly control panel so non-technical users can manage their agent phone without touching the terminal.

## Why
- Customers need to configure models, channels, API keys, and status without digging into the CLI.
- Existing community builds (e.g., mithun50/openclaw-termux) are terminal-first.
- We’re shipping pre-configured phones; the software experience needs to match the hardware polish.

## High-Level MVP Requirements
1. **On-device setup wizard** for Wi-Fi check, API key entry, channel linking (Telegram, Signal).
2. **Dashboard** to display OpenClaw status, active agents, logs, and storage/battery hints.
3. **Configuration panels** for model selection, plugin enable/disable, key management.
4. **Embedded terminal** (Termux) for advanced users, but hidden by default.
5. **Update & diagnostics tools** (check OpenClaw version, restart services, upload logs).

## Current Status
- Requirements/architecture docs in `docs/` (in progress).
- Repo scaffolding + action plan forthcoming.

## Next Steps
1. Finalize product spec + UX flows.
2. Define technical architecture (Flutter shell + background service + config storage).
3. Scaffold the Flutter project and CI pipeline in a dedicated GitHub repo.
4. Build MVP screens + bridge to Termux/OpenClaw commands.
