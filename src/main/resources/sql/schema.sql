
-- =========================
-- ADVENTUROUS (USER)
-- =========================
CREATE TABLE adventurous
(
    id_adventurous  SERIAL PRIMARY KEY,
    nm_adventurous  VARCHAR(255)        NOT NULL,
    nm_alias        VARCHAR(50)         NOT NULL,
    ds_email        VARCHAR(255) UNIQUE NOT NULL,
    ds_pswd         VARCHAR(50)         NOT NULL,
    ds_country      VARCHAR(50)         NOT NULL,
    ds_calling      VARCHAR(50)         NOT NULL,
    dt_creation     TIMESTAMP           NOT NULL,
    dt_update       TIMESTAMP,
    dt_desativation TIMESTAMP
);

-- =========================
-- GUILD (WORKSPACE)
-- =========================
CREATE TABLE guild
(
    id_guild       SERIAL PRIMARY KEY,
    nm_guild       VARCHAR(50) NOT NULL,
    ds_guild       VARCHAR(255),
    cd_adventurous INTEGER     NOT NULL,
    dt_creation    TIMESTAMP   NOT NULL,
    dt_updated     TIMESTAMP,
    CONSTRAINT fk_guild_owner
        FOREIGN KEY (cd_adventurous) REFERENCES adventurous (id_adventurous)
);

ALTER TABLE guild
    ADD CONSTRAINT unique_guild UNIQUE (nm_guild, cd_adventurous);

-- =========================
-- CAMPAIGN
-- =========================
CREATE TABLE campaign
(
    id_campaign SERIAL PRIMARY KEY,
    nm_campaign VARCHAR(50) NOT NULL,
    ds_campaign VARCHAR(255),
    cd_guild    INTEGER     NOT NULL,
    dt_creation TIMESTAMP   NOT NULL,
    dt_update   TIMESTAMP,
    CONSTRAINT fk_campaign_guild
        FOREIGN KEY (cd_guild) REFERENCES guild (id_guild)
);

ALTER TABLE campaign
    ADD CONSTRAINT unique_campaign UNIQUE (nm_campaign, cd_guild);

-- =========================
-- BOARD
-- =========================
CREATE TABLE board
(
    id_board    SERIAL PRIMARY KEY,
    nm_board    VARCHAR(50) NOT NULL,
    nr_position INTEGER     NOT NULL,
    cd_campaign INTEGER     NOT NULL,
    dt_creation TIMESTAMP   NOT NULL,
    dt_update   TIMESTAMP,
    CONSTRAINT fk_board_campaign
        FOREIGN KEY (cd_campaign) REFERENCES campaign (id_campaign)
);

ALTER TABLE board
    ADD CONSTRAINT unique_board UNIQUE (nm_board, cd_campaign);

-- =========================
-- rarity
-- =========================
CREATE TABLE rarity
(
    id_rarity INTEGER PRIMARY KEY,
    nm_rarity VARCHAR(50) NOT NULL,
    dt_creation TIMESTAMP   NOT NULL
);

-- =========================
-- MISSION (TASK)
-- =========================
CREATE TABLE mission
(
    id_mission     SERIAL PRIMARY KEY,
    nm_mission     VARCHAR(255) NOT NULL,
    dt_start       TIMESTAMP    NOT NULL,
    dt_end         TIMESTAMP    NOT NULL,
    nr_position    INTEGER      NOT NULL,
    cd_board       INTEGER      NOT NULL,
    cd_creator     INTEGER      NOT NULL,
    cd_adventurous INTEGER,
    cd_rarity    INTEGER      NOT NULL,
    dt_creation    TIMESTAMP    NOT NULL,
    dt_updated     TIMESTAMP,
    CONSTRAINT fk_mission_board
        FOREIGN KEY (cd_board) REFERENCES board (id_board),
    CONSTRAINT fk_mission_user
        FOREIGN KEY (cd_adventurous) REFERENCES adventurous (id_adventurous),
    CONSTRAINT fk_mission_owner
        FOREIGN KEY (cd_creator) REFERENCES adventurous (id_adventurous),
    CONSTRAINT fk_mission_rarity
        FOREIGN KEY (cd_rarity) REFERENCES rarity (id_rarity)
);

ALTER TABLE mission
    ADD CONSTRAINT unique_mission UNIQUE (nm_mission, cd_board);

-- =========================
-- RUNE (TAG)
-- =========================
CREATE TABLE rune
(
    id_rune     SERIAL PRIMARY KEY,
    nm_rune     VARCHAR(50) NOT NULL,
    lk_image    VARCHAR(255),
    ds_color    VARCHAR(7),
    cd_guild    INTEGER     NOT NULL,
    dt_creation TIMESTAMP   NOT NULL,
    CONSTRAINT fk_rune_guild
        FOREIGN KEY (cd_guild) REFERENCES guild (id_guild)
);

ALTER TABLE rune
    ADD CONSTRAINT unique_rune UNIQUE (nm_rune, cd_guild);

-- =========================
-- REQUIREMENT (MISSION_RUNE)
-- =========================
CREATE TABLE requirement
(
    id_mission_rune SERIAL PRIMARY KEY,
    cd_mission      INTEGER   NOT NULL,
    cd_rune         INTEGER   NOT NULL,
    CONSTRAINT fk_requirement_mission
        FOREIGN KEY (cd_mission) REFERENCES mission (id_mission),
    CONSTRAINT fk_requirement_rune
        FOREIGN KEY (cd_rune) REFERENCES rune (id_rune)
);

ALTER TABLE requirement
    ADD CONSTRAINT unique_requirement UNIQUE (cd_mission, cd_rune);

-- =========================
-- RACE (ROLE)
-- =========================
CREATE TABLE race
(
    id_race     SERIAL PRIMARY KEY,
    nm_race     VARCHAR(50)  NOT NULL,
    ds_race     VARCHAR(255) NOT NULL,
    dt_creation TIMESTAMP    NOT NULL
);

-- =========================
-- AFFILIATION (USER x GUILD x ROLE)
-- =========================
CREATE TABLE affiliation
(
    id_affiliation SERIAL PRIMARY KEY,
    cd_race        INTEGER   NOT NULL,
    cd_adventurous INTEGER   NOT NULL,
    cd_guild       INTEGER   NOT NULL,
    dt_creation    TIMESTAMP NOT NULL,
    dt_updated     TIMESTAMP,
    CONSTRAINT fk_affiliation_race
        FOREIGN KEY (cd_race) REFERENCES race (id_race),
    CONSTRAINT fk_affiliation_user
        FOREIGN KEY (cd_adventurous) REFERENCES adventurous (id_adventurous),
    CONSTRAINT fk_affiliation_guild
        FOREIGN KEY (cd_guild) REFERENCES guild (id_guild)
);

ALTER TABLE affiliation
    ADD CONSTRAINT unique_affiliation UNIQUE (cd_race, cd_guild, cd_adventurous);

-- =========================
-- ABILITY
-- =========================
CREATE TABLE ability
(
    id_ability SERIAL PRIMARY KEY,
    nm_ability VARCHAR(50) NOT NULL,
    dt_creation TIMESTAMP   NOT NULL
);

-- =========================
-- artefact (table)
-- =========================
CREATE TABLE artefact
(
    id_artefact    SERIAL PRIMARY KEY,
    nm_artefact    VARCHAR(50) NOT NULL,
    dt_creation TIMESTAMP   NOT NULL
);

-- =========================
-- ATTRIBUTE (ROLE PERMISSION)
-- =========================
CREATE TABLE attribute
(
    id_attribute SERIAL PRIMARY KEY,
    cd_race      INTEGER   NOT NULL,
    cd_ability    INTEGER   NOT NULL,
    cd_artefact     INTEGER   NOT NULL,
    dt_creation  TIMESTAMP NOT NULL,
    CONSTRAINT fk_attribute_race
        FOREIGN KEY (cd_race) REFERENCES race (id_race),
    CONSTRAINT fk_attribute_ability
        FOREIGN KEY (cd_ability) REFERENCES ability (id_ability),
    CONSTRAINT fk_attribute_artefact
        FOREIGN KEY (cd_artefact) REFERENCES artefact (id_artefact)
);
