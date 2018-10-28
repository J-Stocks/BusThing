bus_thing@localhost
bustling

CREATE TABLE drivers (
  driver_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name varchar(30) NOT NULL,
  last_name varchar(30) NOT NULL,
  CONSTRAINT PRIMARY KEY (driver_id)
);

CREATE TABLE buses (
  registration char(7) NOT NULL,
  make varchar(20) NOT NULL,
  model varchar(30) NOT NULL,
  capacity tinyint UNSIGNED NOT NULL,
  CONSTRAINT PRIMARY KEY (registration)
);

CREATE TABLE stops (
  stop_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  stop_name varchar(50) NOT NULL,
  postcode varchar(7) NOT NULL,
  CONSTRAINT PRIMARY KEY (stop_id)
);

CREATE TABLE routes (
  route_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  route_name varchar(20) NOT NULL,
  total_distance float UNSIGNED NOT NULL,
  expected_duration smallint UNSIGNED NOT NULL,
  fare float UNSIGNED NOT NULL,
  CONSTRAINT PRIMARY KEY (route_id)
);

CREATE TABLE route_stop (
  route_stop_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  route_id int UNSIGNED NOT NULL,
  stop_id int UNSIGNED NOT NULL,
  stop_number smallint UNSIGNED NOT NULL,
  time_offset smallint UNSIGNED NOT NULL,
  CONSTRAINT PRIMARY KEY (route_stop_id),
  CONSTRAINT fk__route_stop_routes__route_id FOREIGN KEY (route_id) REFERENCES routes(route_id),
  CONSTRAINT fk__route_stop_stops__stop_id FOREIGN KEY (stop_id) REFERENCES  stops(stop_id)
);

CREATE TABLE runs (
  run_id int UNSIGNED NOT NULL AUTO_INCREMENT,
  driver_id int UNSIGNED NOT NULL,
  route_id int UNSIGNED NOT NULL,
  bus_reg char(7) NOT NULL,
  start_time datetime,
  CONSTRAINT PRIMARY KEY (run_id),
  CONSTRAINT fk__run_drivers__driver_id FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
  CONSTRAINT fk__run_routes__route_id FOREIGN KEY (route_id) REFERENCES routes(route_id),
  CONSTRAINT fl__run_buses__bus_reg FOREIGN KEY (bus_reg) REFERENCES buses(registration)
);
