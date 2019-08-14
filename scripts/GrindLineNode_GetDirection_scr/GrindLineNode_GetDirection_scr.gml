var grindLineNode = argument0;

with(grindLineNode)
{
	var dir = undefined;

	if(instance_exists(m_nextNode))
	{
		return point_direction(x, y, m_nextNode.x, m_nextNode.y); 
	}

	return dir;
}