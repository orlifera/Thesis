#import "@preview/glossarium:0.5.4": make-glossary, register-glossary, print-glossary, gls, glspl

#show: make-glossary

#let entry-list = (
  (
    key: "WebApp",
    description: "Applicazione Web",
  ),
  (
    key: "Drag and Drop",
    description: "Lett. trascina e rilascia. Tecnica utilizzata in alcune applicazioni web dove l'utente deve prendere con il mouse (o il dito se da mobile) un componente del sito stesso e spostartlo in un'altra area predefinita.",
  ),
  (
    key: "Way of Working",
    description: "Modalità di lavoro. In questo caso, si riferisce alla modalità di lavoro adottata da un team di sviluppo software.",
  ),
)

#register-glossary(entry-list)
