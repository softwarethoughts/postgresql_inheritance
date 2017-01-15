--
--	This table contains permissions of blog articles.	
--
CREATE TABLE permission_blog_article
(
-- Inherited from table permission:  publishable_id uuid NOT NULL,
-- Inherited from table permission:  user_id uuid NOT NULL,
-- Inherited from table permission:  read boolean,
-- Inherited from table permission:  write boolean,
  CONSTRAINT permission_blog_article_pkey PRIMARY KEY (publishable_id, user_id)
)
INHERITS (permission);
