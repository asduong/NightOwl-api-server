SELECT DISTINCT id, latitude, longitude, name
FROM (
  SELECT venues.id, reviews.line_size, venues.latitude, venues.longitude, venues.name
  FROM venues
    INNER JOIN visits
    ON venues.id = visits.venue_id
    INNER JOIN reviews
    ON visits.id = reviews.visit_id
  ORDER BY reviews.line_size ASC
) a
LIMIT 5;
