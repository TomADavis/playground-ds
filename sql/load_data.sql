COPY drivers  FROM 'data_raw/drivers.csv'  (AUTO_DETECT TRUE, HEADER TRUE);
COPY riders   FROM 'data_raw/riders.csv'   (AUTO_DETECT TRUE, HEADER TRUE);
COPY trips    FROM 'data_raw/trips.csv'    (AUTO_DETECT TRUE, HEADER TRUE);
COPY payments FROM 'data_raw/payments.csv' (AUTO_DETECT TRUE, HEADER TRUE);

CREATE INDEX IF NOT EXISTS trips_driver_idx   ON trips(driver_id);
CREATE INDEX IF NOT EXISTS payments_trip_idx  ON payments(trip_id);
