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

## Stable-identifier policy

`xml:id` values (surfaces `surf_…`, zones `z_…`, tokens, figures) and CSV
`item_id` values are stable: an identifier is never reassigned to a
different entity in a later version. When a zone or record is corrected but
still represents the same conceptual object (e.g. an adjusted bounding
box), it keeps its identifier. Deletions, splits, merges, and replacements
will be recorded in this file, per version.
