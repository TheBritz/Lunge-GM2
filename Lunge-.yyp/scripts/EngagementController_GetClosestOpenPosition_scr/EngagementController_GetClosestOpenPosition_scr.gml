/// @param leftOrRight[Direction2D]

enum Direction2D
{
  None = 0,
  Left = -1,
  Right = 1,
  Up = -2,
  Down = 2
}

var side = argument0;
var checks;

if(side == 0)
{
  checks = array(Direction2D.Right, Direction2D.Left);
}
else
{
  checks = array(side);
}

var safetyCounter = ds_map_size(m_engagementPositionAssignementsByPos) + 2;

var dir;
var i = 1;
var iActual;
var checkNumber = array_length_1d(checks);
do
{
  for(var ii = 0; ii < checkNumber; ii++)
  {
    dir = checks[ii];
    iActual = dir * i;
    if(!ds_map_exists(m_engagementPositionAssignementsByPos, iActual))
    {
      return iActual;
    }
    else
    {
      var occupant = m_engagementPositionAssignementsByPos[? iActual];
      if(!instance_exists(occupant))
      {
        ds_map_delete(m_engagementPositionAssignementsByPos, iActual);
        return iActual;
      }
    }
  }
  
  i++;
}until(i > safetyCounter)

return undefined;