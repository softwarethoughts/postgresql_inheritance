/**
 * Table users
 */
CREATE TABLE public."user"
(
  id uuid NOT NULL,
  username character varying,
  CONSTRAINT user_pkey PRIMARY KEY (id)
)
