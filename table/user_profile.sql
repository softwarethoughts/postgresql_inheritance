--
--	This table contains publishable user profiles.	
--
CREATE TABLE user_profile
(
	firstname text,
	lastname text,
	about_me text,
	CONSTRAINT user_profile_pkey PRIMARY KEY (id)
)
INHERITS (publishable);
