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
= Analisi dei Requisiti
<adr>
#text(
  style: "italic",
  [
    Il prossimo capitolo fornisce una panoramica dettagliata del progetto di stage, partendo dal suo scopo, passando per gli obiettivi prefissati e le tecnologie utilizzate, arrivando ai prodotti attesi.
  ],
)
#v(1em)

L'analisi dei requisiti è una fase, e di conseguenza, un documento (o in questo caso, capitolo), fondamentale nel ciclo di vita di un progetto.

Il suo scopo è quello di definire in modo chiaro, preciso e dettagliato le funzionalità che il prodotto finale andrà ad offrire, ossia i requisiti obbligatorri e opzionali richiesti dal #glossary("proponente").

Nello specifico, questo capitolo si propone di:

- Fornire un'analisi basata direttamente sulle richieste del proponente, in particolare, si basa sugli obiettivi riscontrati negli incontro con la #myProf, che sono stati riportati nel capitolo precedente.
- Identificare i requisiti e suddividerli in funzionali e non funzionali.
- Validare e verificare i requisiti rispettando la Way of Working adottata.

== Tecnologie utilizzate

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

== Obiettivo del progetto

*_Thinky_* è una WebApp progettata per aiutare gli studenti che sono intenzionati ad iscriversi al corso di laurea in _Informatica_ dell'_Università di Padova_ a approcciarsi al mondo della programmazione durante gli Open Day, mediante un laboratorio interattivo svolto insieme alla #myProf e al #myTutor.

L'app utilizza diversi strumenti per fornire all'utente un'esperienza interattiva e coinvolgente, senza esagerare nella difficoltà, sia di utilizzo che dell'attività da svolgere.

== Utenti Target

Gli utenti target di Thinky sono principalmente studenti delle scuole superiori che sono interessati a iscriversi al corso di laurea in _Informatica_ dell'_Università di Padova_. In particolare, si rivolge a:

- Ragazzi e Ragazze di età compresa tra i 17 e i 19 anni, che stanno per diplomarsi e sono interessati a intraprendere un percorso di studi in informatica;
- Studenti provenienti da istituti tecnici e professionali, che potrebbero avere una formazione di
base in informatica;
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

=== UC01: Registrazione Utente

#figure(
  image("/images/uc/registerForm.png", width: 100%),
  caption: "Interfaccia di registrazione utente",
)

#figure(image("/images/uc/gantt.png"), caption: "UC01: diagramma UML")

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

- UC1.1: Visualizzazione messaggio di errore se il
nome utente non è rispettoso.
- UC1.2: Visualizzazione messaggio di errore se il nome utente è già stato utilizzato.
- UC1.3: Visualizzazione messaggio di errore se non sono stati compilati tutti i campi.

*User story*

- Come utente, voglio potermi registrare al sistema per accedere alle funzionalità, senza fornire dati sensibili.


==== UC1.1: Visualizzazione messaggio di errore se il nome utente non è rispettoso

#figure(image("/images/uc/badWords.png"), caption: "Errore nome utente non rispettoso")

#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente ha inserito un nome utente non rispettoso.
  - Le API di GitHub sono disponibili e funzionanti..
- *Postcondizioni*:
  - Il sistema visualizza un messaggio di errore.

*Scenario principale*

- L'utente inserisce un nome utente non rispettoso.
- Il sistema visualizza un messaggio di errore.
- L'utente corregge il nome utente e ripete la registrazione.

*User story*

- Quando inserisco un nome utente non rispettoso, il sistema mostra un messaggio di errore così posso correggerlo e ripetere la registrazione.


==== UC1.2: Visualizzazione messaggio di errore se il nome utente è già utilizzato


#figure(image("/images/uc/taken.png"), caption: "Errore nome utente già utilizzato")

#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - Il nome utente inserito è già utilizzato da un altro utente.
  - Le API di GitHub sono disponibili e funzionanti.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio di errore.

*Scenario principale*

- L'utente inserisce un nome utente già utilizzato.
- Il sistema visualizza un messaggio di errore.
- L'utente corregge il nome utente e ripete la registrazione.

*User story*

- Quando inserisco un nome utente già utilizzato, il sistema mostra un messaggio di errore così posso correggerlo e ripetere la registrazione.


==== UC1.3: Visualizzazione messaggio di errore se non sono stati compilati tutti i campi


#figure(image("/images/uc/missingField.png"), caption: "Errore campo mancante")

#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente ha inserito un nome utente ma non ha compilato il campo scuola di provenienza.
  - Le API di GitHub sono disponibili e funzionanti.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio di errore.

*Scenario principale*

- L'utente inserisce un nome utente ma lascia vuoto il campo scuola di provenienza.
- Il sistema visualizza un messaggio di errore.
- L'utente completa tutti i campi e ripete la registrazione.

*User story*

- Quando non compilo tutti i campi richiesti, il sistema mi avvisa con un messaggio di errore così posso completare i dati mancanti.


=== UC02: Visualizzazione UI

#figure(image("/images/uc/homepage.png"), caption: "Homepage di Thinky")

#figure(image("/images/uc/gantt.png"), caption: "UC02: Visualizzazione UI")

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

#figure(image("/images/uc/commonError.png"), caption: "Errore generico")

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


=== UC03: Visualizzazione pagina iniziale laboratorio

#figure(image("/images/uc/step0.png"), caption: "Pagina iniziale del laboratorio")

#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente è registrato.
  - L'utente ha cliccato sul pulsante "Vai al laboratorio".
- *Postcondizioni*:
  - L'utente visualizza la pagina iniziale del laboratorio.

*Scenario principale*

- L'utente clicca sul pulsante "Vai al laboratorio".
- Il sistema carica la pagina iniziale del laboratorio.

*Estensioni*

- UC3.1: Visualizzazione messaggio di errore se il caricamento di _`currentStep`_ fallisce.

*User story*

- Come utente, voglio visualizzare la pagina iniziale del laboratorio per iniziare l'attività.


==== UC3.1: Visualizzazione messaggio di errore se il caricamento di _`currentStep`_ non è andato a buon fine

#figure(image("/images/uc/currentStepError.png"), caption: "UC08: Salvataggio user")


#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - L'utente è registrato.
  - Il sistema è connesso ma la richiesta di _`currentStep`_ fallisce.
- *Postcondizioni*:
  - Il sistema mostra un messaggio di errore.

*Scenario principale*

- L'interfaccia utente invia una richiesta API a Firebase per la variabile _`currentStep`_, ma la richiesta fallisce.

*User story*

- Se il caricamento di _`currentStep`_ fallisce, il sistema mostra un messaggio di errore per informare l'utente e consentirgli di riprovare.


=== UC04: Visualizzazione step progressivi

#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente è registrato.
  - L'utente ha visualizzato la pagina iniziale del laboratorio.
  - Il sistema ha caricato _`currentStep`_ correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step progressivo del laboratorio.

*Scenario principale*

- L'utente attende che l'admin carichi lo step successivo.
- Il sistema visualizza lo step progressivo del laboratorio.
- L'utente può interagire con esso.

*Estensioni*

- UC3.1: Visualizzazione messaggio di errore se il caricamento di _`currentStep`_ fallisce.

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

#figure(image("/images/uc/step1.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente è registrato.
  - L'admin ha caricato lo step 1.
  - Il sistema ha caricato _`currentStep`_ correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step 1.

*Scenario principale*

- L'utente attende che l'admin carichi lo step 1.
- Il sistema visualizza lo step 1.
- L'utente può interagire con esso.

*Inclusioni*

- UC4.2.1: Drag and Drop

*User story*

- Come utente, voglio visualizzare lo step 1 del laboratorio per interagire con esso e completare l'attività.

==== UC4.1.1: Drag and Drop

#figure(image("/images/uc/dnd.png"), caption: "UC08: Salvataggio user")

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

- Come utente, voglio poter trascinare e rilasciare gli elementi dello step 1 per completare l'attività.


==== UC4.2: Visualizzazione Step 2

#figure(image("/images/uc/step2.png"), caption: "Step 2 del laboratorio")

#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente è registrato.
  - L'admin ha caricato lo step 2.
  - Il sistema ha caricato _`currentStep`_ correttamente.
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

- Come utente, voglio visualizzare lo step 2 del laboratorio per interagire con esso e completare l'attività.


==== UC4.3: Visualizzazione Step 3

#figure(image("/images/uc/step3.png"), caption: "Step 3 del laboratorio")

#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'admin ha caricato lo step 3.
  - Il sistema ha caricato _`currentStep`_ correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step 3.
  - L'utente può interagire con esso.

*Scenario principale*

- L'utente attende che l'admin carichi lo step 3.
- Il sistema visualizza lo step 3.
- L'utente può interagire con esso.


==== UC4.4: Visualizzazione Step 4

#figure(image("/images/uc/step4.png"), caption: "Step 4 del laboratorio")

#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'admin ha caricato lo step 4.
  - Il sistema ha caricato _`currentStep`_ correttamente.
- *Postcondizioni*:
  - L'utente visualizza lo step 4.
  - L'utente può interagire con esso.

*Scenario principale*

- L'utente attende che l'admin carichi lo step 4.
- Il sistema visualizza lo step 4.
- L'utente può interagire con esso.

==== UC4.5: Visualizzazione Step 5

#figure(image("/images/uc/step5.png"), caption: "Step 5 del laboratorio")

#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'admin ha caricato lo step 5.
  - Il sistema ha caricato _`currentStep`_ correttamente.
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

- Come utente, voglio visualizzare lo step 5 del laboratorio per interagire con esso e completare l'attività.

==== UC4.6: Visualizzazione Step 6

#figure(image("/images/uc/step6.png"), caption: "Step 6 del laboratorio")

#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'admin ha caricato lo step 6.
  - Il sistema ha caricato _`currentStep`_ correttamente.
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

- Come utente, voglio visualizzare lo step 6 del laboratorio per interagire con esso e completare l'attività.

=== UC05: Visualizzazione pagina di chiusura laboratorio

#figure(image("/images/uc/step7.png"), caption: "Pagina di chiusura del laboratorio")

#figure(image("/images/uc/gantt.png"), caption: "UC05: Visualizzazione pagina di chiusura laboratorio")

#figure(image("/images/uc/gantt.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente
- *Attori Secondari*: Firebase

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'admin ha caricato lo step 7.
  - Il sistema ha caricato _`currentStep`_ correttamente.
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

L'utente Admin è considerabile come una generalizzazione dell'utente target, in quanto ha accesso a tutte le funzionalità della WebApp, ma con privilegi aggiuntivi che gli consentono di gestire il sistema. L'utente Admin, tuttavia, non necessita di passare per la registrazione avendo già le credenziali (in questo caso salvate sul file `.env`). Si considerino quindi solo i seguenti casi d'uso, specifici per l'utente Admin, da sommare ai casi d'uso appena elencati.

=== UC06: Login Admin
#figure(image("/images/uc/loginFormAdmin.png"), caption: "Pagina di accesso Admin")

#figure(image("/images/uc/gantt.png"), caption: "Schermata di acesso Admin")

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

#figure(image("/images/uc/errPass.png"), caption: "Errore di accesso")

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

=== UC07: Visualizzazione homepage Admin

#figure(image("/images/uc/homeAdmin.png"), caption: "Visualizzazione homepage Admin")


*Attori coinvolti*

- *Attori Primari*: Utente Admin

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
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

#figure(image("/images/uc/tabellaUtenti.png"), caption: "Visualizzazione tabella lista utenti registrati")

*Attori coinvolti*
- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di GitHub sono disponibili e funzionanti.
- *Postcondizioni*:
  - L'utente Admin visualizza la tabella con la lista degli utenti registrati.

*Scenario principale*

- L'utente Admin accede alla homepage di amministrazione.
- Il sistema visualizza la tabella con la lista degli utenti registrati.

*Estensioni*

- UC7.1.1: Visualizzazione messagio per lista vuota.
- UC7.1.2: Visualizzazione messaggio di errore se il caricamento della lista fallisce.

*User Story*

- Come utente Admin, voglio visualizzare la lista degli utenti registrati per gestire gli utenti del sistema.

==== UC7.1.1: Visualizzazione messaggio per lista vuota

#figure(image("/images/uc/noUser.png"), caption: "Errore lista utenti vuota")

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di GitHub sono disponibili e funzionanti.
  - Non ci sono utenti registrati nel sistema.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio che informa l'utente che la lista è vuota.

*Scenario principale*

- L'utente Admin accede alla homepage di amministrazione.
- Il sistema verifica se ci sono utenti registrati.
- Non ci sono utenti registrati, il sistema visualizza un messaggio che informa l'utente che la lista è vuota.

*User Story*

- Quando non ci sono utenti registrati, il sistema mostra un messaggio che informa l'utente Admin che la lista è vuota.

==== UC7.1.2: Visualizzazione messaggio di errore se il caricamento della lista fallisce

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di GitHub sono disponibili e funzionanti.
  - Si è verificato un errore durante il caricamento della lista degli utenti registrati.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio di errore.

*Scenario principale*

- L'utente Admin accede alla homepage di amministrazione.
- Il sistema tenta di caricare la lista degli utenti registrati.
- Si verifica un errore durante il caricamento della lista.
- Il sistema visualizza un messaggio di errore.

*User Story*

- Se il caricamento della lista degli utenti registrati fallisce, il sistema mostra un messaggio di errore per informare l'utente Admin.

==== UC07.2: Visualizzazione tab gestione laboratorio

#figure(image("/images/uc/graph3.png"), caption: "vsiualizzazione tab gestione laboratorio")

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: Firebase, GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di GitHub sono disponibili e funzionanti.
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

#figure(image("/images/uc/buttons.png"), caption: "Pulsanti per la gestione degli step del laboratorio")

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: Firebase, GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di GitHub sono disponibili e funzionanti.
- *Postcondizioni*:
  - L'utente Admin visualizza i pulsanti per la gestione degli step del laboratorio.

*Scenario principale*
- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza i pulsanti per la gestione degli step del laboratorio.
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
  - Il sistema ha caricato _`currentStep`_ correttamente.
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
  - Il sistema ha caricato _`currentStep`_ correttamente.
  - _`currentStep`_ >= 1
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
  - Le API di GitHub sono disponibili e funzionanti.
  - Il sistema ha caricato _`currentStep`_ correttamente.
  - L'utente Admin ha cliccato sul pulsante per l'azzeramento delle statistiche.
- *Postcondizioni*:
  - Il pulsante per l'azzeramento delle statistiche resetta _`users.json`_ e _`chartAnswer.json`_ (maggiori informazioni su questi due file e il loro scopo sono elencate al #link(<json>)[#text(fill: blue, "prossimo capitolo")]).

*Scenario Principale*

- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza il pulsante per l'azzeramento delle statistiche.
- L'utente Admin può interagire con il pulsante per azzerare le statistiche.
- _`users.json`_ e _`chartAnswer.json`_ vengono resettati.

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
  - Il sistema ha caricato _`currentStep`_ correttamente.
  - L'utente Admin ha cliccato sul pulsante per il reset degli step.
- *Postcondizioni*:
  - Il pulsante per il reset degli step resetta _`currentStep`_ a 0.

*Scenario principale*

- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza il pulsante per il reset degli step.
- L'utente Admin può interagire con il pulsante per resettare gli step in maniera rapida.
- _`currentStep`_ viene resettato a 0.

*User Story*
- Come utente Admin, voglio visualizzare il pulsante per il reset degli step per poter resettare gli step del laboratorio in modo rapido senza dover accedere al servizio di _information storage_ dove è contenuto il file _`step.json`_.

==== UC07.2.2: Visualizzazione Tab Grafici Step 3

#figure(image("/images/uc/graph3close.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di GitHub sono disponibili e funzionanti.
  - Il sistema ha caricato i dati di _`chartAnswer.json`_ correttamente.
- *Postcondizioni*:
  - L'utente Admin visualizza la Tab con i grafici delle risposte date dagli utenti nello step 3.

*Scenario principale*
- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza la Tab con i grafici delle risposte date dagli utenti nello step 3.
- L'utente Admin può interagire con i grafici per visualizzare le risposte date dagli utenti nello step 3.

*Estensioni*

- UC7.2.2.1: Visualizzazione messaggio di informazione se il file _`chartAnswer.json`_ è vuoto o avviene un errore generico.

*User Story*

- Come utente Admin, voglio visualizzare la Tab con i grafici delle risposte date dagli utenti nello step 3 per analizzare le risposte degli utenti e migliorare l'esperienza del laboratorio.


==== UC7.2.2.1: Visualizzazione messaggio di informazione se il file _`chartAnswer.json`_ è vuoto o avviene un errore generico

#figure(image("/images/uc/chartAnsErr.png"), caption: "Errore durante il caricamento dei dati")

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*
- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Il file _`chartAnswer.json`_ è vuoto o si
  - Le API di GitHub sono disponibili e funzionanti.verifica un errore durante il caricamento dei dati.
- *Postcondizioni*:
  - Il sistema visualizza un messaggio di informazione che indica che il file _`chartAnswer.json`_ è vuoto.

*Scenario principale*

- L'utente Admin accede alla Tab con i grafici delle risposte date dagli utenti nello step 3.
- Il sistema tenta di caricare i dati dal file _`chartAnswer.json`_.
- Il file _`chartAnswer.json`_ è vuoto o si verifica un errore durante il caricamento dei dati.
- Il sistema visualizza un messaggio di informazione che indica che il file _`chartAnswer.json`_ è vuoto.

*User Story*

- Quando il file _`chartAnswer.json`_ è vuoto o si verifica un errore durante il caricamento dei dati, il sistema mostra un messaggio di informazione per informare l'utente Admin che non ci sono dati disponibili per lo step 3.

==== UC07.2.3: Visualizzazione Tab Grafici Step 4

#figure(image("/images/uc/graph4.png"), caption: "UC08: Salvataggio user")

*Attori coinvolti*

- *Attori Primari*: Utente Admin
- *Attori Secondari*: GitHub

*Precondizioni e Postcondizioni*

- *Precondizioni*:
  - Il sistema è connesso e funzionante.
  - L'utente Admin è autenticato.
  - Le API di GitHub sono disponibili e funzionanti.
  - Il sistema ha caricato i dati di _`chartAnswer.json`_ correttamente.
- *Postcondizioni*:
  - L'utente Admin visualizza la Tab con i grafici delle risposte date dagli utenti nello step 4.

*Scenario principale*

- L'utente Admin accede alla Tab con le informazioni di laboratorio.
- Il sistema visualizza la Tab con i grafici delle risposte date dagli utenti nello step 4.
- L'utente Admin può interagire con i grafici per visualizzare le risposte date dagli utenti nello step 4.

*Estensioni*

- UC7.2.2.1: Visualizzazione messaggio di informazione se il file _`chartAnswer.json`_ è vuoto o avviene un errore generico.

*User Story*

- Come utente Admin, voglio visualizzare la Tab con i grafici delle risposte date dagli utenti nello step 4 per analizzare le risposte degli utenti e migliorare l'esperienza del laboratorio.
