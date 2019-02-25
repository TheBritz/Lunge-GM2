var subject = id;
if(argument_count > 0)
{
  subject = argument[0];
}

with(subject)
{
  m_spearIsLunging = false;
  m_isAttacking = false;
  m_spearLungeAdjust = 0;

  sprite_index = m_combatantSpriteIdle;
  m_combatantState = CombatantStates.Ground;
  alarm[PlayerBaseAlarms.ResetCanLunge] = m_spearLungeDelay;
}