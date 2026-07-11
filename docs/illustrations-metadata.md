# `illustrations_metadata.csv` — data dictionary

One row per illustration located in the digitized volume: **505 rows**,
UTF-8, comma-separated, quoted where needed, header row. `item_id` is the
primary key (unique). Row order follows the volume (scan order, then
position on the page) but carries no additional meaning.

438 of the 505 rows correspond to a `<figure>` in the encoded TEI (matched
via `item_api_url` = the figure's `@corresp`); the remaining 67 are outside
the encoded scope (front matter and *Storia della colonna infame*) and have
no TEI counterpart.

**Empty cells** mean "not applicable / not recorded in the source
catalogue" — there is no explicit NULL marker.

## Identity and source-catalogue fields

Descriptive fields (title through geographic places) are taken from the
FICLIT Digital Library catalogue records; they are curated by the library,
not by this project.

| Column | Content |
|---|---|
| `item_id` | FICLIT catalogue item id (integer as text; unique key) |
| `item_api_url` | FICLIT REST API record, `https://dlrc.ficlit.unibo.it/api/items/{item_id}`; equals the TEI `<figure>`/`@corresp` |
| `item_page_url` | human-readable catalogue page for the item |
| `title` | illustration title from the catalogue (Italian) |
| `identifier` | catalogue identifier, pattern `Quarantana_{scan}_p.{printed page}_{position}` |
| `scan_number` | zero-padded scan/canvas number within the digitized volume |
| `printed_page` | printed page number as it appears in the volume; bracketed (e.g. `[1]`) when the number is not printed on the page |
| `position_on_page` | 1-based order of the illustration on its page (1 or 2) |
| `chapter` | chapter the illustration belongs to (e.g. `Introduzione`, `Capitolo I`); empty for 3 items not attributable to a chapter |
| `illustration_type` | one of: `Frontespizio`, `Frontespizio morto`, `Frontespizio tipografico`, `Capolettera`, `Intestazione`, `Altre illustrazioni` |
| `visual_typology` | broader iconographic class (e.g. `Figura allegorica`); empty when not classified |
| `creators` | artists/engravers, `;`-separated (e.g. `Gonin, Francesco; Sacchi, Luigi`) |
| `subjects` | thematic subject headings, `;`-separated |
| `characters` | novel characters depicted, `;`-separated |
| `narrative_place` | place in the narrative depicted |
| `geographic_place` | real geographic place depicted |
| `illustration_image_url` | direct URL of the catalogue's cropped illustration image (FICLIT-hosted) |
| `media_ids` | FICLIT media ids attached to the item, `;`-separated |

## Page / IIIF fields

| Column | Content |
|---|---|
| `canvas_label` | label of the IIIF canvas (scan filename) |
| `canvas_id` | IIIF canvas URI in the volume manifest |
| `page_iiif_image_service` | IIIF Image API service base for the full page |
| `page_full_image_url` | `{service}/full/full/0/default.jpg` — the full page image |

## Location fields (project-derived)

These fields were computed by this project by locating the catalogue's
cropped illustration image on its full page image, and are the basis of the
`type="illustration"` zones in `facsimile.xml`.

| Column | Content |
|---|---|
| `x`, `y`, `w`, `h` | pixel region of the illustration on the full page image (top-left origin), same coordinate space as the TEI zone `@ulx/@uly/@lrx-@ulx/@lry-@uly` |
| `match_score` | template-matching confidence, 0–1 (observed range 0.44–0.99) |
| `match_method` | matching algorithm that produced the location: `ncc` (normalized cross-correlation), `ncc-clahe` (NCC after contrast equalization), `orb` (feature matching) |
| `iiif_region_url` | precomputed `{page_iiif_image_service}/{x},{y},{w},{h}/full/0/default.jpg` — fetches the illustration region directly |

Consistency between `iiif_region_url`, `page_iiif_image_service`, and
`x,y,w,h` is machine-checked at release time (see
`docs/validation-report.md`).
