# Encoding guidelines

This is a user-facing reference for the markup used in this edition. Known
data limitations are summarized in the README's **Coverage & limitations**
section. For the formal schema (module selection, embedded Schematron), see
`schema/promessi-sposi.odd`.

## The two layers

- **Text layer** — `quarantana/intro.xml`, `quarantana/cap1.xml` …
  `cap38.xml`: the critical reading text (Poggi Salani's 2013 critical
  edition). These are bare `<div>` fragments with no namespace of their own.
- **Facsimile layer** — `quarantana/facsimile.xml`: one `<surface>` per
  scanned page, containing `<zone>` elements for physical lines,
  illustrations, and page marginalia, plus a `<graphic>` giving the page's
  IIIF image service.

The layers are linked by `@facs`, which always has the form
`facsimile.xml#<xml:id>` and appears on text elements (`<lb>`, `<pb>`,
`<figure>`) pointing at the facsimile-layer element (`<zone>` or
`<surface>`) they correspond to.

## Element and attribute inventory

**Text layer**

| Element | Use |
|---|---|
| `<div type="capitolo" n="…">` | one chapter |
| `<head>` | chapter heading (e.g. "CAPITOLO I") |
| `<p>` | paragraph |
| `<w>` | word token (each carries its own `@xml:id`) |
| `<lb>` | line break, `@facs`-linked to a `type="line"` zone |
| `<pb>` | page break, `@facs`-linked to a `<surface>` |
| `<figure>` | an illustration in the text flow, `@facs`-linked to a `type="illustration"` zone |
| `<graphic>` | inside `<figure>`, a local thumbnail reference (`url="./assets/img/…"`) |
| `<hi>` | inline typographic highlight (e.g. italics) |
| `<note place="bottom">` | footnote |
| `<milestone unit="comma">` | editorial paragraph/sentence-numbering milestone |

**Facsimile layer**

| Element | Use |
|---|---|
| `<facsimile>` | root container |
| `<surface>` | one scanned page; `@xml:id`, `@n` (printed page number, where present), `@corresp` (IIIF canvas URL) |
| `<graphic>` | inside `<surface>`, the full-page IIIF image (`@url`, `@width`, `@height`) |
| `<zone>` | one region on the page: a line, an illustration, or marginalia |

**Attributes**

| Attribute | Where | Meaning |
|---|---|---|
| `@facs` | `<lb>`, `<pb>`, `<figure>` | link to a facsimile-layer id: `facsimile.xml#<id>` |
| `@xml:id` | most elements | stable identifier |
| `@type` | `<zone>`, `<div>`, `<p>`, `<figure>` | subtype: zone kind (below), `capitolo`/`introduzione`, `capolettera`, etc. |
| `@n` | `<zone type="line">`, `<div>`, `<surface>`, `<lb>` | ordinal or printed number |
| `@ulx`/`@uly`/`@lrx`/`@lry` | `<zone>` | bounding box, upper-left / lower-right, in page pixels |
| `@points` | `<zone>` | polygon outline of the region (a tighter fit than the bounding box) |
| `@corresp` | `<surface>`, `<figure>`, `<zone type="illustration">` | link to an external identifier (IIIF canvas URL, or the FICLIT catalog item API URL) |

## Zone-type semantics

`<zone>` elements are typed by `@type`; only `line` and `illustration` are
linked from the text. The other three types are marginalia — present in the
facsimile layer for completeness (and for anyone who wants to render the
full page image), but never targeted by a text-layer `@facs`.

| `@type` | Meaning | Linked from text? | Count |
|---|---|---|---|
| `line` | one physical line of the printed body text | yes — every `<lb>` | 20,579 |
| `illustration` | an engraving/illustration on the page | yes — every `<figure>` | 438 |
| `runningHead` | the running head at the top of the page | no | 704 |
| `pageNum` | the printed page number, top centre | no | 703 |
| `signature` | printer's gathering signature, page foot, on gathering boundaries | no | 72 |

`unmatched`, `printMark`, and `lowConf` are not used as `@type` values in
the shipped data.

## Milestone conventions

- **In-word line breaks**: when a line break falls inside a hyphenated word,
  the `<lb>` sits inside the `<w>`, carries `break="no"`, and (when the
  print shows a visible hyphen) `rend="hyphen"`:
  ```xml
  <w>mez<lb n="3" facs="facsimile.xml#z_0015_l03" break="no" rend="hyphen"/>zogiorno,</w>
  ```
  Reflow by simply ignoring non-breaking milestones; a facsimile-aware
  renderer may re-materialize the hyphen at that point.
- **Page-turn hyphenation**: a handful of words are split across a page
  turn. These carry both a non-breaking `<pb>` and a non-breaking `<lb>`
  inside the same `<w>`, in that order:
  ```xml
  <w>sacri<pb break="no" facs="facsimile.xml#surf_…"/><lb break="no" facs="facsimile.xml#z_…"/>ficarsi</w>
  ```
- **Capolettera (drop-cap opening)**: the engraved initial letter is encoded
  as a `<figure>` (linked to its own `type="illustration"` zone), and the
  first word of the chapter/section remains intact and complete in the text
  — it is not split around the drop cap:
  ```xml
  <p type="capolettera"><figure xml:id="…" facs="facsimile.xml#z_…"><graphic url="…"/></figure></p>
  <p><lb n="2" facs="facsimile.xml#z_…"/><w>Quel</w> …</p>
  ```
  A renderer that wants to show the drop cap in place should combine the
  `<figure type="capolettera">`-context `<p>` with the first word of the
  paragraph that follows it.
- **The `@facs` layer discriminator**: `@facs` is what marks an element as
  belonging to the generated facsimile-alignment layer. Almost every `<lb>`
  and `<pb>` in the corpus carries it. Exactly **one** `<lb>` in the whole
  corpus does not: the original expert encoder's dialogue-break line break
  after "Perpetua." in `cap1.xml`, at a point where the print itself does
  not break the line. It was kept (rather than removed as redundant, like
  the other 33 pre-existing `<lb>` elements that coincided with a generated
  break) precisely because it has no facsimile counterpart — removing it
  would have discarded a genuine pre-existing editorial line break with no
  equivalent replacement.

## What is not encoded

- **HTR page-edge noise**: small marks the automated layout segmentation
  flagged near a page's edge (creases, fold shadows, speckling) that do not
  correspond to any printed content are not written into the facsimile
  layer at all.
- **Out-of-scope illustrations**: illustrations in the front matter and in
  *Storia della colonna infame* (outside the encoded intro + 38 chapters)
  have coordinates and IIIF region URLs in `illustrations_metadata.csv`, but
  no corresponding `<zone>`/`<figure>` in the TEI, since that text is not
  part of this TEI edition.
- **Engraver/artist plate credits**: small captions overlapping an
  illustration (e.g. "L. RICCARDI") are not zoned or transcribed.

## Coordinate / IIIF model

All coordinates on `<zone>` and `<surface>` are page pixels in the
coordinate space of that surface's `<graphic>`. A zone's bounding box
(`@ulx,@uly,@lrx,@lry`) combined with its surface's IIIF image service base
(the `<graphic>/@url`, stripped of its trailing `/full/full/0/default.jpg`)
gives a IIIF Image API region request `{x},{y},{w},{h}/full/0/default.jpg`,
where `x=ulx`, `y=uly`, `w=lrx-ulx`, `h=lry-uly`. See the README's
**Coordinates & IIIF** section for a worked example.

## Encoding conventions

Two constructs are deliberate encoding conventions, both valid TEI:

- `<p type="capolettera">` — used twice (`intro.xml`, `cap1.xml`) to wrap the
  drop-cap `<figure>` as its own paragraph, ahead of the paragraph carrying
  the first word (see **Milestone conventions** above). `@type` on `<p>` is
  open-vocabulary.
- `<bibl sameAs="…">` — links a cited work in `header.xml`'s bibliography to
  an external identifier (`@sameAs` is part of `att.global.linking`).
