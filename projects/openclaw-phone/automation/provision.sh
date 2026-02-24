#!/usr/bin/env bash
set -euo pipefail

LOG_DIR="${LOG_DIR:-$(pwd)/projects/openclaw-phone/automation/logs}"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/$(date +%Y%m%d-%H%M%S)-provision.log"

log() {
  local level="$1"; shift
  local msg="$*"
  local ts
  ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  echo "${ts} [${level}] ${msg}" | tee -a "$LOG_FILE"
}

require_adb() {
  if ! command -v adb >/dev/null 2>&1; then
    log ERROR "adb command not found. Install Android Platform Tools."
    exit 1
  fi
}

wait_for_device() {
  log INFO "Waiting for device..."
  adb wait-for-device
  log INFO "Device connected: $(adb shell getprop ro.serialno | tr -d '\r')"
}

install_apk() {
  local apk_path="$1"
  local label="$2"
  if [[ ! -f "$apk_path" ]]; then
    log WARN "APK for ${label} missing at ${apk_path}; skipping (placeholder)."
    return
  fi
  log INFO "Installing ${label} from ${apk_path}"
  if adb install -r "$apk_path" >>"$LOG_FILE" 2>&1; then
    log INFO "${label} installed"
  else
    log ERROR "Failed to install ${label}"
  fi
}

copy_workspace_template() {
  local template_dir="${1:-templates/openclaw-workspace}"
  if [[ ! -d "$template_dir" ]]; then
    log WARN "Template dir ${template_dir} missing; skipping copy."
    return
  fi
  log INFO "Pushing workspace template to /sdcard/OpenClawWorkspace"
  adb push "$template_dir" /sdcard/OpenClawWorkspace >>"$LOG_FILE" 2>&1
  log INFO "Workspace template pushed"
}

set_screen_timeout() {
  local ms="$1"
  log INFO "Setting screen timeout to ${ms} ms"
  adb shell settings put system screen_off_timeout "$ms" >>"$LOG_FILE" 2>&1
}

optimize_battery_for() {
  local pkg="$1"
  log INFO "Whitelisting ${pkg} from battery optimizations"
  adb shell dumpsys deviceidle whitelist +"$pkg" >>"$LOG_FILE" 2>&1 || log WARN "Unable to whitelist ${pkg}"
}

main() {
  log INFO "Starting provisioning script"
  require_adb
  wait_for_device

  # Placeholder paths - replace with real APK locations
  install_apk "assets/apk/openclaw-latest.apk" "OpenClaw"
  install_apk "assets/apk/termux-latest.apk" "Termux"
  install_apk "assets/apk/telegram-latest.apk" "Telegram"

  copy_workspace_template "projects/openclaw-phone/templates/workspace"

  set_screen_timeout 300000

  optimize_battery_for "com.openclaw.app"   # TODO: replace with actual package name
  optimize_battery_for "com.termux"
  optimize_battery_for "org.telegram.messenger"

  log INFO "Provisioning script complete (manual QA still required)."
}

main "$@"
