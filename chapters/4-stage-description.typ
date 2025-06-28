#import "@preview/glossarium:0.5.4": make-glossary, gls
#import "../appendix/entries.typ": entry-list
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
<json>

== Tecnologie utilizzate

COMMENTO: Questo capitolo devo ancora iniziarlo, ho solo preferito spostare le tecnologie utilizzare per tenerle insieme alla parte "tecnica" della tesi. Devo ancora riguardare ciò che ho scritto e pensare a quello che devo scrivere.

Le tecnologie utilizzate nel progetto e la loro selezione sono state fatte in comune accordo con la #myProf, tenendo conto delle competenze pregresse, acquisite durante il corso di _Ingegneria del Software_ e delle tecnologie più moderne e adatte al contesto del progetto. Tali scelte sono state fatte con l'obiettivo di assicurare un prodotto finale di alta qualità, facilmente manutenibile e modificabile in futuro, e che potesse essere utilizzato da altri studenti come me, garantendo anche una rapida curva di apprendimento.

=== Typescript

=== Axios

=== Firebase

=== GitHub

=== ShadCN

=== NextJS

Nonstante fin da subito fosse stato chiaro che non sarebbe stato necessario un backend, ho comunque optato per NextJS, perché sapevo che avrei dovuto implementare funzionalità che richiedevano di effettuare chiamate alle #glossary("API") di #glossary("GitHub"). Inoltre, grazie al rendering lato server (SSR) e alla generazione statica delle pagine (SSG) con i #glossary("server-side components"), Next permette di limitare il caricamento di codice `JavaScript` necessario per il rendering della pagina verso il client, rendendo così il sito più leggero sul browser, più veloce e piacevole da utilizzare, e soprattutto più #glossary("SEO") friendly, quindi, in un'ottica aziendale, più _appeasing_ a livello marketing.
COMMENTO(non so se aggiungere una parte "teorica" su NextJS)

=== TailwindCSS
Ho scelto di utilizzare TailwindCSS per la sua flessibilità e per la sua capacità di creare interfacce utente reattive e personalizzabili in modo semplice e veloce. Inoltre, grazie alla sua natura _utility-first_, permette di scrivere meno codice CSS, rendendo il progetto più leggero e veloce da caricare, senza preoccupazioni di conflitti tra stili dati dalla rigidità della gerarchia di specificità di CSS.
