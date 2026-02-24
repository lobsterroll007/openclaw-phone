# OpenClaw Phone Device Prep SOP (v1.0)
_Last updated: 2026-02-23_

**Purpose:** Deliver a repeatable, <60 minute prep/reset process for Motorola XT2513v units with consistent QA documentation.

## 0. Overview
- **Prep time target:** ≤60 minutes per unit (new or return). Track deltas in QA log.
- **Primary owner:** Device Prep Specialist. Escalate blockers >15 minutes to Ops Lead.
- **Dependencies:** Automation Engineer (scripts & tooling), Support Lead (test accounts), Ops Analyst (tracker updates).

## 1. Prerequisites & Required Tools
| Category | Items |
| --- | --- |
| Hardware | • Motorola XT2513v unit • OEM charger + USB-C cable • USB-C OTG hub (if imaging multiple devices) • SD card (≥32 GB) containing workspace template & APKs |
| Workstation | • Prep laptop with ADB + Fastboot • USB-C data cable • Access to secure Wi-Fi (5 GHz preferred) |
| Software/Accounts | • Latest OpenClaw APK (stable) • App bundle set (Termux, Telegram, Signal, Files, Authenticator) • Tracker access (Notion/Sheet) • Test Telegram bot creds (rotating) |
| Consumables | • Lens wipe & microfiber cloth • Packaging materials + printed quick-start inserts • Tamper seal |
| QA Docs | • `ops/device-qa-log.md` • Current golden image manifest |

> **Automation candidates:** provisioning + reset shell scripts, tracker auto-fill, QA log form entry, APK sync via rsync/ADB push script.

## 2. Safety & Data Hygiene Checks
1. Confirm device IMEI/serial matches intake sheet.
2. Ensure workstation antivirus is up-to-date.
3. Verify SD card contents against checksum manifest (from golden image note).
4. Log start time in QA log.

## 3. Process Flows
### 3.1 New Device Flow (Greenfield Units)
| Step | Description | Time Target |
| --- | --- | --- |
| 1. Intake & Inspection | Visual inspection, accessory check, document deviations. | 5 min |
| 2. Power-On & Factory Reset | Boot, apply initial factory reset, enable dev options, USB debugging, stay-awake. | 7 min |
| 3. Connectivity & Updates | Join secure Wi-Fi, install OTA updates if pending (cap at 10 min; otherwise note for follow-up). | 8 min |
| 4. OS Optimization | Remove bloatware, adjust battery optimization, screen timeout. | 6 min |
| 5. Install Core Stack | Sideload OpenClaw + required apps via `adb install-multiple` batch script. | 10 min |
| 6. Workspace Template | Copy `OpenClawWorkspace/` from SD or workstation, verify checksums. | 5 min |
| 7. Configure Defaults | Home screen layout, shortcuts, wallpaper, captive portal reminder. | 5 min |
| 8. QA Pass | Run `openclaw status`, messaging handshake, audio test, storage check. | 8 min |
| 9. Finalize & Pack | Clear temp data, reboot, confirm lock screen instructions, package with inserts, log tracker. | 6 min |
| **Total** |  | **60 min** |

### 3.2 Return / Refurb Flow (Units coming back from customers)
| Step | Description | Time Target |
| --- | --- | --- |
| R1. Intake & Condition Grade | Record cosmetic condition (A/B/C). Photograph issues. | 4 min |
| R2. Secure Data Wipe | Run `adb shell recovery --wipe_data` or OEM recovery wipe. Confirm via double-boot. | 8 min |
| R3. Golden Image Restore | Flash current golden image using `fastboot flashall` or `adb shell sh restore.sh`. | 10 min |
| R4. App Stack Refresh | Run automation script to reinstall apps, or manually verify versions vs manifest. | 7 min |
| R5. Hardware QA | Test buttons, ports, mic/speaker, battery health (Settings → Battery → health stats). | 8 min |
| R6. Cosmetic Refinish | Clean chassis, replace screen protector if scratched. | 5 min |
| R7. Configuration Touch-Ups | Apply Wi-Fi reminder, home shortcuts, wallpaper, ensure notifications cleared. | 5 min |
| R8. QA Pass + Regression | Repeat new-device QA plus added stress test: 10-minute standby + quick call test. | 9 min |
| R9. Documentation & Packing | Update tracker with condition grade, attach return-specific insert if needed. | 4 min |
| **Total** |  | **60 min** |

> **Automation candidates (returns):** script to reset + flash golden image, auto-generate condition photo log, automated health report via `adb shell dumpsys` summary.

## 4. QA Checkpoints
1. **Checkpoint A (Post-Step 3 or R3):** Device boots, Wi-Fi connected, OTA status logged.
2. **Checkpoint B (Post-Step 6 or R4):** Workspace template hash matches manifest; automation script output archived.
3. **Checkpoint C (Post-Step 8 or R8):** `openclaw status` OK, messaging handshake screenshot saved, audio test recorded if issue.
4. **Checkpoint D (Final):** QA log entry completed, packaging photo taken, tracker updated, shipping label queued.

Each checkpoint requires initials + timestamp in QA log. Deviations → create `Issue-YYYYMMDD-<serial>` entry referencing mitigation.

## 5. Failure Modes & Mitigation
| Failure Mode | Detection Point | Mitigation | Escalation |
| --- | --- | --- | --- |
| OTA update stuck >10 min | Step 3 | Power cycle once, switch Wi-Fi, if still stuck skip OTA, log + notify Automation Engineer for offline update package. | Ops Lead |
| APK install fails | Step 5/R4 | Re-run via ADB with `-r -d`; if signature mismatch, download fresh APK from repo; verify checksum. | Automation Engineer |
| Template hash mismatch | Step 6/R4 | Recopy from golden SD, run `sha256sum`; if persists, refresh SD from golden image process. | Device Prep Lead |
| Messaging handshake fails | QA Checkpoint C | Validate Wi-Fi, reissue test bot token, reinstall Telegram; if service outage, log and retry within 2h. | Support Lead |
| Hardware defect (mic, speaker, button) | QA Checkpoint C | Swap device to quarantine bin, mark as RMA candidate, notify Ops Analyst for inventory impact. | Ops Lead |

## 6. Documentation & Handoff
- Update `ops/device-qa-log.md` per unit (template below).
- Attach photos/screenshots to tracker entry.
- Store automation logs under `ops/logs/<serial>/<date>/`.
- Send daily summary to Ops Analyst with cycle time + blockers.

## 7. Continuous Improvement Hooks
- Capture actual times per step to refine estimates; target automation on steps consistently >10 minutes.
- Propose new automation tickets in shared board tagged **Automation Candidate** referencing the step number.
- Review golden image process monthly or after any critical OpenClaw release.

> **Reminder:** Always leave one fully configured golden device untouched except during validation cycles (see `ops/golden-image.md`).
