#import "@preview/glossarium:0.5.4": make-glossary, register-glossary, print-glossary, gls, glspl
#import "./entries.typ": entry-list

#show: make-glossary
#register-glossary(entry-list)

#pagebreak(to: "odd")
#set heading(numbering: none)

= Glossario
<cap:glossary>

#print-glossary(entry-list)
