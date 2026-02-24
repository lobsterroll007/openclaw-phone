# OpenClaw Phone Prep Tracker Concept

## Purpose
Provide a lightweight, near-real-time view of each device's provisioning status for Ops (device prep) and Sales (customer readiness). Tracker ingests structured log output from automation scripts and pairs it with manual notes to create a single source of truth.

## Data Model
Minimal fields per device:
- `device_id` (IMEI or serial)
- `sku`
- `assigned_customer` (optional until order allocated)
- `stage` (enum: intake, baseline, apps, workspace, qa, ready, blocked)
- `stage_detail` (free text or predefined codes)
- `operator` (who ran provisioning)
- `updated_at` (UTC timestamp)
- `log_path` (link to raw log file from `provision.sh`)
- `blockers` (array of strings, empty when none)
- `qa_checks` (struct: `openclaw_status`, `telegram_test`, `audio_test`, `storage_pct`)

Storage options:
1. **CSV/JSON file** in repo for prototyping (`automation/tracker-state.json`).
2. **Lite DB** (SQLite) for multi-user access.
3. Future: hosted Airtable/Notion view fed by script uploads.

## Ingestion Flow
1. `provision.sh` writes logs under `automation/logs/<timestamp>-provision.log` with machine-readable markers, e.g. `JSON: {"event":"install","pkg":"com.termux",...}`.
2. Tracker ingestion script (`automation/update-tracker.py`, future) parses latest log for each device and updates tracker store.
3. Manual actions (inspection, QA anomalies) recorded via CLI prompts or quick form writing into same store.

## Status Views
- **Ops Dashboard:** Table grouped by `stage`, sorted by `updated_at`. Shows operator + blockers for triage.
- **Sales Snapshot:** Filter for `stage=ready` or `assigned_customer=<name>` for ship dates.
- **Audit History:** Logs remain immutable; tracker stores last event references + `log_path` for deep dive.

## Reading Mechanisms
- `prep-tracker.md` describes schema; initial implementation could be `tracker-cli status` (a simple Python script) that prints human-readable table using the JSON data.
- Secondary: auto-generate Markdown summary during provisioning run and drop into `automation/report-<device>.md` for asynchronous review.

## Dependencies / Blockers
- Need consistent device identifier capture at start of script.
- Logging format must include JSON markers to allow reliable ingestion (current script only human-readable; TODO: add `log_json()` helper).
- Decide on shared storage (git-tracked file vs. lightweight hosted DB).

## Next Steps
1. Extend `provision.sh` with `DEVICE_ID` variable (read via `adb shell getprop ro.serialno`).
2. Define `tracker-state.json` schema + sample entry.
3. Build `update-tracker.py` to parse logs and update statuses.
4. Iterate with Ops/Sales to confirm fields and dashboard access (Notion/Airtable embed optional).
