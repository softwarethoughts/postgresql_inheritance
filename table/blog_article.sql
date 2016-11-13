/**
 *	This table contains publishable blog articles.
 */
CREATE TABLE blog_article
(
	title TEXT,
	content TEXT,
	CONSTRAINT blog_article_pkey PRIMARY KEY (id),
	CONSTRAINT blog_article_replaced_by_id_fkey FOREIGN KEY (replaced_by_id)
		REFERENCES public.blog_article (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT blog_article_replaces_id_fkey FOREIGN KEY (replaces_id)
		REFERENCES public.blog_article (id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
)
INHERITS (versionable);
