INSERT INTO drivers (driver_id, first_name, last_name) VALUES
  (NULL, 'John', 'Smith'),
  (NULL, 'Maryanne', 'Reed'),
  (NULL, 'Alfreda', 'Kevins'),
  (NULL, 'Hudson', 'Nicolson'),
  (NULL, 'Tamika', 'Waldroup'),
  (NULL, 'Perce', 'Russel'),
  (NULL, 'Gamal', 'Warner'),
  (NULL, 'Lena', 'Gilliam'),
  (NULL, 'Finley', 'Hughes'),
  (NULL, 'Shakil', 'Newport'),
  (NULL, 'Dwight', 'Knaggs')


INSERT INTO icons (icon_id, url, alt_text) VALUES
  (NULL, '../images/single_decker.svg', 'Single Decker'),
  (NULL, '../images/double_decker.svg', 'Double Decker')

INSERT INTO buses (registration, make, model, capacity, icon_id) VALUES
  ('BJ57 TWM', 'Trident 2', 'Dennis', 70, 2),
  ('MK02 VVG', 'Albion', 'Aberdonian ', 35, 1)

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
  (NULL, 1, 1, 'BJ57 TWM', '2018-12-24 09:28:00'),
  (NULL, 2, 1, 'BJ57 TWM', '2018-12-24 09:58:00'),
  (NULL, 3, 1, 'BJ57 TWM', '2018-12-24 10:28:00'),
  (NULL, 4, 1, 'BJ57 TWM', '2018-12-24 10:58:00'),
  (NULL, 5, 1, 'MK02 VVG', '2018-12-24 11:28:00'),
  (NULL, 6, 1, 'MK02 VVG', '2018-12-24 11:58:00'),
  (NULL, 7, 1, 'MK02 VVG', '2018-12-24 12:28:00'),
  (NULL, 8, 1, 'MK02 VVG', '2018-12-24 12:58:00'),
  (NULL, 9, 1, 'BJ57 TWM', '2018-12-24 13:28:00'),
  (NULL, 10, 1, 'BJ57 TWM', '2018-12-24 13:58:00'),
  (NULL, 11, 1, 'BJ57 TWM', '2018-12-24 14:28:00'),
  (NULL, 1, 1, 'BJ57 TWM', '2018-12-24 14:58:00'),
  (NULL, 2, 1, 'MK02 VVG', '2018-12-24 15:28:00'),
  (NULL, 3, 1, 'MK02 VVG', '2018-12-24 15:58:00'),
  (NULL, 4, 1, 'MK02 VVG', '2018-12-24 16:28:00'),
  (NULL, 5, 1, 'BJ57 TWM', '2018-12-24 16:58:00'),
  (NULL, 6, 1, 'BJ57 TWM', '2018-12-24 17:28:00'),
  (NULL, 1, 1, 'BJ57 TWM', '2018-12-25 09:28:00'),
  (NULL, 2, 1, 'BJ57 TWM', '2018-12-25 09:58:00'),
  (NULL, 3, 1, 'BJ57 TWM', '2018-12-25 10:28:00'),
  (NULL, 4, 1, 'BJ57 TWM', '2018-12-25 10:58:00'),
  (NULL, 5, 1, 'MK02 VVG', '2018-12-25 11:28:00'),
  (NULL, 6, 1, 'MK02 VVG', '2018-12-25 11:58:00'),
  (NULL, 7, 1, 'MK02 VVG', '2018-12-25 12:28:00'),
  (NULL, 8, 1, 'MK02 VVG', '2018-12-25 12:58:00'),
  (NULL, 9, 1, 'BJ57 TWM', '2018-12-25 13:28:00'),
  (NULL, 10, 1, 'BJ57 TWM', '2018-12-25 13:58:00'),
  (NULL, 11, 1, 'BJ57 TWM', '2018-12-25 14:28:00'),
  (NULL, 1, 1, 'BJ57 TWM', '2018-12-25 14:58:00'),
  (NULL, 2, 1, 'MK02 VVG', '2018-12-25 15:28:00'),
  (NULL, 3, 1, 'MK02 VVG', '2018-12-25 15:58:00'),
  (NULL, 4, 1, 'MK02 VVG', '2018-12-25 16:28:00'),
  (NULL, 5, 1, 'BJ57 TWM', '2018-12-25 16:58:00'),
  (NULL, 6, 1, 'BJ57 TWM', '2018-12-25 17:28:00'),
  (NULL, 1, 1, 'BJ57 TWM', '2018-12-26 09:28:00'),
  (NULL, 2, 1, 'BJ57 TWM', '2018-12-26 09:58:00'),
  (NULL, 3, 1, 'BJ57 TWM', '2018-12-26 10:28:00'),
  (NULL, 4, 1, 'BJ57 TWM', '2018-12-26 10:58:00'),
  (NULL, 5, 1, 'MK02 VVG', '2018-12-26 11:28:00'),
  (NULL, 6, 1, 'MK02 VVG', '2018-12-26 11:58:00'),
  (NULL, 7, 1, 'MK02 VVG', '2018-12-26 12:28:00'),
  (NULL, 8, 1, 'MK02 VVG', '2018-12-26 12:58:00'),
  (NULL, 9, 1, 'BJ57 TWM', '2018-12-26 13:28:00'),
  (NULL, 10, 1, 'BJ57 TWM', '2018-12-26 13:58:00'),
  (NULL, 11, 1, 'BJ57 TWM', '2018-12-26 14:28:00'),
  (NULL, 1, 1, 'BJ57 TWM', '2018-12-26 14:58:00'),
  (NULL, 2, 1, 'MK02 VVG', '2018-12-26 15:28:00'),
  (NULL, 3, 1, 'MK02 VVG', '2018-12-26 15:58:00'),
  (NULL, 4, 1, 'MK02 VVG', '2018-12-26 16:28:00'),
  (NULL, 5, 1, 'BJ57 TWM', '2018-12-26 16:58:00'),
  (NULL, 6, 1, 'BJ57 TWM', '2018-12-26 17:28:00')
