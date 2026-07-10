# I Promessi Sposi (Quarantana, 1840): a facsimile-aligned TEI edition

A TEI encoding of Alessandro Manzoni's *I promessi sposi* whose reading text
is aligned, line by line, to a digital facsimile of the *Quarantana* (the
illustrated 1840 Milan edition Manzoni himself supervised). The reading text
is Teresa Poggi Salani's critical edition (2013), whose copy-text is this
same 1840 Quarantana; the facsimile layer is the digitized Quarantana copy
held by FICLIT (Università di Bologna) and served over IIIF. Every line of
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
illustrations_metadata.csv   full illustration catalog (505 items) with IIIF region URLs
schema/                  TEI ODD and Schematron project rules
docs/                    encoding guidelines
```

`intro.xml` and `cap1.xml`…`cap38.xml` are bare `<div>` fragments — they carry
no `xmlns` of their own and are not standalone TEI documents. They are meant
to be assembled into (or validated against) a wrapping `<TEI>` document.
`header.xml`, `facsimile.xml`, and `listPerson.xml`, by contrast, are complete
TEI documents in the TEI namespace (`http://www.tei-c.org/ns/1.0`).

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
`<figure>`) carry a `@facs="facsimile.xml#<zone-or-surface-id>"` attribute
pointing into the facsimile layer. A `<surface>` corresponds to one printed
page; a `<zone>` corresponds to one physical line of print or one
illustration on that page.

## Textual relationship: not a diplomatic transcription

The reading text is a **critical edition** (Teresa Poggi Salani, 2013),
anchored to its witness — not a diplomatic transcription of the print. The
facsimile layer connects that critical text to the specific 1840 Quarantana
copy it is based on, line by line, so a reader or downstream tool can see
which physical line of the printed page underlies any given stretch of text.
Because the two are *aligned* rather than transcribed from one another, a few
printed glyphs will not match the encoded text character-for-character — the
critical edition's corrections and normalizations.

## Coordinates & IIIF

All zone and surface coordinates (`@ulx`, `@uly`, `@lrx`, `@lry`) are in page
pixels, in the coordinate space of the full-page image referenced by that
surface's `<graphic>`. Line and region coordinates are machine-detected
(automated layout analysis of the page images), so a zone's box is a close
but not pixel-perfect fit to the printed line or illustration.

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
its Schematron rules in `schema/promessi-sposi.sch`.

## Coverage & limitations

- 742 digitized pages, 20,579 aligned lines — line coverage is 100% in every
  chapter (no unmatched lines).
- 505 illustrations located in the digitized volume; the 438 within the
  encoded chapters are linked to `<figure>` elements (the rest — front matter
  and *Storia della colonna infame* — are outside the encoded scope).
- Every text token carries a physical-line `@facs` link through its governing
  `<lb>`.

See `docs/encoding-guidelines.md` for a description of the markup and its
conventions.

## License

All contents of this dataset are licensed **CC BY-NC 4.0** — see
`LICENSE`.

## Provenance & credits

- **Text**: the TEI encoding is from the **LeggoManzoni** project (*quaranta
  commenti alla quarantana*), part of the **Manzoni Online** initiative
  (<https://www.alessandromanzoni.org>). Individual encoders are credited by
  chapter range in the `<respStmt>` entries of `quarantana/header.xml`.
- **Images / IIIF**: the digitized Quarantana page images and IIIF service
  are provided by the FICLIT Digital Library, Università di Bologna
  (`https://dlrc.ficlit.unibo.it`). Images are **not redistributed** in this
  dataset — only their coordinates and IIIF URLs are; the images themselves
  remain served from the FICLIT endpoint.
- **Facsimile alignment**: the line- and illustration-level links between the
  text and the page images were produced by an automated alignment pipeline
  (layout analysis of the page images matched against the encoded text). The
  pipeline code is not part of this dataset.

## Citation

If you use this dataset, please cite it as described in `CITATION.cff`.
A Zenodo DOI will be minted on deposit (`TODO` until then).
