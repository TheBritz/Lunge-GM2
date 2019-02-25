/// @description Combatant_AddHitboxAttack_scr(<args> mask, relativeX, relativeY, framesToLive)
/// @param <args> mask
/// @param  relativeX
/// @param  relativeY
/// @param  framesToLive
var args = argument[0];
var i = 0;
var mask, relPosX, relPosY;
if(is_array(args))
{
  mask = args[i++];
  relPosX = args[i++];
  relPosY = args[i++];
}
else
{
  mask = argument[i++];
  relPosX = args[i++];
  relPosY = args[i++];  
}

var ttl = -1;
if(array_length_1d(args) > i)
{
  ttl = args[i++];
}

var framesToLive = round(ttl / image_speed);

var hitbox = Hitbox_Create_scr(mask, x, y, relPosX, relPosY, framesToLive);
ds_list_add(m_hitboxesAttack, hitbox);
