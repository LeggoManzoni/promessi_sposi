# I Promessi Sposi (Quarantana, 1840): a facsimile-aligned TEI edition

A TEI encoding of Alessandro Manzoni's *I promessi sposi* whose reading text
is aligned, line by line, to a digital facsimile of the *Quarantana* (the
illustrated 1840 Milan edition Manzoni himself supervised). The reading text
is Teresa Poggi Salani's critical edition (2013); the facsimile layer
reproduces a physical copy of the Quarantana owned by Paola Italia,
digitized by FICLIT/AdLab and
served over IIIF by the FICLIT Digital Library (Università di
Bologna). Every line of
the text is linked to the pixel region of the printed page it corresponds
to, and every illustration is linked to its zone on the page, so the edition
can be read as text, viewed as page images, or rendered as a synchronized
text-and-facsimile interface.

## What's in here

```
quarantana/
  header.xml           TEI header: title, encoders, licence, sources
  intro.xml            introductory matter (bare <div> fragment)
  cap1.xml … cap38.xml  the 38 chapters (bare <div> fragments)
  facsimile.xml         the facsimile layer: <surface> (pages) + <zone> (lines, illustrations, marginalia)
  listPerson.xml        person-name authority list
dist/
  promessi-sposi-quarantana.xml   the assembled single-file edition (generated derivative)
illustrations_metadata.csv   full illustration catalog (505 items) with IIIF region URLs
schema/                  TEI ODD and Schematron project rules
docs/
  encoding-guidelines.md      markup reference
  validation-report.md        dated integrity-check results for this release
  illustrations-metadata.md   data dictionary for the CSV
RIGHTS.md                component-level rights statement
CONTRIBUTORS.md          contributor roles
CHANGELOG.md             release history and stable-identifier policy
```

`intro.xml` and `cap1.xml`…`cap38.xml` are bare `<div>` fragments — they carry
no `xmlns` of their own and are not standalone TEI documents. They are meant
to be assembled into (or validated against) a wrapping `<TEI>` document.
`header.xml`, `facsimile.xml`, and `listPerson.xml`, by contrast, are complete
TEI documents in the TEI namespace (`http://www.tei-c.org/ns/1.0`).

## Quick start

**If you just want one TEI file**, use
`dist/promessi-sposi-quarantana.xml`: the whole edition — header, person
list (in `<standOff>`), facsimile layer, introduction, and 38 chapters — as
a single valid TEI document. It is generated from the modular files, which
remain the editorial source; in the assembled file every `@facs` pointer is
rewritten from `facsimile.xml#id` to the document-internal form `#id`.

**If you work with the modular files**, assemble them the same way: a
`<TEI>` root in the TEI namespace containing the `<teiHeader>` from
`header.xml`, the `<listPerson>` from `listPerson.xml` (e.g. in
`<standOff>`), the `<facsimile>` from `facsimile.xml`, and a
`<text>` with `<front>` holding the `intro.xml` div and `<body>` holding
`cap1.xml`…`cap38.xml` in order (the bare fragments must be moved into the
TEI namespace).

**If you want the image of a line or illustration**, combine a zone's
coordinates with its surface's IIIF service — see **Coordinates & IIIF**
below; for illustrations, `illustrations_metadata.csv` has ready-made
`iiif_region_url` values.

## The two layers

The edition has two linked layers:

- **Text layer** (`intro.xml`, `cap1..38.xml`): the critical reading text,
  encoded as chapters (`<div type="capitolo">`), paragraphs, and word tokens,
  with line breaks (`<lb>`), page breaks (`<pb>`), illustrations (`<figure>`),
  footnotes (`<note>`), and an editorial clause-numbering grid
  (`<milestone unit="comma">`, numbered per chapter).
- **Facsimile layer** (`facsimile.xml`): one `<surface>` per scanned page,
  each containing `<zone>` elements for every physical line and every
  illustration on that page, plus a `<graphic>` pointing at the IIIF image
  service for the page.

The two layers are linked by `@facs`: text elements (`<lb>`, `<pb>`,
`<figure>`, and chapter-opening `<head>`) carry a
`@facs="facsimile.xml#<zone-or-surface-id>"` attribute pointing into the
facsimile layer. A `<surface>` corresponds to one printed
page; a `<zone>` corresponds to one physical line of print or one
illustration on that page.

## Textual relationship: not a diplomatic transcription

The reading text is a **critical edition** (Teresa Poggi Salani, 2013) —
not a diplomatic transcription of the print. The facsimile reproduces a
**physical copy** of the Quarantana (Paola Italia's volume, digitized and
served in digital form by FICLIT). Text and facsimile therefore belong to
the same
edition-level tradition but are *aligned* rather than transcribed from one
another: the facsimile layer connects the critical text to the printed page
line by line, so a reader or downstream tool can see which physical line
underlies any given stretch of text, while a few printed glyphs will not
match the encoded text character-for-character — the critical edition's
corrections and normalizations.

## Alignment provenance & verification

Initial line regions were generated automatically (layout analysis of the
page images) and aligned with the encoded text. The resulting alignment was
then manually reviewed page by page in the eScriptorium interface: empty or
spurious regions were removed, and incorrect line boundaries — particularly
truncated or overextended line endings — were corrected. The released
coordinates therefore represent a curated, manually verified line-level
alignment.

Four distinct quality claims, kept separate:

| Claim | Status |
|---|---|
| **Coverage** — every encoded textual line has a facsimile target | Complete within the encoded scope (introduction + 38 chapters) |
| **Link correctness** — the target is the corresponding printed line | Manually reviewed page by page in eScriptorium |
| **Geometry** — the box encloses the relevant line | Corrected where necessary; functional regions, not pixel-perfect contours |
| **Textual identity** — encoded characters reproduce the print exactly | Not claimed: the text is a critical reading text, not a transcription |

## Coordinates & IIIF

All zone and surface coordinates (`@ulx`, `@uly`, `@lrx`, `@lry`) are in page
pixels, in the coordinate space of the full-page image referenced by that
surface's `<graphic>`. Bounding boxes should be understood as functional
regions for navigation and extraction rather than exact typographic
contours (see **Alignment provenance & verification** above).

To fetch the image of a single line or illustration, combine a zone's
bounding box with its surface's IIIF image service base. For example,
`facsimile.xml` contains:

```xml
<surface xml:id="surf_0011" n="5" corresp="https://dlrc.ficlit.unibo.it/iiif/2/232045/canvas/p11">
  <graphic url="https://dlrc.ficlit.unibo.it/iiif/2/232056/full/full/0/default.jpg" width="1783px" height="2392px"/>
  <zone xml:id="z_0011_l01" type="line" n="1" ulx="590" uly="996" lrx="860" lry="1053" .../>
  ...
</surface>
```

The IIIF service base is the `<graphic>` URL with its trailing
`/full/full/0/default.jpg` request stripped:
`https://dlrc.ficlit.unibo.it/iiif/2/232056`. A IIIF Image API region
request is `{x},{y},{w},{h}` in page pixels, where `x=ulx`, `y=uly`,
`w=lrx-ulx`, `h=lry-uly`. For the zone above (`590,996,860,1053`):
`w = 860 - 590 = 270`, `h = 1053 - 996 = 57`, giving:

```
https://dlrc.ficlit.unibo.it/iiif/2/232056/590,996,270,57/full/0/default.jpg
```

`illustrations_metadata.csv` already carries a precomputed `iiif_region_url`
column built the same way for every illustration.

## Schema

The files conform to the TEI customization in `schema/promessi-sposi.odd`
(TEI P5 with the conventions described in `docs/encoding-guidelines.md`) and
its Schematron rules in `schema/promessi-sposi.sch`. Conformance and
referential integrity were verified for this release; the dated results are
recorded in `docs/validation-report.md`.

## Coverage & limitations

- 742 digitized pages, 20,579 aligned lines. Linkage coverage is complete
  within the encoded scope (introduction + 38 chapters): every line zone has
  exactly one text-layer link — 20,540 via `<lb>`, 39 via chapter-opening
  `<head>`. Coverage is a claim about linkage, not geometry: boxes are
  functional regions, not pixel-perfect outlines.
- 505 illustrations located in the digitized volume; the 438 within the
  encoded chapters are linked to `<figure>` elements (the rest — front matter
  and *Storia della colonna infame* — are outside the encoded scope).
- Word tokens (`<w>`) carry no `@facs` of their own: a token's physical line
  is given by the nearest preceding `<lb>` (or the chapter-opening `<head>`).
  Exactly one editorial `<lb>` (a dialogue break in `cap1.xml`) has no
  facsimile counterpart — see `docs/encoding-guidelines.md`.

See `docs/encoding-guidelines.md` for a description of the markup and its
conventions.

## License

All project-created contents of this dataset are licensed **CC BY-NC 4.0** —
see `LICENSE`. Component-level rights (the source critical text, the TEI
encoding, the alignment coordinates, the illustration metadata, and the
externally hosted page images) are itemized in `RIGHTS.md`.

## Provenance & credits

- **Text**: the TEI encoding is from the **LeggoManzoni** project (*quaranta
  commenti alla quarantana*), part of the **Manzoni Online** initiative
  (<https://www.alessandromanzoni.org>). Individual encoders are credited by
  chapter range in the `<respStmt>` entries of `quarantana/header.xml` and
  in `CONTRIBUTORS.md`.
- **Images / IIIF**: the digitized volume is a physical copy of the 1840
  Quarantana owned by Paola Italia, one of the project's Principal
  Investigators. It was digitized by FICLIT/AdLab, and the digital copy is
  held and served by the FICLIT Digital Library,
  Università di Bologna (`https://dlrc.ficlit.unibo.it`; IIIF manifest:
  `https://dlrc.ficlit.unibo.it/iiif/2/232045/manifest`). Images are **not
  redistributed** in this dataset — only their coordinates and IIIF URLs are;
  the images themselves remain served from the FICLIT endpoint.
- **Facsimile alignment**: the line- and illustration-level links between the
  text and the page images were produced by an automated alignment pipeline
  (layout analysis of the page images matched against the encoded text) and
  then manually reviewed page by page in eScriptorium (see **Alignment
  provenance & verification**). The pipeline code is not part of this
  dataset.

## Citation

If you use this dataset, please cite it as described in `CITATION.cff`.
A Zenodo DOI will be minted on deposit (`TODO` until then).
