/// @param currentOccupantOrPosition

var currentOccupantOrPosition = argument[0];

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
  ds_list_delete(m_engagementPositionAssignementsByEnemy, occupant);
}

if(!is_undefined(pos))
{
  ds_list_delete(m_engagementPositionAssignementsByPos, pos);
}

