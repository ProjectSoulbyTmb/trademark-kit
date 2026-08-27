# Trademark Kit — Self-Contained, $0

A complete, **free**, dependency-free method to trademark your software brand.
No lawyer, no paid tools, no mandatory external accounts.

## Contents
| File | Purpose |
|------|---------|
| `TRADEMARK_FREE.md` | The method: 7 free steps + optional cheap federal filing. |
| `TRADEMARK_EVIDENCE_LOG.md` | Your free "registration": log first use + keep specimens. |
| `CEASE_AND_DESIST_TEMPLATE.md` | Enforce your mark yourself, for free. |
| `trademark-deadlines.ps1` | Free offline tracker for federal Section 8 / 9 / 15 deadlines. |
| `README.md` | This file. |

## Independence guarantees (nothing paid, no lock-in)
- **Common-law ™ rights** cost $0 — they arise from use + a saved log.
- **Clearance search** uses only free public tools (USPTO TESS, web, code repos).
- **Monitoring** can be done by hand (quarterly). Google Alert is optional, not required.
- **Enforcement** is a self-written cease & desist letter.
- **If you later register federally**, the included PowerShell script tracks every
  deadline **offline** — no paid docketing service needed.

## Start now (common-law, $0)
1. Pick a strong, non-generic name. Run the free search (Step 2 of `TRADEMARK_FREE.md`).
2. Publish your software using the name with **™**. Fill in `TRADEMARK_EVIDENCE_LOG.md`
   and save the referenced specimen files (screenshots, receipt, repo description).
3. Set one yearly calendar reminder: "Confirm ™ still in use + re-run search."

## Optional federal registration later
Self-file at USPTO.gov (Trademark Center) as *pro se* (no lawyer). The only
unavoidable cost is the government filing fee (2026: $350/class base). Then track
deadlines with the script:

```powershell
pwsh ./trademark-deadlines.ps1 -RegistrationDate 2026-03-15 -Classes 1
# Windows PowerShell alternative:
powershell -ExecutionPolicy Bypass -File ./trademark-deadlines.ps1 -RegistrationDate 2026-03-15 -Classes 1
```

Run it any time; it flags anything due within 90 days (change with `-WarnDays`).

> ⚠️ General information, not legal advice. For serious commercial launches, a
> one-time attorney consult is cheap insurance.
