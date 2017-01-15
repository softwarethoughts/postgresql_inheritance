--
-- Table to be inherited by publishable relations.
--
CREATE TABLE publishable
(
  id uuid NOT NULL,
  time_modified timestamp without time zone,
  is_public boolean,
  CONSTRAINT publishable_pkey PRIMARY KEY (id)
);
