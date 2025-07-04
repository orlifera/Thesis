#import "@preview/glossarium:0.5.4": gls, glspl, make-glossary, print-glossary, register-glossary

#show: make-glossary

#let entry-list = (
  (
    key: "WebApp",
    description: "abbr. Applicazione Web",
  ),
  (
    key: "Lettori e Scrittori",
    description: "Lettori e scrittori. Problema di sincronizzazione in cui più processi (lettori) possono leggere le informazioni condivise, ma solo un processo (scrittore) può modificarle.",
  ),
  (
    key: "Way of Working",
    description: "Modalità di lavoro. In questo caso, si riferisce alla modalità di lavoro adottata da un team di sviluppo software.",
  ),
  (
    key: "Cybersecurity",
    description: "ing. Sicurezza informatica. Ramo dell'informatica che si occupa della protezione dei sistemi informatici e delle reti da attacchi, danni o accessi non autorizzati.",
  ),
  (
    key: "Web Development",
    description: "ing. Sviluppo web. Processo di creazione e manutenzione di siti web e applicazioni web.",
  ),
  (
    key: "Git",
    description: "Sistema di controllo versione distribuito. Permette di tenere traccia delle modifiche apportate a file e cartelle nel tempo.",
  ),
  (
    key: "GitHub",
    description: "Piattaforma di hosting per progetti software che utilizza Git come sistema di controllo versione. Permette la collaborazione tra sviluppatori e la gestione del codice sorgente.",
  ),
  (
    key: "Piano di Lavoro",
    description: "Piano di lavoro. Documento che descrive le attività e gli obiettivi di un tirocinio o di un progetto.",
  ),
  (
    key: "sprint",
    description: "Sprint. Periodo di tempo definito in cui un team di sviluppo (o in questo caso, un solo dev) lavora per completare un insieme specifico di attività o obiettivi.",
  ),
  (
    key: "backlog",
    description: "Backlog. Elenco di attività o funzionalità da completare in un progetto. In questo caso, si riferisce all'elenco delle funzionalità e dei bug da risolvere nel progetto.",
  ),
  (
    key: "Kanban",
    description: "Sistema di gestione del lavoro che utilizza schede per visualizzare il flusso di lavoro e le attività in corso.",
  ),
  (
    key: "Scrum",
    description: "Framework Agile per la gestione dei progetti. Si basa su iterazioni brevi (sprint) e su riunioni regolari per monitorare i progressi.",
  ),
  (
    key: "ReactJS",
    description: "Libreria JavaScript per la creazione di interfacce utente. Permette di costruire applicazioni web complesse e reattive in modo efficiente.",
  ),
  (
    key: "NextJS",
    description: "Framework React per lo sviluppo di applicazioni web. Permette il rendering lato server e la generazione statica delle pagine.",
  ),
  (
    key: "TailwindCSS",
    description: "Framework CSS per la creazione di interfacce utente reattive e personalizzabili. Utilizza classi utility per semplificare lo sviluppo front-end.",
  ),
  (
    key: "API",
    description: "Interfaccia di programmazione delle applicazioni. Permette la comunicazione tra diverse applicazioni o servizi.",
  ),
  (
    key: "server-side components",
    description: "Componenti lato server. Permettono di eseguire il rendering delle pagine sul server prima di inviarle al client, migliorando le prestazioni e l'ottimizzazione SEO.",
  ),
  (
    key: "SEO",
    description: "ing: Search Engine Optimization. Ottimizzazione per i motori di ricerca. Insieme di tecniche e pratiche per migliorare la visibilità di un sito web sui motori di ricerca.",
  ),
  (
    key: "proponente",
    description: "Colui che propone un progetto o un'idea. In questo caso, si riferisce all'Università di Padova",
  ),
  (
    key: "interfaccia utente (UI)",
    description: "Interfaccia utente. Parte di un'applicazione o di un sito web con cui l'utente interagisce direttamente.",
  ),
  (
    key: "Firebase",
    description: "Piattaforma di sviluppo di applicazioni web e mobili che offre servizi come database in tempo reale, autenticazione e hosting.",
  ),
  (
    key: "User Experience",
    short: "UX",
    description: "Esperienza utente. Rappresenta l'esperienza complessiva di un utente nell'interagire con un prodotto o un servizio, in questo caso Thinky.",
  ),
  (
    key: "responsive",
    description: "Responsive. Design reattivo. Approccio al design web che consente a un sito web di adattarsi a diverse dimensioni di schermo e dispositivi, garantendo una buona esperienza utente su desktop, tablet e smartphone.",
  ),
  (
    key: "accessibilità",
    description: "Accessibilità. Pratica di progettazione e sviluppo che mira a rendere i contenuti e le funzionalità di un sito web o di un'applicazione utilizzabili da tutti, comprese le persone con disabilità.",
  ),
  (
    key: "Framework",
    description: "Framework. Insieme integrato di componenti software e strumenti che forniscono una struttura di base per lo sviluppo di applicazioni. I framework semplificano e accelerano il processo di sviluppo, fornendo funzionalità predefinite e convenzioni da seguire.",
  ),
  (
    key: "Bottom-up",
    description: "Approccio Bottom-up. Approccio di sviluppo in cui si parte da una base di codice già esistente e lo si estende, piuttosto che partire da zero. Questo approccio consente di riutilizzare il codice esistente e di costruire su di esso.",
  ),
  (
    key: "Top-down",
    description: "Approccio Top-down. Approccio di sviluppo in cui si fornisce una struttura architetturale di base su cui costruire l'applicazione, piuttosto che partire da zero e costruire tutto da capo. Questo approccio consente di avere una visione d'insieme del progetto fin dall'inizio.",
  ),
  (
    key: "query",
    description: "Query. In informatica, una query è una richiesta di informazioni da un database o da un sistema di gestione dei dati. Le query vengono utilizzate per recuperare, inserire, aggiornare o eliminare dati in un database.",
  ),
  (
    key: "client",
    description: "Client. In un contesto di rete, il client è un dispositivo o un software, solitamente un browser o un'applicazione, che richiede servizi o risorse da un server. Il client invia richieste al server e riceve risposte contenenti i dati richiesti.",
  ),
  (
    key: "server",
    description: "Server. In un contesto di rete, il server è un dispositivo o un software che fornisce servizi o risorse ai client. Il server elabora le richieste dei client e restituisce le risposte contenenti i dati richiesti.",
  ),
  (
    key: "Backend as a Service",
    description: "Backand as Service. Servizio che fornisce un backend completo per le applicazioni, inclusi database, autenticazione e hosting, consentendo agli sviluppatori di concentrarsi sullo sviluppo del frontend.",
  ),
  (
    key: "server-side component",
    description: "Componenti lato server. Permettono di eseguire il rendering delle pagine sul server prima di inviarle al client, migliorando le prestazioni e l'ottimizzazione SEO.",
  ),
  (
    key: "open source",
    description: "Open source. Software il cui codice sorgente è reso disponibile al pubblico, consentendo a chiunque di utilizzarlo, modificarlo e distribuirlo liberamente.",
  ),
  (
    key: "blueprint",
    description: "Progetto di base. In questo caso, si riferisce al file layout.tsx che fornisce la struttura principale a tutte le pagine dell'applicazione.",
  ),
  (
    key: "utility-first",
    description: "Utility-first. Approccio di sviluppo CSS in cui si utilizzano classi predefinite per applicare stili specifici agli elementi HTML, semplificando la creazione di interfacce utente reattive e personalizzabili.",
  ),
  (
    key: "hook",
    description: "Hook. Funzione speciale in React che consente di utilizzare lo stato e altre funzionalità senza dover scrivere una classe. Gli hook semplificano la gestione dello stato e degli effetti collaterali nelle applicazioni React.",
  ),
  (
    key: "props",
    description: "Proprietà. In React, le props sono un modo per passare dati e funzioni dai componenti genitori ai componenti figli. L'equivalente dei parametri per le funzioni in altri linguaggi. I props consentono di personalizzare il comportamento e l'aspetto dei componenti.",
    plural: "props",
  ),
  (
    key: "tooltip",
    description: "Tooltip. Piccola finestra di testo che appare quando si passa il mouse su un elemento, fornendo informazioni aggiuntive o suggerimenti sull'elemento stesso.",
  ),
)

#register-glossary(entry-list)
