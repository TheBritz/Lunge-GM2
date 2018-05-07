if(m_velocityH != 0 && !is_undefined(m_combatantSpriteRun))
{
  sprite_set_properties(m_combatantSpriteRun, undefined, m_combatantImageSpeedRun);
}
else if(!is_undefined(m_combatantSpriteIdle))
{
  sprite_set_properties(m_combatantSpriteIdle, undefined, m_combatantImageSpeedIdle);
}
