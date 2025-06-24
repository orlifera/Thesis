#import "../config/constants.typ": chapter
#let config(
  myAuthor: "Orlando Ferazzani",
  myTitle: "WebApp per attività laboratoriali di OpenDay",
  myLang: "it",
  myNumbering: "1.1",
  body,
) = {
  // Set the document's basic properties.
  set document(author: myAuthor, title: myTitle)
  show math.equation: set text(weight: 400)
  // LaTeX look (secondo la doc di Typst)
  set page(
    margin: 1.55in,
    numbering: "1 of 1",
    number-align: top + right,
  )
  // set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
  set par(leading: 1em, justify: true)
  set text(font: "Avenir", size: 12pt, lang: myLang)
  set heading(numbering: myNumbering)
  show raw: set text(font: "Avenir", size: 10pt, lang: myLang)
  show par: set par(spacing: 1.5em)
  show heading: set block(above: 1.5em, below: 1.2em)
  show heading.where(level: 4): it => [
    #block(it.body)
  ]
  show heading.where(level: 1): it => {
    stack(
      spacing: 2em,
      if it.numbering != none {
        text(size: 1.5em)[#chapter #counter(heading).display()]
      },
      text(size: 2em, it.body),
      [],
    )
  }
  show ref: it => {
    text(size: 1.2em, sub("[" + it + "]"))
  }

  body
}

#let useCase(useCaseDetails) = {
  let n = 1
  if useCaseDetails.number != "" and useCaseDetails.name != "" {
    text(12pt, [ *UC#useCaseDetails.number: #useCaseDetails.name* ])
  }
  let result = for (k, v) in useCaseDetails {
    if k != "number" and k != "name" {
      (
        text(k, weight: "bold"),
        v,
      )
    }
    n = n + 1
  }
  table(
    inset: 8pt,
    stroke: none,
    columns: 2,
    ..result
  )
}
