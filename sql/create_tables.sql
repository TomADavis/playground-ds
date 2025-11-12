CREATE TABLE IF NOT EXISTS drivers(
  driver_id INTEGER PRIMARY KEY,
  signup_date DATE,
  city VARCHAR
);
CREATE TABLE IF NOT EXISTS riders(
  rider_id INTEGER PRIMARY KEY,
  signup_date DATE,
  segment VARCHAR
);
CREATE TABLE IF NOT EXISTS trips(
  trip_id INTEGER PRIMARY KEY,
  rider_id INTEGER,
  driver_id INTEGER,
  trip_ts TIMESTAMP,
  duration_min DOUBLE,
  distance_km DOUBLE,
  fare DOUBLE,
  surge_mult DOUBLE
);
CREATE TABLE IF NOT EXISTS payments(
  payment_id INTEGER PRIMARY KEY,
  trip_id INTEGER,
  pay_ts TIMESTAMP,
  method VARCHAR,
  amount DOUBLE
);
