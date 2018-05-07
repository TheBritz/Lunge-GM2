/// @description Combatant_StateAir_scr()

if(!is_undefined(m_combatantSpriteFall))
{
  sprite_index = m_combatantSpriteFall;
}

Combatant_LimitAirSpeed_scr();
Combatant_CollisionSolidAir_scr();
