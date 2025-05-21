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

#let dummy(word) = {
  let t = word + sub("G")
  text(fill: rgb("#3354c1"), t)
}

#pagebreak(to: "odd")



= Introduzione
<business-context>



#v(1em)

== Motivazioni e Contesto

Il corso di laurea triennale in _Informatica_ che offre l'Ateneo dell'_Università Di Padova_ è a numero chiuso, con un massimo di 222 postim cifra che nel corso degli anni è aumentata di paripasso con il numero di iscritti. Tuttavia, le scuole di provenienza delle matricole mostrano una grande disparità, con il numero degli studenti provenienti da istituti ad indirizzo informatico (come istituti tenici o liceo delle sicenze applicate) che supera di gran lunga il numero di studenti provenienti da licei tradizionali. In particolare, parliamo di circa il 75% di studenti che proviene da istituti tecnici, e il circa il 25% proveniente da altri istituti.

Questa disparità è data sicuramente dalla "credenza" che l'informatica sia solo programmazione e che quindi uno studente proveniente da un Liceo Scientifico non abbia le competenze necessarie per questo affrontare questo percorso.

Tuttavia, di contro a questa "credenza", non mancano le competenze, ma solamente le conoscenze, che è proprio il vuoto che questo corso va a colmare. Se magari uno studente proveniente da un istituto tecnico ha già delle competenze di programmazione, uno studente proveniente da un liceo scientifico ha sicuramente delle competenze matematiche e logiche che sono fondamentali per affrontare questo percorso.

Lo scopo di questo tirocinio, quindi, è proprio quello di dimostrare a tutti gli studenti che hanno un interesse in informatica, che non importa quale sia il loro _background_ scolastico per affrontare questo percorso.

Altro obiettivo molto importante, è quello di aumentare il numero di iscritti donna, dimostrando, grazie anche a vari testimonial (#link("https://womenincs.math.unipd.it")[#underline(text("WomenInCS", fill: blue.darken(30%)))], dimostrando alle varie studentesse, che la storia dell'informatica è stata fatta in non piccola parte da donne e scenziate.

L'informatica non è solo programmazione, ma è anche progettazione e design. Infatti, il mio progetto si basa sulla creazione di un'applicazione web interattiva, che richiede competenze di progettazione e design oltre a quelle di programmazione.

Personalmente, essendo uno di quei ragazzi timorosi di iniziare il percorso, arrivando da un Liceo Scientifico, mi sono sentito moralmente in dovere di aiutare tutti coloro che si trovano nella posizione in cui io stesso mi sono trovato, anche per questo quindi ho deciso di fare questo tirocinio con la #myProf.


// - il secondo invece è proprio il corso di _Tecnologie Web_ offerto dal mio corso di laurea. La #myProf ha saputo trasmettere la sua passione per il Web Developmente l'accessibilità rendendo il corso interessante e stimolante. Questo mi ha portato a voler approfondire le mie conoscenze in questo campo, e a cercare un tirocinio che fosse in linea con i miei interessi.

// - L'ultimo, ma non per importanza, è un motivo personale: un sito web sviluppato con un design accattivante e funzionale è la miglior prima impressione che un'azienda può fare sui propri clienti, oltre che alla qualità di qualsiasi servizio questa offra. Avendo fatto il passo importante di portare avanti una mia azienda, con un sito web in parte svilupato da me, mi impegno costantemente a mantenerlo aggiornato, sia a livello di design che a livello di funzionalità.


== Strumenti e processi

Durante il corso del tirocinio, mi sono avvalso di diversi strumenti che ho imparato ad utilizzare nel corso della mia carriera universitaria, e che mi hanno aiutato a portare avanti il mio progetto, come #glossary("Git") e #glossary("GitHub"), utilissimi per tenere traccia di ogni modifica effettuata al codice sorgente dell'applicazione, nonché per la condivisione di tale codice con la mia Relatrice. Inoltre, come già anticipato, ho scelto di utilizzare dei framework di #glossary("ReactJS") per lo sviluppo del mio progetto. Tutte le tecnologie saranno discusse nel dettaglio #link(<stage-purpose>)[#text("secondo capitolo", fill: blue.darken(30%))].

=== Suddivisione del lavoro

Dovendo presentare un #glossary("Piano di Lavoro") per inizire il mio tirocino, e volendo rispettare gli insegnamenti appresi dal corso di Ingegneria del Software, ho da subito deciso di impostare il mio Way of Working.

Ho quindi dapprima definito tutti gli obiettivi da raggiungere durante il percorso, trovandone 19. A questo punto, ho suddiviso il lavoro da svolgere nelle 8 settimane, potendo quindi definire degli "#glossary("sprint")". A fine di ogni sprint, controllo di aver completato tutto ciò che mi ero prefissato nel #glossary("backlog") di lavoro e, se ci fosse qualcosa che non ho completato, lo sposto nel backlog del prossimo sprint.

Per il tracciamento, come menzionato sopra, in una #glossary("Kanban") board, divisa in 3 colonne:
+ ToDo: attività da completare
+ In Progress: attività in corso
+ Done: attività completate

#figure(
  image("/images/kanban.png", width: 100%),
  caption: "vista della Kanban alla seconda settimana",
)

Inoltre, per visualizzare i tempi di svolgimento previsti ed effettivi, ho deciso di utilizzare un diagramma di Gantt.
#figure(
  image("/images/gantt.png", width: 100%),
  caption: "vista diagramma di Gantt alla seconda settimana",
)


Tutto questo è conforme al metodo di lavoro #glossary("Scrum"), che prevede una suddivisione del lavoro in sprint e un monitoraggio costante dei progressi. Lo Scrum fa parte della metodologia Agile#sub[@manifesto_agile], creata per migliorare lo sviluppo di prodotti software rallentati dalle tediose fasi di analisi e documentazione.

== Struttura del Documento

- *Cosa*: Il #link(<stage-purpose>)[#text("secondo capitolo", fill: blue.darken(30%))] fornisce una panoramica di tutto il progetto, dal suo scopo, a i prodotti attesi, descrivendo nel dettaglio il concetto di webapp interattiva e le tecnologie utilizzate e le motivazioni dietro queste.

- *Come*: Il #link(<stage-description>)[#text("terzo capitolo", fill: blue.darken(30%))] espone come le scelte descritte nel capitolo precedente sono state implementate. Inoltre, viene fornita una panoramica del codice sorgente, con i file più significativi e le loro funzionalità, oltre che la descrizione delle caratteristiche di accessibilità.

- *Conclusioni*: Il #link(<conclusions>)[#text("quarto capitolo", fill: blue.darken(30%))] fornisce una panoramica dei risultati ottenuti, sia a livello di codice sorgente che di accessibilità. Inoltre, viene fornita una panoramica dei test effettuati e dei risultati ottenuti.

- Nel #link(<cap:glossary>)[#text("Glossario", fill: blue.darken(30%))] sono riportati i termini tecnici e le abbreviazioni utilizzate nel corso del documento.



Oltre alla struttura qui sopra descritta, si adottano anche i seguenti accorgimenti tipografici:

- le abbreviazioni, termini tecnici (o comunque di uso non comune), o in lingua straniera in prima occorrenza nel documento sono definiti nel glossario consultabile alla fine del documento. Ogni termine nel glossario è evidenziato come segue: #dummy("Parola").

- Altri termini che richiedono un'attenzione particolare, ma che non hanno bisogno di essere definiti, saranno evidenziati in corsivo: _Parola_
