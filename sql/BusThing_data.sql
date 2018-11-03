INSERT INTO drivers (driver_id, first_name, last_name) VALUES
  (NULL, 'John', 'Smith')

INSERT INTO buses (registration, make, model, capacity) VALUES
  ('BJ57 TWM', 'Trident 2', 'Dennis', 70)

INSERT INTO stops (stop_id, stop_name, postcode) VALUES
  (NULL, 'Manchester Piccadilly', 'M1 1RG'),
  (NULL, 'Newton Heath Dean Lane', 'M40 3AD'),
  (NULL, 'Hollinwood Mersey Road North', 'M35 9FF'),
  (NULL, 'Garden Suburb', 'OL8 3BE'),
  (NULL, 'Oldham Bus Station', 'OL3 5SR'),
  (NULL, 'Oldham Mumps Bridge', 'OL4 1SY'),
  (NULL, 'Lees County End', 'OL4 4LY'),
  (NULL, 'Grotton Station Road', 'OL4 5SF'),
  (NULL, 'Uppermill', 'OL3 6BF'),
  (NULL, 'Diggle Sunfield Lane', 'OL3 5PS'),
  (NULL, 'Marsden Peel Street', 'HD7 6EZ'),
  (NULL, 'Slaithwaite Star Hotel', 'HD7 5HR'),
  (NULL, 'Cowlersley', 'HD7 5QZ'),
  (NULL, 'Huddersfield Bus Station', 'HD1 2JN')

INSERT INTO routes (route_id, route_name, total_distance, expected_duration, fare) VALUES
  (NULL, '184 - Manchester to Huddersfield', 27, 119, 0.1)

INSERT INTO route_stop (route_stop_id, route_id, stop_id, stop_number, time_offset) VALUES
  (NULL, 1, 1, 1, 0),
  (NULL, 1, 2, 2, 13),
  (NULL, 1, 3, 3, 9),
  (NULL, 1, 4, 4, 6),
  (NULL, 1, 5, 5, 11),
  (NULL, 1, 6, 6, 11),
  (NULL, 1, 7, 7, 8),
  (NULL, 1, 8, 8, 3),
  (NULL, 1, 9, 9, 9),
  (NULL, 1, 10, 10, 6),
  (NULL, 1, 11, 11, 12),
  (NULL, 1, 12, 12, 8),
  (NULL, 1, 13, 13, 8),
  (NULL, 1, 14, 14, 15)

INSERT INTO runs (run_id, driver_id, route_id, bus_reg, start_time) VALUES
  (NULL, 1, 1, 'BJ57 TWM', '2018-12-24 09:28:00')
