/// @description Combatant_StateAir_scr()

//Set overspeed image  
var hSpeed = Movable_GetHSpeed_scr(id);
if(abs(hSpeed) > m_movementAirFallMaxSpeedHor * m_movementGroundOverspeedThreshold && sign(hSpeed) == m_facing)
{
  if(!is_undefined(m_combatantSpriteOverspeed) && !m_isAttacking)
  {
    sprite_set_properties(m_combatantSpriteOverspeed, undefined, m_combatantImageSpeedOverspeed);
  }
}
else if(!is_undefined(m_combatantSpriteFall) && !m_isAttacking)
{
  sprite_index = m_combatantSpriteFall;
}

Combatant_LimitAirSpeed_scr();
Combatant_CollisionSolidAir_scr();
