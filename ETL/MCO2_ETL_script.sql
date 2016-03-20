-- Load location
#INSERT INTO location(mun, zone, brgy, purok)
SELECT distinct mun, zone, brgy, purok FROM db_hpq.hpq_hh;

-- Load crop
#INSERT INTO crop(volume, line, typeID, householdID)
SELECT distinct crop_vol, crop_line, croptype, h.id FROM db_hpq.hpq_crop c INNER JOIN db_hpq.hpq_hh h ON( c.hpq_hh_id = h.id);

-- Load aquani
#INSERT INTO aquani(volume, line, typeID, householdID)
SELECT distinct aquani_vol, aquani_line, aquanitype, h.id FROM db_hpq.hpq_aquani a INNER JOIN db_hpq.hpq_hh h ON( a.hpq_hh_id = h.id);

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

/*
-- Load calamity
INSERT INTO calamity(freq_year)
SELECT 1 as typeID, AVG(calam1_hwmny) as freq_year FROM db_hpq.hpq_hh GROUP BY mun, zone, brgy, purok;
INSERT INTO calamity(freq_year)
SELECT 2 as typeID, AVG(calam2_hwmny) as freq_year FROM db_hpq.hpq_hh GROUP BY mun, zone, brgy, purok;
INSERT INTO calamity(freq_year)
SELECT 3 as typeID, AVG(calam3_hwmny) as freq_year FROM db_hpq.hpq_hh GROUP BY mun, zone, brgy, purok;
INSERT INTO calamity(freq_year)
SELECT 4 as typeID, AVG(calam4_hwmny) as freq_year FROM db_hpq.hpq_hh GROUP BY mun, zone, brgy, purok;
INSERT INTO calamity(freq_year)
SELECT 5 as typeID, AVG(calam5_hwmny) as freq_year FROM db_hpq.hpq_hh GROUP BY mun, zone, brgy, purok;
INSERT INTO calamity(freq_year)
SELECT 6 as typeID, AVG(calam6_hwmny) as freq_year FROM db_hpq.hpq_hh GROUP BY mun, zone, brgy, purok;
INSERT INTO calamity(freq_year)
SELECT 7 as typeID, AVG(calam7_hwmny) as freq_year FROM db_hpq.hpq_hh GROUP BY mun, zone, brgy, purok;
INSERT INTO calamity(freq_year)
SELECT 8 as typeID, AVG(calam8_hwmny) as freq_year FROM db_hpq.hpq_hh GROUP BY mun, zone, brgy, purok;
INSERT INTO calamity(freq_year)
SELECT 9 as typeID, AVG(calam9_hwmny), mun, zone, brgy, purok FROM db_hpq.hpq_hh GROUP BY mun, zone, brgy, purok;
*/ 

-- load aquani type
INSERT INTO aquani_type(type) VALUES("Tilapia");
INSERT INTO aquani_type(type) VALUES("Milkfish");
INSERT INTO aquani_type(type) VALUES("Catfish");
INSERT INTO aquani_type(type) VALUES("Mudfish");
INSERT INTO aquani_type(type) VALUES("Carp");
INSERT INTO aquani_type(type) VALUES("Others");

-- load crop type
INSERT INTO crop_type(type) VALUES("Sugar Cane");
INSERT INTO crop_type(type) VALUES("Palay");
INSERT INTO crop_type(type) VALUES("Corn");
INSERT INTO crop_type(type) VALUES("Coffee");
INSERT INTO crop_type(type) VALUES("Other Crops");

INSERT INTO house(housetype, wall_mat, roof_mat)
SELECT distinct (CASE WHEN house_type = 1 THEN "Single House"
			 WHEN house_type = 2 THEN "Duplex"
			 WHEN house_type = 3 THEN "Multi-Unit Residential"
			 WHEN house_type = 4 THEN "Commercial/Agricultural/Industrial"
		END) as housetype,
		(CASE WHEN wall = 1 THEN "Strong Materials"
			  WHEN wall = 2 THEN "Light Materials"
			  WHEN wall = 3 THEN "Makeshift Materials"
			  WHEN wall = 4 THEN "Predominantly Strong"
			  WHEN wall = 5 THEN "Predominantly Light"
			  WHEN wall = 6 THEN "Predominantly Makeshift"
			  WHEN wall = 7 THEN "N/A"		
		END) as wall_mat,
		(CASE WHEN roof = 1 THEN "Strong Materials"
			  WHEN roof = 2 THEN "Light Materials"
			  WHEN roof = 3 THEN "Makeshift Materials"
			  WHEN roof = 4 THEN "Predominantly Strong"
			  WHEN roof = 5 THEN "Predominantly Light"
			  WHEN roof = 6 THEN "Predominantly Makeshift"
			  WHEN roof = 7 THEN "N/A"		
		END) as roof_mat
FROM db_hpq.hpq_hh;