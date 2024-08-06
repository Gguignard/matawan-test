-- liquibase formmated sql

-- changeset gregory.guignard:script.1.0.0-1
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE team
(
    uuid    UUID             NOT NULL,
    name    VARCHAR          NOT NULL,
    acronym VARCHAR          NOT NULL,
    budget  DOUBLE PRECISION NOT NULL,
    CONSTRAINT pk_team PRIMARY KEY (uuid)
);

-- rollback DROP TABLE TEAM;

-- changeset gregory.guignard:script.1.0.0-2

INSERT INTO team (uuid, name, acronym, budget)
VALUES (uuid_generate_v4(), 'Paris Saint-Germain', 'PSG', 500000000.00),
       (uuid_generate_v4(), 'Olympique de Marseille', 'OM', 250000000.00),
       (uuid_generate_v4(), 'Olympique Lyonnais', 'OL', 200000000.00),
       (uuid_generate_v4(), 'AS Monaco', 'ASM', 180000000.00),
       (uuid_generate_v4(), 'Stade Rennais', 'SRFC', 150000000.00),
       (uuid_generate_v4(), 'LOSC Lille', 'LOSC', 130000000.00),
       (uuid_generate_v4(), 'OGC Nice', 'OGCN', 120000000.00),
       (uuid_generate_v4(), 'Montpellier HSC', 'MHSC', 100000000.00),
       (uuid_generate_v4(), 'AS Saint-Étienne', 'ASSE', 90000000.00),
       (uuid_generate_v4(), 'Racing Club de Lens', 'RCL', 85000000.00);

-- rollback DELETE FROM team;

-- changeset gregory.guignard:script.1.0.0-3

CREATE TABLE player
(
    uuid      UUID    NOT NULL,
    name      VARCHAR NOT NULL,
    age       INTEGER NOT NULL,
    team_uuid UUID    NOT NULL,
    position  VARCHAR NOT NULL,
    CONSTRAINT pk_player PRIMARY KEY (uuid),
    CONSTRAINT fk_team FOREIGN KEY (team_uuid) REFERENCES team (uuid)
);

-- rollback DROP TABLE player;

-- changeset gregory.guignard:script.1.0.0-4

-- Ensure the uuid-ossp extension is enabled to use uuid_generate_v4()
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Players for Paris Saint-Germain
INSERT INTO player (uuid, name, age, team_uuid, position)
VALUES (uuid_generate_v4(), 'Kylian Mbappe', 24, (SELECT uuid FROM team WHERE acronym = 'PSG'), 'Forward'),
       (uuid_generate_v4(), 'Neymar Jr', 32, (SELECT uuid FROM team WHERE acronym = 'PSG'), 'Forward'),
       (uuid_generate_v4(), 'Marco Verratti', 30, (SELECT uuid FROM team WHERE acronym = 'PSG'), 'Midfielder'),
       (uuid_generate_v4(), 'Marquinhos', 29, (SELECT uuid FROM team WHERE acronym = 'PSG'), 'Defender'),
       (uuid_generate_v4(), 'Gianluigi Donnarumma', 25, (SELECT uuid FROM team WHERE acronym = 'PSG'), 'Goalkeeper');

-- Players for Olympique de Marseille
INSERT INTO player (uuid, name, age, team_uuid, position)
VALUES (uuid_generate_v4(), 'Dimitri Payet', 37, (SELECT uuid FROM team WHERE acronym = 'OM'), 'Midfielder'),
       (uuid_generate_v4(), 'Florian Thauvin', 31, (SELECT uuid FROM team WHERE acronym = 'OM'), 'Forward'),
       (uuid_generate_v4(), 'Steve Mandanda', 38, (SELECT uuid FROM team WHERE acronym = 'OM'), 'Goalkeeper'),
       (uuid_generate_v4(), 'Boubacar Kamara', 24, (SELECT uuid FROM team WHERE acronym = 'OM'), 'Defender'),
       (uuid_generate_v4(), 'Valentin Rongier', 29, (SELECT uuid FROM team WHERE acronym = 'OM'), 'Midfielder');

-- Players for Olympique Lyonnais
INSERT INTO player (uuid, name, age, team_uuid, position)
VALUES (uuid_generate_v4(), 'Memphis Depay', 30, (SELECT uuid FROM team WHERE acronym = 'OL'), 'Forward'),
       (uuid_generate_v4(), 'Houssem Aouar', 26, (SELECT uuid FROM team WHERE acronym = 'OL'), 'Midfielder'),
       (uuid_generate_v4(), 'Anthony Lopes', 33, (SELECT uuid FROM team WHERE acronym = 'OL'), 'Goalkeeper'),
       (uuid_generate_v4(), 'Jason Denayer', 29, (SELECT uuid FROM team WHERE acronym = 'OL'), 'Defender'),
       (uuid_generate_v4(), 'Lucas Paquetá', 26, (SELECT uuid FROM team WHERE acronym = 'OL'), 'Midfielder');

-- Players for AS Monaco
INSERT INTO player (uuid, name, age, team_uuid, position)
VALUES (uuid_generate_v4(), 'Wissam Ben Yedder', 34, (SELECT uuid FROM team WHERE acronym = 'ASM'), 'Forward'),
       (uuid_generate_v4(), 'Cesc Fàbregas', 37, (SELECT uuid FROM team WHERE acronym = 'ASM'), 'Midfielder'),
       (uuid_generate_v4(), 'Alexander Nübel', 27, (SELECT uuid FROM team WHERE acronym = 'ASM'), 'Goalkeeper'),
       (uuid_generate_v4(), 'Benoît Badiashile', 23, (SELECT uuid FROM team WHERE acronym = 'ASM'), 'Defender'),
       (uuid_generate_v4(), 'Aurélien Tchouaméni', 24, (SELECT uuid FROM team WHERE acronym = 'ASM'), 'Midfielder');

-- Players for Stade Rennais
INSERT INTO player (uuid, name, age, team_uuid, position)
VALUES (uuid_generate_v4(), 'Eduardo Camavinga', 21, (SELECT uuid FROM team WHERE acronym = 'SRFC'), 'Midfielder'),
       (uuid_generate_v4(), 'Jérémy Doku', 22, (SELECT uuid FROM team WHERE acronym = 'SRFC'), 'Forward'),
       (uuid_generate_v4(), 'Alfred Gomis', 31, (SELECT uuid FROM team WHERE acronym = 'SRFC'), 'Goalkeeper'),
       (uuid_generate_v4(), 'Damien Da Silva', 36, (SELECT uuid FROM team WHERE acronym = 'SRFC'), 'Defender'),
       (uuid_generate_v4(), 'Flavien Tait', 31, (SELECT uuid FROM team WHERE acronym = 'SRFC'), 'Midfielder');

-- Players for LOSC Lille
INSERT INTO player (uuid, name, age, team_uuid, position)
VALUES (uuid_generate_v4(), 'Jonathan David', 24, (SELECT uuid FROM team WHERE acronym = 'LOSC'), 'Forward'),
       (uuid_generate_v4(), 'Renato Sanches', 26, (SELECT uuid FROM team WHERE acronym = 'LOSC'), 'Midfielder'),
       (uuid_generate_v4(), 'Mike Maignan', 29, (SELECT uuid FROM team WHERE acronym = 'LOSC'), 'Goalkeeper'),
       (uuid_generate_v4(), 'José Fonte', 40, (SELECT uuid FROM team WHERE acronym = 'LOSC'), 'Defender'),
       (uuid_generate_v4(), 'Burak Yılmaz', 39, (SELECT uuid FROM team WHERE acronym = 'LOSC'), 'Forward');

-- Players for OGC Nice
INSERT INTO player (uuid, name, age, team_uuid, position)
VALUES (uuid_generate_v4(), 'Amine Gouiri', 24, (SELECT uuid FROM team WHERE acronym = 'OGCN'), 'Forward'),
       (uuid_generate_v4(), 'Kasper Dolberg', 26, (SELECT uuid FROM team WHERE acronym = 'OGCN'), 'Forward'),
       (uuid_generate_v4(), 'Morgan Schneiderlin', 34, (SELECT uuid FROM team WHERE acronym = 'OGCN'), 'Midfielder'),
       (uuid_generate_v4(), 'Walter Benítez', 31, (SELECT uuid FROM team WHERE acronym = 'OGCN'), 'Goalkeeper'),
       (uuid_generate_v4(), 'Dante', 40, (SELECT uuid FROM team WHERE acronym = 'OGCN'), 'Defender');

-- Players for Montpellier HSC
INSERT INTO player (uuid, name, age, team_uuid, position)
VALUES (uuid_generate_v4(), 'Andy Delort', 32, (SELECT uuid FROM team WHERE acronym = 'MHSC'), 'Forward'),
       (uuid_generate_v4(), 'Teji Savanier', 32, (SELECT uuid FROM team WHERE acronym = 'MHSC'), 'Midfielder'),
       (uuid_generate_v4(), 'Jonas Omlin', 30, (SELECT uuid FROM team WHERE acronym = 'MHSC'), 'Goalkeeper'),
       (uuid_generate_v4(), 'Daniel Congré', 39, (SELECT uuid FROM team WHERE acronym = 'MHSC'), 'Defender'),
       (uuid_generate_v4(), 'Gaëtan Laborde', 29, (SELECT uuid FROM team WHERE acronym = 'MHSC'), 'Forward');

-- Players for AS Saint-Étienne
INSERT INTO player (uuid, name, age, team_uuid, position)
VALUES (uuid_generate_v4(), 'Romain Hamouma', 37, (SELECT uuid FROM team WHERE acronym = 'ASSE'), 'Forward'),
       (uuid_generate_v4(), 'Denis Bouanga', 29, (SELECT uuid FROM team WHERE acronym = 'ASSE'), 'Forward'),
       (uuid_generate_v4(), 'Timothée Kolodziejczak', 32, (SELECT uuid FROM team WHERE acronym = 'ASSE'), 'Defender'),
       (uuid_generate_v4(), 'Mahdi Camara', 25, (SELECT uuid FROM team WHERE acronym = 'ASSE'), 'Midfielder'),
       (uuid_generate_v4(), 'Jessy Moulin', 37, (SELECT uuid FROM team WHERE acronym = 'ASSE'), 'Goalkeeper');

-- Players for RC Lens
INSERT INTO player (uuid, name, age, team_uuid, position)
VALUES (uuid_generate_v4(), 'Seko Fofana', 29, (SELECT uuid FROM team WHERE acronym = 'RCL'), 'Midfielder'),
       (uuid_generate_v4(), 'Gaël Kakuta', 33, (SELECT uuid FROM team WHERE acronym = 'RCL'), 'Midfielder'),
       (uuid_generate_v4(), 'Jonathan Clauss', 31, (SELECT uuid FROM team WHERE acronym = 'RCL'), 'Defender'),
       (uuid_generate_v4(), 'Florian Sotoca', 33, (SELECT uuid FROM team WHERE acronym = 'RCL'), 'Forward'),
       (uuid_generate_v4(), 'Jean-Louis Leca', 38, (SELECT uuid FROM team WHERE acronym = 'RCL'), 'Goalkeeper');

-- rollback DELETE FROM player;
