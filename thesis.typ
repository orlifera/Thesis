#import "./config/variables.typ": *
#import "./config/thesis-config.typ": *

//config
#show: config.with(
  myAuthor: myName,
  myTitle: myTitle,
  myNumbering: "1.1",
  myLang: myLang,
)

#include "structure.typ"
