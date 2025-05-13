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

#v(1em)

#v(1em)

== titolo


Durante il mio tirocinio, ho quindi lavorato allo sviluppo di una WebApp che permette all'utente di lavorare alla risoluzione dei noti problemi di informatica, come ad esempio il problema dei #glossary("Lettori e Scrittori"), in maniera interattiva e senza necessità di conscenze pregresse. Questo è possibile grazie all'utilizzo di blocchi di codice, o istruzioni creati ad hoc, che l'utente dovrà _letteralmente_ trascinare nel punto giusto del programma. A fine esercizio, l'applicazione validerà la risposta fornendo informazioni sugli eventuali errori o modi per ottimizzare il programma. In questo modo, l'utente potrà apprendere le basi della programmazione in modo divertente e stimolante. Saranno disponibili durante tutto l'utilizzo, sezioni di teoria dove approfondire il problema in analisi.
