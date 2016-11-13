DO $$
	DECLARE _relname CHARACTER VARYING;
	DECLARE count INTEGER;
	DECLARE _content TEXT;
	DECLARE _title TEXT;
	DECLARE _publishable_id UUID;
	DECLARE _user_id UUID[];
BEGIN
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

		EXECUTE FORMAT('INSERT INTO %I (publishable_id, user_id, read, write) VALUES (uuid_generate_v4(), $1, TRUE, TRUE)',
		'permission_' || _relname) USING _user_id[count];

		count := count + 1;
	END LOOP;
END$$;
