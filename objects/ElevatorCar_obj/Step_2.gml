/// @description Place Player in car
if(y != m_yBottom)
{
  m_player.x = x;
  m_player.y = y;
  audio_emitter_position(m_audioEmitter, x, y, 0);  

  var diff = m_yBottom - y;
  if(diff > m_slowDownPoint)
  {
    vspeed += m_accel;
    vspeed = limit_value_magnitude(vspeed, m_speedMax);
  }
  else
  {
    if(diff <= m_slowDownMinSpd)
    {
      y = m_yBottom;
      vspeed = 0;
      m_player.m_combatantState = CombatantStates.Ground;
    }
    else
    {
      vspeed = m_speedMax * diff/m_slowDownPoint;
      if(vspeed < m_slowDownMinSpd)
      {
        vspeed = m_slowDownMinSpd;
      }
    }
  }
}

