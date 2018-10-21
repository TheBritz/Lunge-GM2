var enemy = argument0;
var position = argument1;

if(!ds_map_exists(m_engagementPositionAssignementsByPos, position))
{
  var rangeLow = -m_engagementPositionRangeWidth/2;
  var rangeHigh = m_engagementPositionRangeWidth/2;
  var relativePos = 
    position * m_engagementPositionSeparation + irandom_range(rangeLow, rangeHigh);
  
  EngagementController_ReleasePosition_scr(enemy);
  
  m_engagementPositionAssignementsByPos[? position] = enemy;
  m_engagementPositionAssignementsByEnemy[? enemy] = position;

  enemy.m_engagementPosition = relativePos;
  
  if(position < 0)
  {
    m_engagementNumberOnLeft++;
  }
  else if(position > 0)
  {
    m_engagementNumberOnRight++;
  }

  return relativePos;
}

return undefined;