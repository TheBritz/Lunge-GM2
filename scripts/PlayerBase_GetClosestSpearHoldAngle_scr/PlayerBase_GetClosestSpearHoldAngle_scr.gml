/// @description PlayerBase_GetClosestSpearHoldAngle_scr(player, angle)
/// @param player
/// @param  angle

var player = argument0;
var angle = argument1;
var smallestDiff = 360;
var bestMatch = undefined;
var diff;
with(player)
{
  for(var increment = 0; increment < 360; increment += m_spearHoldAngleIncrement)
  {
    diff = abs(angle_difference(angle, increment));
    if(diff < smallestDiff)
    {
      bestMatch = increment;
      smallestDiff = diff;
    }       
  }
  
  return bestMatch;
}
