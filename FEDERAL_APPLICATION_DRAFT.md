# Federal Trademark Application Draft (USPTO, filed pro se)

> Fill the `[BRACKETED]` fields. This is a preparation worksheet, NOT a submission.
> You file it yourself at the USPTO Trademark Center (uspto.gov). General info, not legal advice.

## 1. Mark
- Mark name: `[YOUR_SOFTWARE_NAME]`
- Mark type: [ ] Standard character (plain text)   [ ] Special form (logo / stylized)
- Description of mark (required only for logos): `[describe appearance]`

## 2. Owner
- Owner name: `[YOUR_NAME_OR_COMPANY]`
- Entity type: [ ] Individual   [ ] LLC   [ ] Corporation   [ ] Other
- Address: `[street, city, state, ZIP, country]`
- Email: `[you@example.com]`  (USPTO sends all legal notices here — keep it current)

## 3. Filing basis
- [ ] **1(a) Use in commerce** — already selling/using the mark. Provide dates + specimen below.
- [ ] **1(b) Intent-to-use** — not yet using. Locks your filing date; file a Statement of Use later.

## 4. Dates (required for 1(a))
- First use anywhere: `[YYYY-MM-DD]`
- First use in commerce: `[YYYY-MM-DD]`

## 5. Goods & class
Most software files in two classes:
- **Class 9** — downloadable software / mobile apps
- **Class 42** — SaaS / software-as-a-service / cloud services

Example identifications:
- Class 9: "Downloadable computer software for `[purpose]`."

- Class 42: "Software-as-a-service (SaaS) featuring `[purpose]`."

## 6. Specimen (required for 1(a))
A real example showing the mark used as a *brand* (source identifier), e.g. a
screenshot of your website / app-store page / README where the name appears as a
product name (not just a filename or code comment). Save it in this repo as a
PNG/PDF and reference it in `TRADEMARK_EVIDENCE_LOG.md`.

## 7. Fee (2026 electronic — verify at uspto.gov/trademark-fee-information)
- Base application: **$350 per class** (+ possible $100–$200 surcharges for
  incomplete info / free-form description).
- Example: 2 classes (9 + 42) = **$700** base.
- Non-refundable even if refused — so run the free clearance search first.

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
### Next step
Send me: **(1)** the exact mark name, **(2)** first-use date (or "intent-to-use"),
and **(3)** a specimen URL/file. I'll pre-fill this worksheet + the evidence log,
commit, and push — leaving only the USPTO submit-and-pay step to you.
