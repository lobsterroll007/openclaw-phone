# Role Brief – Automation Engineer / Scripter

## Mission
Automate the phone provisioning and tracking workflow to remove as many manual steps as possible, targeting <40 manual minutes per unit by end of sprint.

## Inputs Provided
- Existing prep checklist + SOP from Device Prep.
- Workspace template contents (to be mirrored onto devices).
- Need for lightweight inventory/tracking system.

## Key Deliverables
1. **Provisioning Script**
   - Automates installs (OpenClaw APK, Termux, Telegram/Signal, workspace files).
   - Generates log output (timestamps, success/failure) stored centrally.
2. **Reset/Refurb Script**
   - Streamlined process for wiping returns and reapplying the golden image.
3. **Inventory & Prep Tracker**
   - Sheet/AppScript or lightweight app capturing device ID, status, timestamps.
   - Auto-populated from provisioning logs when possible.
4. **Documentation**
   - Setup instructions, dependencies, troubleshooting guide.

## Success Metrics
- Manual touches removed (baseline vs. automated steps).
- Prep time reduction curve (goal: <40 minutes manual effort).
- Data completeness: 100% of devices logged with status + timestamps.

## Collaboration
- Pair with Device Prep for real-world testing.
- Share scripts with Support Lead to aid troubleshooting.
- Work with Ops Analyst to feed tracker data into metrics dashboard.

## Reporting Cadence
- Progress note after each major automation milestone.
- Weekly demo or screencap showing current tooling state.
