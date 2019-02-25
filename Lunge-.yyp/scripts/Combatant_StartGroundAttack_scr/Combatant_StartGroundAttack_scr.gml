m_combatantState = CombatantStates.GroundAttack;
sprite_set_properties(m_combatantSpriteGroundAttack, 
  0, m_combatantImageSpeedGroundAttack);
m_movementGroundActivelyMoving = false;
alarm[1] = sprite_get_number(m_combatantSpriteGroundAttack)/image_speed;
