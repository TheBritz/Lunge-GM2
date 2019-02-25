/// @param currentOccupantOrPosition
/// @param target[optional]

var currentOccupantOrPosition = argument[0];

var controller;
if(argument_count > 1)
{
  var target = argument[1];
	controller = EngagementController_GetTargetController_scr(target);
}
else
{
	controller = id;
}

if(instance_exists(controller))
{
	with(controller)
	{
		var occupant, pos;
		if(currentOccupantOrPosition >= 10000)
		{
		  occupant = currentOccupantOrPosition;
		  pos = m_engagementPositionAssignementsByEnemy[? occupant];
		}
		else
		{
		  pos = currentOccupantOrPosition;
		  occupant = m_engagementPositionAssignementsByPos[? pos];
		}
  
		if(!is_undefined(occupant))
		{
		  ds_map_delete(m_engagementPositionAssignementsByEnemy, occupant);
		}

		if(!is_undefined(pos))
		{
		  ds_map_delete(m_engagementPositionAssignementsByPos, pos);
		}
	}
}
