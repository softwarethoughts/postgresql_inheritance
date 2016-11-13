/**
*	Change the publicity of publishable entities on the inherited table.
*
*	@params _id		The id of the entity
*	@params _is_public	TRUE if new status is public, FALSE if not 
*/
CREATE FUNCTION change_publicity_on_publishable(_id UUID, _is_public BOOLEAN)
RETURNS VOID AS
$$
BEGIN
	UPDATE publishable SET is_public = _is_public WHERE id = _id;
END;
$$
LANGUAGE plpgsql;