#import "@preview/glossarium:0.5.4": gls, make-glossary
#import "../appendix/entries.typ": entry-list
#import "../config/variables.typ": *
#import "@preview/codelst:2.0.2": sourcecode
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
#set figure(numbering: num => str(counter(heading).get().at(0)) + "." + str(num))

#let glossary(word) = {
  let t = gls(word) + sub("G")
  text(fill: rgb("#3354c1"), t)
}


#pagebreak()

= Implementazione
<cap:stage-description>

#v(1em)
#text(
  style: "italic",
  [
    Espone come le scelte descritte nel capitolo precedente sono state implementate, attraverso una panoramica del codice sorgente, delle tecnologie utilizzate, delle feature di accessibilità e delle best practices attuate durante il processo di sviluppo.
  ],
)
#v(1em)
<json>

Il progetto Thinky è stato sviluppato seguendo le linee guida e le best practices del _Web Development_, con particolare attenzione all'accessibilità e alla facilità d'uso. In questo capitolo, verranno presentate le tecnologie utilizzate, le scelte progettuali adottate e una panoramica del codice sorgente.

Il progetto ha un architettura a componenti, come da standard di #glossary("ReactJS"). Ogni componente è responsabile di una parte specifica dell'interfaccia utente e della propria logica e può essere riutilizzato in diverse parti dell'applicazione.

Queste scelte sono state fatte tenendo conto del concetto di riuso, ovvero quella pratica di utilizzare parti di codice già esistenti per evitare di riscrivere codice già funzionante, e di modularità, che permette di suddividere il codice in moduli indipendenti e riutilizzabili. Questo approccio consente di mantenere il codice organizzato e facilmente manutenibile, facilitando anche l'aggiunta di nuove funzionalità in futuro. Il riuso durante la progettazione può essere ottemperato in due modi differenti:

- Progettare _con_ riuso, ovvero progettare il codice ed utilizzare librerie di componenti già pronti in modo che possa essere facilmente riutilizzato in altre parti dello stesso progetto. Questo approccio è più semplice, in quanto non richiede una conoscenza anticipata di bisogni futuri, ma richiede comunque una buona organizzazione del codice e una buona documentazione.
- Progettare _per_ riuso, ovvero progettare il codice in modo che possa essere facilmente riutilizzato in altri progetti o contesti. Questo approccio è difficile, in quanto implica una conoscenza anticipata di bisogni futuri e di come il codice potrebbe essere utilizzato in altri contesti. Tuttavia, è possibile adottare alcune best practices per facilitare il riuso del codice.

== Tecnologie: scelte e implementazione

Data la natura tecnica del progetto, i sui scopi (si veda il #link(<stage-purpose>)[#text(fill: blue, "capitolo secondo")]), e tutte le motivazioni elencate sopra, la scelta più ovvia per le tecnologie da utilizzare era quella di optare per i #glossary("Framework"). Questi rendono il processo di sviluppo più veloce e semplice, fornendo una struttura di base su cui costruire l'applicazione. Inoltre, i framework offrono anche funzionalità predefinite e convenzioni da seguire, che semplificano ulteriormente lo sviluppo. I framework, a livello architetturale e di sviluppo sono considerati:
- #glossary("Bottom-up"): perché partono da una base di codice già esistente e lo estendono, piuttosto che partire da zero.
- #glossary("Top-down"): perché forniscono una struttura architetturale di base su cui costruire l'applicazione, piuttosto che partire da zero e costruire tutto da capo.


Queste tecnologie sono state scelte tenendo conto di conoscenze pregresse acquisite durante il corso di _Ingegneria del Software_, e delle tecnologie più moderne e adatte al contesto del progetto. Inoltre, sono state scelte anche in base alla loro popolarità e diffusione nel mondo dello sviluppo web, in modo da garantire una rapida curva di apprendimento per altri studenti che potrebbero voler contribuire al progetto in futuro. I linguaggi, le librerie e i vari framework utilizzati sono comunque stati approvati dalla #myProf, che ha supervisionato e guidato le scelte tecniche durante tutto il processo di sviluppo.

=== Typescript

Typescript#sub[@typescript] @ts è alla base del progetto. È il linguaggio di programmazione utilizzato per tutto il progetto in ogni sua parte. Questo linguaggio è un _superset_ (estensione) di JavaScript che aggiunge una forte tipizzazione statica che permette di evitare errori di tipo durante lo sviluppo, migliorando la qualità del codice e la sua manutenibilità. Inoltre, Typescript offre funzionalità avanzate come le interfacce, le classi e i moduli, che semplificano la scrittura di codice complesso e facilitano il riuso. Il fatto che sia un _superset_ di JavaScript permette di utilizzare tutte le librerie e i framework basati su JavaScript, rendendolo estremamente versatile e compatibile con il vasto ecosistema di librerie e strumenti disponibili per lo sviluppo web.

#figure(caption: "Logo di typescript", image(
  "/images/loghi/ts.png",
  fit: "contain",
  width: 10em,
))<ts>

#pagebreak()


=== Axios

Axios#sub[@axios] @ax è una libreria JavaScript per effettuare richieste HTTP. È stata scelta per la sua semplicità e facilità d'uso, oltre alla sua capacità di gestire le richieste in modo asincrono. Axios permette di effettuare chiamate alle #glossary("API") in modo semplice e intuitivo, gestendo automaticamente la serializzazione dei dati e la gestione degli errori. Inoltre, supporta anche le richieste cancellabili e la gestione dei token di autenticazione, rendendolo una scelta ideale per il progetto Thinky.

#figure(
  image(
    "/images/loghi/axios.png",
    fit: "contain",
    width: 10em,
  ),
  caption: "Logo di Axios",
)<ax>


Durante il progetto Axios è stata usata per effettuare chiamate HTTP alle #glossary("API") di #glossary("GitHub").

Le richieste HTTP sono il meccanismo con cui un #glossary("client") comunica con un #glossary("server") per richiedere risorse o inviare dati. Ogni richiesta HTTP consiste in un metodo (come GET, POST, PUT, DELETE) e un URL che identifica la risorsa richiesta. Le richieste possono anche includere intestazioni (headers) e un corpo (body) contenente dati aggiuntivi. Le risposte del server contengono uno stato (status code), intestazioni e, facoltativamente, un corpo con i dati richiesti.

In particolare, le richieste HTTP sono state utilizzate per recuperare i dati dai file JSON presenti nella repository di GitHub, che contengono le informazioni sui laboratori e le risposte degli utenti.


Le HTTP Requests sono state effettuate in modo asincrono, utilizzando le funzionalità di #code-pill("async/await") di Typescript, che permettono di scrivere codice asincrono in modo più leggibile e comprensibile. Inoltre, Axios gestisce automaticamente la serializzazione dei dati e la gestione degli errori, semplificando ulteriormente il processo di sviluppo.

Per fare Le richieste con Axios, viene creato un file typescript dove vengono definite le variabili @var da utilizzare nella #glossary("query").
Nel mio caso, ho creato il file #code-pill("gh.ts") e poi ho creato le seguenti variabili:

#figure(
  image(
    "../images/code/variables.png",
    fit: "contain",
    width: 45em,
  ),
  caption: "Variabili per le richieste Axios",
) <var>

Per fare le richieste su una specifica _Repo_ di _GitHub_ però, è necessario creare un _secret token_ @env sul proprio profilo di GitHub. Questo verrà usato dai servizi per confermare la propria identità, confermando che sia l'effettivo proprietario della repo a fare queste _HTTP Requests_. Questo token viene poi salvato in un file #code-pill(`.env`) che non viene mai caricato su GitHub, per evitare che altri possano utilizzarlo per accedere ai dati della propria repo. Il file #code-pill(`.env`) contiene le variabili d'ambiente necessarie per l'autenticazione e la configurazione del progetto.

#figure(
  sourcecode(
    ```env
    NEXT_PUBLIC_GITHUB_TOKEN=token_segretrissimo
    ```,
  ),
  caption: "Esempio di file `.env`",
) <env>

Per un miglior mantenimento del codice, prima di ogni chiamata di funzione, viene controllato se il token è creato con questa _flag_ @flag:

#figure(caption: "Controllo del token GitHub", image(
  "../images/code/env.png",
  fit: "contain",
  width: 45em,
))<flag>

Viene poi creata l'istanza base di Axios @in, che contiene le informazioni di base per effettuare le richieste:

#figure(
  image(
    fit: "contain",
    "../images/code/axios.png",
    width: 45em,
  ),
  caption: "Istanza base di Axios",
)<in>

Nel caso di #code-pill("users.json"), viene effettuata una richiesta #code-pill("GET")@get per recuperare i dati degli utenti:

#figure(
  sourcecode(
    ```ts
        //richiesta GET per recuperare i dati degli utenti
    export const fetchUsers = async (): Promise<User[]> => {
        try {
            const response = await githubApi.get(`/repos/${OWNER}/${REPO}/contents/${FILE_PATH}`);
            const content = JSON.parse(atob(response.data.content)); // Decode Base64
            return content.map((user: User) => ({
                ...user,
                date: user.date,
            }));
        } catch (error) {
            console.error("Failed to fetch users:", error);
            throw new Error("Could not fetch users");
        }
    };
    ```,
  ),
  caption: "Richiesta GET per recuperare i dati degli utenti",
)<get>

Mentre per scrivere sul file i dati degli utenti appena registrati, viene effettuata una richiesta #code-pill("PUT").

Tutti i dati mandati e richiesti sono crittografati in #code-pill("Base64"), per evitare che i dati possano essere letti da chiunque abbia accesso alla repo. Questo è un passaggio fondamentale per garantire la sicurezza dei dati degli utenti e per proteggere la privacy degli stessi. Vengono poi utilizzate le funzioni #code-pill("btoa") e #code-pill("atob") per codificare e decodificare i dati in Base64. Queste funzioni sono disponibili in TypeScript e permettono di convertire i dati in una stringa Base64, che può essere facilmente trasmessa attraverso le richieste HTTP.


=== Firebase

Firebase#sub[@firebase] @fb è un servizio di Google che fornisce un #glossary("Backend as a Service") (BaaS) per lo sviluppo di applicazioni web e mobili. I servizi BaaS sono una soluzione cloud che fornisce tutte le funzionalità tipiche di un backend, senza la necessità di doverlo creare manualmente e averne l'infrastruttura.

#figure(
  image(
    "/images/loghi/firebase.png",
    fit: "contain",
    width: 10em,
  ),
  caption: "Logo di Firebase",
)<fb>

Nel caso di Thinky, Firebase è stato utilizzato per sopperire alle mancanze di GitHub, che non permetteva di avere un aggiornamento live dei dati. Questo è dovuto al fatto che GitHub è un servizio di versionamento del codice, e non un database in tempo reale, e inoltre la funzione #code-pill("fetchStep") è contenuta in un #glossary("server-side component") di NextJS e che quindi veniva eseguito solo una volta al caricamento della pagina. Inoltre, GitHub ha un ritardo sulle richieste dovuto al CDN Caching.

Per creare un database con Firebase, tutto quello che serve è creare un progetto sul sito ufficiale di Firebase e configurare il file #code-pill("firebase.ts") @fbts con le credenziali del progetto. Il file #code-pill("firebase.ts") contiene le informazioni necessarie per connettersi al database Firebase e per utilizzare i servizi offerti da Firebase, come l'autenticazione e il database in tempo reale.

#figure(caption: "File `firebase.ts`", image(
  "../images/code/firebase.png",
  fit: "contain",
  width: 35em,
))<fbts>

Questo file viene automaticamente generato da Firebase quando si crea il nuovo progetto. Per aggiornare i dati in tempo reale, viene utilizzato il database Firestore di Firebase, che permette di avere un database NoSQL in tempo reale, con la possibilità di effettuare query e aggiornamenti in modo semplice e veloce.

Per vedere _live_ i dati aggiornati, viene utilizzato il metodo #code-pill("onSnapshot()") di Firestore, che permette di ascoltare le modifiche ai dati in tempo reale e di aggiornare l'interfaccia utente di conseguenza. Questo metodo è molto utile per Thinky, perché azzera il _delay_ che GitHub aveva nell'aggiornare lo step, garantendo così la stessa esperienza fluida e divertente ad ogni studente.

#figure(caption: "Utilizzo di `onSnapshot()` per aggiornare i dati in tempo reale", sourcecode(
  ```ts
  useEffect(() => {
          const unsubscribe = onSnapshot(
              doc(db, "lab", "step"),
              (snap) => {

                  setCurrentStep(snap.data()?.currentStep ?? 0)
                  setError(null)

              },
              (err) => {
                  setError(err)
                  setCurrentStep(null)
              }
          )
          return () => unsubscribe()
      }, [])
  ```,
))

=== GitHub

GitHub#sub[@github] @gh è una piattaforma di hosting per il controllo di versione e la collaborazione, che permette di gestire progetti software e di tenere traccia delle modifiche al codice sorgente. È stata scelta per il progetto Thinky per la sua popolarità e per le sue funzionalità avanzate di gestione del codice, ma anche come "backend" fittizio.

È stato deciso di utilizzare GitHub come "backend" fittizio per il progetto Thinky, in quanto non era necessario un vero e proprio backend per il progetto. Avendo inizialmente deciso di non utilizzare un database, GitHub era la scelta più ovvia per gestire i dati del progetto, reperendoli quando necessario attraverso le sue API, dando così un valore aggiunto alla WebApp.

I dati reperiti dalle API di GitHub sono stati:

- Avatar degli utenti, per mostrare le immagini dei profili degli studenti che hanno partecipato al laboratorio nella navbar.
- Risposte degli utenti, per mostrare il conto delle risposte degli utenti nell'area admin.

Tutte le informazioni sono state salvate in file JSON all'interno di una repository di GitHub separata da quella del codice sorgente, che sono stati poi letti e scritti tramite le API di GitHub.

IN particolare, per reperire le immagini degli avatar, è stata creata una funzione che prendeva come parametro il nome utente scelto durante la registrazione e lo inseriva all'interno dell'URL della cartella contenente le immagini degli avatar, in modo che prendesse quella corrispondente al nome utente scelto. Le immagini degli avatar sono state salvate in una cartella chiamata `avatars` all'interno della repository di GitHub.

COMMENTO: Non so se menzionare qua la differenziazione del nome utente (generato random o scelto dall'utente) e come questo influisce sulla scelta dell'avatar. Qua si parla di GitHub, forse ha più senso metterlo in una sezione separata, lei che dice?

Per le risposte degli utenti, invece, è stato creato un file JSON chiamato `chartAnswer.json` che contiene il numero di risposte per ogni domanda. Questo file viene aggiornato ogni volta che l'utende admin avanza di step, in modo da tenere traccia delle risposte degli utenti in tempo reale.

GitHub, come anticipato, è stato utilizzato anche nel suo ruolo principale, quindi di Version Control System. L'utilizzo di GitHub ha permesso di tenere traccia delle modifiche al codice sorgente, di poter tornare indietro nel caso di _breaking changes_ e di tenere traccia dei progressi attraverso le Issues.

#figure(
  image(
    "../images/loghi/Octicons-mark-github.svg",
    fit: "contain",
    width: 7em,
  ),
  caption: "Logo di GitHub",
)<gh>

=== ShadCN
<shadcn>
ShadCN#sub[@shadcn-docs] @sn è una libreria di componenti User Interface #glossary("open source") basata su ReactJS e TailwindCSS progettata per fornire componenti UI moderni, accessibili e facilmente personalizzabili.È stata scelta per Thinky per svariati motivi, primo tra cui l'accessibilità.

Infatti, ShadCN è progettata per essere accessibile e conforme agli standard WCAG (Web Content Accessibility Guidelines), garantendo che tutti gli utenti possano utilizzare l'applicazione senza difficoltà.

Questa era una prerogativa fondamentale del progetto, in quanto volevo garantire il facile utilizzo della piattaforma a tutti glu studenti, senza esclusioni.

Un'altra motivazione importante è stata la facilità di personalizzazione dei componenti con TailwindCSS e il loro adattamento al tema chiaro e a quello scuro. Infatti, ogni componente di ShadCN è predisposto con delle classi CSS generiche, che vengono definite dopo dallo sviluppatore nel file #code-pill("globals.css"), permettendo così di personalizzare facilmente l'aspetto dei componenti senza dover riscrivere il codice sorgente della libreria.

ShadCN inoltre mette a disposizione una semplice logica per il cambio tema della pagina. Creando un #code-pill("ThemeProvider") @tp, da utilizzare nel layout @lt, questo verrà applicato ad ogni pagina, e di conseguenza ad ogni componente di essa, garantendo una coerenza visiva e una facile gestione del tema scelto dall'utente.

#figure(
  image(
    "../images/code/theme.png",
    fit: "contain",
    width: 35em,
  ),
  caption: "Esempio di ThemeProvider di ShadCN",
)<tp>

#figure(caption: "Esempio di layout.tsx con ThemeProvider", sourcecode(
  ```ts
  import { ThemeProvider } from '@/components/ThemeProvider';


  export default function RootLayout({
    children,
  }: Readonly<{
    children: React.ReactNode;
  }>) {
    return (
        <ThemeProvider
          attribute="class"
          defaultTheme="system"
          enableSystem
          disableTransitionOnChange
        >
            <div id="main-content" tabIndex={-1}>
              {children}
            </div>
        </ThemeProvider>
      )
    }
  ```,
))<lt>

In questo caso, #code-pill("{children}") indica tutto ciò che viene passato come contenuto del componente #code-pill("ThemeProvider"), e che quindi verrà avvolto, in gergo _wrappato_ dal tema scelto dall'utente. Questo permette di avere un tema coerente in tutta l'applicazione, senza dover ripetere il codice per ogni pagina o componente. ShadCN ha quindi permesso di avere uno stile coeso e coerente tra tutte le pagine, e grazie alla sua stretta integrazione con TailwindCSS, ha permesso di risparmiare tempo nello sviluppo dell'UI garantendo una maggior concentrazione di risorse nello sviluppo della logica e nello studio dei problemi di sincronizzazione.


#figure(
  image(
    "/images/loghi/shad.png",
    fit: "contain",
    width: 7em,
  ),
  caption: "Logo di ShadCN",
)<sn>

=== NextJS
<next>
NextJS#sub[@nextjs-docs] @nx è un framework di React utilizzato per lo sviluppo _fullstack_ di applicazioni web moderne e performanti. Questo framework offre di default molte funzionalità avanzate, utili per migliorare le performance del prodotto. Ad esempio il Server Side Rendering (SSR) delle componenti, che permette di renderizzare una pagina sul server prima di inviarla al client, migliorando le prestazioni e diminuendo il codice che il client deve interpretare, auemntando la velocità di caricamento della pagina stessa. Inoltre, NextJS offre anche la generazione statica delle pagine, che permette di creare pagine statiche a partire dai dati dinamici, migliorando ulteriormente le prestazioni e l'ottimizzazione SEO.

NextJS utilizza una struttura a file e cartelle per organizzare le pagine e i componenti dell'applicazione, rendendo facile la navigazione e la gestione del progetto. Mette anche a disposizione dei file di _default_ da utilizzare in diverse occorrenze.

#figure(
  image(
    "../images/loghi/next.png",
    width: 10em,
    fit: "contain",
  ),
  caption: "Logo di NextJS",
)<nx>

==== Layout.tsx
Il file #code-pill("layout.tsx")@lay è il più importnate di tutti, è l'unico file che non può mancare in un progetto (non a caso, Next lo crea automaticamente se viene cancellato). Deve essercene almeno uno, ed è il file che da la struttura principale a tutte le pagine dell'applicazione. Funge da _#glossary("blueprint")_ per tutte le pagine, permettendo di definire la loro struttura. Tutto ciò che viene incluso in un file #code-pill("layout.tsx") sarà riportato in ogni pagina che fa riferimento a quel file (possono esistere più file #code-pill("layout.tsx") in un progetto, ma ogni pagina può fare riferimento solo ad uno di essi, in base alla folder structure e alla posizione di suddetta pagina). Questo file è quindi fondamentale per garantire una struttura coerente e uniforme in tutta l'applicazione, e permette di definire le parti comuni a tutte le pagine, come il menu di navigazione, il footer e altre componenti condivise.
Come mostrato prima infatti, il #code-pill("ThemeProvider") viene inserito all'interno del file #code-pill("layout.tsx") principale, in modo da applicare il tema scelto dall'utente a tutte le pagine dell'applicazione.

Nel caso di Thinky sono stati creati tre file #code-pill("layout.tsx"):

- Il file #code-pill("layout.tsx") principale, che contiene la struttura di base dell'applicazione e il #code-pill("ThemeProvider").
- Il file #code-pill("layout.tsx") per la pagina di laboratorio.
- Il file #code-pill("layout.tsx") per le altre pagine.

COMMENTO: Come gli avatar, riguardo all'approfondimento di layout. metto qua o in una sezione a parte?

Questi verranno approfonditi nella #link(<layout>, text(fill: blue)[sezione apposita]).

#figure(caption: "Struttura del file Layout", image(
  "/images/techs/nested-layouts.png",
  fit: "contain",
  width: 35em,
))<lay>

Nell'immagine sopra, il file #code-pill("layout.tsx") principale è quello che si trova nella Root (#code-pill("app/") folder) del progetto, e contiene la struttura di base dell'applicazione. I file #code-pill("layout.tsx") secondari sono quelli che si trovano all'interno delle cartelle delle pagine (in questo caso #code-pill("Blog/")), e contengono la struttura specifica per quelle pagine. I file #code-pill("layout.tsx") si "sommano", ovvero ogni file #code-pill("layout.tsx") si applica a tutte le pagine che si trovano nella sua cartella e nelle sue sottocartelle, inclusi altri file #code-pill("layout.tsx"), creando una struttura ad albero.

==== page.tsx
Per creare le varie pagine, NextJS utilizza un sistema di routing _folder-based_, in cui ogni pagina è rappresnentata da un file #code-pill("page.tsx") all'interno di una cartella. Questo sistema permette di creare pagine in modo semplice e intuitivo, senza dover configurare manualmente le rotte dell'applicazione. Ogni file #code-pill("page.tsx") rappresenta una pagina dell'applicazione e viene automaticamente associato a una rotta corrispondente.

Il file #code-pill("page.tsx") è il file che contiene il codice della pagina. Ogni pagina dell'applicazione deve avere un file #code-pill("page.tsx") fatta eccezione per la pagina Home, che è contenuta nella Root del progetto, ed è visualizzata nella barra degli indirizzi con il "/" subito dopo il dominio:  `https://nextproject.com/`.

Tutti i file #code-pill("page.tsx") devono essere esportati come componenti React, in modo da poter essere renderizzati correttamente da NextJS, e si attengono alla struttura definita nel file #code-pill("layout.tsx") più vicino.

Con "file più vicino" si intende il primo file #code-pill("layout.tsx") che si trova percorrendo a ritroso il percorso partendo dal file #code-pill("page.tsx") stesso verso la Root del progetto. Se non viene trovato nessun file #code-pill("layout.tsx") lungo il percorso, NextJS utilizzerà il file #code-pill("layout.tsx") principale, che si trova nella Root del progetto.


==== global-error.tsx

Il file #code-pill("global-error.tsx") @gb è un file speciale di NextJS che permette di gestire gli errori a livello globale dell'applicazione. Utile per creare una pagina di errore generica che viene visualizzata quando si verifica un errore in una qualsiasi pagina dell'applicazione. Questo file viene utilizzato per gestire gli errori in modo centralizzato, evitando di dover gestire gli errori in ogni singola pagina.

Una particolarità di questo file, è che ridefinisce i tag #code-pill("<html>") e #code-pill("<body>") della pagina in quanto sostituisce completamente il contenuto della pagina di errore, "auto-creando" il proprio layout.

Tutti gli "error-components" devono essere marcati come #code-pill("use client"), ovvero "client-side components", in quanto devono essere eseguiti sul client e non sul server.

#figure(
  image("../images/code/global-error.png", fit: "contain", width: 40em),
  caption: "global-error.tsx di Thinky",
)<gb>


Quindi, questo componente, verrà visualizzato ogni volta che si verifica un errore in Thinky. In particolare, la pagina mostrata sarà @global:

#figure(
  image("../images/uc/commonError.png", fit: "contain", width: 30em),
  caption: "Pagina di errore globale di Thinky",
)<global>

==== Server e Client components

In NextJS, per standard, tutti i #code-pill("layout.tsx") e tutti i file #code-pill("page.tsx") sono considerati _server-side components_, ovvero componenti che vengono eseguiti sul server e che possono accedere ai dati del server, come ad esempio le API o il database. Questi componenti vengono renderizzati sul server e poi inviati al client, dove vengono visualizzati.

I _server-side components_#sub[@ssc] permettono di effettuare il #code-pill("fetch") dei dati e di renderizzare parte della UI direttamente sul server, prima di arrivare al Client.

I _client components_#sub[@csc] invece, differiscono dai primi in quanto vengono eseguiti sul client e non sul server. Questi componenti possono essere utilizzati per gestire l'interazione con l'utente, come ad esempio la gestione degli eventi o la modifica dello stato dell'applicazione. I _client components_ sono marcati con la direttiva #code-pill("use client") all'inizio del file, e possono essere utilizzati all'interno dei _server-side components_.

=== TailwindCSS

TailwindCSS#sub[@tailwind] @tw è un framework CSS #glossary("utility-first") che permette di creare interfacce utente moderne e personalizzabili in modo semplice e veloce. È stato scelto per il progetto Thinky per la sua facilità d'uso, che permette allo sviluppatore di non preoccuparsi della specificità delle regole CSS in quanto le classi di Tailwind sono già create, ed esposte nella documentazione, e vengono inserite direttamente nel _markup_ HTML o TSX.

#figure(
  image(
    "/images/loghi/tailwind.png",
    fit: "contain",
    width: 7em,
  ),
  caption: "Logo di TailwindCSS",
)<tw>

Creare stili con Tailwind è molto semolice:
quando si vuole applicare lo stile ad un elemento, basta aggiungere la classe desiderata al tag stesso dell'elemento, poi il compilatore di Tailwind si occuperà di generare il CSS necessario per applicare lo stile desiderato. Questo approccio permette di creare interfacce utente in modo rapido e intuitivo, senza dover scrivere codice CSS complesso@html.

#figure(
  sourcecode[
    ```tsx
    <button id="test-button">
      Click me
    </button>
    ```
  ],
  caption: "HTML Esempio",
)<html>
Solitamente, in CSS base @css, per applicare degli stili a questo elemento si avrebbe:

#figure(
  sourcecode[```css
    #test-button {
      background-color: #3b82f6; /* blu-500 */
      color: white;
      font-weight: bold;
      padding: 0.5rem 1rem; /* py-2 px-4 */
      border-radius: 0.25rem; /* rounded */
    }
    #test-button:hover {
      background-color: #1d4ed8; /* blu-700 */
    }
    ```],
  caption: "Esempio di codice CSS per HTML",
)<css>

Mentre con TailwindCSS @tail, si avrebbe:
#figure(
  sourcecode[```tsx
    <button id="test-button" className="bg-blue-500 text-white font-bold
      py-2 px-4 rounded hover:bg-blue-700">
      Click me
    </button>
    ```],
  caption: "Esempio di codice TailwindCSS per HTML",
)<tail>

Questo approccio, oltre che ad essere più conciso, permette di applicare lo stile direttamente all'elemento, senza preoccupazioni di sovrascritture da parte di stili applicati ad altri elementi prima di questo.

=== LucideReact

LucideReact#sub[@lucide] @lr è una libreria di icone open source per ReactJS, che offre una vasta gamma di icone personalizzabili e facilmente integrabili nelle applicazioni web. È stata scelta per il progetto Thinky per la sua facilità d'uso e per la sua compatibilità con TailwindCSS, che permette di personalizzare le icone in modo semplice e veloce.

#figure(
  image(
    "/images/loghi/lucide.jpg",
    fit: "contain",
    width: 7em,
  ),
  caption: "Logo di LucideReact",
)<lr>

Per utilizzare LucideReact @lr2, dopo aver installato la libreria, basta importare l'icona desiderata come un componente ed applicare eventuali stili.

#figure(
  image(
    "../images/code/top.png",
    fit: "contain",
    width: 35em,
  ),
  caption: "Esempio di utilizzo di LucideReact che renderizza una freccia verso l'alto",
)<lr2>

=== DND Kit

DND Kit#sub[@dndkit] @dnd è una libreria di Drag and Drop per ReactJS che permette di creare interfacce utente interattive e dinamiche, con la possibilità di trascinare e rilasciare elementi all'interno dell'applicazione. È stata scelta per il progetto Thinky per la sua facilità d'uso e per la sua compatibilità con TailwindCSS, che permette di personalizzare gli stili degli elementi trascinabili in modo semplice e veloce.

Inoltre, DND Kit offre di default tutte le caratteristiche di accessibilità compatibili con gli standard WCAG, garantendo che tutti gli utenti possano utilizzare l'applicazione senza difficoltà. Questo è stato un aspetto fondamentale per il progetto Thinky, in quanto si voleva garantire il facile utilizzo della piattaforma a tutti gli studenti, senza esclusioni.

#figure(image("../images/loghi/logo.svg", fit: "contain", width: 7em), caption: "Logo di DND Kit")<dnd>
== Implementazione del codice e risultati

In questa sezione verranno presentate le scelte progettuali più importanti fatte durante lo sviluppo di Thinky, spiegando i motivi dietro a queste scelte e come sono state effettivamente implementate.

=== Registrazione

La prima cosa che uno studente è chiamato a fare quando apre Thinky, è la registrazione. Questo passaggio è fondamentale, sia per lo studente per poter iniziare ad utilizzare l'app, sia per l'utente admin, che potrà poi vedere le risposte degli studenti e gestire il laboratorio.

Le prerogative della registrazione erano che fosse semplice, e che non chiedesse dati personali, così da non dover gestire la privacy degli studenti come da GDPR.

Per questo motivo, è stata data l'opzione all'utente di generare uno username randomico, o di sceglierne uno personalizzato, che non dovesse obbligatoriamente essere il proprio nome. L'utente è informato di questa possibilità tramite un #glossary("tooltip") che appare al passaggio del mouse sull'icona delle informazioni al momento della registrazione. Inoltre, in questo _tooltip_ @tool'utente è informato che lo username deve essere rispettoso.

#figure(image("../images/uc/tolltip.png", fit: "contain", width: 30em), caption: "Tooltip di Thinky")<tool>

Per la registrazione è stato creato un form@form che richiede all'utente due informazioni:

- Il nome utente, che può essere generato randomicamente o scelto dall'utente.
- La scuola di provenienza, utile per tenere traccia degli studenti che partecipano al laboratorio.

#figure(
  image("../images/uc/registerForm.png", fit: "contain", width: 30em),
  caption: "Form di registrazione di Thinky",
)<form>

Per effettuare la registrazione, e controllare che lo username non sia già stato utilizzato, viene effettuata una richiesta #code-pill("PUT") al file #code-pill("users.json") presente nella repository di GitHub. Questo file contiene le informazioni degli utenti registrati, e viene aggiornato ogni volta che un nuovo utente si registra. In questo modo, si garantisce che ogni utente abbia uno username unico e che non ci siano conflitti tra gli utenti. Nel caso in cui lo username scelto dall'utente sia già stato utilizzato, viene mostrato un messaggio di errore e l'utente è invitato a scegliere un altro username. @usererror

#figure(
  image("../images/uc/taken.png", fit: "contain", width: 25em),
  caption: "Messaggio di errore per username già utilizzato",
)<usererror>

Il nome utente inoltre, prima di essere salvato, viene comparato ad una lista di parole scurrili, e se questo corrisponde ad una di esse viene mostrato un messaggio di errore @badwords e l'utente è invitato a scegliere un altro username.

#figure(
  image("../images/uc/badWords.png", fit: "contain", width: 25em),
  caption: "Messaggio di errore per username non rispettoso",
)<badwords>

Ogni campo del form è obbligatorio, e se l'utente non compila uno dei campi viene mostrato un messaggio di errore @emptyfield, invitando l'utente a compilare tutti i campi.
#figure(
  image("../images/uc/missingField.png", fit: "contain", width: 25em),
  caption: "Messaggio di errore per campi mancanti",
)<emptyfield>


=== Pagina Admin

La pagina admin @adminpage è la pagina a cui l'organizzatore dell'attività può accedere quando vuole gestire il laboratorio o vedere le risposte degli studenti.

#figure(image("../images/uc/homeAdmin.png", fit: "contain", width: 25em), caption: "Pagina admin di Thinky")<adminpage>

Questa pagina è accessibile attraverso un login con password @loginadmin. Anche in questo caso, è stato deciso di non chiedere dati personali, e di non utilizzare metodi di autenticazione complessi, optando quindi per una semplice password salvata sul un file #code-pill(".env").

#figure(
  image("../images/uc/loginFormAdmin.png", fit: "contain", width: 25em),
  caption: "Form di login per la pagina admin",
)<loginadmin>


Se la password inserita è corretta, l'utente viene reindirizzato alla pagina admin, altrimenti viene mostrato un messaggio di errore @wrongpass.

#figure(
  image("../images/uc/errPass.png", fit: "contain", width: 25em),
  caption: "Messaggio di errore per password errata",
)<wrongpass>

#pagebreak()

Questa pagina è suddivisa in due sezioni, raggruppate in due tab:

- Lista utenti@list, che mostra la lista di tutti gli utenti registrati, insieme alla data e alla scuola di provenienza.

#figure(image("../images/uc/homeAdmin.png", fit: "contain", width: 35em), caption: "Tab Lista Utenti")<list>


- Gestione laboratorio@labadmin, che mostra la sezione dedicata alla gestione degli step del laboratorio, e la visualizzazione dei grafici delle risposte.
#figure(image("../images/uc/graph3.png", fit: "contain", width: 35em), caption: "Tab Gestione Laboratorio")<labadmin>

I bottoni vengono usati per gestire gli step progressivi, in particolare permettono di:
- Avanzare di uno step.
- Tornare indietro di uno step.
- Resettare il laboratorio, cancellando tutti gli utenti e tutte le loro risposte.
- Resettare lo step corrente a 0.

=== Laboratorio

Il laboratorio è il fulcro centrale dell'esperienza per cui è nata l'idea di Thinky. L'attività, che deve durare circa 1 ora, è svolta insieme ad un docente, che spiega agli studenti man mano i problemi da risolvere, e che può decidere di fermarsi per spiegare meglio un concetto o per rispondere a domande degli studenti.
Il laboratorio è suddiviso in step, che corrispondono a problemi da risolvere, e che vengono mostrati agli studenti dinamicamente, in modo che gli studenti non possano accedere agli step successivi prima di aver risolto quello corrente. Questo permette di garantire che gli studenti non saltino i problemi e che seguano l'ordine corretto. Ogni step viene caricato manualmente dall'utente admin, che può decidere di avanzare di uno step o di tornare indietro, in base alle esigenze del laboratorio.

Gli step di laboratorio sono 6, da sommare a uno "step 0" che è la pagina iniziale in cui si spiega agli studenti cosa andranno a fare, e lo "step 7" che è una pagina che mostra agli studenti che hanno terminato il laboratorio. I 6 step interattivi sono così suddivisi:

- *Step 1*: Drag and Drop relativo al problema del "produttore-consumatore", in cui gli studenti devono trascinare i pezzi di codice nella giusta posizione per completare la struttura del Produttore.

- *Step 2*: Drag and Drop relativo al problema del "produttore-consumatore", in cui gli studenti devono trascinare i pezzi di codice nella giusta posizione per completare la struttura del Consumatore.

- *Step 3*: Domande Teoriche sul problema dei "lettori-scrittori". In questo step gli studenti devono rispondere a 4 domande, due a risposta singola e due a risposta multipla, riguardanti il problema dei lettori-scrittori. Le domande sono state create per verificare la comprensione del problema e per stimolare la riflessione sugli argomenti trattati. Ogni domanda dispone di un #link(<hint>, text(fill: blue)[hint]) @sugg che può essere cliccato per mostrare un suggerimento, utile per gli studenti che hanno difficoltà a rispondere.

- *Step 4*: Domande di teoria sul problema dei "lettori-scrittori" in forma di menù a tedina divise in 3 categorie:
  - associazione ruolo-comportamento
  - classificazione comportamento
  - completa la frase

- *Step 5*: Drag and Drop relativo al problema dei "lettori-scrittori", in cui gli studenti devono trascinare i pezzi di codice nella giusta posizione per completare la struttura del Scrittore.

- *Step 6*: Drag and Drop relativo al problema dei "lettori-scrittori", in cui gli studenti devono trascinare i pezzi di codice nella giusta posizione per completare la struttura dello Lettore.

#figure(image("../images/uc/step3.png", fit: "contain", width: 30em), caption: "Hint di Thinky")<sugg>

=== Suggerimento
<hint>

Il suggerimento mostrato sotto ogni domanda teorica è stato creato come un componente aggiuntivo, che viene mostrato dinamicamente in base ad un certo #code-pill("id") passato come prop al componente stesso. Questo permette di mostrare un suggerimento diverso per ogni domanda, in modo da aiutare gli studenti a rispondere correttamente senza dover creare diversi componenti cambiando il testo.

In particolare, il componente prende come prop l'id della domanda, e poi fa una ricerca nel file #code-pill("hints.json"), che contiene i suggerimenti per ogni domanda. In questo modo, il suggerimento è facilmente inseribile nella funzione #code-pill("map") che crea le domande, e viene mostrato solo quando l'utente clicca sul link del suggerimento. Questo permette di mantenere l'interfaccia pulita e di mostrare il suggerimento solo quando necessario, evitando di appesantire la pagina con informazioni non necessarie.

=== Layout
<layout>

Come accennato nella sezione dedicata a #link(<next>, text(fill: blue)[NextJS]), il file #code-pill("layout.tsx") è il file che definisce la struttura di base dell'applicazione e viene utilizzato per tutte le pagine che fanno riferimento ad esso. Questo file è fondamentale per garantire una struttura coerente e uniforme in tutta l'applicazione, e permette di definire le parti comuni a tutte le pagine, come il menu di navigazione, il footer e altre componenti condivise.

In Thinky, sono stati creati tre file #code-pill("layout.tsx"):

- Nel file #code-pill("layout.tsx") principale @principal, vengono renderizzate le parti necessarie alla visualizzazione dell pagina generica di errore, e il link per saltare al contenuto principale. Questo è stato creato per sopperire alla mancanza di un layout nella Root del progetto, che avrebbe portato alla visualizzazione di pagine di errore senza una struttura definita e senza l'applicazione degli stili.
#figure(
  image(
    "../images/code/rootLayout.png",
    fit: "contain",
    width: 29em,
  ),
  caption: "layout.tsx principale",
)<principal>
- Il file #code-pill("layout.tsx") per la pagina di laboratorio @lab, che contiene la struttura specifica per quella pagina. Questo file viene utilizzato per tutte le pagine che fanno riferimento alla pagina di laboratorio, garantendo una struttura coerente e uniforme in tutta l'applicazione. In particolare, data la presenza di pagine con una spiegazione teorica dei problemi che lo studente è chiamato a risolvere, è stato necessario creare un layout per questa pagina che includesse una vista modificata della Navbar, che non permettesse di accedere alle pagine di teoria, di modo che l'utente non potesse accedervi durante lo svolgimento dell'attività.

#figure(
  image("../images/code/LabLayout.png", fit: "contain", width: 29em),
  caption: "layout.tsx della pagina di laboratorio",
)<lab>

- L'ultimo file #code-pill("layout.tsx") è quello per le altre pagine @generic, che contiene la struttura specifica per quelle pagine. Questo file viene utilizzato per tutte le pagine che non fanno riferimento alla pagina di laboratorio, garantendo una struttura coerente e uniforme in tutta l'applicazione. In particolare, questo file contiene la struttura della Navbar e del Footer, che sono presenti in tutte le pagine dell'applicazione.
#figure(
  image(
    "../images/code/PageLayout.png",
    fit: "contain",
    width: 29em,
  ),
  caption: "layout.tsx delle altre pagine",
)<generic>

Si noti come il layout del laboratorio e quello delle pagine generiche abbiano in comune i componenti #code-pill("<UserProvider>") e #code-pill("<ThemeProvider>").

=== UserProvider

Mentre è stata già spiegata la funzione e l'implementazione di #code-pill("<ThemeProvider>") nella sezione dedicata a #link(<shadcn>, text(fill: blue)[ShadCN]), il componente #code-pill("<UserProvider>") è stato creato per gestire lo stato dell'utente all'interno dell'applicazione, permettendo di accedere alle informazioni dell'utente in modo semplice e veloce.
In particolare, questo componente permette di gestire lo sraro dell'utente, e di visualizzarne le informazioni in tutti gli altri componenti che sono _wrappati_ all'interno di esso.

Lo #code-pill("<UserProvider>")@up è quindi incluso nel layout desiderato, e al suo interno sono inclusi tutti i restanti componenti. Nella sua definizione, viene creato il #code-pill("context") e un #glossary("hook") #code-pill("useUser") per accedere alle informazioni dell'utente in modo semplice e veloce. Questo permette di evitare di dover passare le informazioni dell'utente come #glossary("props") a tutti i componenti, semplificando la gestione dello stato dell'utente all'interno dell'applicazione.

#figure(image("../images/code/userContext.png", fit: "contain", width: 35em), caption: "UserProvider")<up>

#code-pill("useUser") viene utilizzato in tutti i componenti che hanno bisogno di accedere alle informazioni dell'utente, come ad esempio la Navbar, o le pagine admin.

=== Avatar

Gli avatar sono stati implementati in Thinky per mostrare le immagini dei profili degli studenti che hanno partecipato al laboratorio nella navbar. Per fare ciò, è stato creato un componente #code-pill("<Avatar>") che si occupa di visualizzare l'immagine dell'avatar dell'utente, partendo da un componente della libreria ShadCN.

Questo è poi inserito nella Navbar, che utilizzando #code-pill("useUser") come menzionato sopra, passa le informazioni al componente #code-pill("<Avatar>") per visualizzare l'immagine dell'avatar dell'utente.

L'immagine è visualizzata in base all'username, che è di due tipi:

- Generato randomicamente in base ad una lista di nomi disponibili.
- Deciso dall'utente.

In ambo i casi, l'immagine dell'avatar viene recuperata dalla cartella `avatar` all'interno della repository di GitHub, cambia però quale immagine viene visualizzata.

Gli avatar sono quindi stati creati con l'intelligenza artificiale in modo da distinguere questi due casi.

Infatti, se l'username viene generato randomicamente, allora seguirà il tipo `Animale Colore`, quindi la logica del componente reperirà da GitHub l'immagine con il nome corrispondente all'username passato come Prop al componente, e visualizzerà l'immagine corrispondente @ac.

#figure(
  image("../images/code/avatarImage.png", fit: "contain", width: 15em),
  caption: "Avatar con username generato: Elefante Verde",
)<ac>

Se invece l'username viene scelto dall'utente, la logica del componente reperirà da GitHub un immagine random tra una lista dedicata di avatar @ug.

#figure(
  image("../images/code/avatar2.png", fit: "contain", width: 15em),
  caption: "Avatar con username scelto: Avatar personalizzato",
)<ug>

Inoltre, l'avatar fungerà da menù dropdown @dd, che mostrerà all'utente le informazioni inserite in fase di registrazione e un link per visitare la pagina informativa del corso.

#figure(image("../images/code/DropDown.png", fit: "contain", width: 25em), caption: "Dropdown dell'avatar")<dd>

Tutte le informazioni degli user sono inoltre persistenti attraverso tutta l'applicazione grazie all'utilizzo del #code-pill("sessionStorage"). È stato deciso di utilizzare questo tipo di memoria perché non era ncesessario mantenere le informazioni degli utenti una volta terminato il laboratorio. In questo modo, una volta chiusa la scheda del browser, tutte le informazioni degli utenti vengono cancellate, garantendo così la privacy degli studenti e la sicurezza dei loro dati.

==== Banner Home

Anche il banner utilizza  #code-pill("<useUSer>") per visualizzare il nome utente in prima pagina, così da rendere l'esperienza utente più personalizzata e accogliente. Il banner è stato creato come un componente a sé stante, che può essere utilizzato in qualsiasi pagina dell'applicazione, che accetta diversi prop:

- #code-pill("source"): source dell'immagine da visualizzare nel banner.
- #code-pill("title"): titolo del banner.
- #code-pill("text"): testo del banner.
- #code-pill("username"): unico prop opzionale, che permette di visualizzare il nome utente nel banner se esiste.

Inoltre, nel caso in cui il prop #code-pill("username") venga passato @home, il banner visualizzerà il nome utente all'interno di un tag #code-pill("<h2>") con un #code-pill("background-color") impostato allo stesso colore del nome utente (se del tipo `Animale Colore`), o al colore di default (se del tipo `Avatar personalizzato`).

Se invece il prop username non è pervenuto, il banner visualizzerà normalmente tutti gli altri props @norm.

#figure(
  image("../images/code/bannerHome.png", fit: "contain", width: 32em),
  caption: "Banner della Home con username",
)<home>

#figure(
  image("../images/code/bannerProd.png", fit: "contain", width: 32em),
  caption: "Banner della pagina Produttore-Consumatore",
)<norm>

Per fare questo, è bastato prendere il prop username, separare il nome dell'animale dal colore, e applicare il colore come #code-pill("background-color") del tag #code-pill("<h2>") che contiene il nome utente. Nel caso in cui l'username sia del tipo `Avatar personalizzato`, il colore di default è stato impostato a #code-pill("bg-red-500"), ovvero il rosso di TailwindCSS.

=== Responsive Design

Tutto il progetto è stato sviluppato tenendo a mente il principio del _responsive design_, ovvero la capacità di adattarsi a diverse dimensioni dello schermo e dispositivi. Questo è stato fatto utilizzando le classi modificiatrici di TailwindCSS, che permettono di definire stili specifici per diverse dimensioni dello schermo, garantendo così una buona esperienza utente su tutti i dispositivi.

Nonostante il progetto sia stato sviluppato con la consapevolezza che verrà utilizzato sui computer desktop del laboratorio del Dipartimento di Mamtematica, far si che l'applicazione fosse responsive permette di garantire una ottima esperienza a tutti gli utenti se in futuro dovessero utilizzare Thinky su dispositivi diversi, come smartphone o tablet.

=== Drag and Drop

La funzionalità Drag and Drop @drag che offre il progetto, è il core dell'attività di laboratorio, in quanto permette agli studenti di interagire a livello massimo con l'applicazione stessa, spronandoli al ragionamento e al pensiero critico. Per implementare questa funzionalità, è stata utilizzata la libreria DND Kit, che permette di creare interfacce utente interattive e dinamiche, con la possibilità di trascinare e rilasciare elementi all'interno dell'applicazione.

#figure(image("../images/uc/dnd.png", fit: "contain", width: 40em), caption: "Esempio di Drag and Drop")<drag>

Questa libreria è stata scelta per la sua facilità d'uso e per la sua compatibilità con TailwindCSS, che permette di personalizzare gli stili degli elementi trascinabili in modo semplice e veloce. Inoltre, DND Kit offre di default tutte le caratteristiche di accessibilità compatibili con gli standard WCAG.

Per ottenere un risultato modulare, sono stati creati due componenti principali:

- DroppableContainer, che rappresenta l'area in cui gli elementi possono essere trascinati e rilasciati.
- SortableItem, che rappresenta gli elementi che possono essere trascinati e rilasciati all'interno del DroppableContainer.

All'interno del componente #code-pill("<DroppableContainer>"), viene utilizzato il #code-pill("useDroppable") di DND Kit per gestire gli eventi di trascinamento e rilascio degli elementi. Questo hook permette di definire le proprietà del contenitore, come ad esempio il tipo di elementi che possono essere trascinati e rilasciati, e le azioni da eseguire quando un elemento viene trascinato o rilasciato. Ogni #code-pill("<DroppableContainer>") può contenere al più un #code-pill("<SortableItem>")@sortable, così da garantire che la risposta sia univoca per ogni container. In figura

#figure(image("../images/code/sortable.png", fit: "contain", width: 35em), caption: "SortableItem")<sortable>

All'interno del componente #code-pill("<SortableItem>"), viene utilizzato il componente #code-pill("<Markdown>"), importato dalla libreria #code-pill("RactMarkdown"), per visualizzare il testo dell'elemento trascinabile. Questo permette di visualizzare il testo formattato per apparire come una stringa di codice.A questo componente, viene poi passato un prop opzionale, comodamente chiamato #code-pill("className") che permette di passare delle classi di TailwindCSS per personalizzare l'aspetto dell'elemento trascinabile. Questo comportamento è stato utile per cambiare il colore di sfondo dei vari #code-pill("<SortableItem>") in base al contenuto, per rendere più intuitivo l'esercizio. Ad esempio, i #code-pill("semaforoVerde()") sono stati colorati di verde, e i #code-pill("semaforoRosso()") di rosso, mentre le altre istruzioni in blu o arancione.

Dato che però i vari Items erano renderizzati dinamicamente, in base ad un oggetto definito nella logica del componente, non era possibile passare le classi direttamente al componente #code-pill("<SortableItem>") in fase di renderizzazione. Per sopperire a questo problema, il componente #code-pill("<SortableItem>") accetta un prop chiamato #code-pill("id"), che contiene l'id dell'elemento renderizzato. Questo id, viene poi utilizzato per recuperare la classe corrispondente all'elemento all'interno di un dizionario @dic, e quella viene passata al componente #code-pill("<Markdown>") per visualizzare l'elemento con lo stile corretto.

#figure(image("../images/code/map.png", fit: "contain", width: 35em), caption: "Dizionario delle classi")<dic>

=== Tema chiaro e scuro




== Accessibilità

Come già scritto, l'accessibilità è stata una delle priorità principali del progetto Thinky. Si è cercato di garantire che tutti gli studenti potessero utilizzare la piattaforma senza difficoltà, in ogni parte del sistema, dalla più banale alla più complessiva. Per raggiungere questo obiettivo, sono state adottate diverse best practices e strumenti per misurare il grado di accessibilità.

Per essere sicuri che l'applicazione fosse accessibile a tutti gli utenti, sono stati seguiti gli standard WCAG (Web Content Accessibility Guidelines), che forniscono linee guida per rendere i contenuti web più accessibili a persone con disabilità. Queste linee guida coprono vari aspetti dell'accessibilità, come la navigazione, la leggibilità, l'uso di colori e contrasti, e l'interazione con i contenuti.

Sono stati utilizzati diversi strumenti per testare l'accessibilità dell'applicazione, tra cui:

- Total validator, messo a disposizione dall'ateneo. È uno strumento che permette di verificare l'accessibilità dei siti web, controllando se rispettano gli standard WCAG. Total Validator esegue una serie di test automatici per identificare eventuali problemi di accessibilità e fornisce un report dettagliato con le problematiche riscontrate e le relative soluzioni.
- Accessible Web Chrome Extension, un'estensione per il browser Google Chrome che permette di scansionare ogni pagina del sito e identificare eventuali problemi, evidenziandoli così da rendere più semplice la loro risoluzione. Questa estensione è molto utile per testare l'accessibilità in tempo reale, mentre si sviluppa l'applicazione, e permette di identificare rapidamente eventuali problemi di accessibilità.
- Screen Reader (lettore di schermo), un software che legge ad alta voce il contenuto di una pagina web, permettendo agli utenti con disabilità visive di interagire con l'applicazione. I lettori di schermo sono uno strumento fondamentale per testare l'accessibilità dell'applicazione, in quanto permettono di verificare se il contenuto è leggibile e comprensibile anche per gli utenti con disabilità visive.

Durante lo sviluppo inoltre, sono state applicate tutte le best practices per garantire l'accessibilità, come ad esempio:
- Utilizzare colori con un contrasto sufficiente tra il testo e lo sfondo, in modo da garantire una buona leggibilità per tutti gli utenti.
- Utilizzare etichette chiare e descrittive per i campi di input, in modo da rendere chiaro il loro scopo e facilitare la comprensione da parte degli utenti.
- Utilizzare testi alternativi per le immagini, in modo da garantire che gli utenti con disabilità visive possano comprendere il contenuto delle immagini.
- Utilizzare una struttura semantica corretta per il markup HTML, in modo da garantire che i lettori di schermo possano interpretare correttamente il contenuto della pagina e navigare facilmente tra le sezioni.
- Utilizzare un linguaggio semplice e chiaro, evitando termini tecnici o complessi.

== Test e compatibilità

Per garantire la consegna di un prodotto funzionante e di massima qualità sono stati svolti molteplici test manuali. Insieme alla #myProf, è stato deciso di non utilizzare test automatici dato che l'applicazione sarebbe stata testata molteplici volte durante lo sviluppo da più utenti, anche di tipo diverso.

Più precisamente, l'applicazione è stata testata in toto da utenti target, e utenti esperti.

Con utente target si intende la tipologia di utente che si vuole raggiungere con il prodotto, più precisamente il tipo di utente descritto al #link(<utenti>, text(fill: blue)[capitolo terzo]).

Con utente esperto invece si intende un utente con connoscenze del prodotto tecniche e teoriche molto avanzate, che sa come funziona l'applicazione stessa.

Far testare l'applicazione solamente ad uno dei due gruppi di utenti avrebbe inificiato il concetto stesso di testing: infatti, far eseguire i test solamente all'utente target avrebbe portato a non considerare le problematiche tecniche e teoriche che un utente esperto avrebbe potuto riscontrare, mentre far eseguire i test solamente all'utente esperto avrebbe portato a non considerare le problematiche di usabilità e accessibilità che un utente target avrebbe potuto riscontrare.

I test inoltre sono stati effettuati su diversi browser e dispositivi, in modo tale da garantire la massima compatibilità attraverso ogni piattaforma.

I browser testati sono stati:

- Google Chrome
- Mozilla Firefox
- Safari

I dispositivi testati sono stati:

- Computer desktop
- Computer portatili
- Smartphone
- Tablet

==== Risultato finale dei test

I ripetuti test hanno portato a diverse modifiche nel tempo, che hanno migliorato l'esperienza utente e la stabilità dell'applicazione. Tutto questo ha fatto si che l'applicazione fosse pronta per essere presentata al pubblico, e che potesse essere utilizzata da tutti gli studenti senza problemi.

I test con utenti target hanno evidenziato come certi aspetti del laboratorio non fossero chiari e che fosse necessario semplificare gli esercizi e le istruzioni, in modo da renderli più comprensibili e facili da seguire. Inoltre, sono stati riscontrati alcuni problemi di usabilità, come ad esempio la difficoltà nel trovare alcune funzionalità o nel comprendere il funzionamento di alcune parti dell'applicazione.

I test con utenti esperti hanno invece evidenziato alcune problematiche tecniche, come ad esempio il conrtrasto dei colori in alcuni elementi non fosse abbastanza accentuato e come, in particolare nel Drag and Drop, fosse necessario aggiungere dei colori alle istruzioni per rendere più chiaro lo scopo dell'esercizio. Alcuni test hanno anche rilevato mancata compatibilità con certi dispositivi, più nel particolare quelli Android, e come questi non supportassero alcune funzionalità avanzate come il drag and drop. Questi problemi sono stati risolti con modifiche al codice e all'interfaccia utente, in modo da garantire la massima compatibilità e usabilità su tutti i dispositivi e browser.
