# OpenClaw Phone – Financial Model (2026-02-23)

## 1. Core Inputs
| Input | Value | Notes |
| --- | --- | --- |
| Base bundle price | **$130** | Device + OpenClaw pre-config |
| Concierge add-on | **+$50** | Live setup; optional |
| Device cost (COGS) | **$32** | Motorola XT2513v |
| Labor target | **≤ 60 min** prep, **≤ 60 min** reset | Drives automation goals |
| Labor rate (model input) | **$30/hr** _(use $20–$40 for sensitivity)_ | Opportunity cost or contractor rate |
| Restocking fee | **$30** | Charged on accepted returns |
| Return refurb labor | **60 min** | Goal: equal to outbound prep |
| Payment fees | 0% | Cash-like methods for now |

> **Per-touch labor cost (60 min @ $30/hr) = $30.** Adjust minutes or hourly rate as the process improves.

## 2. Per-Unit Contribution (No Returns)
### 2.1 Base Bundle Only
- Revenue: $130
- Device COGS: $32 → **Gross Margin (pre-labor): $98 (75.4%)**
- Labor: $30 → **Net contribution: $68 (52.3%)**

### 2.2 Base + Concierge Add-on
- Revenue: $180
- Device COGS: $32 → **Gross Margin (pre-labor): $148 (82.2%)**
- Labor: $30 prep + $30 concierge call (assume 60 min total) = $60
- **Net contribution: $88 (48.9%)**

### 2.3 Labor Sensitivity (60 min target)
| Hourly Rate | Labor / Base | Net Margin (Base) | Labor / Concierge | Net Margin (Concierge) |
| --- | --- | --- | --- | --- |
| $20/hr | $20 | $78 (60.0%) | $40 | $108 (60.0%) |
| $30/hr _(default)_ | $30 | $68 (52.3%) | $60 | $88 (48.9%) |
| $40/hr | $40 | $58 (44.6%) | $80 | $68 (37.8%) |

## 3. Return Rate Scenarios (Restock Fee = $30)
Each return consumes an additional 60 min reset ($30 labor). The $30 restock fee offsets that cost **if collected**. If waived/contested, the full $30 labor hit remains. Tables below show expected net contribution per unit sold under different return-rate assumptions.

### 3.1 Base Bundle
| Return Rate | Net Margin w/ Fee Collected | Net Margin w/o Fee (for comparison) |
| --- | --- | --- |
| 0% | $68 | $68 |
| 5% | $68 | $66.5 |
| 10% | $68 | $65 |

### 3.2 Base + Concierge Add-on
| Return Rate | Net Margin w/ Fee Collected | Net Margin w/o Fee (for comparison) |
| --- | --- | --- |
| 0% | $88 | $88 |
| 5% | $88 | $86.5 |
| 10% | $88 | $85 |

> With the $30 fee in place and labor held to 60 min, each return is effectively labor-neutral. The drag only reappears if the fee is discounted/refunded, labor exceeds 60 min, or devices require parts replacement. Track real-world minutes to validate this assumption.

## 4. Cash & Capacity Implications
- **Prep time goal:** Hitting ≤60 min doubles throughput vs the previous 2-hour process (2 phones per tech-hour instead of 1).
- **Return loops:** Even if net cost is neutral, returns tie up inventory for ~1 extra week. Maintain a 10% buffer inventory to keep outbound flow steady.
- **Concierge attach rate:** Every +10 pts of attach rate adds ~$2 per blended unit to margin (assuming 60 min session). Upsell focus is high leverage.

## 5. Next Modeling Enhancements
1. Plug in actual timed runs once Device Prep Specialist logs data (prep + reset).
2. Layer in payment processor fees once Stripe/Shopify go live (~2.9% + $0.30).
3. Add marketing CAC + churn/return cohort view to forecast cash break-even volume.
4. Build a simple Google Sheet with input cells (device cost, labor mins, return rate, attach rate) for fast scenario testing.
