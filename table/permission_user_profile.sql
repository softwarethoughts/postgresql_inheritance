--
--	This table contains permissions of user profiles.	
--
CREATE TABLE permission_user_profile
(
-- Inherited from table permission:  publishable_id uuid NOT NULL,
-- Inherited from table permission:  user_id uuid NOT NULL,
-- Inherited from table permission:  read boolean,
-- Inherited from table permission:  write boolean,
  CONSTRAINT permission_user_profile_pkey PRIMARY KEY (publishable_id, user_id)
)
INHERITS (permission);
