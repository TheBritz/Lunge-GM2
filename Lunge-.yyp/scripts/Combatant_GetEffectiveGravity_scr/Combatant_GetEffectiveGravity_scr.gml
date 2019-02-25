/// @param combatant

var combatant = argument0;

var grav = global.Gravity;
if(!is_undefined(combatant.m_movementAirGravity))
{
  grav = combatant.m_movementAirGravity;
}

return grav;