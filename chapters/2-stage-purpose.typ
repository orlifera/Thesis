#import "@preview/glossarium:0.5.4": make-glossary, gls
#import "../config/variables.typ": *

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
  text(fill: rgb("#3354c1"), t)
}

#pagebreak(to: "odd")

= Scopo del tirocinio
<stage-purpose>
#text(
  style: "italic",
  [
    Il prossimo capitolo fornisce una panoramica dettagliata del progetto di stage, partendo dal suo scopo, passando per gli obiettivi prefissati e le tecnologie utilizzate, arrivando ai prodotti attesi.
  ],
)
#v(1em)
== Scopo del progetto

== Obiettivi prefissati

== Tecnologie utilizzate

Dopo una breve riflessione insieme alla mia relatrice, abbiamo concordato sull'utilizzo di tecnologie con cui avevo già familiarità, avendole usate anche durante il progetto di _Ingegneria del Software_.

In particolare, ho scelto di utilizzare _#glossary("NextJS")_, che è un framework di #glossary("ReactJS") per lo sviluppo di applicazioni web, e _#glossary("TailwindCSS")_, un framework CSS che permette di creare interfacce utente reattive e personalizzabili in modo semplice e veloce.

Ho preso questa decisione con l'obiettivo non solo di crescere a livello di conoscenze, ma soprattutto con la cognizione di voler creare un prodotto che, seppur potrebbe non essere utilizzato, sia comunque creato con tecnologie moderne, facilmente mantenibile e modificabile in futuro da altri studenti come me.

=== NextJS

Nonstante fin da subito fosse stato chiaro che non sarebbe stato necessario un backend, ho comunque optato per NextJS, perché sapevo che avrei dovuto implementare funzionalità che richiedevano di effettuare chiamate alle #glossary("API") di #glossary("GitHub"). Inoltre, grazie al rendering lato server (SSR) e alla generazione statica delle pagine (SSG) con i #glossary("server-side components"), Next permette di limitare il caricamento di codice `JavaScript` necessario per il rendering della pagina verso il client, rendendo così il sito più leggero sul browser, più veloce e piacevole da utilizzare, e soprattutto più #glossary("SEO") friendly, quindi, in un'ottica aziendale, più _appeasing_ a livello marketing.



== Prodotti attesi
