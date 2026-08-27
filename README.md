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
| `capture-specimen.ps1` | Auto-captures a dated VOLTAGE THOTH specimen (gh api / local / URL) and logs it. |
| `README.md` | This file. |

## Independence guarantees (nothing paid, no lock-in)
- **Common-law ™ rights** cost $0 — they arise from use + a saved log.
- **Clearance search** uses only free public tools (USPTO TESS, web, code repos).
- **Monitoring** can be done by hand (quarterly). Google Alert is optional, not required.
- **Enforcement** is a self-written cease & desist letter.
- **If you later register federally**, the included PowerShell script tracks every
  deadline **offline** — no paid docketing service needed.

## Start now (common-law, $0)
1. Pick a strong, non-generic name (this kit is pre-filled for **VOLTAGE THOTH** — see `MARK_VARIANTS.md`). Run the free search (Step 2 of `TRADEMARK_FREE.md`).
2. Publish your software using the name with **™**. Fill in `TRADEMARK_EVIDENCE_LOG.md`
   and save the referenced specimen files (screenshots, receipt, repo description).
3. Set one yearly calendar reminder: "Confirm ™ still in use + re-run search."

## Auto-save specimens (VOLTAGE THOTH)
Run the capture script whenever you publish VOLTAGE THOTH somewhere new; it saves a dated
copy and logs it automatically:

```powershell
pwsh ./capture-specimen.ps1 -Commit
# or capture a specific public page/file:
pwsh ./capture-specimen.ps1 -Source https://example.com/voltage-thoth -Commit
```

The script resolves the mark-in-use via authenticated `gh api` (works for private
repos), a local file, or any URL, and appends a row to `TRADEMARK_EVIDENCE_LOG.md`
(idempotent — re-running the same source won't duplicate the row).

### Set-and-forget auto-capture
`auto-capture.ps1` watches a list of targets (the public `voltage-thoth` page and
your local `D:\THOTH` docs), runs `capture-specimen.ps1` for each, then makes **one**
commit (+ push with `-Push`). Schedule it weekly so any new VOLTAGE THOTH publication
is captured automatically:

```powershell
pwsh ./auto-capture.ps1 -Push
```

Edit the `$targets` list in `auto-capture.ps1` to add any new URL/file where you
publish VOLTAGE THOTH. The Task Scheduler snippet at the bottom of that script
registers it to run automatically.

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
