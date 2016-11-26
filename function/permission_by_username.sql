--
--	Get users permission on an publishable entity.
--
--	@params _publishable_id		The id of the entity
--	@params _username			The username to get the permissions for 
CREATE FUNCTION permissions_by_username(_publishable_id UUID, _username CHARACTER VARYING)
RETURNS SETOF permission AS
$$
	DECLARE _relname CHARACTER VARYING;
BEGIN
	RETURN QUERY SELECT pe.* FROM permission pe
		INNER JOIN publishable pu ON pe.publishable_id = pu.id
		INNER JOIN "user" u ON pe.user_id = u.id
	WHERE u.username = _username AND pu.id = _publishable_id;
END;
$$
LANGUAGE plpgsql;