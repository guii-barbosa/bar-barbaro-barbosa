-- =========================
-- ACESS CONTROL
-- =========================
INSERT INTO race (id_race, nm_race, ds_race, dt_creation)
VALUES (1, 'ARCANE', 'Full control over guilds, campaigns, missions and runes', NOW()),
       (2, 'ELF', 'Can create campaigns, missions and runes', NOW()),
       (3, 'DWARF', 'Can create missions only', NOW()),
       (4, 'HUMAN', 'Can only self-assign and execute missions', NOW());

INSERT INTO action (nm_action, dt_action)
VALUES ('CREATE', NOW()),
       ('READ', NOW()),
       ('UPDATE', NOW()),
       ('DELETE', NOW());

INSERT INTO resource (nm_table, dt_creation)
VALUES ('GUILD', NOW()),
       ('CAMPAIGN', NOW()),
       ('MISSION', NOW()),
       ('RUNE', NOW());

-- ARCANE
INSERT INTO attribute (cd_race, cd_action, cd_table, dt_creation)
SELECT 1, a.id_action, r.id_table, NOW()
FROM action a,
     resource r;

-- ELF
INSERT INTO attribute (cd_race, cd_action, cd_table, dt_creation)
SELECT 2, a.id_action, r.id_table, NOW()
FROM action a
         JOIN resource r ON r.nm_table IN ('CAMPAIGN', 'MISSION', 'RUNE');

-- DWARF
INSERT INTO attribute (cd_race, cd_action, cd_table, dt_creation)
SELECT 3, a.id_action, r.id_table, NOW()
FROM action a
         JOIN resource r ON r.nm_table = 'MISSION';

-- HUMAN
INSERT INTO attribute (cd_race, cd_action, cd_table, dt_creation)
SELECT 4, a.id_action, r.id_table, NOW()
FROM action a
         JOIN resource r ON r.nm_table = 'MISSION'
WHERE a.nm_action = 'ASSIGN';

-- =========================
-- USER
-- =========================

INSERT INTO calling (id_calling, nm_calling, dt_creation)
VALUES (1, 'SCHOOL', NOW()),
       (2, 'WORK', NOW()),
       (3, 'PERSONAL', NOW());

INSERT INTO adventurous
(nm_user, nm_alias, ds_email, ds_pswd, ds_country, cd_calling, dt_creation)
VALUES ('Arthur Vale', 'IronWolf', 'arthur.vale@ironcitadel.tech', 'Arth0r!2026', 'UK', 2, NOW()),
       ('Luna Bright', 'MoonSeer', 'luna.bright@silverlibrary.edu', 'Lun@Study9', 'USA', 1, NOW()),
       ('Thorin Oak', 'StoneHand', 'thorin.oak@forgeworks.dev', 'St0ne#Hammer', 'Norway', 2, NOW()),
       ('Elena Storm', 'SkyBlade', 'elena.storm@gmail.com', 'SkyBl@de7', 'Brazil', 3, NOW()),
       ('Marcus Reed', 'ShadowQuill', 'marcus.reed@goldenmarket.co', 'Shad0w!Ink', 'Canada', 2, NOW()),
       ('Isolde Night', 'SilverLeaf', 'isolde.night@academy.edu', 'Silv3r!Leaf', 'France', 1, NOW()),
       ('Garen Holt', 'SteelGuard', 'garen.holt@ironcitadel.tech', 'Ste3l#Guard', 'Germany', 2, NOW()),
       ('Nyx Raven', 'DarkRune', 'nyx.raven@outlook.com', 'DarkR@ven8', 'USA', 3, NOW()),
       ('Cedric Dawn', 'LightBearer', 'cedric.dawn@student.edu', 'Light#123D', 'UK', 1, NOW()),
       ('Helga Frost', 'IceForge', 'helga.frost@forgeworks.dev', 'IceF0rge!', 'Sweden', 2, NOW()),
       ('Rowan Ash', 'GreenMind', 'rowan.ash@silverlibrary.edu', 'Gre3n@Mind', 'Ireland', 1, NOW()),
       ('Kael Ember', 'FireBrand', 'kael.ember@yahoo.com', 'FireBr@nd6', 'Spain', 3, NOW()),
       ('Seraphine Vale', 'StarWhisper', 'seraphine.vale@goldenmarket.co', 'St@rWh1sper', 'Italy', 2, NOW()),
       ('Dorian Black', 'NightCrown', 'dorian.black@ironcitadel.tech', 'NightCr0wn!', 'USA', 2, NOW()),
       ('Mira Sol', 'SunWeaver', 'mira.sol@student.edu', 'SunW3av3r@', 'Brazil', 1, NOW());

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

INSERT INTO priority (id_priority, nm_priority, dt_creation)
VALUES (1, 'LOW', NOW()),
       (2, 'MEDIUM', NOW()),
       (3, 'HIGH', NOW()),
       (4, 'LEGENDARY', NOW());

INSERT INTO mission
(nm_mission, dt_start, dt_end, nr_position, cd_board, cd_adventurous, cd_priority, dt_creation)
VALUES ('Design authentication architecture', NOW(), NOW() + INTERVAL '10 days', 1, 1, 3, 3, NOW()),
       ('Define microservice boundaries', NOW(), NOW() + INTERVAL '7 days', 1, 2, 7, 2, NOW()),
       ('Implement JWT security layer', NOW(), NOW() + INTERVAL '5 days', 1, 3, 1, 3, NOW()),
       ('Review payment integration PR', NOW(), NOW() + INTERVAL '2 days', 1, 4, 13, 2, NOW()),
       ('Deploy v1.0 to production', NOW() - INTERVAL '3 days', NOW() - INTERVAL '1 day', 1, 5, 1, 4, NOW()),

       ('Define app navigation flow', NOW(), NOW() + INTERVAL '6 days', 1, 6, 4, 2, NOW()),
       ('Refine push notification strategy', NOW(), NOW() + INTERVAL '4 days', 1, 7, 7, 2, NOW()),
       ('Implement dark mode UI', NOW(), NOW() + INTERVAL '8 days', 1, 8, 3, 3, NOW()),
       ('Code review mobile API integration', NOW(), NOW() + INTERVAL '2 days', 1, 9, 1, 2, NOW()),
       ('Publish beta to app stores', NOW() - INTERVAL '5 days', NOW() - INTERVAL '1 day', 1, 10, 1, 4, NOW()),

       ('List algebra topics for exam', NOW(), NOW() + INTERVAL '3 days', 1, 11, 2, 2, NOW()),
       ('Study calculus derivatives', NOW(), NOW() + INTERVAL '5 days', 1, 12, 6, 3, NOW()),
       ('Solve 50 geometry exercises', NOW(), NOW() + INTERVAL '4 days', 1, 13, 15, 3, NOW()),
       ('Complete full mock exam simulation', NOW() - INTERVAL '7 days', NOW() - INTERVAL '2 days', 1, 14, 2, 4, NOW()),

       ('Brainstorm new brand slogan', NOW(), NOW() + INTERVAL '3 days', 1, 15, 5, 2, NOW()),
       ('Produce Instagram teaser video', NOW(), NOW() + INTERVAL '6 days', 1, 16, 10, 3, NOW()),
       ('Launch influencer partnership campaign', NOW(), NOW() + INTERVAL '10 days', 1, 17, 13, 4, NOW()),
       ('Analyze engagement metrics week 1', NOW(), NOW() + INTERVAL '2 days', 1, 18, 5, 2, NOW()),

       ('Investigate rumors in the capital tavern', NOW(), NOW() + INTERVAL '2 days', 1, 19, 9, 2, NOW()),
       ('Negotiate alliance with northern clans', NOW(), NOW() + INTERVAL '4 days', 1, 20, 12, 3, NOW()),
       ('Lead assault on the royal fortress', NOW(), NOW() + INTERVAL '3 days', 1, 21, 8, 4, NOW()),
       ('Secure the throne and restore order', NOW() - INTERVAL '6 days', NOW() - INTERVAL '1 day', 1, 22, 8, 4, NOW());


INSERT INTO rune (nm_rune, lk_img_form, cd_guild, ds_color, dt_creation)
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


INSERT INTO requirement (cd_mission, cd_rune, dt_creation)
VALUES (1, 1, NOW()),
       (2, 1, NOW()),
       (3, 3, NOW()),
       (4, 1, NOW()),
       (5, 3, NOW()),
       (6, 2, NOW()),
       (7, 3, NOW()),
       (8, 2, NOW()),
       (9, 1, NOW()),
       (10, 3, NOW()),
       (11, 4, NOW()),
       (12, 4, NOW()),
       (13, 4, NOW()),
       (14, 5, NOW()),
       (15, 7, NOW()),
       (16, 7, NOW()),
       (17, 6, NOW()),
       (18, 6, NOW()),
       (19, 9, NOW()),
       (20, 9, NOW()),
       (21, 8, NOW()),
       (22, 8, NOW());

COMMIT;