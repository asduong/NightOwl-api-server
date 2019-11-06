SELECT DISTINCT id
FROM (
  SELECT venues.id, reviews.entry_fee
  FROM venues
    INNER JOIN visits
    ON venues.id = visits.venue_id
    INNER JOIN reviews
    ON visits.id = reviews.visit_id
  ORDER BY reviews.entry_fee DESC
) a
LIMIT 5;
