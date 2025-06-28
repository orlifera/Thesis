#import "@preview/glossarium:0.5.4": make-glossary, register-glossary, print-glossary, gls, glspl

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
)

#register-glossary(entry-list)
