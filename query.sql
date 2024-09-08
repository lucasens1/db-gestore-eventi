-- Selezionare tutti gli eventi gratis, cioè con prezzo nullo (19)
SELECT
    *
FROM
    `events`
WHERE
    `events`.`price` IS NULL;

-- Selezionare tutte le location in ordine alfabetico (82)
SELECT
    *
FROM
    `locations`
ORDER BY
    `name` DESC;

-- Selezionare tutti gli eventi che costano meno di 20 euro e durano meno di 3 ore (38)
SELECT
    *
FROM
    `events`
WHERE
    `events`.`price` < 20
    AND `events`.`duration` < '03:00:00';

-- Selezionare tutti gli eventi di dicembre 2023 (25)
SELECT
    *
FROM
    `events`
WHERE
    YEAR (`events`.`start`) = 2023;

-- Selezionare tutti gli eventi con una durata maggiore alle 2 ore (823)
SELECT
    *
FROM
    `events`
WHERE
    `events`.`duration` > '02:00:00';

-- Selezionare tutti gli eventi, mostrando nome, data di inizio, ora di inizio, ora di fine e durata totale (1040)
SELECT
    `events`.`name`,
    DATE (`events`.`start`),
    TIME(`events`.`start`),
    TIME(ADDTIME (`events`.`start`, `events`.`duration`)),
    `events`.`duration`
FROM
    `events`
    -- NOTA : SQL, non gestisce in automatico il passaggio oltre le ore 24
    -- Selezionare tutti gli eventi aggiunti da “Fabiano Lombardo” (id: 1202) (132) Selezionare il numero totale di eventi per ogni fascia di prezzo (81) Selezionare tutti gli utenti admin ed editor (9)
SELECT
    *
FROM
    `events`
WHERE
    `events`.`user_id` = 1202;

SELECT
    `events`.`price`,
    COUNT(*) AS `total_events`
FROM
    `events`
GROUP BY
    `events`.`price`;

-- Selezionare tutti i concerti (eventi con il tag “concerti”) (72)
SELECT
    *
FROM
    `event_tag`
WHERE
    `tag_id` = 1;

-- Selezionare tutti i tag e il prezzo medio degli eventi a loro collegati (11)
SELECT
    `tags`.`name` AS `tag`,
    ROUND(AVG(`events`.`price`), 2) AS `prezzo_medio`
FROM
    `events`
    INNER JOIN `event_tag` ON `events`.`id` = `event_tag`.`event_id`
    INNER JOIN `tags` ON `event_tag`.`tag_id` = `tags`.`id`
GROUP BY
    `tags`.`name`
    -- Arrotondo per 2 numeri dopo la virgola, usando ROUND
    -- Selezionare tutte le location e mostrare quanti eventi si sono tenute in ognuna di esse (82)
SELECT
    `locations`.*,
    COUNT(*) AS `eventi_fatti`
FROM
    `locations`
    INNER JOIN `events` ON `locations`.`id` = `events`.`location_id`
GROUP BY
    `locations`.`id`
    -- Selezionare tutti i partecipanti per l’evento “Concerto Classico Serale” (slug: concerto-classico-serale, id: 34) (30)
SELECT
    *
FROM
    `users`
    INNER JOIN `bookings` ON `users`.`id` = `bookings`.`user_id`
    INNER JOIN `events` ON `bookings`.`event_id` = `events`.`id`
WHERE
    `events`.`id` = 34;

-- Selezionare tutti i partecipanti all’evento “Festival Jazz Estivo” (slug: festival-jazz-estivo, id: 2) specificando nome e cognome (13)
SELECT
    `users`.`first_name`,
    `users`.`last_name`
FROM
    `users`
    INNER JOIN `bookings` ON `users`.`id` = `bookings`.`user_id`
    INNER JOIN `events` ON `bookings`.`event_id` = `events`.`id`
WHERE
    `events`.`id` = 2;

-- Selezionare tutti gli eventi sold out (dove il totale delle prenotazioni è uguale ai biglietti totali per l’evento) (18)
SELECT
    `events`.`name`,
    `events`.`total_tickets`
FROM
    `events`
    INNER JOIN `bookings` ON `events`.`id` = `bookings`.`event_id`
GROUP BY
    `events`.`id`,
    `events`.`name`,
    `events`.`total_tickets`
HAVING
    COUNT(`bookings`.`event_id`) = `events`.`total_tickets`
-- HAVING, quando bisogna usare funzioni di aggregazione 

-- Selezionare tutte le location in ordine per chi ha ospitato più eventi (82) 
SELECT
    `locations`.*, COUNT(`events`.`id`) AS `counter_eventi`
FROM
    `locations`
    INNER JOIN `events` ON `locations`.`id` = `events`.`location_id`
GROUP BY 
    `locations`.`id`
ORDER BY
    `counter_eventi` DESC;

-- Selezionare tutti gli utenti che si sono prenotati a più di 70 eventi (74)
SELECT `users`.`username`, COUNT(`bookings`.`user_id`) AS `numero_prenotazioni`
FROM `users`
    INNER JOIN `bookings` ON `users`.`id` = `bookings`.`user_id`
GROUP BY 
    `users`.`id`
HAVING 
    `numero_prenotazioni` > 70;
-- Quando faccio query su campo aggregato comunque serve HAVING

-- Selezionare tutti gli eventi, mostrando il nome dell’evento, il nome della location, il numero di prenotazioni e il totale di biglietti ancora disponibili per l’evento (1040)