#import "../config/constants.typ": abstract
#import "@preview/glossarium:0.5.4": make-glossary, gls
#import "../config/variables.typ": *
#import "../appendix/entries.typ": entry-list
#show: make-glossary

#set page(numbering: "i")
#set par(first-line-indent: 0pt)
//#set par(leading: 0.65em)
#set text(size: 10pt)

#let glossary(word) = {
  let t = gls(word)
  return t + sub("G")
}

#text(24pt, weight: "semibold", abstract)

#v(1em)

Il seguente elaborato descrive l'attività di tirocinio, della durata complessiva di xxx ore, interno svolta presso l'Università di Padova.
Questa attività è stata portata avanti sotto la guida della #myProf. Il #myTutor ha ricoperto il ruolo di tutor accademico.


L'_Università degli Studi di Padova_ durante i suoi OpenDay, utilizza #glossary("WebApp") interattive per avvicinare i ragazzi delle scuole superiori al corso di laurea in Informatica. Queste consentono di far conoscere le basi della programmazione attraverso giochi che stimolano la logica e la creatività.
Tuttavia, queste applicazioni sono spesso molto tediose da utilizzare dato il breve tempo a disposizione per le attività e non sempre riescono a coinvolgere gli studenti, soprattutto chi di programmazione non ha mai visto nulla.

Durante il mio tirocinio, ho quindi lavorato allo sviluppo di una WebApp interattiva che permette all'utente di lavorare a dei noti problemi di informatica, come ad esempio il problema dei Lettori e Scrittori, o ancora quello dei Filosofi a cena, utilizzando dei blocchi creati ad hoc, e utilizzando librerie di #glossary("Drag and Drop") per posizionare suddetti blocchi nella parte giusta del codice. A fine esercizio, l'applicazione validerà la risposta fornendo anche info su dove si è sbagliato e come correggere l'errore. In questo modo, l'utente potrà apprendere le basi della programmazione in modo divertente e stimolante. Saranno disponibili durante tutto l'utilizzo, sezioni di teoria dove approfondire il problema in analisi.

In questo documento, espongo il lavoro che ho svolto con la seguente suddivisione:

-Nel #link(<business-context>)[primo capitolo] descrivo il contesto
all'interno del quale ho svolto il mio tirocinio, fornendo una panoramica degli strumenti e dei processi adottati.
- Nel #link(<stage-purpose>)[secondo capitolo] espongo lo
scopo dello stage, i prodotti attesi, il #glossary("Way of Working") e gli obiettivi personali.
- Nel #link(<stage-description>)[terzo capitolo] descrivo nel dettaglio le attività svolte e metodi di approccio a
problemi. Alla fine presento brevemente il prodotto finale.
- Nel #link(<cap:glossary>)[Glossario] sono riportati i termini tecnici e le abbreviazioni utilizzate nel


// Attualmente, il _software_ dei sistemi di controllo è ancora prevalentemente sviluppato in
// linguaggio _C_.
// Tuttavia, il codice che ne deriva è spesso difficile da leggere e quindi anche da _mantenere_.
// Vista anche la sua natura estremamente versatile, facilita l’introduzione di errori di sicurezza.
// Durante il tirocinio, ho riprogettato e sviluppato, in _Rust_, un _driver_ per il modulo dedicato
// alle conversioni da segnali analogici a digitali, ad approssimazioni successive (_SAR_), del
// microcontrollore _Infineon Aurix TC375_.
// Il lavoro ha evidenziato come è possibile, grazie a _Rust_, rimuovere un'intera classe di errori e
// garantire sicurezza e stabilità al sistema.



Oltre alla struttura appena descritta, ho adottato le seguenti convenzioni tipografiche:
- gli acronimi, le abbreviazioni e i termini di uso non comune menzionati, vengono definiti nel #link(<cap:glossary>)[Glossario], situato alla fine del presente documento;
- per la prima occorrenza dei termini riportati nel glossario viene utilizzata la seguente nomenclatura: #text(blue.darken(60%))[parola#sub[G]]\;
- i termini in lingua straniera o facenti parte del gergo tecnico sono evidenziati con il carattere _corsivo_;
- dove non diversamente specificato, l'uso del "noi" si riferisce a me e ai miei tutor aziendali.

#v(1fr)

#pagebreak()
#set page(numbering: none)
