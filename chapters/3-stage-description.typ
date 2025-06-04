#import "@preview/glossarium:0.5.4": make-glossary, gls
#import "../appendix/entries.typ": entry-list
#show: make-glossary
#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(figure.where(kind: raw)).update(0)
  it
}
#set math.equation(numbering: num => "(" + (str(counter(heading).get().at(0)) + "." + str(num)) + ")")
#set figure(numbering: num => str(counter(heading).get().at(0)) + "." + str(num))

#pagebreak()

= Implementazione
<cap:stage-description>

#v(1em)
#text(
  style: "italic",
  [
    Espone come le scelte descritte nel capitolo precedente sono state implementate, attraverso una panoramica del codice sorgente, delle feature di accessibilità e delle best practices attuate durante il processo di sviluppo.
  ],
)
#v(1em)

<stage-description>
