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
  text(fill: rgb("#a99c84"), t)
}

#pagebreak(to: "odd")



= Il contesto
<business-context>

#text(
  style: "italic",
  [
    In questo capitolo spiegherò le motivazioni che mi hanno spinto a scegliere questo tirocinio, sia a livello personale che professionale. Inoltre, fornirò una panoramica del contesto in cui si inserisce il mio progetto, oltre che degli strumenti e dei processi adottati.
  ],
)

#v(1em)

== Motivazioni e Contesto

Sin dal primo semestre del terzo anno, i miei interessi nel modno dell'informatica sono migrati, seppur non interamente, dalla #glossary("Cybersecurity") al #glossary("Web Development").

Questo interesse deriva da tre motivi principali:
- il primo si può definire visivo: mi piace vedere il risultato del mio lavoro, e il Web Development è un ottimo modo per farlo. Mi sprona anche a migliorarmi di progetto in progetto;

- il secondo invece è proprio il corso di _Tecnologie Web_ offerto dal mio corso di laurea. La #myProf ha saputo trasmettere la sua passione per il Web Developmente l'accessibilità rendendo il corso interessante e stimolante. Questo mi ha portato a voler approfondire le mie conoscenze in questo campo, e a cercare un tirocinio che fosse in linea con i miei interessi.

- L'ultimo, ma non per importanza, è un motivo personale: un sito web sviluppato con un design accattivante e funzionale è la miglior prima impressione che un'azienda può fare sui propri clienti, oltre che alla qualità di qualsiasi servizio questa offra. Avendo fatto il passo importante di portare avanti una mia azienda, con un sito web in parte svilupato da me, mi impegno costantemente a mantenerlo aggiornato, sia a livello di design che a livello di funzionalità.

Da qui la mia scelta di eseguire un tirocinio interno proprio con la #myProf, spronandomi ancora di più a migliorare le mie conoscenze attraverso l'utilizzo dei principi di accessibilità e usabilità, che sono stati il tema principale del mio tirocinio, nonché dei framework più recenti in modo tale che il mio progetto fosse più stimolante e moderno possibile.

== Strumenti e processi

//add new things here

Durante il corso del tirocinio, mi sono avvalso di diversi strumenti che ho imparato ad utilizzare nel corso della mia carriera universitaria, e che mi hanno aiutato a portare avanti il mio progetto, come #glossary("Git") e #glossary("GitHub"), utilissimi per tenere traccia di ogni modifica effettuata al codice sorgente dell'applicazione, nonché per la condivisione di tale codice con la mia Relatrice. Inoltre, come già anticipato, ho scelto di utilizzare dei framework di #glossary("ReactJS") per lo sviluppo del mio progetto. Tutte le tecnologie saranno discusse nel dettaglio #link(<stage-purpose>)[#text("secondo capitolo", fill: blue.darken(30%))].

