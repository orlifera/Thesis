= Installazione

- Per installare Thinky è necessario avere un ambiente di sviluppo Node.js e NPM configurato. Una volta configurato, è possibile clonare il repository e installare le dipendenze necessarie.
  - per installare le dipendenze, è necessario aprire il terminale sul path in cui è instalato il progetto e lanciare il comando `npm install`.
- Per avviare il progetto in locale, è necessario lanciare il comando `npm run dev` nel terminale. Questo avvierà il server di sviluppo e sarà possibile accedere al progetto tramite il browser all'indirizzo `http://localhost:3000`.
- Per avviare il progetto in modalità produzione, è necessario lanciare il comando `npm run build` per compilare il progetto e poi `npm run start` per avviare il server di produzione.

= Modifica dati
- Per cancellare gli user salvati e le loro risposte, basta utilizzare il bottone "resetta stats" presente nell'area riservata.
- Per modificare il testo di una domanda se questa è:
  - Step 1, Step 2, Step 5 o Step 6: aprire un qualsiasi editor di codice, navigare alla cartella `src/app/lab/componets/step` e aprire il file `StepX.tsx` dove X è il numero dello step che si vuole modificare. Una volta aperto il file, modificare il testo della domanda dall'oggetto `ScrittoriCode` se si vuole cambiare il testo della parte di codice da completare, o dall'oggetto `initialContainers` con id = `risposte` se si vuole modificare il testo dell'oggetto da trascinare. Non è necessario cambiare l'id dell'oggetto trascinabile, in quanto nullerebbe il funzionamento della funzione che cambia il colore di tale oggetto.
  - Step 3: aprire un qualsiasi editor di codice, navigare alla cartella `src/app/lab/componets/step` e aprire il file `StepThree.tsx` e modificare dal TSX il teso della domanda, a partire da riga 66.
  - Step 4: aprire un qualsiasi editor di codice, navigare alla cartella `src/app/data/answers.json` e modificare la domanda richiesta senza cambiare l'id.

= hosting server universitario
Per hostare il progetto, ho letto che è necessario installare NodeJS, e git, come avevo scritto in una delle mail passate.

Eseguire poi i comandi `npm run build` e `npm run start` per avviare il progetto in modalità produzione.

Installare nginx e configurarlo per servire il progetto. Ecco un esempio di configurazione di nginx:
```nginx
server {
    listen 80;
    server_name app.miuniversita.it;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

e poi va abilitato il sito con il comando `sudo ln -s /etc/nginx/sites-available/thinky /etc/nginx/sites-enabled/` e ricaricato nginx con `sudo systemctl restart nginx`.

per collegare il dominio, serve configurare il dns ma nelle guide che ho trovato, serve che lo faccia il tecnico.
