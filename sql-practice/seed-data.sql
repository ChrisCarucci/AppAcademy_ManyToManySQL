-- Tells SQLite to enforce foreign key restrictions
PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS musician_instruments;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS musicians;

CREATE TABLE musicians (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100)
);

CREATE TABLE instruments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type VARCHAR(100) NOT NULL
);

CREATE TABLE musician_instruments (
  musician_id INTEGER NOT NULL,
  instrument_id INTEGER NOT NULL,
  FOREIGN KEY (musician_id) REFERENCES musicians(id),
  FOREIGN KEY (instrument_id) REFERENCES instruments(id)
);

INSERT INTO musicians
VALUES (1, 'Adam', 'Appleby'),
  (2, 'Anton', 'Martinovic'),
  (3, 'Wilson', 'Holt'),
  (4, 'Marine', 'Sweet'),
  (5, 'Georgette', 'Kubo'),
  (6, 'Aurora', 'Hase'),
  (7, 'Trenton', 'Lesley'),
  (8, 'Camila', 'Nenci'),
  (9, 'Rosemarie', 'Affini'),
  (10, 'Victoria', 'Cremonesi');

INSERT INTO instruments
VALUES (1, 'piano'),
  (2, 'guitar'),
  (3, 'drums'),
  (4, 'bass'),
  (5, 'violin'),
  (6, 'cello'),
  (7, 'trumpet'),
  (8, 'saxophone');

INSERT INTO musician_instruments (musician_id, instrument_id)
VALUES (1, 1),
  (1, 2),
  (2, 1),
  (2, 4),
  (3, 6),
  (4, 8),
  (5, 3),
  (5, 7),
  (5, 8),
  (6, 5),
  (6, 6),
  (7, 1),
  (8, 1),
  (9, 1),
  (9, 5),
  (10, 5);
  


  Run the SQL command that joins the musicians 
  and instruments tables together, SELECTing both 
  the first name of the musician and the type of 
  instrument.


SELECT musicians.first_name, instruments.type
FROM musicians
JOIN instruments ON instruments.id = musicians.id;

select musicians.first_name, musicians.last_name
from musicians
join instruments on instruments.id = musicians.id
where instruments.type = 'drums';



// Joining a many-to-many table to find musician first/last name
that play piano.

SELECT m.first_name, m.last_name
  FROM musicians m
JOIN musician_instruments mi 
  ON mi.musician_id = m.id 
JOIN instruments i 
  ON mi.instrument_id = i.id
WHERE i.type = 'piano';


