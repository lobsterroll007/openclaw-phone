# OpenClaw Phone Feedback Loop
Purpose: capture every customer signal, turn it into structured insight, and close the loop quickly. Tone: reassuring, proactive, action-driven.

---

## 1. Capture → Tag → Assign → Resolve Overview
1. **Capture** every touchpoint (concierge calls, Telegram pings, emails, diagnostics forms).
2. **Tag** consistently so patterns surface.
3. **Assign** to the owner who can fix it fastest (Support, Ops, Engineering, Product, CX).
4. **Resolve** with a clear customer-facing response and internal note.
5. **Review** weekly in Insights sync to highlight wins & blockers.

---

## 2. Capture Guidelines
- **During Calls:** Take notes directly into the Concierge Checklist. Mark questions, friction, and feature ideas.
- **Async Channels:** Enable auto-forward to `support@openclaw.com` + log entries in HelpDesk within 1 hour.
- **Diagnostics:** When customers send logs, attach them to the case immediately.
- **Positive Feedback:** Capture quotes too—tag as "Delight" for marketing use.

**Minimum data per entry:** customer name, time stamp, channel, summary, impact level (P0 critical → P3 minor).

---

## 3. Tagging Framework
Use one primary tag + optional secondary tags.

| Category | Tag | Description |
| --- | --- | --- |
| Reliability | `NoResponse`, `WiFi`, `RelayDelay`, `Battery`, `Notifications` | Anything affecting basic service availability |
| Setup | `APIKey`, `TelegramRelay`, `Permissions`, `OnboardingGap` | Obstructions during initial 10-min setup |
| Experience | `Delight`, `Confusion`, `FeatureRequest` | Sentiment or qualitative feedback |
| Hardware | `Accessory`, `Restock`, `Damage` | Physical components or replacements |
| Ops | `Billing`, `Shipping`, `Scheduling` | Process-related issues |

**How to apply tags:** choose from HelpDesk dropdown → if new tag needed, propose it during weekly sync before adding.

---

## 4. Assignment Rules
1. **Support Pod** handles `NoResponse`, `APIKey`, `TelegramRelay`, `WiFi`, `Notifications`.
2. **Ops** handles `Billing`, `Shipping`, `Restock`, `Accessory`.
3. **Engineering** handles persistent product bugs (auto-escalate when same tag appears 3+ times in a week).
4. **Product** owns `FeatureRequest` and `OnboardingGap` themes; they respond with roadmap notes.
5. **CX Lead** keeps ownership of `Delight` to repurpose quotes/testimonials.

Assignments must include due date + next action in the ticket header.

---

## 5. Resolution Cadence
| Priority | Definition | SLA | Customer Update Frequency |
| --- | --- | --- | --- |
| P0 | Outage / device offline | 2h fix or workaround | Every 60 min |
| P1 | Setup blocked for individual user | 1 business day | Daily |
| P2 | Minor bug or accessory need | 3 business days | Twice weekly |
| P3 | Feature request / nice-to-have | Added to roadmap | Weekly summary |

Upon resolution:
1. Document fix steps + verification (screenshot/log).
2. Notify customer via preferred channel with friendly closure.
3. Update tag counts in weekly tracker.

---

## 6. Weekly Review Ritual
- **Monday 9:00 MT:** Support & Concierge sync (30 min).
- Agenda:
  1. Top incidents by tag count (present chart from tracker).
  2. Wins & quotes for marketing.
  3. Pending escalations (who owns, next steps).
  4. Preventative actions (docs to update, training needed, product tweaks).
- Update the "Weekly Insights" template immediately after the meeting and share in #phone-ops.

---

## 7. Tooling
- **HelpDesk** for ticketing + tags.
- **Notion tracker** for weekly insights (same structure as template).
- **Slack #phone-ops** for rapid escalations (link ticket every time).
- **Ops Portal** for restock orders and accessory shipments.

---

## 8. Customer Loop Closure Checklist
1. ✅ Customer heard promptly (acknowledged within SLA).
2. ✅ Tag + owner assigned.
3. ✅ Fix applied / workaround shared.
4. ✅ Satisfaction confirmed ("Does everything feel stable now?").
5. ✅ Insight logged into weekly tracker.

If any box is unchecked, the loop is still open.
