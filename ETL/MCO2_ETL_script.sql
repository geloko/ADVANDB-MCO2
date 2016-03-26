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

INSERT INTO aquani_type
SELECT distinct IFNULL(aquanitype, 7), (CASE WHEN aquanitype = 1 THEN "Tilapia"
			 WHEN aquanitype = 2 THEN "Milkfish"
			 WHEN aquanitype = 3 THEN "Catfish"
			 WHEN aquanitype = 4 THEN "Mudfish"
			 WHEN aquanitype = 5 THEN "Carp"
			 WHEN aquanitype = 6 THEN "Others"
			 WHEN aquanitype IS NULL THEN "Undefined"
		END)
FROM db_hpq.hpq_aquani;

INSERT INTO crop_type
SELECT distinct IFNULL(croptype, 6), (CASE WHEN croptype = 1 THEN "Sugar Cane"
			 WHEN croptype = 2 THEN "Palay"
			 WHEN croptype = 3 THEN "Corn"
			 WHEN croptype = 4 THEN "Coffee"
			 WHEN croptype = 5 THEN "Other Crops"
			 WHEN croptype IS NULL THEN "Undefined"
		END)
FROM db_hpq.hpq_crop;

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

