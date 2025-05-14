#import "@preview/glossarium:0.5.4": make-glossary, gls
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

#let glossary(word) = {
  let t = gls(word) + sub("G")
  text(fill: rgb("#a99c84"), t)
}

#pagebreak(to: "odd")

= Scopo del tirocinio
<stage-purpose>
#text(
  style: "italic",
  [
    Il prossimo capitolo fornisce una panoramica generale, ma nel dettaglio, del progetto di stage, partendo dal suo scopo, passando per gli obiettivi prefissati e le tecnologie utilizzate, arrivando ai prodotti attesi.
  ],
)
#v(1em)

#v(1em)

