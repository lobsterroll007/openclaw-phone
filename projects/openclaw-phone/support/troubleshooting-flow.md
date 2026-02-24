# OpenClaw Phone Troubleshooting Flow
Tone: calm, solution-oriented. Always narrate what you are doing so the customer never feels lost.

## How to Use This Flow
1. Confirm the customer’s current state ("What are you seeing right now?").
2. Enter the relevant branch below.
3. After each fix, run a test (send the standard "Hey OpenClaw…" message) before closing.
4. Log the outcome and tag the scenario in the feedback tracker.

---

## Branch A: No Response from Assistant
1. **Check Basics**
   - Ask: “Is the phone showing Wi-Fi bars and notifications?”
   - Toggle Airplane Mode on/off.
2. **Verify App Status**
   - Open OpenClaw app → ensure session is active.
   - Force-quit and relaunch if frozen (swipe up, reopen).
3. **Quick Test**
   - Send in-app test prompt.
   - If still no answer, continue.
4. **Server Health**
   - Check status.openclaw.com (if outage, set expectations & create incident note).
5. **Escalation**
   - Collect logs (Settings → Support → “Send diagnostics”).
   - Tag ticket "NoResponse" and assign to engineering within 15 minutes.

---

## Branch B: API Key Errors
1. **Confirm Provider**
   - Ask which model (OpenAI, Anthropic, etc.) and whether billing is active.
2. **Validate Key Format**
   - Compare prefix (e.g., "sk-") with provider standards.
   - Ensure no spaces/newlines when pasted.
3. **Re-Authenticate**
   - Open OpenClaw app → Settings → AI Provider → “Replace key”.
   - Paste key, tap **Verify**.
4. **Quota/Permissions**
   - If error persists, log into provider portal, confirm usage/quota.
   - Suggest temporary downgrade to a working key if main account locked.
5. **Escalation**
   - Capture screenshot of error message.
   - Tag ticket "APIKey" and relay to Solutions team with provider status.

---

## Branch C: Telegram Relay Issues
1. **Bot Status**
   - Ask customer to open Telegram → search @OpenClawSupport → confirm chat exists.
   - Ensure bot is not muted or archived.
2. **Re-Link Flow**
   - In OpenClaw app, go to Messaging → Telegram → "Disconnect" then "Connect".
   - Approve new request in Telegram within 60 seconds.
3. **Test Message**
   - Send "/ping" command. Expect "pong" plus timestamp.
4. **Network Constraints**
   - If still failing, confirm Telegram isn’t blocked by corporate Wi-Fi (test on LTE hotspot).
5. **Escalation**
   - Export Telegram debug log (Settings → Advanced → Export chat info).
   - Tag ticket "TelegramRelay" and notify comms engineer for bot health review.

---

## Branch D: Wi-Fi Problems
1. **Signal Check**
   - Ask customer to move closer to router. Note bars/strength.
2. **Credential Reset**
   - Forget network → re-enter password slowly.
   - Verify 2.4 vs 5 GHz network; prefer 5 GHz when stable.
3. **Router Constraints**
   - Confirm MAC filtering / enterprise portal requirements.
   - If captive portal, guide through browser login.
4. **Fallback Plan**
   - Connect to LTE hotspot or guest network to complete setup.
5. **Escalation**
   - Capture router model, firmware, and ISP info.
   - Tag ticket "WiFi" and loop in Ops if hardware swap or mesh extender needed.

---

## Branch E: Telegram Notification but No Content (Relay Delay)
1. **Check Message Queue**
   - In app: Messaging → Relay Health → view queue.
2. **Clear Cache**
   - Tap "Flush pending" then resend test message.
3. **Time Sync**
   - Ensure phone timezone matches server (Settings → General → Date & Time → Automatic).
4. **Escalation**
   - Collect relay log bundle.
   - Tag ticket "RelayDelay".

---

## Branch F: General Wi-Fi + App Success but Device Idle Overnight
1. **Confirm Sleep Settings**
   - Settings → Display → Auto-Lock set to at least 5 min (not 30 sec).
2. **Battery Saver**
   - Disable Low Power Mode during troubleshooting.
3. **Notification Permissions**
   - Ensure OpenClaw app notifications enabled with sound/badge.
4. **Escalation**
   - Capture screen recording of missed notification timeline.

---

## Closure Checklist
- ✅ Issue resolved test message logged.
- 🕓 If unresolved, ETA communicated to customer.
- 📝 Feedback tag selected (NoResponse / APIKey / TelegramRelay / WiFi / RelayDelay / Idle).
- 📧 Follow-up summary sent via customer’s preferred channel.
