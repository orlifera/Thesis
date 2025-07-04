#import "@preview/glossarium:0.5.4": gls, make-glossary
#import "../config/variables.typ": *
#import "../config/thesis-config.typ": *

#show: make-glossary
#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(figure.where(kind: raw)).update(0)
  it
}
#set math.equation(numbering: num => "(" + (str(counter(heading).get().at(0)) + "." + str(num)) + ")")
// #set figure(numbering: num => str(counter(heading).get().at(0)) + "." + str(num))

#let glossary(word) = {
  let t = gls(word) + sub("G")
  text(fill: rgb("#3354c1"), t)
}

#pagebreak()
= Analisi dei Requisiti
<adr>
#text(style: "italic", [
  Il seguente capitolo riporta l'analisi dei requisiti di Thinky, con i relativi casi d'uso e diagrammi UML.
])
#v(1em)

L'analisi dei requisiti è una fase, e di conseguenza, un documento (o in questo caso, capitolo), fondamentale nel ciclo di vita di un progetto.

Il suo scopo è quello di definire in modo chiaro, preciso e dettagliato le funzionalità che il prodotto finale andrà ad offrire, ossia i requisiti obbligatorri e opzionali richiesti dal #glossary("proponente").

Nello specifico, questo capitolo si propone di:

- Fornire un'analisi basata direttamente sulle richieste del proponente, in particolare, si basa sugli obiettivi riscontrati negli incontro con la #myProf, che sono stati riportati nel capitolo precedente.
- Identificare i requisiti e suddividerli in funzionali e non funzionali.
- Validare e verificare i requisiti rispettando la Way of Working adottata.


== Obiettivo del progetto

*_Thinky_* è una WebApp progettata per aiutare gli studenti che sono intenzionati ad iscriversi al corso di laurea in _Informatica_ dell'_Università di Padova_ a approcciarsi al mondo della programmazione durante gli Open Day, mediante un laboratorio interattivo svolto insieme alla #myProf e al #myTutor.

L'app utilizza diversi strumenti per fornire all'utente un'esperienza interattiva e coinvolgente, senza esagerare nella difficoltà, sia di utilizzo che dell'attività da svolgere.

== Utenti Target
<utenti>
Gli utenti target di Thinky sono principalmente studenti delle scuole superiori che sono interessati a iscriversi al corso di laurea in _Informatica_ dell'_Università di Padova_. In particolare, si rivolge a:

- Ragazzi e Ragazze di età compresa tra i 17 e i 19 anni, che stanno per diplomarsi e sono interessati a intraprendere un percorso di studi in informatica;
- Studenti provenienti da istituti tecnici e professionali, che potrebbero avere una formazione di base in informatica;
- Studenti provenienti da licei scientifici e classici, che potrebbero avere una formazione più analitico-matematica ma sono interessati a esplorare il mondo della programmazione e dello sviluppo software;


== Casi d'uso

Nella seguente sezione verranno elencati i casi d'uso principali della WebApp, che sono stati identificati in base agli obiettivi del progetto e alle esigenze degli utenti target.

Tutti i casi d'uso adottano la medesima struttura, come segue:

- *Nome Caso D'uso*: Nome del caso d'uso chiaro e descrittivo;
- *Attori*: Gli attori coinvolti nel caso d'uso, che possono essere utenti o sistemi esterni;
- *Precondizione e postcondizione*: Stato del sistema prima e dopo l'esecuzione del caso d'uso;
- *Scenario principale*: descrizione dettagliata dei passi che l'utente deve seguire per completare il caso d'uso;
- *Estensioni*: Eventuali estensioni o variazioni dello scenario principale, che possono includere errori o situazioni particolari che l'utente potrebbe incontrare durante l'esecuzione del caso d'uso;
- *Inclusioni*: Eventuali casi d'uso inclusi che sono necessari per completare il caso d'uso principale;
- *Generalizzazioni*: Eventuali generalizzazioni del caso d'uso, che possono includere casi d'uso più specifici o varianti del caso d'uso principale.
- *User Story*: Una breve descrizione del caso d'uso in forma di user story, che può essere utilizzata per comunicare il caso d'uso in modo più semplice e comprensibile.

È possibile suddividere i casi d'uso del sistema Thinky in due categorie principali:

- I casi d'uso relativi all'utente target, che riguardano le funzionalità principali della WebApp e l'interazione con l'utente;
- I casi d'uso relativi all'utente Admin;

== Attori

=== Primari

Per attore primario si intende un attore che interagisce direttamente con il sistema per raggiungere un obiettivo specifico. Nel caso di Thinky, l'attore primario è l'utente, ossia lo studente che partecipa al laboratorio interattivo. L'utente ha accesso a tutte le funzionalità della WebApp e può interagire con il sistema per completare le attività previste dal laboratorio.

=== Secondari

Per attore secondario si intende tutti quei servizi o sistemi esterni che Thinky utilizza a supporto delle sue funzionalità. Sono tutti attori su cui non si ha effettuato alcun tipo di sviluppo e che vengono "contattati" dal sistema, invece di contattare il sistema stesso. Nel caso di Thinky, gli attori secondari sono:

- #glossary("Firebase"), servizio di backend as service che fornisce un database in tempo reale;
- #glossary("GitHub"), piattaforma di hosting per progetti software che utilizza Git come sistema di controllo versione;

== Definizione dei casi d'uso Utente target

=== UC01: Registrazione Utente @uc1

// #figure(
// image(
// "/images/uc/registerForm.png",
// width: 34em,
// ),
// caption: "Interfaccia di registrazione utente",
// )
#figure(
  image(
    "/images/uc/UML/UC01.drawio.png",
    fit: "contain",
    width: 49em,
  ),
  caption: "UC01: diagramma UML",
)<uc1>

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente non è registrato nel sistema.
  - Le #glossary("API") di GitHub sono disponibili e funzionanti.
- *Postcondizioni*:
  - L'utente è registrato e può accedere alle funzionalità della WebApp.

*Scenario principale*

- L'utente apre per la prima volta l'interfaccia di Thinky.
- Il sistema rileva che l'utente non è registrato e mostra il form di registrazione.
- L'utente inserisce un nome utente e seleziona la scuola di provenienza.
- Il sistema verifica la validità dei dati inseriti (vedi estensioni UC1.1 - UC1.3).
- Se i dati sono validi, l'utente viene registrato e il nome viene salvato su GitHub.
- L'utente viene reindirizzato alla homepage della WebApp.

*Estensioni*

- UC1.1: Visualizzazione messaggio di errore se il nome utente non è rispettoso.
- UC1.2: Visualizzazione messaggio di errore se il nome utente è già stato utilizzato.
- UC1.3: Visualizzazione messaggio di errore se non sono stati compilati tutti i campi.

*Generalizzazioni*
- UC1.4: Inserimento nome utente.
- UC1.5: Selezione scuola di provenienza.

*User story*

- Come utente, voglio potermi registrare al sistema per accedere alle funzionalità, senza fornire dati sensibili.


==== UC1.1: Visualizzazione messaggio di errore se il nome utente non è rispettoso

// #figure(
//   image(
//     "/images/uc/badWords.png",
//     width: 34em,
//   ),
//   caption: "Errore nome utente non rispettoso",
// )

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente ha inserito un nome utente non rispettoso.
  - Le API di GitHub sono disponibili e configurate correttamente.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio di errore.

*Scenario principale*

- L'utente inserisce un nome utente non rispettoso.
- Il sistema visualizza un messaggio di errore.
- L'utente corregge il nome utente e ripete la registrazione.

*User story*

- Quando inserisco un nome utente non rispettoso, il sistema mostra un messaggio di errore così posso correggerlo e ripetere la registrazione.

==== UC1.2: Visualizzazione messaggio di errore se il nome utente è già utilizzato


// #figure(
//   image(
//     "/images/uc/taken.png",
//     width: 34em,
//   ),
//   caption: "Errore nome utente già utilizzato",
// )


*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - Il nome utente inserito è già utilizzato da un altro utente.
  - Le API di GitHub sono disponibili e configurate correttamente.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio di errore.

*Scenario principale*

- L'utente inserisce un nome utente già utilizzato.
- Il sistema visualizza un messaggio di errore.
- L'utente corregge il nome utente e ripete la registrazione.

*User story*

- Quando inserisco un nome utente già utilizzato, il sistema mostra un messaggio di errore così posso correggerlo e ripetere la registrazione.


==== UC1.3: Visualizzazione messaggio di errore se non sono stati compilati tutti i campi


// #figure(
//   image(
//     "/images/uc/missingField.png",
//     width: 34em,
//   ),
//   caption: "Errore campo mancante",
// )

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente ha inserito un nome utente ma non ha compilato il campo scuola di provenienza.
  - Le API di GitHub sono disponibili e configurate correttamente.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio di errore.

*Scenario principale*

- L'utente inserisce un nome utente ma lascia vuoto il campo scuola di provenienza.
- Il sistema visualizza un messaggio di errore.
- L'utente completa tutti i campi e ripete la registrazione.

*User story*

- Quando non compilo tutti i campi richiesti, il sistema mi avvisa con un messaggio di errore così posso completare i dati mancanti.

=== UC02: Visualizzazione UI @uc2

// #figure(
//   image(
//     "/images/uc/homepage.png",
//     width: 34em,
//     fit: "contain",
//   ),
//   caption: "Homepage di Thinky",
// )

#figure(
  image(
    "/images/uc/UML/UC02.drawio.png",
    width: 47em,
    fit: "contain",
  ),
  caption: "UC02: Visualizzazione UI",
)<uc2>

*Attori coinvolti*

- *Attori Primari*: Utente

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - L'utente è registrato nel sistema.
  - Il sistema è connesso e funzionante.
- *Postcondizioni*:
  - L'utente visualizza l'interfaccia utente della WebApp.

*Scenario principale*

- L'utente accede alla WebApp.
- Il sistema visualizza l'interfaccia utente.

*Estensioni*

- UC2.1: Visualizzazione messaggio di errore generico in caso di malfunzionamento del sistema.

*Generalizzazioni*

- UC2.2: Visualizzazione interfaccia in modalità scura.
- UC2.3: Visualizzazione interfaccia in modalità chiara.

*User story*

- Come utente, voglio visualizzare l'interfaccia della WebApp per interagire con essa e scegliere la modalità del tema.


==== UC2.1: Visualizzazione messaggio di errore generico

// #figure(
//   image(
//     "/images/uc/commonError.png",
//     width: 35em,
//   ),
//   caption: "Errore generico",
// )

*Attori coinvolti*

- *Attori Primari*: Utente

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - Si è verificato un malfunzionamento.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio di errore generico.

*Scenario principale*

- L'utente accede alla WebApp.
- Si verifica un malfunzionamento.
- Il sistema mostra un messaggio di errore generico.

*User story*

- In caso di malfunzionamento, il sistema mostra un messaggio di errore generico così l'utente è informato e può riprovare.


=== UC03: Visualizzazione pagina iniziale laboratorio @uc3

// #figure(
//   image(
//     "/images/uc/step0.png",
//     width: 35em,
//   ),
//   caption: "Pagina iniziale del laboratorio",
// )

#figure(
  image(
    "/images/uc/UML/UC03.drawio.png",
    width: 47em,
  ),
  caption: "UC03: Visualizzazione pagina iniziale laboratorio",
)<uc3>

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - L'utente è registrato.
  - L'utente ha cliccato sul pulsante "Vai al laboratorio".
- *Postcondizioni*:
  - L'utente visualizza la pagina iniziale del laboratorio.

*Scenario principale*

- L'utente clicca sul pulsante "Vai al laboratorio".
- Il sistema carica la pagina iniziale del laboratorio.

*Estensioni*

- UC3.1: Visualizzazione messaggio di errore se il caricamento dello step corrente fallisce.

*User story*

- Come utente, voglio visualizzare la pagina iniziale del laboratorio per iniziare l'attività.


==== UC3.1: Visualizzazione messaggio di errore se il caricamento dello step corrente non è andato a buon fine

// #figure(
//   image(
//     "/images/uc/currentStepError.png",
//     width: 35em,
//   ),
//   caption: "Errore currentStep",
// )


*Attori coinvolti*

- *Attori Primari*
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - L'utente è registrato.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Il sistema è connesso ma la richiesta dello  step corrente fallisce.
- *Postcondizioni*:
  - Il sistema mostra un messaggio di errore.

*Scenario principale*

- L'interfaccia utente invia una richiesta API a Firebase per la variabile dello step corrente, ma la richiesta fallisce.

*User story*

- Se il caricamento dello step corrente fallisce, il sistema mostra un messaggio di errore per informare l'utente e consentirgli di riprovare.


=== UC04: Visualizzazione step progressivi @uc4

// #figure(
//   image(
//     "/images/uc/step1.png",
//     width: 34em,
//   ),
//   caption: "Step 1 dei 6 progressivi",
// )

#figure(
  image(
    "/images/uc/UML/UC04.drawio.png",
    width: 45em,
  ),
  caption: "UC04: Visualizzazione step progressivi",
) <uc4>

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - L'utente è registrato.
  - L'utente ha visualizzato la pagina iniziale del laboratorio.
  - L'utente admin ha correttamente avanzato lo step.
  - Il sistema ha caricato lo step corrente correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step progressivo del laboratorio.

*Scenario principale*

- L'utente attende che l'admin carichi lo step successivo.
- Il sistema visualizza lo step progressivo del laboratorio.
- L'utente può interagire con esso.

*Estensioni*

- UC3.1: Visualizzazione messaggio di errore se il caricamento dello step corrente fallisce.

*Generalizzazioni*

- UC4.1: Visualizzazione Step 1
- UC4.2: Visualizzazione Step 2
- UC4.3: Visualizzazione Step 3
- UC4.4: Visualizzazione Step 4
- UC4.5: Visualizzazione Step 5
- UC4.6: Visualizzazione Step 6

*User story*

- Come utente, voglio visualizzare lo step progressivo del laboratorio per interagire con esso e completare l'attività.

==== UC4.1: Visualizzazione Step 1

// #figure(
//   image(
//     "/images/uc/step1.png",
//     width: 35em,
//   ),
//   caption: "Visualizzazione Step1",
// )

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - L'utente è registrato.
  - L'admin ha caricato lo step 1.
  - Il sistema ha caricato lo step corrente correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step 1.

*Scenario principale*

- L'utente attende che l'admin carichi lo step 1.
- Il sistema visualizza lo step 1.
- L'utente può interagire con esso.

*Inclusioni*

- UC4.1.1: Drag and Drop

*User story*

- Come utente, voglio visualizzare lo step 1 del laboratorio per interagire con il Drag and Drop e risolvere il problema proposto interagendo con esso e completando l'attività.

==== UC4.1.1: Drag and Drop

// #figure(
//   image(
//     "/images/uc/dnd.png",
//     width: 35em,
//   ),
//   caption: "Drag and Drop",
// )

*Attori coinvolti*
- *Attori Primari*: Utente

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente è registrato.
  - L'utente ha visualizzato lo step 1.
- *Postcondizioni*:
  - L'utente può trascinare e rilasciare gli elementi dello step 1.

*Scenario principale*

- L'utente visualizza lo step 1.
- Il sistema permette il drag and drop degli elementi.
- L'utente interagisce con gli elementi trascinati e rilasciati.

*User story*

- Come utente, voglio poter trascinare e rilasciare gli elementi.
  COMMENTO: questo UC è lasciato generico di proposito, in quanto è un'inclusione su altri UC, quindi non sarebbe corretto renderlo più specifico. È d'accordo?


==== UC4.2: Visualizzazione Step 2

// #figure(
//   image(
//     "/images/uc/step2.png",
//     width: 35em,
//   ),
//   caption: "Step 2 del laboratorio",
// )


*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - L'utente è registrato.
  - L'admin ha caricato lo step 2.
  - Il sistema ha caricato lo step corrente correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step 2.
  - L'utente può interagire con esso.

*Scenario principale*

- L'utente attende che l'admin carichi lo step 2.
- Il sistema visualizza lo step 2.
- L'utente può interagire con esso.

*Inclusioni*

- UC4.1.1: Drag and Drop

*User story*

- Come utente, voglio visualizzare lo step 2 del laboratorio per interagire con il Drag and Drop e risolvere il problema proposto interagendo con esso e completando l'attività..


==== UC4.3: Visualizzazione Step 3

// #figure(
//   image(
//     "/images/uc/step3.png",
//     width: 35em,
//   ),
//   caption: "Step 3 del laboratorio",
// )


*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'admin ha caricato lo step 3.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Il sistema ha caricato lo step corrente correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step 3.
  - L'utente può interagire con esso.

*Scenario principale*

- L'utente attende che l'admin carichi lo step 3.
- Il sistema visualizza lo step 3.
- L'utente può interagire con esso.

*Inclusioni*
- UC4.3.1: Risposta domande

*User Story*

- Come utente, voglio visualizzare lo step 1 del laboratorio per rispondere alle le domande completando l'attività.

==== UC4.4: Visualizzazione Step 4

// #figure(
//   image(
//     "/images/uc/step4.png",
//     width: 35em,
//   ),
//   caption: "Step 4 del laboratorio",
// )


*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'admin ha caricato lo step 4.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Il sistema ha caricato lo step corrente correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step 4.
  - L'utente può interagire con esso.

*Scenario principale*

- L'utente attende che l'admin carichi lo step 4.
- Il sistema visualizza lo step 4.
- L'utente può interagire con esso.

*Inclusioni*
- UC4.4.1: Completamento esercizio Select

*User Story*

- Come utente, voglio visualizzare lo step 4 del laboratorio per completare l'esercizio Select e interagire con esso completando l'attività.

==== UC4.5: Visualizzazione Step 5

// #figure(
//   image(
//     "/images/uc/step5.png",
//     width: 35em,
//   ),
//   caption: "Step 5 del laboratorio",
// )

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'admin ha caricato lo step 5.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Il sistema ha caricato lo step corrente correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step 5.
  - L'utente può interagire con esso.

*Scenario principale*

- L'utente attende che l'admin carichi lo step 5.
- Il sistema visualizza lo step 5.
- L'utente può interagire con esso.

*Inclusioni*

- UC4.1.1: Drag and Drop

*User story*

- Come utente, voglio visualizzare lo step 5 del laboratorio per interagire con il Drag and Drop e risolvere il problema proposto interagendo con esso e completando l'attività.

==== UC4.6: Visualizzazione Step 6

// #figure(
//   image(
//     "/images/uc/step6.png",
//     width: 35em,
//   ),
//   caption: "Step 6 del laboratorio",
// )


*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'admin ha caricato lo step 6.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Il sistema ha caricato lo step corrente correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step 6.
  - L'utente può interagire con esso.

*Scenario principale*

- L'utente attende che l'admin carichi lo step 6.
- Il sistema visualizza lo step 6.
- L'utente può interagire con esso.

*Inclusioni*

- UC4.1.1: Drag and Drop

*User story*

- Come utente, voglio visualizzare lo step 6 del laboratorio per interagire con il Drag and Drop e risolvere il problema proposto interagendo con esso e completando l'attività.

==== UC4.3.1: Risposta domande

// #figure(
//   image(
//     "/images/uc/answerQuestions.png",
//     width: 35em,
//   ),
//   caption: "Risposta domande",
// )

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente ha visualizzato lo step 3.
  - Le API di GitHub sono disponibili e configurate correttamente.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Il sistema ha caricato lo step corrente correttamente.
- *Postcondizioni*:
  - L'utente ha risposto alle domande dello step 3.
  - Il sistema ha salvato le risposte su GitHub.

*Scenario principale*
- L'utente visualizza lo step 3.
- Il sistema mostra le domande dello step 3.
- L'utente risponde alle domande.
- Il sistema salva le risposte su GitHub.

*Inclusioni*

- UC4.3.1.1: Visualizzazione suggerimento

*User story*
- Come utente, voglio rispondere alle domande dello step 3 per completare l'attività.

==== UC04.3.1.1: Visualizzazione suggerimento

// #figure(
//   image(
//     "/images/uc/suggestion.png",
//     width: 35em,
//   ),
//   caption: "Suggerimento",
// )

*Attori coinvolti*

- *Attori Primari*: Utente

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente ha visualizzato lo step 3.
  - Il sistema ha caricato lo step corrente correttamente.
  - L'utente ha cliccato sul pulsante "Suggerimento".
- *Postcondizioni*:
  - Il sistema visualizza il suggerimento per rispondere alle domande dello step 3.

*Scenario principale*
- L'utente visualizza lo step 3.
- Il sistema mostra le domande dello step 3.
- L'utente clicca sul pulsante "Suggerimento".
- Il sistema visualizza il suggerimento per rispondere alle domande dello step 3.

*User story*

- Come utente, voglio visualizzare un suggerimento per rispondere alle domande dello step 3 per completare l'attività.

==== UC04.4.1: Completamento esercizio Select

// #figure(
//   image(
//     "/images/uc/selectExercise.png",
//   width: 35em,
//   ),
//   caption: "Completamento esercizio Select",
// )

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente ha visualizzato lo step 4.
  - Le API di GitHub sono disponibili e configurate correttamente.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Il sistema ha caricato lo step corrente correttamente.
- *Postcondizioni*:
  - L'utente ha completato l'esercizio Select dello step 4.
  - Il sistema ha salvato le risposte su GitHub.

*Scenario principale*
- L'utente visualizza lo step 4.
- Il sistema mostra l'esercizio Select dello step 4.
- L'utente completa l'esercizio Select.
- Il sistema salva le risposte su GitHub.

*Inclusioni*
- UC4.3.1.1: Visualizzazione suggerimento

*User story*

- Come utente, voglio completare l'esercizio Select dello step 4 per interagire con esso e completare l'attività.

=== UC05: Visualizzazione pagina di chiusura laboratorio @uc5

// #figure(
//   image(
//     "/images/uc/step7.png",
//     width: 35em,
//   ),
//   caption: "Pagina di chiusura del laboratorio",
// )

#figure(
  image(
    "/images/uc/UML/UC05.drawio.png",
    width: 40em,
  ),
  caption: "UC05: Visualizzazione pagina di chiusura laboratorio",
) <uc5>


*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'admin ha caricato lo step 7.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Il sistema ha caricato lo step corrente correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step 7.
  - L'utente può interagire con esso.

*Scenario principale*

- L'utente attende che l'admin carichi lo step 7.
- Il sistema visualizza lo step 7.
- L'utente può interagire con esso.

*User Story*

- Come utente, voglio visualizzare lo step 7 del laboratorio per finire l'attività laboratoriale.


== Definizione dei casi d'uso Utente Admin

L'utente Admin è considerabile come una generalizzazione dell'utente target, in quanto ha accesso a tutte le funzionalità della WebApp, ma con privilegi aggiuntivi che gli consentono di gestire il sistema. L'utente Admin, tuttavia, non necessita di passare per la registrazione avendo già le credenziali (in questo caso salvate sul file #code-pill(`.env`). Si considerino quindi solo i seguenti casi d'uso, specifici per l'utente Admin, da sommare ai casi d'uso appena elencati.

=== UC06: Login Admin @uc6
// #figure(
//   image(
//     "/images/uc/loginFormAdmin.png",
//     width: 35em,
//   ),
//   caption: "Pagina di accesso Admin",
// )

#figure(
  image(
    "/images/uc/UML/UC06.drawio.png",
    width: 45em,
  ),
  caption: "Schermata di acesso Admin",
) <uc6>

*Attori coinvolti*

- *Attori Primari*: Utente Admin

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin ha le credenziali di accesso.
- *Postcondizioni*:
  - L'utente Admin è autenticato e può accedere alle funzionalità di amministrazione.

*Scenario principale*

- L'utente Admin apre l'interfaccia di Thinky direttamente alla pagina di accesso.
- Il sistema mostra il form di accesso.
- L'utente Admin inserisce le credenziali di accesso.
- Il sistema verifica le credenziali.
- Le credenziali sono valide, l'utente Admin viene autenticato.

*Estensioni*

- UC6.1: Visualizzazione messaggio di errore se le credenziali sono errate.

*User Story*

- Come utente Admin, voglio poter accedere al sistema per gestire le funzionalità di amministrazione.

==== UC6.1: Visualizzazione messaggio di errore se le credenziali sono errate

// #figure(
//   image(
//     "/images/uc/errPass.png",
//     width: 35em,
//   ),
//   caption: "Errore di accesso",
// )

*Attori coinvolti*

- *Attori Primari*: Utente Admin

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin ha inserito credenziali errate.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio di errore.

*Scenario principale*

- L'utente Admin apre l'interfaccia di Thinky direttamente alla pagina di accesso.
- Il sistema mostra il form di accesso.
- L'utente Admin inserisce le credenziali errate.
- Il sistema verifica le credenziali.
- Le credenziali non sono valide, il sistema visualizza un messaggio di errore.

*User Story*

- Quando inserisco credenziali errate, il sistema mostra un messaggio di errore così posso correggerle e ripetere l'accesso.

=== UC07: Visualizzazione homepage Admin @uc7

// #figure(
//   image(
//     "/images/uc/homeAdmin.png",
//     width: 35em,
//   ),
//   caption: "Visualizzazione homepage Admin",
// )


#figure(
  image(
    "/images/uc/UML/UC07.drawio.png",
    width: 49em,
  ),
  caption: "Visualizzazione homepage Admin",
)<uc7>

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub, Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Le API di GitHub sono disponibili e configurate correttamente
- *Postcondizioni*:
  - L'utente Admin visualizza la homepage di amministrazione.

*Scenario principale*
- L'utente ha effettuato l'accesso al sistema.
- Il sistema visualizza la homepage di amministrazione.

*Inclusioni*

- UC07.1: Visualizzazione tab lista utenti registrati.
- UC07.2: Visualizzazione tab gestione laboratorio.

*User Story*

- Come utente Admin, voglio visualizzare la homepage di amministrazione per gestire le funzionalità del sistema.


==== UC07.1: Visualizzazione scheda lista utenti registrati

// #figure(
//   image(
//     "/images/uc/tabellaUtenti.png",
//     width: 45em,
//     fit: "cover",
//   ),
//   caption: "Visualizzazione tabella lista utenti registrati",
// )

*Attori coinvolti*
- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di GitHub sono disponibili e configurate correttamente.
- *Postcondizioni*:
  - L'utente Admin visualizza la tabella con la lista degli utenti registrati.

*Scenario principale*

- L'utente Admin accede alla homepage di amministrazione.
- Il sistema visualizza la tabella con la lista degli utenti registrati.

*Estensioni*

- UC7.1.1: Visualizzazione messagio per lista vuota.


*User Story*

- Come utente Admin, voglio visualizzare la lista degli utenti registrati per gestire gli utenti del sistema.

==== UC7.1.1: Visualizzazione messaggio per lista vuota

// #figure(
//   image(
//     "/images/uc/noUser.png",
//     width: 35em,
//   ),
//   caption: "Errore lista utenti",
// )

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di GitHub sono disponibili e configurate correttamente.
  - Non ci sono utenti registrati nel sistema.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio che informa l'utente che la lista è vuota.

*Scenario principale*

- L'utente Admin accede alla homepage di amministrazione.
- Il sistema verifica se ci sono utenti registrati.
- Non ci sono utenti registrati, il sistema visualizza un messaggio che informa l'utente che la lista è vuota.

*User Story*

- Quando non ci sono utenti registrati, il sistema mostra un messaggio che informa l'utente Admin che la lista è vuota.


==== UC07.2: Visualizzazione tab gestione laboratorio

// #figure(
//   image(
//     "/images/uc/graph3.png",
//     width: 41em,
//   ),
//   caption: "vsiualizzazione tab gestione laboratorio",
// )

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: Firebase, GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Le API di GitHub sono disponibili e configurate correttamente.
- *Postcondizioni*:
  - L'utente Admin visualizza la Tab con le informazioni di laboratorio.

*Scenario principale*

- L'utente Admin accede alla homepage di amministrazione.
- Il sistema visualizza la Tab con le informazioni di laboratorio.

*Inclusioni*

- UC07.2.1: Visualizzazione pulsanti della gestione step del laboratorio.
- UC07.2.2: Visualizzazione Tab Grafici Step 3
- UC07.2.3: Visualizzazione Tab Grafici Step 4

*User Story*

- Come utente Admin, voglio visualizzare la Tab con le informazioni di laboratorio per gestire gli step del laboratorio e i grafici delle risposte date nei laboratori.

==== UC07.2.1: Visualizzazione pulsanti della gestione step del laboratorio

// #figure(
//   image(
//     "/images/uc/buttons.png",
//     width: 45em,
//   ),
//   caption: "Pulsanti per la gestione degli step del laboratorio",
// )

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: Firebase, GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Le API di GitHub sono disponibili e configurate correttamente.
- *Postcondizioni*:
  - L'utente Admin visualizza i pulsanti per la gestione degli step del laboratorio.

*Scenario principale* COMMENTO: i pulsanti sono specificati nelle generalizzazioni, per questo qua non avevo messo _quali_ pulsanti. Devo comunque modificare?
- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza i pulsanti per la gestione degli step del laboratorio .
- L'utente Admin può interagire con i pulsanti per gestire gli step del laboratorio.

*Generalizzazioni*

- UC07.2.1.1: Visualizzazione pulsante per l'avanzamento ad un nuovo step.
- UC07.2.1.2: Visualizzazione pulsante per ritornare allo step precedente.
- UC07.2.1.3: Visualizzazione pulsante per azzeramento statistiche.
- UC07.2.1.4: Visualizzazione pulsante per il reset degli step.

*User Story*

- Come utente Admin, voglio visualizzare i pulsanti per la gestione degli step del laboratorio per poterli gestire in modo efficiente.

==== UC07.2.1.1: Visualizzazione pulsante per l'avanzamento ad un nuovo step


*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Il sistema ha caricato lo step corrente correttamente.
- *Postcondizioni*:
  - L'utente Admin visualizza il pulsante per l'avanzamento ad un nuovo step.

*Scenario principale*

- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza il pulsante per l'avanzamento ad un nuovo step.
- L'utente Admin può interagire con il pulsante per avanzare ad un nuovo step.

*User Story*

- Come utente Admin, voglio visualizzare il pulsante per l'avanzamento ad un nuovo step per poter gestire gli step del laboratorio in modo efficiente.

==== UC07.2.1.2: Visualizzazione pulsante per ritornare allo step precedente

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Il sistema ha caricato lo step corrente correttamente.
  - step corrente >= 1
- *Postcondizioni*:
  - Il pulsante per tornare indietro di uno step è cliccabile.

*Scenario principale*

- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza il pulsante per tornare indietro di uno step.
- L'utente Admin può interagire con il pulsante per tornare indietro di uno step.

*User Story*

- Come utente Admin, voglio visualizzare il pulsante per tornare indietro di uno step per poter gestire gli step del laboratorio in modo efficiente.

==== UC07.2.1.3: Visualizzazione pulsante per azzeramento statistiche

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: Firebase, GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Le API di GitHub sono disponibili e configurate correttamente.
  - Il sistema ha caricato lo step corrente correttamente.
  - L'utente Admin ha cliccato sul pulsante per l'azzeramento delle statistiche.
- *Postcondizioni*:
  - Il pulsante per l'azzeramento delle statistiche resetta gli utenti salvati e il conteggio delle domande.

*Scenario Principale*

- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza il pulsante per l'azzeramento delle statistiche.
- L'utente Admin può interagire con il pulsante per azzerare le statistiche.
- gli utenti salvati e il conteggio delle domande vengono resettati.

*User Story*

- Come utente Admin, voglio visualizzare il pulsante per l'azzeramento delle statistiche per poter resettare le statistiche del laboratorio in modo rapido senza dover accedere al servizio di _information storage_ dove sono contenuti i file.


==== UC07.2.1.4: Visualizzazione pulsante per il reset degli step

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di Firebase sono disponibili e configurate correttamente.
  - Il sistema ha caricato lo step corrente correttamente.
  - L'utente Admin ha cliccato sul pulsante per il reset degli step.
- *Postcondizioni*:
  - Il pulsante per il reset degli step resetta step corrente a 0.

*Scenario principale*

- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza il pulsante per il reset degli step.
- L'utente Admin può interagire con il pulsante per resettare gli step in maniera rapida.
- step corrente viene resettato a 0.

*User Story*
- Come utente Admin, voglio visualizzare il pulsante per il reset degli step per poter resettare gli step del laboratorio in modo rapido senza dover accedere al servizio di _information storage_ dove è contenuto il file _`step.json`_.

==== UC07.2.2: Visualizzazione Tab Grafici Step 3

// #figure(
//   image(
//     "/images/uc/graph3close.png",
//     width: 40em,
//   ),
//   caption: "Grafici Step3",
// )

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di GitHub sono disponibili e configurate correttamente.
  - Il sistema ha caricato correttamente i dati delle domande salvate.
- *Postcondizioni*:
  - L'utente Admin visualizza la Tab con i grafici delle risposte date dagli utenti nello step 3.

*Scenario principale*
- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza la Tab con i grafici delle risposte date dagli utenti nello step 3.
- L'utente Admin può interagire con i grafici per visualizzare le risposte date dagli utenti nello step 3.

*Estensioni*

- UC7.2.2.1: Visualizzazione messaggio di informazione se non ci sono risposte salvate o avviene un errore generico.

*User Story*

- Come utente Admin, voglio visualizzare la Tab con i grafici delle risposte date dagli utenti nello step 3 per analizzare le risposte degli utenti e migliorare l'esperienza del laboratorio.


==== UC7.2.2.1: Visualizzazione messaggio di informazione se non ci sono risposte salvate o avviene un errore generico

// #figure(
//   image(
//     "/images/uc/chartAnsErr.png",
//     width: 40em,
//   ),
//   caption: "Errore durante il caricamento dei dati",
// )

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*
- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - non ci sono risposte salvate o si verifica un errore durante il caricamento dei dati.
  - Le API di GitHub sono disponibili e configurate correttamente.verifica un errore durante il caricamento dei dati.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio di informazione che indica che non ci sono risposte salvate.

*Scenario principale*

- L'utente Admin accede alla Tab con i grafici delle risposte date dagli utenti nello step 3.
- Il sistema tenta di caricare i dati dnon ci sono risposte salvateci sono risposte salvate o si verifica un errore durante il caricamento dei dati.
- Il sistema visualizza un messaggio di informazione che indica che non ci sono risposte salvate.

*User Story*

- Quando non ci sono risposte salvate o si verifica un errore durante il caricamento dei dati, il sistema mostra un messaggio di informazione per informare l'utente Admin che non ci sono dati disponibili per lo step 3.

==== UC07.2.3: Visualizzazione Tab Grafici Step 4

// #figure(
//   image(
//     "/images/uc/graph4.png",
//     width: 40em,
//   ),
//   caption: "Grafici Step4",
// )

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di GitHub sono disponibili e configurate correttamente.
  - Il sistema ha caricato correttamente i dati delle domande salvate.
- *Postcondizioni*:
  - L'utente Admin visualizza la Tab con i grafici delle risposte date dagli utenti nello step 4.

*Scenario principale*

- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza la Tab con i grafici delle risposte date dagli utenti nello step 4.
- L'utente Admin può interagire con i grafici per visualizzare le risposte date dagli utenti nello step 4.

*Estensioni*

- UC7.2.2.1: Visualizzazione messaggio di informazione se non ci sono risposte salvate o avviene un errore generico.

*User Story*

- Come utente Admin, voglio visualizzare la Tab con i grafici delle risposte date dagli utenti nello step 4 per analizzare le risposte degli utenti e migliorare l'esperienza del laboratorio.

== Requisiti

I requisiti sono stati individuati in base ai casi d'uso e alle user story precedentemente definiti, oltre che in base alle funzionalità richieste. I requisiti sono stati definiti in modo incrementale, partendo da quelli più generali e arrivando a quelli più specifici, e sono variati e aumentati nel tempo.

Ogni requisito è stato identificato con un codice univoco, che ne facilita la consultazione e la gestione. I requisiti sono stati classificati in tre categorie principali: requisiti funzionali, requisiti di qualità e requisiti di vincolo. Questi possono essere consultati nella tabella sottostante, che riporta il codice del requisito, la sua descrizione e la sua priorità, che si distingue in:

- *Obbligatorio*: requisito che deve essere implementato per il corretto funzionamento del sistema e che non può essere omesso.


- *Desiderabile*: requisito che migliora significativamente l'esperienza utente, ma che può essere omesso senza compromettere il funzionamento del sistema.


- *Opzionale*: requisito che può essere implementato se il tempo lo consente per arricchire le funzionalità. Questi obiettivi possono essere considerati come 'extra' che migliorano l'esperienza utente o aggiungono funzionalità utili

I requisiti di questo progetto sono divisi in:

- *Requisiti funzionali*: Indicano le funzionalità specifiche del sistema, e sono identificati con il prefisso _RF_. Corrispondono agli obiettivi identificati al capitolo #link(<objectives>)[#text(fill: blue, "Obiettivi del progetto")] e ai casi d'uso (e sotto casi d'uso) relativi. Sono definiti il *cosa* del sistema.

- *Requisiti di qualità*: Indicano le caratteristiche qualitative del sistema, e sono identificati con il prefisso _RQ_. Sono definiti il *come* il sistema deve funzionare per garantire la miglior #glossary("User Experience").

- *Requisiti di Vincolo*: Indicano i vincoli esterni al sistema, e sono identificati con il prefisso _RC_. Sono definiti le limitazioni del sistema, tutto ciò che il sistema deve rispettare per mantenere il grado massimo di qualità.

== Requisiti funzionali

#set table(stroke: 1pt, fill: (x, y) => if y == 0 {
  blue.lighten(65%)
} else if calc.odd(y) {
  luma(88.1%)
} else {
  white
})


#show table.cell: it => {
  if it.y == 0 {
    strong(align(center, it))
  } else {
    it
  }
}

#figure(
  table(
    align: center + horizon,
    columns: (auto, auto, auto),
    [Codice], [Descrizione], [Priorità],
    [*RF01*], [Il prodotto deve essere implementato correttamente ed essere funzionante], [Obbligatorio],
    [*RF02*], [Il prodotto deve rappresentare il problema dei lettori-scrittori], [Obbligatorio],
    [*RF03*], [L'utente deve potersi registrare senza utilizzo di dati personali (UC01)], [Obbligatorio],
    [*RF04*],
    [L'utente deve visualizzare un messaggio che lo informa che il nome utente scelto non è rispettoso UC1.1],
    [Obbligatorio],

    [*RF05*],
    [L'utente deve visualizzare un messaggio che lo informa che il nome utente scelto è già in uso UC1.2],
    [Obbligatorio],

    [*RF06*],
    [L'utente deve visualizzare un messaggio che lo informa che deve compilare tutti i campi UC1.3],
    [Obbligatorio],

    [*RF07*], [L'utente deve visualizzare l'applicazione dopo la corretta registrazione (UC02)], [Obbligatorio],
    [*RF08*], [L'utente deve poter visualizzare un messaggio di errore generico in caso di problemi], [Obbligatorio],
    [*RF09*], [L'utente deve visualizzare la pagina del laboratorio], [Obbligatorio],
    [*RF10*], [L'utente deve poter visualizzare gli step progressivi del laboratorio (UC04)], [Obbligatorio],
    [*RF11*], [L'utente deve poter visualizzare la pagina di chiusura del laboratorio (UC05)], [Obbligatorio],
    [*RF12*], [L'utente Admin deve poter accedere al sistema (UC06)], [Obbligatorio],
    [*RF13*], [L'utente Admin deve poter visualizzare la homepage di amministrazione (UC07)], [Obbligatorio],
    [*RF14*], [L'utente Admin deve poter visualizzare la lista degli utenti registrati (UC07.1)], [Obbligatorio],
    [*RF15*],
    [
      L'utente Admin deve poter visualizzare un messaggio di errore se il caricamento della lista degli utenti fallisce
      (UC07.1.2)
    ],
    [Obbligatorio],

    [*RF16*],
    [L'utente Admin deve poter visualizzare la Tab con le informazioni di laboratorio (UC07.2)],
    [Obbligatorio],

    [*RF17*],
    [
      L'utente Admin deve poter visualizzare i pulsanti per la gestione degli step del laboratorio (UC07.2.1)
    ],
    [Obbligatorio],

    [*RF18*],
    [
      L'utente Admin deve poter visualizzare i grafici delle risposte date dagli utenti nello step 3
      (UC07.2.2)
    ],
    [Facoltativo],

    [*RF19*],
    [
      L'utente Admin deve poter visualizzare i grafici delle risposte date dagli utenti nello step 4
      (UC07.2.3)
    ],
    [Facoltativo],

    [*RF20*],
    [
      Il sistema deve implementare il problema dei produttori-consumatori
    ],
    [Facoltativo],

    [*RF21*],
    [
      Il sistema deve dare all'utente la possibilità di inserire una sequenza di operazioni (UC4.2.1: Drag and Drop)
    ],
    [Facoltativo],
  ),
  caption: "Requisiti funzionali",
)

== Requisiti di qualità

#figure(caption: "Requisiti di qualità", table(
  align: center + horizon,
  columns: (auto, auto, auto),
  [Codice], [Descrizione], [Priorità],
  [*RQ01*], [Il sistema deve essere facilmente utilizzabile e intuitivo per l'utente], [Obbligatorio],
  [*RQ02*], [Il sistema deve essere veloce e reattivo], [Obbligatorio],
  [*RQ03*], [Il sistema deve avere le minime basi di sicurezza informatica], [Obbligatorio],
  [*RQ04*], [Il codice del sistema deve essere di libera consultazione su una singola repo di GitHub], [Obbligatorio],
  [*RQ05*],
  [Il sistema deve essere facilmente manutenibile e aggiornabile da sviluppatori diversi dal Laureando],
  [Obbligatorio],

  [*RQ06*], [Il sistema deve garantire almeno il 90% di copertura di obiettivi completati], [Obbligatorio],
))

== Requisiti di vincolo

#figure(
  caption: "Requisiti di vincolo",
  table(
    align: center + horizon,
    columns: (auto, auto, auto),
    [Codice], [Descrizione], [Priorità],
    [*RV01*], [Il sistema deve essere sviluppato in TypeScript], [Obbligatorio],
    [*RV02*],
    [Il sistema deve essere compatibile e funzionare con disinvoltura con la versione 140.0 o superiore di Firefox, che è l'ultima disponibile al momento della stesura di questo documento, e che quindi sia accessibile da ogni sistema operativo che supporta Firefox],
    [Obbligatorio],

    [*RV03*],
    [Il sistema deve essere compatibile e funzionare con disinvoltura con la versione 137.0.7151.120 o superiore di Chrome che è l'ultima disponibile al momento della stesura di questo documento, e che quindi sia accessibile da ogni sistema operativo che supporta Chrome],
    [Obbligatorio],

    [*RV04*],
    [Il sistema deve essere compatibile e funzionare con disinvoltura con la versione 18.1.0 o superiore di Safari, che è l'ultima disponibile al momento della stesura di questo documento, e che quindi sia accessibile da ogni sistema operativo che supporta Safari],
    [Obbligatorio],

    [*RV05*],
    [Il sistema deve rispettare le best practices del web development e rispettare gli standard di accessibilità dettati dallo standard internazionale W3C WCAG 2.1 AAA
      (Web Content Accessibility Guidelines)],
    [Obbligatorio],

    [*RV06*],
    [Il sistema deve essere compatibile con diverse dimensioni di schermo, rendendolo completamente #glossary("responsive")],
    [Obbligatorio],

    [*RV07*],
    [Il sistema deve essere compatibile con i diversi sistemi operativi (sia per dispositivi mobili che per desktop), come Windows, macOS, Linux, Android e iOS],
    [Obbligatorio],
  ),
)

