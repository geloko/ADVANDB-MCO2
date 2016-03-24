-- Load location
INSERT INTO location(mun, zone, brgy, purok)
SELECT distinct mun, zone, brgy, purok FROM db_hpq.hpq_hh;

-- Load Calamity type
INSERT INTO calamity_type VALUES (1, "typhoon");
INSERT INTO calamity_type VALUES (2, "flood");
INSERT INTO calamity_type VALUES (3, "drought");
INSERT INTO calamity_type VALUES (4, "earthquake");
INSERT INTO calamity_type VALUES (5, "volcanic eruption");
INSERT INTO calamity_type VALUES (6, "landslide");
INSERT INTO calamity_type VALUES (7, "tsunami");
INSERT INTO calamity_type VALUES (8, "fire");
INSERT INTO calamity_type VALUES (9, "forest fire");

-- load aquani type
INSERT INTO aquani_type(type) VALUES("Tilapia");
INSERT INTO aquani_type(type) VALUES("Milkfish");
INSERT INTO aquani_type(type) VALUES("Catfish");
INSERT INTO aquani_type(type) VALUES("Mudfish");
INSERT INTO aquani_type(type) VALUES("Carp");
INSERT INTO aquani_type(type) VALUES("Others");
INSERT INTO aquani_type(type) VALUES("Undefined");

-- load crop type
INSERT INTO crop_type(type) VALUES("Sugar Cane");
INSERT INTO crop_type(type) VALUES("Palay");
INSERT INTO crop_type(type) VALUES("Corn");
INSERT INTO crop_type(type) VALUES("Coffee");
INSERT INTO crop_type(type) VALUES("Other Crops");
INSERT INTO crop_type(type) VALUES("Undefined");


INSERT INTO housetype
SELECT distinct house_type, (CASE WHEN house_type = 1 THEN "Single House"
			 WHEN house_type = 2 THEN "Duplex"
			 WHEN house_type = 3 THEN "Multi-Unit Residential"
			 WHEN house_type = 4 THEN "Commercial/Agricultural/Industrial"
			 WHEN house_type = 5 THEN "Others"
		END)
FROM db_hpq.hpq_hh;

INSERT INTO wall
SELECT distinct wall, (CASE WHEN wall = 1 THEN "Strong Materials"
			  WHEN wall = 2 THEN "Light Materials"
			  WHEN wall = 3 THEN "Makeshift Materials"
			  WHEN wall = 4 THEN "Predominantly Strong"
			  WHEN wall = 5 THEN "Predominantly Light"
			  WHEN wall = 6 THEN "Predominantly Makeshift"
			  WHEN wall = 7 THEN "N/A"		
		END)
FROM db_hpq.hpq_hh;

INSERT INTO roof
SELECT distinct roof, (CASE WHEN roof = 1 THEN "Strong Materials"
			  WHEN roof = 2 THEN "Light Materials"
			  WHEN roof = 3 THEN "Makeshift Materials"
			  WHEN roof = 4 THEN "Predominantly Strong"
			  WHEN roof = 5 THEN "Predominantly Light"
			  WHEN roof = 6 THEN "Predominantly Makeshift"
			  WHEN roof = 7 THEN "N/A"		
		END)
FROM db_hpq.hpq_hh;

INSERT INTO household
SELECT H.id, L.id AS location, house_type, wall, roof
FROM db_hpq.hpq_hh H LEFT JOIN location L 
		ON H.mun = L.mun AND H.zone = L.zone AND H.brgy = L.brgy AND H.purok = L.purok
GROUP BY H.id;

INSERT INTO crop(volume, line, typeID, locationID)
SELECT crop_vol, crop_line, IFNULL(croptype, 6), h.locationID 
FROM db_hpq.hpq_crop c INNER JOIN household h ON( c.hpq_hh_id = h.id);

INSERT INTO aquani(volume, line, typeID, locationID)
SELECT distinct aquani_vol, aquani_line, IFNULL(aquanitype, 7), h.locationID 
FROM db_hpq.hpq_aquani a INNER JOIN household h ON ( a.hpq_hh_id = h.id);

INSERT INTO calamity(typeID, freq_year, locationID)
SELECT 1, AVG(calam1_hwmny), l.id
FROM db_hpq.hpq_hh h INNER JOIN location l ON (h.mun = l.mun AND h.zone = l.zone AND h.brgy = l.brgy AND h.purok = l.purok)
GROUP BY l.id;

INSERT INTO calamity(typeID, freq_year, locationID)
SELECT 2, AVG(calam2_hwmny), l.id
FROM db_hpq.hpq_hh h INNER JOIN location l ON (h.mun = l.mun AND h.zone = l.zone AND h.brgy = l.brgy AND h.purok = l.purok)
GROUP BY l.id;

INSERT INTO calamity(typeID, freq_year, locationID)
SELECT 3, AVG(calam3_hwmny), l.id
FROM db_hpq.hpq_hh h INNER JOIN location l ON (h.mun = l.mun AND h.zone = l.zone AND h.brgy = l.brgy AND h.purok = l.purok)
GROUP BY l.id;

INSERT INTO calamity(typeID, freq_year, locationID)
SELECT 4, AVG(calam4_hwmny), l.id
FROM db_hpq.hpq_hh h INNER JOIN location l ON (h.mun = l.mun AND h.zone = l.zone AND h.brgy = l.brgy AND h.purok = l.purok)
GROUP BY l.id;

INSERT INTO calamity(typeID, freq_year, locationID)
SELECT 5, AVG(calam5_hwmny), l.id
FROM db_hpq.hpq_hh h INNER JOIN location l ON (h.mun = l.mun AND h.zone = l.zone AND h.brgy = l.brgy AND h.purok = l.purok)
GROUP BY l.id;

INSERT INTO calamity(typeID, freq_year, locationID)
SELECT 6, AVG(calam6_hwmny), l.id
FROM db_hpq.hpq_hh h INNER JOIN location l ON (h.mun = l.mun AND h.zone = l.zone AND h.brgy = l.brgy AND h.purok = l.purok)
GROUP BY l.id;

INSERT INTO calamity(typeID, freq_year, locationID)
SELECT 7, AVG(calam7_hwmny), l.id
FROM db_hpq.hpq_hh h INNER JOIN location l ON (h.mun = l.mun AND h.zone = l.zone AND h.brgy = l.brgy AND h.purok = l.purok)
GROUP BY l.id;

INSERT INTO calamity(typeID, freq_year, locationID)
SELECT 8, AVG(calam8_hwmny), l.id
FROM db_hpq.hpq_hh h INNER JOIN location l ON (h.mun = l.mun AND h.zone = l.zone AND h.brgy = l.brgy AND h.purok = l.purok)
GROUP BY l.id;

INSERT INTO calamity(typeID, freq_year, locationID)
SELECT 9, AVG(calam9_hwmny), l.id
FROM db_hpq.hpq_hh h INNER JOIN location l ON (h.mun = l.mun AND h.zone = l.zone AND h.brgy = l.brgy AND h.purok = l.purok)
GROUP BY l.id;

