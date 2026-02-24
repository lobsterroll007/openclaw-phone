# OpenClaw Phone Provisioning Automation Plan (Draft)

_Source:_ `phone-prep-checklist.md` v0.1 + current ops notes.

## Goals
- Reduce per-device prep time by codifying every repeatable action.
- Use automation (Termux scripts, ADB, shell) wherever Android allows without rooting.
- Produce logs that downstream tooling (prep tracker) can ingest for live status.

## Assumptions
1. Devices: Motorola XT2513v running near-stock Android 14.
2. Workstations: macOS/Linux with Android Platform Tools installed.
3. Temporary physical access with USB debugging enabled.
4. OpenClaw APK + supporting APKs available via internal storage or URLs (placeholders now).
5. Workspace template stored under `/sdcard/OpenClawWorkspaceTemplate/` or synced via `adb push`.

## Automation Coverage Map

| Checklist Phase | Action | Proposed Implementation | Automation Readiness |
| --- | --- | --- | --- |
| Intake & Inspection | log SKU/serial, defect notes | Manual capture in tracker UI; optionally `adb shell getprop ro.serialno` | Manual (required), serial pull script optional |
| Power-On & Factory Reset | factory reset, Wi-Fi, dev options | Manual navigation; future: `adb shell recovery --wipe_data`? but not standard | Manual |
| Enable USB Debugging | Toggle developer options, USB debug, stay awake | Manual toggles; script can verify via `adb devices` and `adb shell settings get global stay_on_while_plugged_in` | Mixed: manual toggle, script verify |
| OS Optimization | Disable bloatware, adjust screen timeout | Use `adb shell pm uninstall --user 0 <package>` or `cmd package` list. Timeout via `adb shell settings put system screen_off_timeout 300000`. | Automatable now (need package list) |
| Install Stack | Install OpenClaw APK, Termux, Telegram, Signal, Files | Use `adb install` for APKs stored locally. Termux via `adb install termux.apk` (F-Droid).  Telegram via Play Store requires manual login, so push latest APK. | Automatable now with placeholder APK paths |
| Workspace Template | Copy skeleton files | Mount template onto `/sdcard/OpenClaw/` using `adb push` or Termux + git clone. | Automatable now |
| Configure Defaults | Home screen shortcuts, wallpaper, widgets | Requires UI automation (ADB `cmd shortcut` limited). Could use `adb shell cmd shortcut create` or rely on OEM backup restore. For now manual | Manual/blocker |
| QA Pass | Run `openclaw status`, test Telegram relay, mic/speaker | Termux script can run `openclaw status` + log results; Telegram handshake requires manual but script can stub. | Mixed |
| Finalize for Shipment | Clear caches, reboot, update tracker | `adb shell pm clear`, `adb reboot`, tracker update via script. | Automatable |

## Detailed Step Mapping

### 1. Device Intake
- **Script:** `scripts/device-intake.sh`
  - `adb shell getprop ro.serialno` to record serial.
  - `adb shell getprop ro.product.model` for confirmation.
  - Output to JSON log consumed by tracker.
- **Manual Input:** Physical inspection, accessory confirmation; operator enters notes into tracker UI.

### 2. Baseline Prep
- **Manual:** Factory reset + Wi-Fi.
- **Verification Script:** `adb wait-for-device` + `adb shell settings put global stay_on_while_plugged_in 3` to ensure screen stays awake while charging.

### 3. OS Optimization
- **Script:** `automation/provision.sh` section `optimize_os()`
  - List of packages to disable/uninstall, e.g. `adb shell pm uninstall --user 0 com.facebook.katana` (placeholder list in repo `automation/bloatware-packages.txt`).
  - Set screen timeout: `adb shell settings put system screen_off_timeout 300000` (5 min) and later revert to `60000`.
  - Disable battery optimizations for targeted apps using `adb shell dumpsys deviceidle whitelist +com.openclaw.app` (requires package name).

### 4. Install Application Stack
- **Script:** `automation/provision.sh`
  - Install APKs via `adb install -r path/to/app.apk`.
  - If network install preferred, leverage Termux `pkg install wget` + `wget <url>` + `pm install`.
  - Log each install step with timestamps.

### 5. Workspace Template Deployment
- **Script:** `adb push templates/workspace/ /sdcard/OpenClawWorkspace/`.
  - Within Termux, run `cp -r /sdcard/OpenClawWorkspace ~/openclaw/workspace`.
  - Validate presence: `ls ~/openclaw/workspace/AGENTS.md`.

### 6. QA Scripts
- **Termux command block**: `openclaw status`, `openclaw gateway status`.
- **Audio test**: For now manual (playback sample file). Future: `adb shell media play-test` or `cmd media play-sound` if accessible.
- **Telegram handshake**: Future automation once bot tokens available via env injection.

### 7. Finalization
- **Script:**
  - `adb shell cmd notification post --channel "prep" ...` to remind user to connect Wi-Fi? (optional)
  - `adb reboot`
  - Append `status=ready` to tracker log.

## Immediate Automation Opportunities
1. Central provisioning script (this doc) to run sequential steps after manual prerequisites done.
2. Logging wrapper around every `adb` call to capture success/failure.
3. Template copy + verification.
4. Standardized install order to reduce missed apps.

## Dependencies / Blockers
- Need authoritative list + storage location for APKs (OpenClaw, Telegram, Termux, others).
- Some steps still require manual action (factory reset, home screen customization, audio check).
- Termux automation assumes user grants Storage + Run command permission; may require manual first launch.
- Battery optimization whitelist commands vary by OEM; need testing on XT2513v.

## Next Steps
1. Build + test `automation/provision.sh` on a dev unit.
2. Capture `bloatware-packages.txt` and template path references.
3. Integrate log output with tracker concept (`prep-tracker.md`).
4. Iterate with Ops to replace manual steps with UI automation (e.g., `adb shell input keyevent` sequences) as confidence grows.
