-- =========================
-- CALLING
-- =========================
CREATE TABLE calling
(
    id_calling  INTEGER PRIMARY KEY,
    nm_calling  VARCHAR(50) NOT NULL,
    dt_creation TIMESTAMP   NOT NULL
);

-- =========================
-- ADVENTUROUS (USER)
-- =========================
CREATE TABLE adventurous
(
    id_adventurous         SERIAL PRIMARY KEY,
    nm_user         VARCHAR(255)        NOT NULL,
    nm_alias        VARCHAR(50)         NOT NULL,
    ds_email        VARCHAR(255) UNIQUE NOT NULL,
    ds_pswd         VARCHAR(50)         NOT NULL,
    ds_country      VARCHAR(50)         NOT NULL,
    cd_calling      INTEGER             NOT NULL,
    dt_creation     TIMESTAMP           NOT NULL,
    dt_update       TIMESTAMP,
    dt_desativation TIMESTAMP,
    CONSTRAINT fk_adventurous_calling
        FOREIGN KEY (cd_calling) REFERENCES calling (id_calling)
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
        FOREIGN KEY (cd_adventurous) REFERENCES adventurous (id_user)
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
-- PRIORITY
-- =========================
CREATE TABLE priority
(
    id_priority INTEGER PRIMARY KEY,
    nm_priority VARCHAR(50) NOT NULL,
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
    cd_owner       INTEGER      NOT NULL,
    cd_adventurous INTEGER,
    cd_priority    INTEGER      NOT NULL,
    dt_creation    TIMESTAMP    NOT NULL,
    dt_updated     TIMESTAMP,
    CONSTRAINT fk_mission_board
        FOREIGN KEY (cd_board) REFERENCES board (id_board),
    CONSTRAINT fk_mission_user
        FOREIGN KEY (cd_adventurous) REFERENCES adventurous (id_user),
    CONSTRAINT fk_mission_owner
        FOREIGN KEY (cd_owner) REFERENCES adventurous (id_user),
    CONSTRAINT fk_mission_priority
        FOREIGN KEY (cd_priority) REFERENCES priority (id_priority)
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
    lk_img_form VARCHAR(255),
    cd_guild    INTEGER     NOT NULL ds_color    VARCHAR(7) NOT NULL,
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
    dt_creation     TIMESTAMP NOT NULL,
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
    dt_creation TIMESTAMP    NOT NULL,
    dt_update   TIMESTAMP
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
    dt_updated     TIMESTAMP NOT NULL,
    CONSTRAINT fk_affiliation_race
        FOREIGN KEY (cd_race) REFERENCES race (id_race),
    CONSTRAINT fk_affiliation_user
        FOREIGN KEY (cd_adventurous) REFERENCES adventurous (id_user),
    CONSTRAINT fk_affiliation_guild
        FOREIGN KEY (cd_guild) REFERENCES guild (id_guild)
);

ALTER TABLE affiliation
    ADD CONSTRAINT unique_affiliation UNIQUE (cd_race, cd_guild, cd_adventurous);

-- =========================
-- ACTION
-- =========================
CREATE TABLE action
(
    id_action SERIAL PRIMARY KEY,
    nm_action VARCHAR(50) NOT NULL,
    dt_action TIMESTAMP   NOT NULL
);

-- =========================
-- RESOURCE (table)
-- =========================
CREATE TABLE resource
(
    id_table    SERIAL PRIMARY KEY,
    nm_table    VARCHAR(50) NOT NULL,
    dt_creation TIMESTAMP   NOT NULL
);

-- =========================
-- ATTRIBUTE (ROLE PERMISSION)
-- =========================
CREATE TABLE attribute
(
    id_attribute SERIAL PRIMARY KEY,
    cd_race      INTEGER   NOT NULL,
    cd_action    INTEGER   NOT NULL,
    cd_table     INTEGER   NOT NULL,
    dt_creation  TIMESTAMP NOT NULL,
    CONSTRAINT fk_attribute_race
        FOREIGN KEY (cd_race) REFERENCES race (id_race),
    CONSTRAINT fk_attribute_action
        FOREIGN KEY (cd_action) REFERENCES action (id_action),
    CONSTRAINT fk_attribute_resource
        FOREIGN KEY (cd_table) REFERENCES resource (id_table)
);
