/**
*	This table contains publishable user profiles.	
*/
CREATE TABLE user_profile
(
	firstname text,
	lastname text,
	about_me text,
	CONSTRAINT user_profile_pkey PRIMARY KEY (id),
	CONSTRAINT user_profile_replaced_by_id_fkey FOREIGN KEY (replaced_by_id)
		REFERENCES public.user_profile (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT user_profile_replaces_id_fkey FOREIGN KEY (replaces_id)
		REFERENCES public.user_profile (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
)
INHERITS (versionable);