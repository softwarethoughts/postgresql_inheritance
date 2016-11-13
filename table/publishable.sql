/**
* Table to be inherited by publishable relations.
*/
CREATE TABLE public.publishable
(
  id uuid NOT NULL,
  time_modified timestamp without time zone,
  is_public boolean,
  CONSTRAINT versionable_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);