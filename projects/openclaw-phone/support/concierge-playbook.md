# OpenClaw Phone Concierge Call Playbook

Tone: warm, confident, action-first. The goal is to leave the customer feeling guided, informed, and ready to use their OpenClaw Phone daily.

---

## 1. Call Agenda (30 minutes)
1. **Welcome & Goals (3 min)**
   - Confirm preferred pronouns, contact channel, and today’s objective.
   - Reiterate the promise: "We’ll leave today with Wi-Fi connected, OpenClaw authenticated, messaging linked, and a successful first request."
2. **Hardware & Connectivity Check (5 min)**
   - Power, charging status, and Wi-Fi join.
3. **OpenClaw App Setup (12 min)**
   - Permissions, API key entry, base preferences, safety reminders.
4. **Messaging Link & First Test (7 min)**
   - Telegram/Signal/WhatsApp relay, send scripted test, confirm bot response.
5. **Wrap, Resources, Next Steps (3 min)**
   - Recap, restock reminder, support channels, follow-up commitments.

---

## 2. Concierge Checklist
Use this live during the call. Mark items ✅ / ⚠️ / ❌.

| Phase | Item | Notes |
| --- | --- | --- |
| Welcome | Confirm customer info (name, email, shipping address) |  |
|  | Verify support channel for follow-ups (email, Telegram handle) |  |
| Hardware | Phone powered on & >50% battery or charging |  |
|  | Wi-Fi credentials ready |  |
| Connectivity | Wi-Fi connected (speed test or webpage load) |  |
| OpenClaw App | Signed into OpenClaw setup wizard |  |
|  | Permissions accepted (notifications, mic, camera if needed) |  |
| API | API key provider selected (OpenAI, Anthropic, other) |  |
|  | API key entered & verified (status message) |  |
| Preferences | Timezone reflects customer location |  |
|  | Notification style & quiet hours set |  |
| Messaging | Primary messaging relay linked (Telegram/Signal/WhatsApp) |  |
|  | Bot added/approved and online status confirmed |  |
| Test | Scripted first message sent |  |
|  | Successful AI response received within 30s |  |
| Wrap | Customer confirms they know how to ask for help |  |
|  | Restock reminder delivered |  |
|  | Follow-up email + channels promised |  |

---

## 3. Required Information to Capture
Collect and log in the concierge CRM note immediately after the call.

1. **Customer Profile**: Full name, preferred name, company, time zone.
2. **Contact Paths**: Email, primary chat handle, backup phone number if available.
3. **Device Details**: Serial/asset tag, ship date, current OS build.
4. **Wi-Fi Context**: Network name, any firewall/proxy notes, location (home/office).
5. **AI Provider**: Which LLM account is used, confirmation that billing is active, API usage limits discussed.
6. **Messaging Channels**: Which relays are live, which are deferred, who else needs access (assistants, family, etc.).
7. **Use Cases Identified**: Top 2-3 daily workflows they mentioned.
8. **Open Questions / Follow-Ups**: Feature requests, upcoming travel, compliance needs.

---

## 4. Restock Reminder
Use this script during wrap-up once everything works.

> “I’ve flagged your kit in our system for regular refresh. When you’re down to two spare screen protectors or charging cables, tap the Concierge shortcut or reply to our recap email. We’ll overnight replacements so you never lose a day of productivity.”

**Action Items:**
- Add a “Restock reminder delivered” tick box to your CRM note.
- If customer pre-requests accessories (e.g., extra cases), submit the order via Ops portal immediately after the call.

---

## 5. Post-Call Commitments (for Concierge Lead)
1. Send recap email within 15 minutes (use template in `customer-facing/concierge-kit.md`).
2. Update support tracker with checklist results and any troubleshooting transcripts.
3. Tag recurring questions in the weekly feedback doc for pattern spotting.
4. Schedule follow-up touchpoint if major items remain open (API limit issues, enterprise VPN coordination, etc.).
