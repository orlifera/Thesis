#import "./config/variables.typ": *
#import "./config/thesis-config.typ": *

//config
#show: config.with(
  myAuthor: myName,
  myTitle: myTitle,
  myLang: myLang,
)

#include "structure.typ"
