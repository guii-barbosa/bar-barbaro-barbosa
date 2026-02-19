-- =========================
-- CALLING
-- =========================
CREATE TABLE calling (
    id_calling      BIGINT PRIMARY KEY,
    nm_calling      VARCHAR(255),
    dt_creation     TIMESTAMP
);

-- =========================
-- ADVENTUROUS (USER)
-- =========================
CREATE TABLE adventurous (
    id_user         SERIAL PRIMARY KEY,
    nm_user         VARCHAR(255),
    nm_alias        VARCHAR(255),
    ds_email        VARCHAR(255),
    ds_pswd         VARCHAR(255),
    ds_country      VARCHAR(255),
    cd_calling      BIGINT,
    dt_creation     TIMESTAMP,
    dt_update       TIMESTAMP,
    dt_desativation TIMESTAMP,
    CONSTRAINT fk_adventurous_calling
        FOREIGN KEY (cd_calling) REFERENCES calling(id_calling)
);

-- =========================
-- GUILD (WORKSPACE)
-- =========================
CREATE TABLE guild (
    id_guild        SERIAL PRIMARY KEY,
    nm_guild        VARCHAR(255),
    ds_guild        VARCHAR(255),
    cd_adventurous  BIGINT,
    dt_creation     TIMESTAMP,
    dt_updated      TIMESTAMP,
    CONSTRAINT fk_guild_owner
        FOREIGN KEY (cd_adventurous) REFERENCES adventurous(id_user)
);

-- =========================
-- CAMPAIGN
-- =========================
CREATE TABLE campaign (
    id_campaign     SERIAL PRIMARY KEY,
    nm_campaign     VARCHAR(255),
    ds_goal         VARCHAR(255),
    cd_guild        BIGINT,
    dt_creation     TIMESTAMP,
    dt_update       TIMESTAMP,
    CONSTRAINT fk_campaign_guild
        FOREIGN KEY (cd_guild) REFERENCES guild(id_guild)
);

-- =========================
-- BOARD
-- =========================
CREATE TABLE board (
    id_board        SERIAL PRIMARY KEY,
    nm_board        VARCHAR(255),
    ds_board        VARCHAR(255),
    nr_position     BIGINT,
    dt_creation     TIMESTAMP,
    dt_update       TIMESTAMP,
    cd_campaign     BIGINT,
    CONSTRAINT fk_board_campaign
        FOREIGN KEY (cd_campaign) REFERENCES campaign(id_campaign)
);

-- =========================
-- PRIORITY
-- =========================
CREATE TABLE priority (
    id_priority     BIGINT PRIMARY KEY,
    nm_priority     VARCHAR(255),
    dt_creation     TIMESTAMP
);

-- =========================
-- MISSION (TASK)
-- =========================
CREATE TABLE mission (
    id_mission      SERIAL PRIMARY KEY,
    nm_mission      VARCHAR(255),
    dt_start        TIMESTAMP,
    dt_end          TIMESTAMP,
    nr_position     BIGINT,
    cd_board        BIGINT,
    cd_adventurous  BIGINT,
    dt_updated      TIMESTAMP,
    dt_creation     TIMESTAMP,
    cd_priority     BIGINT,
    CONSTRAINT fk_mission_board
        FOREIGN KEY (cd_board) REFERENCES board(id_board),
    CONSTRAINT fk_mission_user
        FOREIGN KEY (cd_adventurous) REFERENCES adventurous(id_user),
    CONSTRAINT fk_mission_priority
        FOREIGN KEY (cd_priority) REFERENCES priority(id_priority)
);

-- =========================
-- RUNE (TAG)
-- =========================
CREATE TABLE rune (
    id_rune     SERIAL PRIMARY KEY,
    nm_rune     VARCHAR(255),
    ds_form     TEXT,
    ds_color    VARCHAR(255),
    dt_creation TIMESTAMP
);

-- =========================
-- REQUIREMENT (MISSION_RUNE)
-- =========================
CREATE TABLE requirement (
    id_mission_rune SERIAL PRIMARY KEY,
    cd_mission      BIGINT,
    cd_rune         BIGINT,
    dt_creation     TIMESTAMP,
    dt_update       TIMESTAMP,
    CONSTRAINT fk_requirement_mission
        FOREIGN KEY (cd_mission) REFERENCES mission(id_mission),
    CONSTRAINT fk_requirement_rune
        FOREIGN KEY (cd_rune) REFERENCES rune(id_rune)
);

-- =========================
-- RACE (ROLE)
-- =========================
CREATE TABLE race (
    id_race     SERIAL PRIMARY KEY,
    nm_race     VARCHAR(255),
    ds_race     VARCHAR(255),
    dt_creation TIMESTAMP,
    dt_update   TIMESTAMP
);

-- =========================
-- AFFILIATION (USER x GUILD x ROLE)
-- =========================
CREATE TABLE affiliation (
    id_affiliation  SERIAL PRIMARY KEY,
    cd_race         BIGINT,
    cd_adventurous  BIGINT,
    cd_guild        BIGINT,
    dt_creation     TIMESTAMP,
    dt_updated      TIMESTAMP,
    CONSTRAINT fk_affiliation_race
        FOREIGN KEY (cd_race) REFERENCES race(id_race),
    CONSTRAINT fk_affiliation_user
        FOREIGN KEY (cd_adventurous) REFERENCES adventurous(id_user),
    CONSTRAINT fk_affiliation_guild
        FOREIGN KEY (cd_guild) REFERENCES guild(id_guild)
);

-- =========================
-- ACTION
-- =========================
CREATE TABLE action (
    id_action   SERIAL PRIMARY KEY,
    nm_action   VARCHAR,
    dt_action   TIMESTAMP
);

-- =========================
-- RESOURCE (table)
-- =========================
CREATE TABLE resouce (
    id_table    SERIAL PRIMARY KEY,
    nm_table    VARCHAR,
    dt_creation TIMESTAMP
);

-- =========================
-- ATTRIBUTE (ROLE PERMISSION)
-- =========================
CREATE TABLE attribute (
    id_attribute SERIAL PRIMARY KEY,
    cd_race      BIGINT,
    cd_action    BIGINT,
    cd_table     BIGINT,
    dt_creation  TIMESTAMP,
    CONSTRAINT fk_attribute_race
        FOREIGN KEY (cd_race) REFERENCES race(id_race),
    CONSTRAINT fk_attribute_action
        FOREIGN KEY (cd_action) REFERENCES action(id_action),
    CONSTRAINT fk_attribute_resource
        FOREIGN KEY (cd_table) REFERENCES resouce(id_table)
);
