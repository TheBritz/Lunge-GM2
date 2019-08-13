/// @param obj The object index or instance to check whether or not a collision is occuring with a grind line
var obj = argument0;

with(GrindLineNodeBase_obj)
{
	//Only check collision on those nodes that have connections
	if(instance_exists(m_nextNode))
	{
		var node = id;
		var collided = collision_line(node.x, node.y, 
		  node.m_nextNode.x, node.m_nextNode.y, obj, false, false);
		if(collided)
		{
			return true;
		}
	}
}

return false;