# Free Trademark Method for Software (™, $0)

> General info, not legal advice. For serious commercial launches, a one-time
> attorney consult is cheap insurance.

## Principle
You get trademark rights by **using** a mark in commerce, not by registering.
Registration (®) is a *bonus* that costs government fees. This method locks in
free rights and protects them — no lawyer, no paid tools.

---

## Step 1 — Choose a free-protectable name (Day 0, $0)
Pick a **fanciful / arbitrary / suggestive** name. Avoid generic or descriptive
names — those are weak even when paid for.
- Strong free marks: made-up words, unrelated real words (e.g. "Kodak", "Apple").
- Weak: "Best Video Editor", "Quick Notes".

## Step 2 — Free clearance search (30 min, $0)
Do this yourself, no paid service:
1. **USPTO TESS** (uspto.gov/trademarks/search) — search your name + synonyms.
2. **Google** the name in quotes: `"YourName" software`.
3. Check **GitHub, npm, app stores, domain registrars, social handles** for collisions.
4. If clear → proceed. If a live conflict exists → rename now (free to do, expensive later).

## Step 3 — Start using the mark + log "first use" (ongoing, $0)
Common-law rights start the moment you use it. **Proof of first use is everything.**
Keep a `TRADEMARK_EVIDENCE_LOG.md` (template included) with dated specimens:
screenshots of your site/README/UI showing ™, first sale receipt, repo description.

## Step 4 — Use ™ correctly (always, $0)
- Put **™** after the name in UI, site, README, marketing.
- Never use **®** (requires paid federal registration).
- Consistent use = stronger free rights.

## Step 5 — Free monitoring (5 min/month, $0)
- **Full-independence option (no accounts):** quarterly, re-run the Step 2 searches by hand.
- **Convenience option:** set a **free Google Alert** for `"YourSoftwareName"` (needs a Google account; skip it if you want zero external dependencies).
- Either approach replaces paid brand-monitoring services.

## Step 6 — Free enforcement: Cease & Desist (when needed, $0)
If someone copies your name in your market, send the self-written letter in
`CEASE_AND_DESIST_TEMPLATE.md` (no attorney needed). Keep a copy + proof of sending.

## Step 7 — Free maintenance (calendar, $0)
No registration = no government renewal fees. Just:
- Keep using the mark (non-use can void common-law rights too).
- Keep the evidence folder updated annually.
- Set one yearly calendar reminder: "Confirm ™ still in use + re-run search."

---

## Optional: Cheap Federal Registration (DIY, no lawyer)
If you later want **®** + nationwide reach, self-file to avoid attorney fees:
- Self-file at **USPTO.gov** (Trademark Center) as *pro se* (no lawyer).
- Basis: **1(a)** if already selling, **1(b)** intent-to-use if not.
- File your saved Step 3 specimen as proof.
- Run `trademark-deadlines.ps1` (included) to compute and watch every deadline for free — no paid docketing service.

### USPTO fees at a glance (2026, electronic filing — verify at uspto.gov/trademark-fee-information)
| Item | When | Fee / class |
|------|------|-------------|
| Base application | filing | **$350** (+ possible $100–$200 surcharges for incomplete info / free-form descriptions) |
| Section 8 declaration | years 5–6 | $325 |
| Section 9 renewal | years 9–10, then every 10 yrs | $325 |
| Combined Section 8 + 9 | years 9–10, then every 10 yrs | $650 |
| Section 15 (optional incontestability) | years 5–6 | $250 |
| Grace-period surcharge | +6 months late | +$100 |

> Filing fees are **non-refundable** even if refused. Do the free clearance search
> (Step 2) first. Fees change — always confirm the current schedule before paying.

> The ONLY step that costs money is federal filing — the government fee can't be
> waived. Everything above it is $0.

---

## Free-Method Checklist
- [ ] Picked a strong, non-generic name
- [ ] Ran free TESS + web + repo/app-store search
- [ ] Started using name with ™ everywhere
- [ ] Created `TRADEMARK_EVIDENCE_LOG.md` + saved specimens
- [ ] Set Google Alert for the name
- [ ] Filled in `CEASE_AND_DESIST_TEMPLATE.md` as a reusable draft
- [ ] Yearly calendar reminder to confirm use + re-search
- [ ] (Optional) Self-filed federal app, paid only USPTO fee

## Companion files
- `TRADEMARK_EVIDENCE_LOG.md` — blank log to record first use + specimens.
- `CEASE_AND_DESIST_TEMPLATE.md` — fill-in-the-blank C&D letter.
- `trademark-deadlines.ps1` — free, dependency-free PowerShell script that computes
  federal Section 8 / 9 / 15 deadlines and warns you before they're due.
- `README.md` — how the kit fits together and how to stay 100% independent.
