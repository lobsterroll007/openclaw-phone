# OpenClaw Phone – Weekly KPI Dashboard Outline

| KPI | Definition | Target / Alert | Data Source & Owner | Notes |
| --- | --- | --- | --- | --- |
| **Prep Time (avg)** | Mean minutes from unboxed device → "ready to ship" status | Target ≤ 60 min; alert ≥ 75 min | Device Prep Specialist timer log → Google Sheet (automation push) | Capture start/end stamps per unit; highlight top blockers in notes column |
| **Reset Time (avg)** | Mean minutes to receive, inspect, wipe, and re-stage a return | Target ≤ 60 min; alert ≥ 75 min | Returns intake form + reset SOP log | Include reason codes (damage, config issue) to feed automation queue |
| **Gross Margin % (weekly blend)** | (Revenue – COGS – labor) ÷ Revenue for units shipped in week | Target ≥ 70%; alert < 65% | Financial model input sheet maintained by Ops Analyst | Pull concierge attach % + actual labor minutes to keep accurate |
| **Cash on Hand** | Liquid cash dedicated to OpenClaw Phone (operating + reserve) | Target ≥ 6 weeks runway; alert < 4 weeks | Finance tracker (Notion/Sheet) updated by Ops Analyst | Include upcoming payables (inventory orders, contractors) |
| **Inventory On-Hand** | Count of ready-to-ship phones + raw devices | Target ≥ forecasted 3-week demand; alert < 2 weeks | Inventory tab auto-updated by Automation Engineer | Split into "ready", "in prep", "in return cycle" |
| **Lead Pipeline** | # of leads by stage (New, Qualified, Closed-won) for the week | Target: 8+ qualified / week; alert < 5 | CRM/Airtable maintained by Sales & Funnel Builder | Include conversion %, concierge attach, expected ship date |

## Dashboard Cadence & Ownership
- **Update schedule:** Every Monday before noon MST.
- **Publisher:** Margin & Ops Analyst consolidates metrics + commentary.
- **Inputs due:**
  - Device Prep Specialist: upload prep/reset logs by Sunday EOD.
  - Sales Lead: refresh pipeline counts nightly (auto sync preferred).
  - Finance/Ops: reconcile cash + margin inputs weekly.
- **Distribution:** Shared Notion dashboard + PDF snapshot to founder group chat.
