DO $$
	DECLARE _relname CHARACTER VARYING;
	DECLARE count INTEGER;
	DECLARE _content TEXT;
	DECLARE _title TEXT;
	DECLARE _publishable_id UUID;
	DECLARE _user_id UUID[];
BEGIN
	_content := 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ';

	_title := 'Lorem ipsum dolor sit ';

	count := 0;
	WHILE count < 1000000 LOOP
		INSERT INTO user_profile (id, time_modified, is_public) VALUES (uuid_generate_v4(), NOW(), FALSE);
		INSERT INTO blog_article (id, time_modified, is_public, title, content) VALUES (uuid_generate_v4(), NOW(), FALSE, _title || count::TEXT, _content || count::TEXT);
		count := count + 1;
	END LOOP;

	WITH user_id AS (
		INSERT INTO "user" (id, username) VALUES(uuid_generate_v4(), 'user1')
		RETURNING id
	)
	SELECT _user_id || ARRAY[id] INTO _user_id FROM user_id;
 	
	WITH user_id AS (
		INSERT INTO "user" (id, username) VALUES(uuid_generate_v4(), 'user2')
		RETURNING id
	)
	SELECT _user_id || ARRAY[id] INTO _user_id FROM user_id;

	WITH user_id AS (
		INSERT INTO "user" (id, username) VALUES(uuid_generate_v4(), 'user3')
		RETURNING id
	)
	SELECT _user_id || ARRAY[id] INTO _user_id FROM user_id;

	count := 1;

	FOR _publishable_id IN
		SELECT id FROM publishable
	LOOP
		IF count = 4 THEN count := 1; END IF;
		
		SELECT p.relname INTO _relname
		FROM publishable v
		INNER JOIN pg_class p ON v.tableoid = p.oid
		WHERE v.id = _publishable_id;

		EXECUTE FORMAT('INSERT INTO %I (publishable_id, user_id, read, write) VALUES ($1, $2, TRUE, TRUE)',
		'permission_' || _relname) USING _publishable_id, _user_id[count];

		count := count + 1;
	END LOOP;
END$$;
