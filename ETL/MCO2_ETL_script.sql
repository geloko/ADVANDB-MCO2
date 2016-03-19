-- Load location
#INSERT INTO location(mun, zone, brgy, purok)
SELECT distinct mun, zone, brgy, purok FROM db_hpq.hpq_hh;

-- Load crop
#INSERT INTO crop(volume, line, typeID)
SELECT distinct crop_vol, crop_line, croptype FROM db_hpq.hpq_hh h INNER JOIN dp_hpq.hpq_crop c ON (h.id = c.hpq_hh_id);

-- Load aquani
#INSERT INTO aquani(volume, line, typeID)
SELECT distinct aquani_vol, aquani_line, aquanitype FROM db_hpq.hpq_hh h INNER JOIN dp_hpq.hpq_aquani a ON (h.id = a.hpq_hh_id);
