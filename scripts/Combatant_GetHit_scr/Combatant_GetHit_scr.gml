/// @description Combatant_GetHit_scr(hittee, damage, knockbackX, knockbackY)
/// @param hittee
/// @param  damage
/// @param  knockbackX
/// @param  knockbackY
var combatant = argument0;
if(object_is(combatant.object_index, Combatant_obj))
{
  var damage = argument1;
  var knockbackX = argument2;
  var knockbackY = argument3;
  
  with(combatant)
  {
    m_combatantState = CombatantStates.HitStun;
    alarm[CombatantAlarms.GroundReset] = room_speed/2;
    m_combatantHp -= damage;
    Movable_ChangeHSpeed_scr(knockbackX, 1000);
    Movable_ChangeVSpeed_scr(knockbackY, 1000);
  }
}

