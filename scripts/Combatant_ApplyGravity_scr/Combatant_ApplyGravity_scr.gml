/// @description Combatant_ApplyGravity_scr(gravity [optional])
/// @param gravity[optional]

if(!m_movementSuppressGravity)
{
  var terminalVelocity = global.TerminalVelocity;
  var grav = global.Gravity;
  if(argument_count > 0)
  {
    grav = argument[0];
  }
  else if(!is_undefined(m_movementAirGravity))
  {
    grav = m_movementAirGravity;
  }
  if(!is_undefined(m_movementAirFallMaxSpeedVert))
  {
    terminalVelocity = m_movementAirFallMaxSpeedVert;
  }
    
  Movable_ChangeVSpeed_scr(terminalVelocity, grav);
}
