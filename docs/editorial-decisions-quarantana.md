# Editorial decisions — Quarantana documentary text vs Poggi Salani

Following Paola Italia's decision (July 2026) that the edition presents
**il documento** — the 1840 Quarantana exemplar reproduced in the FICLIT
digital library — the reading text follows the print, while *genuine errors of
the documentary witness are corrected* ("gli errori dell'edizione documentaria
vanno corretti").

Two parallel sets of the encoded text are kept:

| set | path | text |
|---|---|---|
| documentary (published) | `quarantana/` | the 1840 print, category-A misprints corrected |
| Poggi Salani | `editions/poggi-salani/` | the readings of the Edizione Nazionale |

Before this pass our TEI followed Poggi Salani at **all 48** substantive spots.
The documentary set reverts 36 of them and retains 12 as error corrections.
Category C is provisionally resolved in favour of the print and still needs
checking against Chiari-Ghisalberti, Nigro and Badini Confalonieri.


## Category A — Corrections retained — genuine Quarantana misprints

The print is defective and Poggi Salani agrees with grammar or fact. Both sets carry the corrected reading; **no change was made**.

| p. | file | Quarantana 1840 | Poggi Salani | documentary set | `xml:id` | note |
|---:|---|---|---|---|---|---|
| 15 | cap1.xml | Ecevedo, | Acevedo, | keep correction | `c1_11876` | proper name: Pedro Enriquez de Acevedo — probable misprint, verify |
| 104 | cap6.xml | un | una | keep correction | `c6_10975` | agreement: "proposta" is feminine |
| 423 | cap22.xml | parebbero | parrebbero | keep correction | `c22_13719` | "parere" gives parrebbero; *parebbero is not a form |
| 430 | cap23.xml | omicciatolo, | omiciattolo, | keep correction | `c23_11386` | standard form is omiciattolo — probable compositor scramble |
| 455 | cap24.xml | Parebbe | Parrebbe | keep correction | `c24_12465` | "parere" gives parrebbe; *parebbe is not a form |
| 456 | — | apparcecchiare. | apparecchiare. | keep correction | — | meaningless string — clear compositor typo |
| 462 | cap24.xml | cacciata | cacciate | keep correction | `c24_14800` | agreement with "le mani" |
| 509 | cap27.xml | dichiarato sostenitore | dichiarata sostenitrice | keep correction | `c27_10201`, `c27_10202` | gender agreement with a feminine subject |
| 552 | cap29.xml | della | dalla | keep correction | `c29_10229` | parallel to "dal peso" — dalla burrasca |
| 670 | cap34.xml | ai | al | keep correction | `c34_16506` | "calpestio" is masc. sing. — al |
| 671 | cap34.xml | l'altri | l'altre | keep correction | `c34_17058` | "voci" is feminine — l'altre |
| 703 | cap36.xml | Providenza; | Provvidenza; | keep correction | `c36_14245` | Manzoni writes Provvidenza throughout — isolated slip |

## Category B — Reverted — legitimate 1840 forms regularised by Poggi Salani

Apocope, 19th-century orthography, and archaic forms inside quoted *gride*. The documentary set restores the print.

| p. | file | Quarantana 1840 | Poggi Salani | documentary set | `xml:id` | note |
|---:|---|---|---|---|---|---|
| 53 | cap3.xml | contra | contro | revert | `c3_11879` | archaic form inside a quoted grida — do not normalize |
| 54 | cap3.xml | essere | esser | revert | `c3_12258` | apocope alternation |
| 97 | cap5.xml | essere: | esser: | revert | `c5_14057` | apocope alternation |
| 116 | cap6.xml | ora | or | revert | `c6_14302` | apocope alternation |
| 117 | cap6.xml | susurrare | sussurrare | revert | `c6_14717` | 19th-c. orthography |
| 251 | cap12.xml | avean | avevan | revert | `c12_14418` | morphological variant |
| 255 | cap13.xml | L'uffiziale | L'ufiziale | revert | `c13_10680` | 19th-c. orthography |
| 259 | cap13.xml | contradette | contraddette | revert | `c13_11909` | 19th-c. orthography |
| 262 | cap13.xml | restringessero | ristringessero | revert | `c13_12954` | 19th-c. orthography |
| 271 | cap14.xml | aver | avere | revert | `c14_10376` | apocope alternation |
| 355 | cap18.xml | signor | signore | revert | `c18_13815` | form alternation |
| 357 | cap18.xml | signor zio: | signore zio; | revert | `c18_14133`, `c18_14134` | form alternation + punctuation |
| 381 | cap20.xml | respingerla | rispingerla | revert | `c20_11308` | 19th-c. orthography |
| 383 | cap20.xml | aver | avere | revert | `c20_11878` | apocope alternation |
| 412 | cap22.xml | fare | far | revert | `c22_10427` | apocope alternation |
| 451 | cap24.xml | d'esser | d'essere | revert | `c24_11430` | apocope alternation |
| 453 | cap24.xml | cercar | cercare | revert | `c24_11944` | apocope alternation |
| 453 | cap24.xml | d'andar | d'andare | revert | `c24_11944` | apocope alternation |
| 463 | cap24.xml | avrebbe | avrebbero | revert | `c24_15085` | BORDERLINE: agreement ad sensum with nearest subject is acceptable |
| 612 | cap32.xml | s'instituisse | s'istituisse | revert | `c32_13005` | 19th-c. orthography |
| 613 | cap32.xml | Soldadesca | Soldatesca | revert | `c32_13050` | Spanish form inside a quoted grida — do not normalize |

## Category C — Reverted, pending cross-edition check — substantive variants

Word choice, word presence and one transposition. Provisionally resolved in favour of the print; **these are the entries to carry to the other editors**.

| p. | file | Quarantana 1840 | Poggi Salani | documentary set | `xml:id` | note |
|---:|---|---|---|---|---|---|
| 9 | cap1.xml | PRIMO. | I | manual review | — | chapter-heading convention, not a <w> token |
| 15 | cap1.xml | — *(absent)* | il Signor | delete PS addition | `c1_12055`, `c1_12056` | PS supplies "il Signor"; Q40/TEI omit |
| 94 | cap5.xml | — *(absent)* | che | delete PS addition | `c5_13282` | PS supplies "che"; Q40/TEI omit |
| 132 | cap7.xml | e | — *(absent)* | restore print word | `c7_14425_b` | Q40 has "e fu li"; TEI follows PS and omits |
| 133 | cap7.xml | da | la | revert | `c7_14659` | "ordino da cena" is idiomatic; PS reads "la cena" |
| 133 | cap7.xml | faccia | viso | revert | `c7_14639` | substantive variant |
| 227 | cap11.xml | odorando | adorando | revert | `c11_13831` | FLAG: Q40 "odorando" (scenting) fits the dog; PS "adorando" |
| 228 | cap11.xml | a | in | revert | `c11_13904` | "venire a taglio" is idiomatic |
| 251 | cap12.xml | come abbiam visto, | — *(absent)* | restore print word order | `c12_14045`, `c12_14046`, `c12_14047`, `c12_14052_b`, `c12_14052_c`, `c12_14052_d`, `c12_14044` | PS moves the clause earlier; TEI follows PS |
| 252 | cap12.xml | strascinarono, | strascicarono, | revert | `c12_14453` | substantive variant |
| 295 | cap15.xml | — *(absent)* | a | delete PS addition | `c15_12065` | PS supplies "a" ("intorno a Renzo"); Q40/TEI omit |
| 369 | cap19.xml | di | da | revert | `c19_12572` | "avere da + inf." is the idiom; possible Q40 misprint. TEI currently = Q40 |
| 518 | cap27.xml | fatte, | fatte sicuramente, | delete PS addition | `c27_12855`, `c27_12854` | PS adds "sicuramente"; TEI has it |
| 591 | cap31.xml | volontà, | — *(absent)* | restore print word | `c31_12760_b` | Q40 has "volonta,"; TEI follows PS and omits |
| 616 | cap32.xml | de'commissari; | de'commissari, come abbiam detto; | delete PS addition | `c32_13926`, `c32_13927`, `c32_13928`, `c32_13925` | PS adds "come abbiam detto"; TEI has it |

## Net effect on the documentary set

215,960 → **215,954** `<w>` tokens: 8 Poggi Salani additions removed (`il Signor`, `che`, `a`, `sicuramente`, `come abbiam detto`) and 2 print words restored (`e` p.132, `volontà` p.591). The p.251 transposition moves three tokens, which receive new `…_b/_c/_d` identifiers per the stable-identifier policy.

The 24 divergences listed under "Additional variants from the born-digital PS collation" in `quarantana-poggisalani-collation.md` needed no action: our TEI already followed the print at every one of them.

## Accentuation — converted to the print (July 2026)

The Quarantana writes the stressed word-final *e* of oxytones with a **grave**
accent (`perchè`, `nè`, `sè`, `chè`, `giacchè`, `potè`); Poggi Salani
regularizes these to the modern **acute** (`perché`…). The documentary set
restores the print.

- **1,274 tokens** converted, covering 102 surface forms.
- The change was not applied as a blind rule: each form was required to be
  **attested with a grave in the verified transcription of the print**. 37
  distinct lemmas are so attested, and they cover 1,274 of the 1,275
  word-final acute-*e* tokens in the text.
- **Three tokens deliberately keep the acute**: `siés` and `Rhétel,` (French)
  and `s'abbatté`. `siés` and `Rhétel,` were **checked against the facsimile
  images**, which show `siés baraòs trapolorum` and `di Nevers e di Rhétel,`
  with the acute — our readings are correct and the verified ALTO is wrong at
  both points.

### Categories NOT converted

The collation also reports capitalization (43), punctuation (71) and
quote-order (92) divergences. These were **not** applied, because the verified
transcription is not a reliable witness for them: examined token by token, the
apparent differences are dominated by transcription artefacts rather than
print readings — dropped graves read as case differences (`lì`→`li` 135×,
`sentì`→`senti` 46×), acute-for-grave on *o* and *u* (`più`→`piú` 64×,
`andò`→`andó` 13×), and above all dropped opening guillemets (`«E`→`E` 87×,
`«Non`→`Non` 66×). Converting on that evidence would corrupt the text.
Resolving these three categories needs the curated line classifier plus
review against the facsimile, and remains open.

## Capitalization — converted to the print (July 2026)

Capitalization was compared token by token against the **verified ALTO
transcription** (`build/alto_ground_truth_verified/`). 54 differences were
found and applied, restoring the print. They fall into clear groups, and
several expose defects in the earlier encoding rather than editorial choices:

- **Lowercase proper names in our text** where the print capitalizes:
  `abbondio` → `Abbondio` (4×), `perpetua` → `Perpetua`, `lucia` → `Lucia`,
  `ambrogio` → `Ambrogio`, `torino` → `Torino`. Concentrated in cap30–32.
- **Lowercase sentence openings**: `in` → `In`, `ogni` → `Ogni`,
  `tutti` → `Tutti`, `li` → `Li`, `allora` → `Allora`, `il` → `Il`,
  `colpa` → `Colpa`, `pensate` → `Pensate`.
- **Honorifics inside the quoted *gride***, which the print sets lower case:
  `Signor Don Carlo` → `signor don Carlo`, `Don Gonzalo` → `don Gonzalo`,
  `San Marco` → `san Marco`; conversely `questa città` → `questa Città`.
- **Footnote and citation style**: `pag.` → `Pag.`, `tom.` → `Tom.`
- **Substantive capitals of the print**: `provvidenza` → `Provvidenza`,
  `il Guerrin meschino` → `il Guerrin Meschino`, `Padri`, `Lazeretto`,
  `Pentecoste`, `Porta Orientale`.

### Method note — witness selection

An earlier pass of this work was driven by the `text` field of
`build/alignment.json`. **That field carries the raw OCR layer, not the
verified transcription**: it differs from the verified ALTO on 10,002 of
20,563 lines (`fimrevna guer` where the verified text reads `finire vna
guer¬`). Six capitalizations applied on that basis were wrong and have been
reverted. All figures in this section derive from the verified ALTO, and the
residual cases were checked against the facsimile images over IIIF.

## Chapter headings — converted to the print

The Quarantana spells out **only the first** chapter and closes every heading
with a full stop:

| | print | our TEI before |
|---|---|---|
| introduction | `INTRODUZIONE.` | `INTRODUZIONE` |
| chapter 1 | `CAPITOLO PRIMO.` | `CAPITOLO I` |
| chapters 2–38 | `CAPITOLO II.` … `CAPITOLO XXXVIII.` | `CAPITOLO II` … (no stop) |

All 39 headings were corrected. The running heads of chapter 1 read `CAPITOLO
PRIMO.` throughout, confirming the form is the edition's own and not a
one-off on the opening page. This resolves the p.9 entry, which no longer
needs an editorial decision.

## Accent on final vowels — resolved case by case against the facsimile

The verified ALTO flagged 653 places where our text and the transcription
disagreed on an accent. Each was checked against the **facsimile image**, not
the transcription. The check ran in two rounds because a first, lower-resolution
pass proved unreliable for accents sitting on interior letters — see the honest
account below.

### What was changed: the grave on stressed final *i* (140 tokens)

Where the accented vowel is the **last letter** of the word, the print of the
Quarantana routinely omits the grave that our (critical-edition-influenced) text
carried. This is the one class where the facsimile gives a clean, repeatable
answer: at 8× magnification the final *i* is plainly bare. The documentary set
drops the accent in 140 such tokens.

| our text | occurrences | print |
|---|---:|---|
| `sentì` | 33 | `senti` |
| `lì` | 29 | `li` |
| `bensì` | 11 | `bensi` |
| `riuscì` | 11 | `riusci` |
| `uscì` | 8 | `usci` |
| `partì` | 6 | `parti` |
| `proseguì` | 5 | `prosegui` |
| `sì` | 5 | `si` |

…and singleton verbs of the same shape (`morì`, `seguì`, `coprì`, `aprì`,
`salì`, `fiorì`, `colpì`, `conferì`, `riempì`, `riunì`, `stabilì`, `sostituì`,
`rivestì`, `ubbidì`, `acconsentì`, `giovedì`, `s'insospettì`, …). Every distinct
form was confirmed bare on the page.

The print is nonetheless inconsistent even here — it sets `Sì! si!` in one line —
so these were adjudicated individually, not by rule.

### What was NOT changed, and why (the honest part)

Two groups were left in their original encoded (accented) form, and a first
pass that had altered them was reverted:

- **Capital `È`** (22 cases). The sentence-initial `È` ("is") always carries its
  accent in the print. A low-resolution pass mis-scored two of them as bare
  (`È`→`E`); re-checked at 4× every `È` shows the mark, and the two were restored.
- **Accents on an interior vowel** (68 cases): the *-ìo* nouns (`ronzìo`,
  `mormorìo`, `calpestìo`, `brulichìo`, `mugolìo`, `bisbiglìo`), and `princìpi`,
  `vòto`/`vòta`/`vòte`, `balìa`, `genìa`, `malìe`, `braverìa`, `pendìo`,
  `restìo`, `oblìo`, `tafferìa`, and similar. Here the accent sits on a letter
  that already carries a dot or stands mid-word, and even at high magnification
  the facsimile does **not** give a reliable yes/no: some clearly keep the
  accent (`mormorío`, `ronzío`, `calpestío`, `mugolío` are visibly marked on the
  page), others look bare, and many are genuinely borderline at 1783-px scan
  resolution. Several of these accents are also **semantic** — `vòto` (empty) vs
  `voto` (vow), `princìpi` (principles) vs `prìncipi` (princes) — so a wrong call
  changes the meaning. This group is therefore **left as encoded and flagged for
  dedicated review** against a higher-resolution image or the physical volume.
  It is a known open item, not a resolved one.

### A methodological correction

A first automated pass drove this work off the raw OCR text layer of
`build/alignment.json` rather than the verified ALTO, and a first visual pass
scored the interior-accent group at a magnification too low to separate an
accent from an *i*'s dot. Both were wrong and were caught and undone. The final
numbers above rest only on the cases the facsimile settles unambiguously; the
rest are explicitly deferred rather than guessed.

### Corrections to the transcription itself

The check also found the verified ALTO **inventing** accents the print does not
carry — `paèse`, `pènsate`, `quèlla`, `rimanentè`, `sospesè`, `tèner`, `anzì`,
`dirè` — where ink specks were read as diacritics. Our text was already correct
at each and was left alone. The French `siés` and `Rhétel,` were likewise
confirmed acute on the page against the ALTO's grave.
