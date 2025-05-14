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
    key: "ReactJS",
    description: "Libreria JavaScript per la creazione di interfacce utente. Permette di costruire applicazioni web complesse e reattive in modo efficiente.",
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
)

#register-glossary(entry-list)
