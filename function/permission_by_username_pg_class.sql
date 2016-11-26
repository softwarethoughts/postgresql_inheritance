--
--	Get users permission on an publishable entity.
--
--	@params _publishable_id		The id of the entity
--	@params _username			The username to get the permissions for 
CREATE FUNCTION permissions_by_username_pg_class(_publishable_id UUID, _username CHARACTER VARYING)
RETURNS SETOF permission AS
$$
	DECLARE _relname CHARACTER VARYING;
BEGIN
	-- Join the postgresql system table pg_class to find out the type of relation for the given identifier _id.
    SELECT p.relname INTO _relname
	FROM publishable v
	INNER JOIN pg_class p ON v.tableoid = p.oid
	WHERE v.id = _publishable_id;

	RETURN QUERY 
	-- Use execute format to decide at runtime on which table to update the publicity flag.
	EXECUTE FORMAT('SELECT pe.* FROM %I pe
						INNER JOIN %I pu ON pe.publishable_id = pu.id
						INNER JOIN "user" u ON pe.user_id = u.id
					WHERE u.username = $1 AND pu.id = $2', 'permission_' || _relname, _relname) USING _username, _publishable_id;
END;
$$
LANGUAGE plpgsql;