# Device QA Log
Use this template for every unit. Record times in local time zone. Attach supporting evidence (photos, screenshots) in tracker but reference filenames below.

## Template
| Date | Prep Type (New/Return) | Device Serial | Start Time | End Time | Total Minutes | Prep Tech | QA Checkpoint Notes (A/B/C/D) | Issues & Mitigation | Packaging/Tracker Ref |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

> **Instructions:**
> 1. Log immediately after completing each checkpoint.
> 2. Total minutes = end - start (rounded). Goal ≤60.
> 3. If an issue occurs, create `Issue-YYYYMMDD-<serial>` file in tracker and summarize in the log.

---

## Sample Entries
| Date | Prep Type | Device Serial | Start Time | End Time | Total Minutes | Prep Tech | QA Checkpoint Notes | Issues & Mitigation | Packaging/Tracker Ref |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-02-23 | New | XT2513V-0921 | 10:05 | 11:02 | 57 | Alex R. | A: Wi-Fi OK, OTA skipped (no updates). B: Template checksum `ok`. C: `openclaw status` green, Telegram ping cleared. D: Packaging photo `IMG_4021`. | None. | Tracker row #145, label `SHIP-NE-145`. |
| 2026-02-23 | Return | XT2513V-0778 | 11:20 | 12:22 | 62 | Alex R. | A: Wipe completed, battery 96%. B: Template hash fail once, passed after recopy. C: Messaging handshake screenshot `QA0778.png`. D: Added return insert. | Template hash mismatch resolved by refreshing SD image. | Tracker row #146, label `SHIP-RT-146`. |
| 2026-02-24 | New | XT2513V-0985 | 09:00 | 09:55 | 55 | Casey L. | A: OTA applied (7 min). B: Workspace copy automated script log `prep-0985.log`. C: Audio test recorded `voice-0985.m4a`. D: Final pack photo `IMG_4055`. | None. | Tracker row #147, label `SHIP-NE-147`. |
| 2026-02-24 | Return | XT2513V-0644 | 13:10 | 14:05 | 55 | Casey L. | A: Recovery wipe verified double-boot. B: Golden image flash log `flash-0644.txt`. C: Telegram test via bot `@OC_Test`. D: Battery health 92%, noted in insert. | Noted minor bezel scuff (Grade B); documented photos `SCUFF0644-1/2`. | Tracker row #148, label `SHIP-RT-148`. |
| 2026-02-24 | New | XT2513V-1032 | 14:20 | 15:18 | 58 | Casey L. | A: Wi-Fi drop once; reconnected. B: Template `ok`. C: `openclaw status` + Termux shortcut working. D: Added spare charger note. | Wi-Fi hiccup mitigated by switching to 5 GHz SSID. | Tracker row #149, label `SHIP-NE-149`. |
