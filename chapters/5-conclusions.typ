#pagebreak(to: "odd")
#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(figure.where(kind: raw)).update(0)
  it
}
#set math.equation(numbering: num => "(" + (str(counter(heading).get().at(0)) + "." + str(num)) + ")")
#set figure(numbering: num => str(counter(heading).get().at(0)) + "." + str(num))

= Conclusioni
<conclusions>

#text(
  style: "italic",
  [
    Riassume le considerazioni finali, riassumendo gli scopi, le scelte e le lezioni apprese, e propone possibili sviluppi futuri.
  ],
)
#v(2em)
== Lo scopo e le scelte

Thinky è un progetto di stage universitario nato con l'obiettivo di sostituire i software attualmente utilizzati per le attività di OpenDay dell'Università di Padova, creando una WebApp interattiva proprietaria dell'ateneo con cui gli studenti potessero approcciarsi al mondo dell'informatica risolvendo alcuni problemi canonici, sotto la guida dei professori del corso.

Il progetto vuole inoltre essere un monito per gli studenti che si trovano a dover scegliere un percorso di studi non in linea con il loro curriculum da studente, dimostrando come anche senza conoscenze specifiche, ma con la voglia di imparare e di mettersi in gioco, si possa intraprendere un percorso da informatico.

La scelta di realizzare un progetto di questo tipo è stata per me importante, in quanto io stesso mi sono trovato a scegliere questo percorso di studi senza una pregressa conoscenza del mondo dell'informatica, e senza sapere se fosse la scelta giusta per me. Mi è sembrato quindi importante realizzare un progetto che possa essere utile a tutti gli studenti futuri che si vogliono 'gettare' in questo mondo ma insicuri perché mancano di conoscenze specifiche.

Tutte le scelte atte durante lo svolgimento del progetto sono state tutte mirate non solo al raggiungimento degli obiettivi prefissati, e quindi al completamento del mio percorso (accademico e di stage), ma anche a garantire che un prodotto di qualità fosse consegnato, e soprattutto con la consapevolezza che la qualità che il prodotto che ho realizzato avrebbe avuto un impatto positivo su studenti che, come me in passato, si trovano a dover compiere una scelta tutt'altro che semplice, in un campo in cui la competenza, ma non la voglia di fare e le conoscenze, viene meno.

Scegliere un percorso di studi, un lavoro, o qualsiasi altra attività, è un passo importante, e spesso difficile da compiere. Per questo motivo, ho cercato di realizzare un prodotto che potesse essere utile a chiunque si trovasse in questa situazione.

Con questo progetto, e di conseguenza le scelte (tecniche e non), ho cercato di rappresentare concretamente questa difficoltà, spingendomi in ogni cosa al di fuori della mia _comfort zone_, adottando tecnologie e pratiche con cui non avevo mai avuto a che fare, o con le quali non avevo esperienza. Questo ha portato ad un prodotto che, sebbene potrebbe non risultare perfetto, è stato realizzato con cura e attenzione ai dettagli, e con lo scopo di dimostrare che tutto è possibile, se l'impegno è abbastanza forte.

== Copertura dei requisiti

Alla fine dello sviluppo del progetto, è stato effettuato un controllo della copertura dei requisiti, per verificare che tutti i quelli definiti fossero stati implementati correttamente. La copertura dei requisiti è stata calcolata come rapporto tra il numero di requisiti implementati e il numero totale di requisiti definiti.

Considerando NR il numero totale di requisiti definiti e NI il numero di requisiti implementati, la copertura dei requisiti è stata calcolata come segue:

$
  "Copertura Requisiti" = ("NR" / "NI" ) * 100
$

Dove:
- NR = 9, obiettivi richiesti, come dal capitolo #link(<objectives>)[#text(fill: blue, "Obiettivi del progetto")].
- NI = 9, obiettivi effettivamente implementati.

È stata raggiunta una copertura del 100%, in quanto tutti i requisiti definiti sono stati implementati correttamente. Questo garantisce che il sistema soddisfi le aspettative minime e le esigenze degli utenti, come definito nei casi d'uso e nelle user story, oltre che ad avere tutti gli 'extra' menzionati.


== Sviluppi futuri

Come mostrato nella sezione precedente, il progetto ha raggiunto tutti gli obiettivi prefissati, e quindi non sono previsti sviluppi futuri a terminazione di questo progetto. Tuttavia, ci sono sicuramente funzionalità aggiuntive che potrebbero essere implementate in futuro, per migliorare ulteriormente l'esperienza utente e le funzionalità del sistema, come ad esempio:

- Implementazione di un sistema di feedback per raccogliere le opinioni degli utenti e migliorare il sistema in base alle loro esigenze.
- Aggiunta di funzionalità di personalizzazione del profilo utente.
- Nuovi problemi da risolvere, per rendere il laboratorio sempre più interessante e stimolante per gli studenti.

== Valutazioni personali

Durante queste settimane di stage, ho avuto l'opportunità di lavorare su un progetto che mi ha permesso di mettere in pratica le conoscenze acquisite durante il mio percorso di studi, e di imparare nuove tecnologie e pratiche che non avevo mai affrontato prima.

Ho imparato molto e non solamente dal punto di vista tecnico, ma anche a livello personale.

Ho imparato ad organizzarmi, a gestire il mio tempo e a lavorare in modo efficacie ed efficiente.

Ho imparato a non essere frettoloso, a non avere paura di chiedere aiuto quando ne ho bisogno, e a non arrendermi di fronte alle difficoltà.

Ho avuto la fortuna di avere una Tutor che mi ha supportato e guidato durante tutto il percorso, e che mi ha permesso di crescere e migliorare, mantenendo sempre alta la qualità del lavoro svolto.

Infine, ritengo che il prodotto realizzato sia di qualità, e che possa essere considerato un ottimo strumento per le attività di OpenDay dell'Università di Padova, e per gli studenti che si trovano a dover scegliere un percorso di studi.
