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

#pagebreak()

= Scopo del tirocinio
<stage-purpose>
#text(
  style: "italic",
  [
    Il prossimo capitolo fornisce una panoramica dettagliata del progetto di stage, partendo dal suo scopo fino ai prodotti attesi.
  ],
)
#v(1em)
== Scopo del progetto

Come evidenziato nel capitolo precendente, questo progetto di stage è volto a colmare una grande 'disparità' tra gli studenti che si iscrivono al corso di laurea in _Informatica_ dell'_Università di Padova_.

Possiamo comunque distinguere due 'sotto-scopi' che convogliano poi in nel progetto finale:

Il primo scopo, definibile _scopo tecnico_, e rivolto al laureando, è quello di portare a limite le proprie abilità, competenze e conoscenze cercando di creare un prodotto che non solo sia funzionale, ma anche facile da utilizzare, accessibile a tutti e che aiuti effettivamente gli studenti. Questo scopo si traduce, all'atto pratico, nello sviluppo della WebApp interattiva.

Il secondo scopo, definibile _scopo sociale_, è rivolto agli studenti delle scuole superiori, e ha come obiettivo quello di mostrare loro che l'informatica non è solo programmazione, ma anche progettazione e design, e che non importa quale sia il loro _background_ scolastico per affrontare questo percorso. In particolare, si vuole dimostrare che ogni scuola superiore, anche se in maniera e con contenuti diversi, permette di affrontare questo percorso, chi in un modo e chi in un altro.

Se dovessi dare quindi una definizione sintetica, quasi matematica come il mio corso ha insegnato, dello scopo del progetto, direi che è:


#quote(block: true)[
  Si definisce il seguente progetto di sviluppo di una WebApp interattiva per l'orientamento agli Open Day di Informatica il processo che, dato un insieme eterogeneo di studenti delle scuole superiori, realizza uno strumento digitale accessibile e inclusivo, volto a ridurre le disparità di background e di genere e a mostrare che l'informatica è disciplina aperta a tutti, indipendentemente dal percorso scolastico precedente.
]


#v(1em)

== Obiettivi prefissati

Nelle fasi iniziali di quella che possiamo chiamare 'candidatura' al progetto, ho definito ciò che ritenevo fossero gli obiettivi principali del progetto, sapendo che questi comunque sarebbero stati mutevoli nel tempo, essendo aggiornati man mano che il progetto andava avanti sulla base delle esigenze e sull'effettivo progresso del progetto. Gli obiettivi definiti sono poi stati discussi insieme alla mia relatrice, e raggruppati in tre diverse categorie:

- *Obiettivi Obbligatori*: sono gli obiettivi che devono essere raggiunti per considerare il progetto completato e soddisfacente. Questi obiettivi sono stati definiti in modo da garantire che il prodotto finale sia funzionale, accessibile e utile per gli studenti delle scuole superiori.


- *Obiettivi Desiderabili*: sono obiettivi che, se raggiunti, migliorano significativamente il progetto e lo rendono più completo e interessante. Questi obiettivi possono essere considerati come 'aggiunte' che arricchiscono l'esperienza utente o aggiungono funzionalità utili, ma non sono strettamente necessari per il completamento del progetto.


- *Obiettivi Facoltativi*: sono obiettivi che, se raggiunti, arricchiscono il progetto e lo rendono più completo e interessante. Questi obiettivi possono essere considerati come 'extra' che migliorano l'esperienza utente o aggiungono funzionalità utili.

Per la classificazione degli obiettivi è stata adottata la seguente nomenclatura:
- Obbligatorio: O
- Desiderabile: D
- Facoltativo: F

Con il codice identificativo dell'obiettivo che diventa quindi:
*#align(center)[`[X] [Y]`]*
con `X` che rappresenta la categoria dell'obiettivo e `Y` che rappresenta il numero progressivo dell'obiettivo.

Gli obiettivi definiti inizialmente sono stati i seguenti:

*Obbligatori*
- O01: implementazione dell'applicativo;
- O02: funzionamento base dello stesso;
- O03: primo problema: produttore - consumatore;
- O04: simulazione della sequenza di operazione eseguita come live demo;
- O05: misurazione delle performance del punto O04;

*Desiderabili*

- D01: implementare il problema dei filosofi a cena;
- D02: possibilità di inserire una sequenza di operazioni;

*Facoltativi*

- F01: inserimento di uno username per mostrarlo nella scoreboard (no login);
- F02: inserimento di un punteggio in base alla percentuale di performance;
- F03: visualizzazione di una scoreboard di tutti gli utenti;

Come anticipato, questi obiettivi sono stati in parte rivisti in corso d'opera insieme alla #myProf, e sono stati aggiunti altri obiettivi, che sono stati classificati come segue:

*Obbligatori*
- O01: implementazione dell'applicativo;
- O02: funzionamento base dello stesso;
- O03: primo problema: lettore - scrittore;
- O04: Inserimento di username e scuola di provenienza per tenere traccia dell'utilizzo dell'applicativo;

*Facoltativi*
- F01: implementare il problema del produttore - consumatore;
- F02: possibilità di inserire una sequenza di operazioni;
- F03: Visualizzione delle statistiche di risposte ai quesiti posti agli utenti;

*Desiderabili*
- D01: Creazione di un'area riservata per l'amministratore senza necessità di login particolari;
- D02: visualizzazione di una dashboard con tutti gli utenti;

// Alla fine del progetto, la percentuale di obiettivi completati risulta la seguente:


// - Obbligatori: 100%
// - Desiderabili: 100%
// - Facoltativi: 100%

// con un totale di obiettivi completati pari al 100%.


== Prodotti attesi

Al completamento del progetto, è prevista la consegna di un prodotto funzionante che rispetti i requisiti definiti in fase di progettazione.

Sarà consegnato il codice sorgente del progetto, che sarà ben documentato e commentato, in modo da permettere una facile comprensione e manutenzione del codice stesso. Inoltre, sarà fornita una documentazione tecnica che descrive le funzionalità implementate, le tecnologie utilizzate e le modalità di utilizzo del prodotto, oltre che un breve documento che spiega all'utente come utilizzare l'applicativo, e un documento che spiega ad eventuali futuri programmatori come è strutturato il codice, per guidarli in un eventuale manutenzione o potenziamento del progetto.


Oltre che alla documentazione tecnica e al codice sorgente, sarà prodotto questo documenti di tesi, che descrive appunto il progetto sotto ogni punto di vista e ne analizza i risultati ottenuti, le difficoltà incontrate e le soluzioni adottate.
