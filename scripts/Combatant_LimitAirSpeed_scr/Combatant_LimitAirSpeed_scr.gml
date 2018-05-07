/// @description Combatant_LimitGroundSpeed_scr()
/*
if(!is_undefined(m_movementAirFallMaxSpeedHor))
{
  hspeed = limit_value_magnitude(hspeed, m_movementAirFallMaxSpeedHor);
}

if(!is_undefined(m_movementAirFallMaxSpeedVert))
{
  vspeed = limit_value_magnitude(vspeed, m_movementAirFallMaxSpeedVert);
}
else
{
  vspeed = limit_value_magnitude(vspeed, global.TerminalVelocity);
}
