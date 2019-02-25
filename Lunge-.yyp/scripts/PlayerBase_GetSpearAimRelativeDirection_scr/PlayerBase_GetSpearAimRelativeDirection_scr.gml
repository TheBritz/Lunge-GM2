/// param playerInstance

var player = argument0;

with(player)
{
	var dir = m_spear.image_angle;
	if(m_facing == -1)
	{
		dir = 180 - dir;
	}
	
	return dir;
	
	//if(m_spear.image_angle == 0 && m_facing == 1 || m_spear.image_angle == 180 && m_facing == -1)
	//{
	//	return AttackDirection.Forward;
	//}
	//else if(m_spear.image_angle == 0 && m_facing == -1 || m_spear.image_angle == 180 && m_facing == 1)
	//{
	//	return AttackDirection.Behind;
	//}
}