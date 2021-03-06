DROP TABLE IF EXISTS users
CASCADE;
DROP TABLE IF EXISTS visits
CASCADE;
DROP TABLE IF EXISTS venues
CASCADE;
DROP TABLE IF EXISTS reviews
CASCADE;



CREATE TABLE users
(
  id SERIAL PRIMARY KEY NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  age DECIMAL(9,0) NOT NULL,
  gender VARCHAR(255) NOT NULL,
  UNIQUE (email)
);

CREATE TABLE venues
(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255),
  province VARCHAR(255),
  country VARCHAR(255),
  latitude DECIMAL(9,6),
  longitude DECIMAL(9,6),
  display_picture VARCHAR(500),
  phone_number VARCHAR(255),
  email VARCHAR(255),
  postal_code VARCHAR(255)
);

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  venue_id INTEGER REFERENCES venues(id) ON DELETE CASCADE,
  created_at timestamp not null default CURRENT_TIMESTAMP
);

CREATE TABLE reviews
(
  id SERIAL PRIMARY KEY NOT NULL,
  visit_id INTEGER REFERENCES visits(id) ON DELETE CASCADE,
  line_size INTEGER,
  entry_fee INTEGER,
  dress_code VARCHAR(255),
  music_type VARCHAR(255),
  img VARCHAR(600)
);