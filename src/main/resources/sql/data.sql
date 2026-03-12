-- =========================
-- ACESS CONTROL
-- =========================
INSERT INTO race (id_race, nm_race, ds_race, dt_creation)
VALUES (1, 'ARCANE', 'Full control over guilds, campaigns, missions and runes', NOW()),
       (2, 'ELF', 'Can create campaigns, missions and runes', NOW()),
       (3, 'DWARF', 'Can create missé ions only', NOW()),
       (4, 'HUMAN', 'Can only self-assign and execute missions', NOW());

INSERT INTO ability (nm_ability, dt_creation)
VALUES ('CONJURE', NOW()),
       ('OBSERVE', NOW()),
       ('TRANSMUTE', NOW()),
       ('BANISH', NOW()),
       ('BESTOW', NOW());   

INSERT INTO artefact (nm_artefact, dt_creation)
VALUES ('GUILD', NOW()),
       ('CAMPAIGN', NOW()),
       ('BOARD', NOW()),
       ('MISSION', NOW()),
       ('RUNE', NOW());


--ARCANE
INSERT INTO attribute (cd_race, cd_ability, cd_artefact, dt_creation)
VALUES

(1,1,1,NOW()),
(1,2,1,NOW()),
(1,3,1,NOW()),
(1,4,1,NOW()),

(1,1,2,NOW()),
(1,2,2,NOW()),
(1,3,2,NOW()),
(1,4,2,NOW()),

(1,1,3,NOW()),
(1,2,3,NOW()),
(1,3,3,NOW()),
(1,4,3,NOW()),

(1,1,4,NOW()),
(1,2,4,NOW()),
(1,3,4,NOW()),
(1,4,4,NOW()),
(1,5,4,NOW()),

(1,1,5,NOW()),
(1,2,5,NOW()),
(1,3,5,NOW()),
(1,4,5,NOW()),


--ELF
(2,2,1,NOW()),

(2,1,2,NOW()),
(2,2,2,NOW()),
(2,3,2,NOW()),
(2,4,2,NOW()),

(2,1,3,NOW()),
(2,2,3,NOW()),
(2,3,3,NOW()),
(2,4,3,NOW()),

(2,1,4,NOW()),
(2,2,4,NOW()),
(2,3,4,NOW()),
(2,4,4,NOW()),
(2,5,4,NOW()),

(2,1,5,NOW()),
(2,2,5,NOW()),
(2,3,5,NOW()),
(2,4,5,NOW()),

--DWARF
(3,2,1,NOW()),
(3,2,2,NOW()),
(3,2,5,NOW()),

(3,1,3,NOW()),
(3,2,3,NOW()),
(3,3,3,NOW()),
(3,4,3,NOW()),

(3,1,4,NOW()),
(3,2,4,NOW()),
(3,3,4,NOW()),
(3,4,4,NOW()),
(3,5,4,NOW()),

-- HUMAN
(4,2,1,NOW()),
(4,2,2,NOW()),
(4,2,3,NOW()),
(4,2,4,NOW()),
(4,2,5,NOW()),

(4,5,4,NOW());


-- =========================
-- USER
-- =========================


INSERT INTO adventurous
(nm_adventurous, nm_alias, ds_email, ds_pswd, ds_country, ds_calling, dt_creation)
VALUES ('Arthur Vale', 'IronWolf', 'arthur.vale@ironcitadel.tech', 'Arth0r!2026', 'UK', 'PERSONAL', NOW()),
       ('Luna Bright', 'MoonSeer', 'luna.bright@silverlibrary.edu', 'Lun@Study9', 'USA', 'SCHOOL', NOW()),
       ('Thorin Oak', 'StoneHand', 'thorin.oak@forgeworks.dev', 'St0ne#Hammer', 'Norway', 'PERSONAL', NOW()),
       ('Elena Storm', 'SkyBlade', 'elena.storm@gmail.com', 'SkyBl@de7', 'Brazil', 'WORK', NOW()),
       ('Marcus Reed', 'ShadowQuill', 'marcus.reed@goldenmarket.co', 'Shad0w!Ink', 'Canada', 'PERSONAL', NOW()),
       ('Isolde Night', 'SilverLeaf', 'isolde.night@academy.edu', 'Silv3r!Leaf', 'France', 'SCHOOL', NOW()),
       ('Garen Holt', 'SteelGuard', 'garen.holt@ironcitadel.tech', 'Ste3l#Guard', 'Germany', 'PERSONAL', NOW()),
       ('Nyx Raven', 'DarkRune', 'nyx.raven@outlook.com', 'DarkR@ven8', 'USA', 'WORK', NOW()),
       ('Cedric Dawn', 'LightBearer', 'cedric.dawn@student.edu', 'Light#123D', 'UK', 'SCHOOL', NOW()),
       ('Helga Frost', 'IceForge', 'helga.frost@forgeworks.dev', 'IceF0rge!', 'Sweden', 'PERSONAL', NOW()),
       ('Rowan Ash', 'GreenMind', 'rowan.ash@silverlibrary.edu', 'Gre3n@Mind', 'Ireland', 'SCHOOL', NOW()),
       ('Kael Ember', 'FireBrand', 'kael.ember@yahoo.com', 'FireBr@nd6', 'Spain', 'WORK', NOW()),
       ('Seraphine Vale', 'StarWhisper', 'seraphine.vale@goldenmarket.co', 'St@rWh1sper', 'Italy', 'PERSONAL', NOW()),
       ('Dorian Black', 'NightCrown', 'dorian.black@ironcitadel.tech', 'NightCr0wn!', 'USA', 'PERSONAL', NOW()),
       ('Mira Sol', 'SunWeaver', 'mira.sol@student.edu', 'SunW3av3r@', 'Brazil', 'SCHOOL', NOW());

-- =========================
-- GUILD
-- =========================

INSERT INTO guild (nm_guild, ds_guild, cd_adventurous, dt_creation)
VALUES ('Iron Citadel', 'Technology guild focused on product development', 1, NOW()),
       ('Silver Library', 'Academic study guild', 2, NOW()),
       ('Golden Market', 'Marketing and branding guild', 5, NOW()),
       ('Crimson Covenant', 'RPG adventure party guild', 8, NOW());

INSERT INTO affiliation (cd_race, cd_adventurous, cd_guild, dt_creation, dt_updated)
VALUES (1, 1, 1, NOW(), NOW()),
       (2, 3, 1, NOW(), NOW()),
       (3, 7, 1, NOW(), NOW()),
       (4, 4, 1, NOW(), NOW()),
       (1, 2, 2, NOW(), NOW()),
       (2, 6, 2, NOW(), NOW()),
       (4, 15, 2, NOW(), NOW()),
       (1, 5, 3, NOW(), NOW()),
       (3, 10, 3, NOW(), NOW()),
       (4, 13, 3, NOW(), NOW()),
       (1, 8, 4, NOW(), NOW()),
       (2, 9, 4, NOW(), NOW()),
       (3, 12, 4, NOW(), NOW()),
       (4, 14, 4, NOW(), NOW());

INSERT INTO campaign (nm_campaign, ds_campaign, cd_guild, dt_creation)
VALUES ('Core Platform', 'Main system architecture', 1, NOW()),
       ('Mobile Expansion', 'Mobile app development', 1, NOW()),
       ('Final Exams', 'Preparation for national exams', 2, NOW()),
       ('Brand Reforge', 'New brand positioning', 3, NOW()),
       ('Shadow Uprising', 'Political intrigue arc', 4, NOW());

-- =========================
-- MISSION
-- =========================

INSERT INTO board (nm_board, nr_position, cd_campaign, dt_creation)
VALUES ('Backlog', 1, 1, NOW()),
       ('Refinement', 2, 1, NOW()),
       ('In Development', 3, 1, NOW()),
       ('Code Review', 4, 1, NOW()),
       ('Deployed', 6, 1, NOW()),
       ('Backlog', 1, 2, NOW()),
       ('Refinement', 2, 2, NOW()),
       ('In Development', 3, 2, NOW()),
       ('Code Review', 4, 2, NOW()),
       ('Deployed', 6, 2, NOW()),
       ('Subjects to Study', 1, 3, NOW()),
       ('Studying', 2, 3, NOW()),
       ('Practice Exercises', 3, 3, NOW()),
       ('Mastered', 5, 3, NOW()),
       ('Ideas Vault', 1, 4, NOW()),
       ('Content Creation', 3, 4, NOW()),
       ('Campaign Running', 4, 4, NOW()),
       ('Analytics & Insights', 5, 4, NOW()),
       ('Whispers in the Dark', 1, 5, NOW()),
       ('Secret Alliances', 2, 5, NOW()),
       ('Open Rebellion', 4, 5, NOW()),
       ('Crown Restored', 5, 5, NOW());

INSERT INTO rarity (id_rarity, nm_rarity, dt_creation)
VALUES (1, 'COMMON', NOW()),
       (2, 'RARE', NOW()),
       (3, 'EPIC', NOW()),
       (4, 'LEGENDARY', NOW());

INSERT INTO mission(nm_mission, dt_start, dt_end, nr_position, cd_board, cd_creator, cd_adventurous, cd_rarity, dt_creation)
VALUES
('Design authentication architecture', NOW(), NOW() + INTERVAL '10' DAY, 1, 1, 1, 3, 3, NOW()),
('Define microservice boundaries', NOW(), NOW() + INTERVAL '7' DAY, 1, 2, 1, 7, 2, NOW()),
('Implement JWT security layer', NOW(), NOW() + INTERVAL '5' DAY, 1, 3, 3, 1, 3, NOW()),
('Review payment integration PR', NOW(), NOW() + INTERVAL '2' DAY, 1, 4, 1, 13, 2, NOW()),
('Deploy v1.0 to production', NOW() - INTERVAL '3' DAY, NOW() - INTERVAL '1' DAY, 1, 5, 1, 7, 4, NOW()),

('Define app navigation flow', NOW(), NOW() + INTERVAL '6' DAY, 1, 6, 1, 4, 2, NOW()),
('Refine push notification strategy', NOW(), NOW() + INTERVAL '4' DAY, 1, 7, 1, 7, 2, NOW()),
('Implement dark mode UI', NOW(), NOW() + INTERVAL '8' DAY, 1, 8, 3, 1, 3, NOW()),
('Code review mobile API integration', NOW(), NOW() + INTERVAL '2' DAY, 1, 9, 1, 7, 2, NOW()),
('Publish beta to app stores', NOW() - INTERVAL '5' DAY, NOW() - INTERVAL '1' DAY, 1, 10, 1, 3, 4, NOW()),

('List algebra topics for exam', NOW(), NOW() + INTERVAL '3' DAY, 1, 11, 2, 15, 2, NOW()),
('Study calculus derivatives', NOW(), NOW() + INTERVAL '5' DAY, 1, 12, 6, 2, 3, NOW()),
('Solve 50 geometry exercises', NOW(), NOW() + INTERVAL '4' DAY, 1, 13, 6, 15, 3, NOW()),
('Complete full mock exam simulation', NOW() - INTERVAL '7' DAY, NOW() - INTERVAL '2' DAY, 1, 14, 2, 6, 4, NOW()),

('Brainstorm new brand slogan', NOW(), NOW() + INTERVAL '3' DAY, 1, 15, 5, 10, 2, NOW()),
('Produce Instagram teaser video', NOW(), NOW() + INTERVAL '6' DAY, 1, 16, 5, 13, 3, NOW()),
('Launch influencer partnership campaign', NOW(), NOW() + INTERVAL '10' DAY, 1, 17, 5, 13, 4, NOW()),
('Analyze engagement metrics week 1', NOW(), NOW() + INTERVAL '2' DAY, 1, 18, 5, 10, 2, NOW()),

('Investigate rumors in the capital tavern', NOW(), NOW() + INTERVAL '2' DAY, 1, 19, 8, 9, 2, NOW()),
('Negotiate alliance with northern clans', NOW(), NOW() + INTERVAL '4' DAY, 1, 20, 8, 12, 3, NOW()),
('Lead assault on the royal fortress', NOW(), NOW() + INTERVAL '3' DAY, 1, 21, 8, 14, 4, NOW()),
('Secure the throne and restore order', NOW() - INTERVAL '6' DAY, NOW() - INTERVAL '1' DAY, 1, 22, 8, 12, 4, NOW());

INSERT INTO rune (nm_rune, lk_image, cd_guild, ds_color, dt_creation)
VALUES ('Backend', '#', 1, '#1E90FF', NOW()),
       ('Frontend', '#', 1, '#32CD32', NOW()),
       ('DevOps', '#', 1, '#8A2BE2', NOW()),
       ('Mathematics', '#', 2, '#FFD700', NOW()),
       ('History', '#', 2, '#CD853F', NOW()),
       ('SEO', '#', 3, '#FF4500', NOW()),
       ('Social Media', '#', 3, '#FF69B4', NOW()),
       ('Combat', '#', 4, '#B22222', NOW()),
       ('Diplomacy', '#', 4, '#4169E1', NOW()),
       ('Magic', '#', 4, '#9400D3', NOW());


INSERT INTO requirement (cd_mission, cd_rune)
VALUES (1, 1),
       (2, 1),
       (3, 3),
       (4, 1),
       (5, 3),
       (6, 2),
       (7, 3),
       (8, 2),
       (9, 1),
       (10, 3),
       (11, 4),
       (12, 4),
       (13, 4),
       (14, 5),
       (15, 7),
       (16, 7),
       (17, 6),
       (18, 6),
       (19, 9),
       (20, 9),
       (21, 8),
       (22, 8);

COMMIT;


-- DO $$
-- DECLARE
--     r RECORD;
-- BEGIN
--     -- Busca todas as sequências que pertencem ao esquema 'public'
--     FOR r IN (SELECT sequence_name
--               FROM information_schema.sequences
--               WHERE sequence_schema = 'public')
--     LOOP
--         -- Executa o restart para cada uma delas voltando para 1
--         EXECUTE 'ALTER SEQUENCE ' || quote_ident(r.sequence_name) || ' RESTART WITH 1';
--     END LOOP;
-- END $$;