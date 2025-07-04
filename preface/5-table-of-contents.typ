#import "../config/constants.typ": figuresList, tablesList
#set page(numbering: "i")
#import "@preview/codelst:2.0.1": sourcecode

#pagebreak(to: "odd");

#[
  #show outline.entry.where(level: 1): it => {
    linebreak()
    link(it.element.location(), strong(it.body()))
    h(1fr)
    link(it.element.location(), strong(it.page()))
  }
  #outline(
    indent: auto,
    depth: 5,
  )
]

#v(8em)

#outline(title: figuresList, target: figure.where(kind: image))

#v(8em)

#outline(
  title: tablesList,
  target: figure.where(kind: table),
  indent: auto,
)

#outline(
  title: "Lista codice",
  target: figure.where(kind: raw),
  indent: auto,
)
