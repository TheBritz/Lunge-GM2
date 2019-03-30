var combatant = argument0;

with(combatant)
{
  var hSpeed = Movable_GetHSpeed_scr(id);
  return abs(hSpeed) > m_movementGroundMaxSpeed * m_movementGroundOverspeedThreshold && sign(hSpeed) == m_facing;
}