/**
 *	This table contains publishable blog articles.
 */
CREATE TABLE blog_article
(
	title TEXT,
	content TEXT,
	CONSTRAINT blog_article_pkey PRIMARY KEY (id)
)
INHERITS (publishable);
