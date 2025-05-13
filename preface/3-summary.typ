#import "../config/constants.typ": abstract
#import "@preview/glossarium:0.5.4": make-glossary, gls, print-glossary, register-glossary
#import "../config/variables.typ": *
#import "../appendix/entries.typ": entry-list
#import "../config/thesis-config.typ"
#show: make-glossary

#set page(numbering: "i")
#set par(first-line-indent: 0pt)
//#set par(leading: 0.65em)
#set text(size: 10pt)

#let glossary(word) = {
  let t = gls(word) + sub("G")
  text(fill: rgb("#a99c84"), t)
}

#text(24pt, weight: "semibold", abstract)

#v(1em)

Il seguente elaborato descrive l'attività di tirocinio, della durata complessiva di xxx ore, svolta presso l'Università di Padova.
Questa attività è stata portata avanti sotto la guida della #myProf. Il #myTutor ha ricoperto il ruolo di tutor accademico.


L'_Università degli Studi di Padova_ durante i suoi OpenDay, utilizza #glossary("WebApp") interattive per avvicinare i ragazzi delle scuole superiori al corso di laurea in Informatica. Queste consentono di far conoscere le basi della programmazione attraverso giochi che stimolano la logica e la creatività.
Tuttavia, queste applicazioni sono spesso molto tediose da utilizzare dato il breve tempo a disposizione per le suddette attività e non sempre riescono a coinvolgere gli studenti, soprattutto chi di programmazione non ha mai intrapreso degli studi di alcun genere.

Il tirocionio effettuato mira proprio a risolvere questa problematica, sviluppando una _WebApp_ interattiva che permetta di avvicinare i ragazzi al mondo della programmazione in modo divertente e stimolante.


In questo documento, espongo il lavoro che ho svolto con la seguente suddivisione:

- Nel #link(<business-context>)[#text("primo capitolo", fill: blue.darken(30%))] descrivo il contesto all'interno del quale ho svolto il mio tirocinio, fornendo una panoramica degli strumenti e dei processi adottati, nonché del #glossary("Way of Working").
- Nel #link(<stage-purpose>)[#text("secondo capitolo", fill: blue.darken(30%))] espongo lo scopo dello stage, i prodotti attesi e gli obiettivi personali.
- Nel #link(<stage-description>)[#text("terzo capitolo", fill: blue.darken(30%))] descrivo nel dettaglio le attività svolte e metodi di approccio a
problemi. Alla fine presento brevemente il prodotto finale.
- Nel #link(<cap:glossary>)[#text("Glossario", fill: blue.darken(30%))] sono riportati i termini tecnici e le abbreviazioni utilizzate nel corso del documento.


// Attualmente, il _software_ dei sistemi di controllo è ancora prevalentemente sviluppato in
// linguaggio _C_.
// Tuttavia, il codice che ne deriva è spesso difficile da leggere e quindi anche da _mantenere_.
// Vista anche la sua natura estremamente versatile, facilita l’introduzione di errori di sicurezza.
// Durante il tirocinio, ho riprogettato e sviluppato, in _Rust_, un _driver_ per il modulo dedicato
// alle conversioni da segnali analogici a digitali, ad approssimazioni successive (_SAR_), del
// microcontrollore _Infineon Aurix TC375_.
// Il lavoro ha evidenziato come è possibile, grazie a _Rust_, rimuovere un'intera classe di errori e
// garantire sicurezza e stabilità al sistema.




#v(1fr)

#pagebreak()
#set page(numbering: none)
