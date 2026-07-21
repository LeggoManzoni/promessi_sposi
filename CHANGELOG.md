# Changelog

## v1.0.0 — unreleased

First public release: the curated facsimile-aligned TEI edition of
*I promessi sposi* (Quarantana, 1840) — critical reading text (Poggi Salani
2013) aligned line by line to the FICLIT digitized copy, with 742 page
surfaces, 20,579 manually reviewed line zones, 438 linked illustrations,
and the 505-item illustration catalogue.

### Editorial corrections (2026-07-17)

The reading text was collated three ways against the Poggi Salani critical
edition and the Quarantana 1840 print (FICLIT facsimile). Changes applied to
the initial encoding:

- **Reading errors** corrected wherever both witnesses agree against the
  earlier transcription (word-, form-, and spelling-level), verified case by
  case against the facsimile and Poggi Salani.
- **Apostrophes** normalized to the straight glyph `'`; **dialogue dashes**
  normalized to the em dash `—`.
- **Token insertions** — 14 tokens added (dropped words restored, and two
  run-together tokens split), each carrying a `…b`-suffixed `xml:id` so no
  existing identifier is reused.
- **Token removals** — 22 tokens removed, per the stable-identifier policy:
  three inserted "don" before "Rodrigo" (cap18), a "come ha fatto a
  quest'altro" dittography (cap24), an interpolated "ho imparato a guardar
  con chi parlo:" clause absent from the print and Poggi Salani (cap38), and
  further single-word reading fixes.
- **Net**: −8 `<w>` tokens (215,968 → 215,960; unique `xml:id` 239,343 →
  239,335).

The combined `dist/promessi-sposi-quarantana.xml` and
`docs/validation-report.md` were rebuilt from the corrected files. The
classified divergences between the Quarantana and Poggi Salani are recorded
in `docs/quarantana-poggisalani-collation.md`.

### Born-digital collation pass (2026-07-20)

The reading text was collated a second time, token by token, against the
born-digital *Edizione Nazionale* PDF (an exact text layer rather than OCR),
with every candidate verified three-way against the Quarantana 1840 print.

- **Five single-token readings** corrected where the print and Poggi Salani
  agree against the earlier transcription: `cap1` `don`→`Don` (Gomez
  Suarez), `cap10` `ancor`→`ancora`, `cap12` `tornare`→`tornar`, `cap29`
  `cercare`→`cercar`, `cap33` `lui`→`colui`. Substitutions only — token and
  `xml:id` counts are unchanged.
- **Twenty-four further divergences** were confirmed as Poggi Salani
  editorial interventions where our TEI follows the 1840 print; these are
  recorded, not changed, in `docs/quarantana-poggisalani-collation.md`.
- **Two typographic slips in the born-digital PS text itself** (`ormal` for
  `ormai`, `toccase` for `toccasse`) were identified; our reading is the
  correct one in both.

`dist/promessi-sposi-quarantana.xml` and `docs/validation-report.md` were
rebuilt from the corrected files.

### Adoption of the documentary text (2026-07-20)

The edition presents the 1840 Quarantana exemplar reproduced in the FICLIT
digital library — *il documento* — rather than a critical reading text. The
critical edition of Teresa Poggi Salani is retained as a collating witness.

- **36 substantive readings reverted** to the print: 21 regularizations of
  19th-century forms undone (apocope, `susurrare`, `contradette`, and the
  archaic forms inside quoted *gride*), and 15 substantive variants resolved
  in favour of the print, including eight words supplied by the critical
  edition removed and two words of the print restored.
- **12 corrections retained**, where the print is manifestly defective and
  sense and the critical edition agree against it (`apparcecchiare` →
  `apparecchiare`, `l'altri voci` → `l'altre voci`, and others).
- **1,274 accents restored** to the grave of the print (`perché` → `perchè`),
  each form required to be attested with a grave in the verified
  transcription. Three tokens deliberately keep the acute.
- Capitalization, punctuation and quote-order are **not** converted; the
  transcription is not a reliable witness for them and they remain open.
- **Net**: −6 `<w>` tokens (215,960 → 215,954; unique `xml:id` 239,335 →
  239,329).

- **54 capitalizations restored** to the print, from a token-by-token
  comparison against the verified ALTO transcription. These also corrected
  defects in the earlier encoding — lowercase proper names (`abbondio`,
  `perpetua`, `lucia`, `ambrogio`, `torino`) and lowercase sentence
  openings, mostly in cap30–32 — besides the print's own conventions
  (lowercase honorifics inside the quoted *gride*, `Provvidenza`, footnote
  style). Residual cases were checked against the facsimile images.
- **653 accent cases adjudicated against the facsimile images.** Where the
  accented vowel is the **final letter** (`sentì`→`senti`, `lì`→`li`,
  `uscì`→`usci`), the Quarantana omits the grave; the accent was removed in
  **140** such tokens, each form confirmed bare on the page. Accents on an
  **interior** vowel (the *-ìo* nouns `ronzìo`/`mormorìo`, and `princìpi`,
  `vòto`, `balìa`, `malìe`, …, 68 cases) could **not** be read reliably even at
  high magnification — some clearly keep the accent, some are semantic
  (`vòto`≠`voto`) — so they are **left as encoded and flagged for dedicated
  review**, not changed. Capital `È` always keeps its accent. See
  `docs/editorial-decisions-quarantana.md`.
- **39 chapter headings corrected** to the form of the print:
  `INTRODUZIONE.`, `CAPITOLO PRIMO.` for the first chapter — which the
  Quarantana alone spells out — and `CAPITOLO II.` … `CAPITOLO XXXVIII.`,
  each closed by a full stop.

Every decision is listed, with `xml:id`, in
`docs/editorial-decisions-quarantana.md`.

## Stable-identifier policy

`xml:id` values (surfaces `surf_…`, zones `z_…`, tokens, figures) and CSV
`item_id` values are stable: an identifier is never reassigned to a
different entity in a later version. When a zone or record is corrected but
still represents the same conceptual object (e.g. an adjusted bounding
box), it keeps its identifier. Deletions, splits, merges, and replacements
will be recorded in this file, per version.
