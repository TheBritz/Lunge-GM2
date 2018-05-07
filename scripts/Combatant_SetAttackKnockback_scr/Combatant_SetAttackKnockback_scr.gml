/// @description Combatant_SetAttackKnockback_scr(attackSprite, knockbackX, knockbackY)
/// @param attackSprite
/// @param  knockbackX
/// @param  knockbackY
var attackSprite = argument0;
var kbX = argument1;
var kbY = argument2;

m_combatantAttackKnockbackMap[? attackSprite] = array(kbX, kbY);
