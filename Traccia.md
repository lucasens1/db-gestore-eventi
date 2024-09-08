## Traccia Esercizio
Il nostro cliente vuole creare una  piattaforma per la gestione degli eventi che organizza.

Il gestionale permetterà agli <code>utenti</code> di gestire <code>eventi</code> e vedere le <code>prenotazioni</code> a loro collegati. 
Ci saranno 4 tipi di utenti, con <code>ruoli</code> diversi: 
- chi può amministrate tutti gli utenti
- chi può accedere al gestionale per creare o modificare eventi
- chi può solo accedere al gestionale senza la possibilità di modifica dei dati
- chi non ha accesso al gestionale e può solo prenotarsi agli eventi

Ogni evento potrà avere più <code>tag</code> per definirne la tipologia.
Il cliente organizza eventi solo in una serie di <code>location</code> esclusive che tramite il gestionale vuole tenere sempre sott’occhio, per capire quali eventi si terranno in ognuna di esse.

#### 🎯 Obiettivo
Progettare il database per la piattaforma in questione, creando il diagramma ER  e poi svolgendo le query fornite.

##### 1️⃣ Milestone 1 (Diagramma ER)
Create il diagramma ER. Pensiamo a quali entità (tabelle) creare per il nostro database, definiamo le colonne e i tipi di dato per ognuna di esse e infine stabiliamo le relazioni.

Esportate quindi il diagramma come immagine e caricatelo nella repo.

###### 2️⃣ Milestone 2 (Query SQL)
Dopo aver creato un nuovo database su phpMyAdmin e aver importato lo schema fornito (db_gestionale_eventi.sql), svolgete le query che trovate nel file query.pdf
In ogni query è indicato il numero di risultati previsti, per permettervi di verificare che sia corretta.

Dopo aver testato le vostre query con phpMyAdmin, riportatele in un file txt e caricatelo nella repo.

Buon kata! 🥷