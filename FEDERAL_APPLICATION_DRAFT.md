# Federal Trademark Application Draft (USPTO, filed pro se) — THOTH

> Fill the `[BRACKETED]` fields. This is a preparation worksheet, NOT a submission.
> You file it yourself at the USPTO Trademark Center (uspto.gov). General info, not legal advice.

> ⚠️ **READ `CLEARANCE_SEARCH_FINDINGS.md` FIRST.** "THOTH" collides with several
> existing software projects — including a **registered** THOTH TECH LLC mark
> (Class 9 educational software) and a live "Thoth" local-first AI assistant.
> A plain-word "THOTH" application in Class 9/42 risks a likelihood-of-confusion
> office action and is NOT recommended without the steps below. Filing fees are
> **non-refundable**.

## 0. Before you file (strongly recommended)
- [ ] Consider a **more distinctive mark** (coined name, or THOTH + unique stylized logo/trade dress), OR
- [ ] Get a quick **IP-attorney consult**, OR
- [ ] If filing anyway, prepare to argue dissimilarity of goods / acquired distinctiveness.

## 1. Mark
- Mark name: `THOTH`
- Mark type: [ ] Standard character (plain text)   [x] Special form (logo / stylized) — *recommended to reduce conflict*
- Description of mark (required only for logos): `[describe your THOTH logo/stylization]`

## 2. Owner
- Owner name: `[LEGAL OWNER — your name or the entity behind ProjectSoulbyTmb]`
- Entity type: [ ] Individual   [ ] LLC   [ ] Corporation   [ ] Other
- Address: `[street, city, state, ZIP, country]`
- Email: `[you@example.com]`  (USPTO sends all legal notices here — keep it current)

## 3. Filing basis
- [x] **1(a) Use in commerce** — first use asserted 2026-08-27. Provide dates + specimen below.
- [ ] **1(b) Intent-to-use** — not yet using.

## 4. Dates (required for 1(a))
- First use anywhere: `2026-08-27`
- First use in commerce: `2026-08-27`
> Verify these against the note in `TRADEMARK_EVIDENCE_LOG.md`.

## 5. Goods & class
Recommended classes for THOTH (software):
- **Class 9** — downloadable software / autonomous-kernel software
- **Class 42** — SaaS / software-as-a-service / cloud services (if applicable)

Example identifications:
- Class 9: "Downloadable computer software for operating-system kernel and operator automation."
- Class 42: "Software-as-a-service (SaaS) featuring autonomous operator and automation services."

## 6. Specimen (required for 1(a))
A real example showing the mark used as a *brand* (source identifier): a screenshot
of the olympos README / THOTH docs page where "THOTH" appears as a product name.
Save it as `screenshot_20260827.png` (see `TRADEMARK_EVIDENCE_LOG.md`) and upload it
at filing. Repo URL: https://github.com/ProjectSoulbyTmb/olympos

## 7. Fee (2026 electronic — verify at uspto.gov/trademark-fee-information)
- Base application: **$350 per class** (+ possible $100–$200 surcharges for
  incomplete info / free-form description).
- Example: 2 classes (9 + 42) = **$700** base. **Non-refundable** — see the §2(d) risk in `CLEARANCE_SEARCH_FINDINGS.md` first.

## 8. How to file (pro se, no lawyer)
1. Create a USPTO.gov account (Trademark Center).
2. Start an application → choose the base application → enter the fields above.
3. Upload specimen(s) and pay the fee.
4. Save your **serial number**. After approval + publication you receive a
   **registration date** — then run:
   `pwsh ./trademark-deadlines.ps1 -RegistrationDate <issued> -Classes <n>`

## 9. Declaration (you certify)
"I believe the applicant is the owner of the mark; to the best of my knowledge
the mark is in use in commerce and not merely descriptive; and all statements
made herein are true."

---
### Status
Common-law ™ record is established in `TRADEMARK_EVIDENCE_LOG.md` (free, valid).
Federal filing is **prepared but gated** on resolving the clearance conflict above.
