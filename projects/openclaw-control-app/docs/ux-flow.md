# OpenClaw Control App – UX Flow Reference

## 1. Onboarding Narrative Walkthrough

### First Boot & System Check
- **Trigger:** User launches the app for the very first time or after a factory reset.
- **Hero Moment:** Animated OpenClaw logo pulses while the app performs a quick integrity check.
- **User Guidance:** Splash copy—“Let’s get you connected to your control hub in under 2 minutes.”
- **Background Task:** Local storage cleared, default settings applied, device capability scan.
- **Toast/Alerts:** Inline status badge (“System check complete”); error banner if hardware incompatibility is detected.

### Wi-Fi Connectivity Confirmation
- **Screen Layout:** Card prompting user to confirm current SSID with option to change networks.
- **Primary CTA:** “Continue” (enabled when Wi-Fi signal is stable and internet ping succeeds).
- **Secondary CTA:** “Switch Network” opens native OS Wi-Fi modal.
- **Feedback:** Success toast (“Connected to HomeLab_5G”); error toast (“We lost the signal—retrying…”).
- **Background Task:** Continuous ping test until stable for 5 seconds; logs stored for diagnostics.

### API Key Entry
- **Purpose:** Authenticate the app with the OpenClaw gateway.
- **Form Elements:** Masked key input, “Paste from clipboard” chip, “Need a key?” helper link.
- **Validation:** Live format check (length + prefix); disabled CTA until valid.
- **Success Path:** Green tick animates inside the input, CTA label switches to “Link Gateway.”
- **Error Path:** Input shakes, inline copy (“That key doesn’t match an active gateway”). Retry up to 3 times before offering help.

### Channel Linking
- **Goal:** Associate messaging/automation channels (Telegram, Slack, Webhooks) with the control app.
- **Flow:**
  1. List of available channels with connect buttons.
  2. On tap, modal shows per-channel instructions (QR code, OAuth, token entry).
  3. Confirmation step summarizing connected endpoints.
- **Feedback:** Each successful link surfaces a toast (“Telegram bot connected”) and a capsule avatar badge turns solid.
- **Error Handling:** Red inline tag under affected channel (“Auth expired—tap to refresh”). Background auto-retry every 30 seconds if credentials pending.

### Dashboard Arrival
- **Transition:** Subtle slide-forward animation with confetti sparkles if all required steps are complete.
- **Welcome Copy:** “You’re live! Monitor and steer your agents from here.”
- **Contextual Coach Marks:** Highlights key widgets (status overview, run queue, quick actions) for first-time users; dismissible overlay.
- **State Persistence:** Onboarding checklist collapses into a “Setup Complete” card under the dashboard header for later review.

---

## 2. Screen-by-Screen Descriptions

### Dashboard (Home)
- **Header Bar:**
  - App title and gateway nickname.
  - Status pill (Online / Degraded / Offline) with last heartbeat timestamp.
  - Quick actions: “Trigger Agent,” “Pause Gateway,” overflow menu.
- **Key Widgets:**
  - **Live Agent Feed:** Timeline of recent actions with filter chips (All, Alerts, Automations).
  - **Run Queue:** Compact list of scheduled tasks showing ETA, priority, and ability to reprioritize via drag handle.
  - **Resource Snapshot:** CPU, memory, network throughput mini charts; warning state when thresholds exceeded.
  - **Channel Health:** Grid of connected channels with connectivity dots (green/yellow/red) and latency numbers.
- **Persistent Footer:** Global diagnostics shortcut, log export, version number.

### Model Selection Modal
- **Invocation:** From dashboard quick action “Trigger Agent” or context menu on an automation card.
- **Structure:**
  - **Tabs:** “Recommended” (curated list) and “All Models.”
  - **Model Rows:** Name, provider badge, latency estimate, last-used label.
  - **Detail Pane:** Appears when a row is highlighted—shows capabilities, token cost, guardrail summary.
  - **Controls:** Temperature slider, max tokens input, “Save as default” checkbox.
- **Actions:** Primary CTA “Apply Model,” secondary “Preview Output” (simulates with seed prompt), tertiary “Cancel.”
- **Feedback:** Success banner stacked at top of dashboard (“Model updated to gpt-5.1-codex for Automation: Inbox Triage”). Error inline message if provider quota exceeded.

### Channel Management Screen
- **Navigation:** Accessible via dashboard card or sidebar entry “Channels.”
- **Layout:**
  - Left column: Channel list with status icons, grouped (Messaging, Webhooks, Voice).
  - Right pane: Detail view showing auth state, webhook URLs, event subscriptions, rate limits.
  - Top-right button: “Add Channel.”
- **Interactions:**
  - Toggle switches to enable/disable delivery per channel.
  - “Rotate Credentials” button opens inline drawer for secret regeneration.
  - Activity log table listing recent events (connected, throttled, failed messages).
- **Feedback:**
  - Success toast after credential updates.
  - Alert banner if channel exceeds error threshold (“Slack webhook failing 30% of requests”).

### Diagnostics Panel
- **Entry Points:** Footer shortcut or sidebar “Diagnostics.” Can be opened as full screen or slide-over panel.
- **Sections:**
  - **Heartbeat Monitor:** Rolling chart of gateway heartbeat intervals; includes “Force ping” button.
  - **Event Log:** Scrollable list with severity chips (info/warn/error) and filters.
  - **Connectivity Tests:** Buttons for “Test Wi-Fi,” “Test API Key,” “Run Channel Ping,” each showing inline result cards.
  - **System Tasks:** List of background jobs (syncs, model downloads) with progress bars.
- **Controls:** “Export Logs” and “Send Diagnostic Bundle” (uploads to support endpoint with confirmation dialog).
- **Feedback:**
  - Checkmark badges when tests pass; red cross with retry option on failure.
  - Toast (“Diagnostic bundle sent to support”) on export completion.

---

## 3. Interaction & Feedback Notes

### Global Patterns
- **Success Toasts:** Slide up from bottom-right, auto-dismiss after 4 seconds, stackable (max 3). Green accent, concise phrases.
- **Error Toasts:** Red accent, stay visible until user dismisses or condition clears; include “View details” link.
- **Background Tasks Indicator:** Spinning progress ring in header when any long-running task is executing; hover reveals dropdown list (task name, ETA, cancel option).
- **Retry Behavior:** Network-dependent actions auto-retry twice with exponential backoff before surfacing an error state.

### Onboarding-Specific Interactions
- **Wi-Fi Check Failure:** Inline callout offers “Troubleshoot Wi-Fi” which opens step-by-step modal; background retries continue.
- **API Key Entry:** After three failures, app offers “Email me instructions” link (opens mailto template) and disables input for 30 seconds to prevent lockouts.
- **Channel Linking:** Pending status chips pulse until confirmation callback is received; if user navigates away, banner appears on dashboard reminding them to finish linking.

### Dashboard Interactions
- **Run Queue Drag:** On drop, toast confirms new order (“Diagnostics Sweep moved to #1”).
- **Channel Health:** Tapping a red state takes user directly to the Channel Management detail view with the relevant channel pre-selected.
- **Resource Snapshot Alerts:** When crossing critical threshold, banner appears with snooze option (15 min / 1 hr).

### Model Selection Modal Interactions
- **Preview Output:** Runs a lightweight dry-run with a canned prompt; result shown inline with ability to copy text.
- **Quota Errors:** Modal header turns red and shows guidance (“Check provider dashboard”); CTA disabled until user adjusts selection.

### Channel Management Interactions
- **Credential Rotation:** Requires confirmation modal; on success, dependent automations queue a refresh task (shown in background task dropdown).
- **Disabling a Channel:** Inline warning notes which automations will pause; user must confirm.

### Diagnostics Panel Interactions
- **Connectivity Tests:** Each test card includes timestamp of last run and “View raw log.”
- **Force Ping:** Displays spinner in status pill; success updates last heartbeat timestamp, error triggers recommendation to re-enter API key.
- **Export Logs:** Progress bar within CTA; on completion, toast provides link to local file path.

This document should guide engineering in implementing the onboarding flow, screen layouts, and interactive feedback patterns consistently throughout the OpenClaw Control App.