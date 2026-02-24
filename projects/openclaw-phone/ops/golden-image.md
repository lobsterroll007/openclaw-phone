# Golden Image Process Note (Motorola XT2513v)
_Last updated: 2026-02-23_

## Objective
Maintain a reference configuration ("golden image") that can be flashed onto any unit to hit the ≤60 min prep target. The golden image must include OS patches, OpenClaw app stack, workspace templates, and launcher configuration.

## Versioning Convention
`GI-<YYYYMMDD>-<rev>` (e.g., `GI-20260223-a`).
- **YYYYMMDD:** date the image was finalized.
- **rev:** increment alphabetically when multiple cuts occur in the same day.
- Maintain changelog entries describing OS build number, OpenClaw version, and notable tweaks.
- Store checksum manifest (`sha256sum.txt`) alongside each release in `/ops/golden-image-store/`.

## Build Procedure (Monthly or on major release)
1. **Base Device Prep**
   - Start with factory-new device or sanitized return.
   - Apply latest OTA updates.
   - Enable developer options, USB debugging, stay awake.
2. **Install & Configure Stack**
   - Install OpenClaw stable APK + supporting apps (Termux, Telegram, Signal, Files, Authenticator) using batch script.
   - Import workspace template (latest versions of `AGENTS.md`, `SOUL.md`, `USER.md`, `README-QUICKSTART.md`, `HEARTBEAT.md`).
   - Set launcher layout, wallpapers, quick settings toggles, and notification presets.
3. **Hardening & Clean-up**
   - Disable bloatware, set battery optimization exceptions, lock screen instructions.
   - Clear cache/data for apps used only for validation (e.g., Telegram test bot).
   - Ensure storage free space ≥80%.
4. **Snapshot Creation**
   - Reboot into bootloader; run `adb shell getprop ro.build.version.incremental` to record OS build.
   - Use `adb shell su -c "/system/bin/dd if=/dev/block/bootdevice/by-name/userdata of=/sdcard/golden-userdata.img"` (or OEM tool) to capture partitions.
   - Pull images to workstation: `adb pull /sdcard/golden-userdata.img` etc.
   - Generate checksum manifest.
5. **Packaging**
   - Place partition images + manifest + changelog into versioned folder.
   - Update `golden-image-manifest.json` with:
     ```json
     {
       "version": "GI-20260223-a",
       "os_build": "T2TZ33.43-19",
       "openclaw_apk": "2.3.1",
       "workspace_commit": "abc1234",
       "checksum_file": "sha256sum.txt"
     }
     ```

> **Automation candidate:** scripted capture + packaging via shell + `fastboot` to minimize manual commands.

## Refresh Cadence
- **Regular:** First Monday each month.
- **Urgent:** Within 48h of critical OpenClaw/security release.
- Maintain at least two prior versions for rollback.

## Validation Procedure (Per release)
1. Flash the new image onto two test devices using `flash-golden.sh <version> <serial>`.
2. Boot and complete onboarding; ensure no setup wizard blockers.
3. Run quick QA (Steps A–C from SOP) and log results tagged `Golden Validation`.
4. Have Automation Engineer diff automation scripts to ensure compatibility; update install scripts with new version string.
5. Once validated, mark `current_version` in manifest and notify Device Prep + Automation channels.

## Distribution & Storage
- Store master copies on encrypted drive + repo (LFS) with restricted access.
- Provide SD card copies labeled with version + checksum.
- Replace SD card contents immediately after a new release; archive old card separately.

## Rollback Procedure
- If QA defect rate spikes or blocker discovered:
  1. Halt shipments, flag impacted serials.
  2. Reflash affected units with previous known-good version.
  3. Document issue in changelog and open ticket for root cause.

## Dependency Hooks
- **Automation Engineer:** maintain `flash-golden.sh`, `prep-install.sh`, and log uploads.
- **Device Prep:** verify SD cards weekly, audit checksums before every batch.
- **Ops Analyst:** note version in tracker for each device to correlate with issue trends.
