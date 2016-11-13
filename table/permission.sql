﻿/**
*	This table contains permissions of publishable entities.	
*/
CREATE TABLE permission
(
  publishable_id uuid NOT NULL,
  user_id uuid NOT NULL,
  read boolean,
  write boolean,
  CONSTRAINT permission_pkey PRIMARY KEY (publishable_id, user_id)
);
