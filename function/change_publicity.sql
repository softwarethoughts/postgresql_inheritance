--
--	Change the publicity of publishable entities.
--
--	@params _id		The id of the entity
--	@params _is_public	TRUE if new status is public, FALSE if not 
--
CREATE FUNCTION change_publicity(_id UUID, _is_public BOOLEAN)
RETURNS VOID AS
$$
	DECLARE _relname CHARACTER VARYING;
BEGIN
	-- Join the postgresql system table pg_class to find out the type of relation for the given identifier _id.
    SELECT p.relname INTO _relname
	FROM publishable v
	INNER JOIN pg_class p ON v.tableoid = p.oid
	WHERE v.id = _id;

	IF _relname IS NOT NULL THEN
		-- Use execute format to decide at runtime on which table to update the publicity flag.
		EXECUTE FORMAT('UPDATE %I SET is_public = $1 WHERE id = $2', _relname) USING _is_public, _id;
	END IF;
END;
$$
LANGUAGE plpgsql;
