--SELECT * FROM permissions_by_username('00024ca1-0ef2-438f-8a83-6962e76682fd', 'user2');
--DROP FUNCTION permissions_by_username_pg_class(_publishable_id UUID, _username CHARACTER VARYING);
--SELECT * FROM permissions_by_username_pg_class('00024ca1-0ef2-438f-8a83-6962e76682fd', 'user2');

SELECT pe.* FROM permission pe
		INNER JOIN publishable pu ON pe.publishable_id = pu.id
		INNER JOIN "user" u ON pe.user_id = u.id
	WHERE u.username = 'user2' AND pu.id = '00024ca1-0ef2-438f-8a83-6962e76682fd';

SELECT pe.* FROM permission_blog_article pe
		INNER JOIN blog_article pu ON pe.publishable_id = pu.id
		INNER JOIN "user" u ON pe.user_id = u.id
	WHERE u.username = 'user2' AND pu.id = '00024ca1-0ef2-438f-8a83-6962e76682fd';

SELECT p.relname
	FROM publishable v
	INNER JOIN pg_class p ON v.tableoid = p.oid
	WHERE v.id = '00024ca1-0ef2-438f-8a83-6962e76682fd';