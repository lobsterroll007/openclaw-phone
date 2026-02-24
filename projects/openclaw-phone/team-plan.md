# OpenClaw Phone Project – Team Blueprint (v1)

_Last updated: 2026-02-23_

## Mission
Deliver a “ready-to-run” OpenClaw Android phone that any customer can set up in minutes, generating cashflow quickly while maintaining high margins and a premium experience.

## Guiding Principles
1. **Customer simplicity** – every artifact must pass the “average person” test.
2. **Operational speed** – automate or templatize prep/reset work to hit <60 min per unit.
3. **Transparent economics** – margin, return rate, and cycle time are tracked weekly.
4. **Tight feedback loop** – concierge/support insights feed straight into docs + automation.

---

## Core Roles & Responsibilities

### 1. Device Prep Specialist
- **Objective:** Turn the checklist into an SOP with measured timings; reduce prep/reset time to ≤60 minutes via process improvements.
- **Deliverables:**
  - Versioned SOP (with timestamps, required tools, failure modes).
  - QA log template + first 5 sample entries.
  - “Golden image” maintenance notes (how to update, validate).
- **Dependencies:** Automation Engineer for tooling; Ops Analyst for metrics.
- **Success Metrics:** Avg prep time, defect rate (<2%).

### 2. Automation Engineer / Scripter
- **Objective:** Eliminate repetitive touches using scripts, Termux automation, and lightweight inventory tracking.
- **Deliverables:**
  - Provisioning script (bash/python) covering installs + workspace copy.
  - Reset script for returns.
  - Tracker (Sheet/AppScript/Notion) auto-updated from prep logs.
- **Success Metrics:** Manual steps removed, % of process automated, data accuracy of tracker.

### 3. Customer Experience Writer
- **Objective:** Own every customer-facing word or visual.
- **Deliverables:**
  - One-page insert (print-ready PDF).
  - Full onboarding guide (docs + screenshots).
  - Landing page copy + FAQ.
  - Concierge script + follow-up email template.
- **Success Metrics:** Customer satisfaction (surveys), support ticket volume drop.

### 4. Sales & Funnel Builder
- **Objective:** Package the offer and drive initial sales while systems are stood up.
- **Deliverables:**
  - Order intake form linked to CRM/Sheet.
  - Pitch collateral (social posts, DM script, referral blurb).
  - Lead tracking pipeline with status tags.
- **Success Metrics:** # of qualified leads/week, close rate, average order value.

### 5. Margin & Ops Analyst
- **Objective:** Keep profitability visible and policies calibrated.
- **Deliverables:**
  - Financial model with live inputs (device cost, labor, restock fee, return rate).
  - KPI dashboard (prep time, margin, cash on hand, inventory).
  - Restocking policy doc + customer-facing wording.
- **Success Metrics:** Target gross margin ≥70%, cashflow forecast accuracy within ±10%.

### 6. Support & Concierge Lead
- **Objective:** Deliver the $50 hand-hold experience and close the loop on customer feedback.
- **Deliverables:**
  - Scripted 30-min onboarding call + checklist.
  - Troubleshooting flowchart.
  - Weekly customer insights report feeding back into docs + automation.
- **Success Metrics:** NPS/CSAT for concierge (>8/10), average resolution time, churn/return triggers flagged early.

---

## Communication & Cadence
- **Daily standup (async):** each role posts blockers/progress in tracker.
- **Twice-weekly sync:** Richard + leads to clear cross-role blockers.
- **Weekly metrics report:** Ops Analyst publishes numbers + risks.
- **Rapid feedback loop:** Support Lead logs top issues → Customer Writer + Automation Engineer review within 24h.

## Tooling & Artefacts
- Shared Notion/Sheet for SOPs + status.
- Git/Repo for scripts & templates (mirrors phone workspace).
- CRM/Lead tracker (Airtable or Sheet) tied to funnel status.
- Customer knowledge base (public doc + printable insert).

## Hiring / Onboarding Steps for Each Role
1. **Brief:** Use this blueprint + role-specific deliverables as the contract.
2. **Kickoff package:** relevant files (checklist, financial model, existing drafts) + success metrics.
3. **Checkpoints:** milestone review after 48h, then weekly.
4. **Handoff expectations:** automation outputs must be documented, customer copy must be version-controlled, etc.

## Immediate Next Actions
1. Finalize restocking fee policy wording (Ops Analyst + Customer Writer).
2. Spin up Automation Engineer to start scripting (highest leverage for shrinking prep time).
3. Customer Writer drafts the one-page insert and onboarding doc.
4. Sales Builder sets up intake form + initial outreach list.

---
This document is the reference playbook; update as roles deliver and metrics evolve.
