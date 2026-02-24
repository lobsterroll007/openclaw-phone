# Inventory Ledger

All active hardware purchases are tracked below. Update both this file and `inventory.csv` together so the docs site and raw data stay in sync.

| Device Label | IMEI | SKU | Source | Purchase Date | Unit Cost | Tax Alloc | Total Cost | Status | Receipt |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| XT2513V-01 | `356717852098770` | STMtxt2513VC64PWP | Walmart #2681 (Boise, ID) | 2026-02-24 | $29.88 | $3.00 | **$32.88** | Intake (unprepped) | [Receipt](../assets/receipts/2026-02-24-walmart-receipt.jpg) |
| XT2513V-02 | `356717852085710` | STMtxt2513VC64PWP | Walmart #2681 (Boise, ID) | 2026-02-24 | $29.88 | $3.00 | **$32.88** | Intake (unprepped) | [Receipt](../assets/receipts/2026-02-24-walmart-receipt.jpg) |

## How to Log New Devices
1. Drop any receipt / box photos into `assets/receipts/` (YYYY-MM-DD-label format).
2. Add a row to `ops/inventory.csv` with cost + tax allocations.
3. Mirror the entry in the table above (or run a script later to auto-generate).
4. Once prep begins, link to the QA log entry and update status to `In Prep` → `Ready to Ship` → `Assigned`.

## Status Codes
- **Intake (unprepped):** Device logged but untouched.
- **In Prep:** Checklist underway; QA log entry pending.
- **Ready to Ship:** QA complete and sitting in inventory.
- **Assigned:** Tied to a customer order.
- **Returned / Reset:** Came back from customer; follow the return SOP and update costs if needed.
