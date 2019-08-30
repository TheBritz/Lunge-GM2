/// @param grinLineNode

var grindLineNode = argument[0];

var grindDir = 1;
if(argument_count > 1)
{
  grindDir = argument[1];
}

with(grindLineNode)
{
	var dir = undefined;

	if(instance_exists(m_nextNode))
	{
    if(grindDir == -1)
    {
      return point_direction(m_nextNode.x, m_nextNode.y, x, y);
    }
    else
    {
		  return point_direction(x, y, m_nextNode.x, m_nextNode.y); 
    }
	}

	return dir;
}