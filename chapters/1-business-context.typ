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
#let glossary(word) = {
  let t = gls(word)
  return t + sub("G")
}


#set math.equation(numbering: num => "(" + (str(counter(heading).get().at(0)) + "." + str(num)) + ")")
#set figure(numbering: num => str(counter(heading).get().at(0)) + "." + str(num))

#pagebreak(to: "odd")

= Il contesto
<business-context>


#v(1em)
#text(
  style: "italic",
  [ ],
)
#v(1em)


