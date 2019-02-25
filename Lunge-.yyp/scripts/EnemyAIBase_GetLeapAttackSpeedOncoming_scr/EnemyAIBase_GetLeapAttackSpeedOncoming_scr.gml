/// @param enemy

var enemy = argument0;

with(enemy)
{
  if(!is_undefined(m_combatLeapAttackSpeedOncoming))
  {
    return m_combatLeapAttackSpeedOncoming;
  }
  else if(!is_undefined(m_combatLeapAttackSpeedOncomingModifier))
  {
    return m_movementGroundMaxSpeed * m_combatLeapAttackSpeedOncomingModifier;
  }
  
  return undefined;
}