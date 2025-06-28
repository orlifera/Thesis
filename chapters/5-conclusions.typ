#pagebreak(to: "odd")
#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(figure.where(kind: raw)).update(0)
  it
}
#set math.equation(numbering: num => "(" + (str(counter(heading).get().at(0)) + "." + str(num)) + ")")
#set figure(numbering: num => str(counter(heading).get().at(0)) + "." + str(num))

= Conclusioni
<conclusions>

#v(1em)
#text(
  style: "italic",
  [
    Riassume le scelte fatte durante il progetto, i risultati ottenuti e le lezioni apprese, e propone possibili sviluppi futuri.
  ],
)
#v(1em)
