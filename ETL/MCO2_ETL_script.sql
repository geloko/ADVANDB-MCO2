-- Load location
#INSERT INTO location(mun, zone, brgy, purok)
SELECT distinct mun, zone, brgy, purok FROM db_hpq.hpq_hh;

-- Load crop
#INSERT INTO crop(volume, line, typeID, householdID)
SELECT distinct crop_vol, crop_line, croptype, h.id FROM db_hpq.hpq_crop c INNER JOIN db_hpq.hpq_hh h ON( c.hpq_hh_id = h.id);

-- Load aquani
#INSERT INTO aquani(volume, line, typeID, householdID)
SELECT distinct aquani_vol, aquani_line, aquanitype, h.id FROM db_hpq.hpq_aquani a INNER JOIN db_hpq.hpq_hh h ON( a.hpq_hh_id = h.id);
