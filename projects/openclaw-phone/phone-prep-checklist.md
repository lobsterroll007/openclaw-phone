# OpenClaw Phone Prep Checklist (v0.1)

Use this every time you configure a Motorola XT2513v unit before shipping. Update as we streamline.

### 1. Intake & Inspection
- [ ] Verify device SKU + serial, note in tracker.
- [ ] Inspect screen/body for defects; reject if damaged.
- [ ] Confirm box contents (charger, cable) or note if selling phone-only.

### 2. Power-On & Factory Reset
- [ ] Boot into Android, perform factory reset (Settings → System → Reset → Erase all data).
- [ ] Connect to trusted Wi-Fi.
- [ ] Enable developer options (tap Build Number 7x), then toggle USB debugging + stay awake while charging.

### 3. OS Optimization
- [ ] Disable/limit bloatware (uninstall updates for preloaded carriers if possible).
- [ ] Turn off battery optimizations for OpenClaw + Telegram/Signal (Settings → Apps → Special access).
- [ ] Increase screen timeout to 5 min for setup (reset to 1 min before shipping).

### 4. Install Stack
- [ ] Install OpenClaw APK (latest stable) via browser download or ADB.
- [ ] Install supporting apps:
  - [ ] Termux
  - [ ] Files app / file explorer
  - [ ] Telegram + Signal (or other default channel apps)
  - [ ] Authenticator (if customers need 2FA)
- [ ] Apply OpenClaw workspace template (copy from SD card/cloud):
  - `AGENTS.md`, `SOUL.md`, `USER.md` skeletons
  - `HEARTBEAT.md` blank
  - `README-QUICKSTART.md` with customer instructions

### 5. Configure Defaults
- [ ] Preload bookmarks/shortcuts on home screen:
  - Quick-start doc
  - “Run OpenClaw” button (via Termux widget or shortcut)
  - Support contact link (email/Telegram bot)
- [ ] Set wallpaper/branding if desired.
- [ ] Add Wi-Fi captive portal reminder (push notification) explaining they must connect to home network on arrival.

### 6. QA Pass
- [ ] Run `openclaw status` to confirm services start.
- [ ] Test Telegram relay handshake (use internal test bot) → remove credentials afterward.
- [ ] Check mic/speaker quickly (voice memo playback).
- [ ] Verify storage space >80% free.

### 7. Finalize for Shipment
- [ ] Clear temporary accounts/cache.
- [ ] Reboot and ensure lock screen instructions show first-run checklist.
- [ ] Include printed quick-start + QR code linking to setup wizard.
- [ ] Update tracking sheet: unit ready, notes, assigned customer.
- [ ] Place in packaging with charger, inserts, and seal.

### Notes
- Document every deviation in the tracker (e.g., replaced charger, cosmetic scuff).
- Keep one fully configured “golden” device to clone settings if we find a faster approach.
