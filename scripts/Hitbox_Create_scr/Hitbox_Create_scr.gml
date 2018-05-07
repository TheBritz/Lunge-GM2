/// @description Hitbox_Create_scr(mask, x, y, relativeX, relativeY, timeToLive [optional])
/// @param mask
/// @param  x
/// @param  y
/// @param  relativeX
/// @param  relativeY
/// @param  timeToLive [optional]
var i = 0;
var mask = argument[i++];
var X = argument[i++];
var Y = argument[i++];
var relPosX = argument[i++];
var relPosY = argument[i++];

var ttl = -1;
if(argument_count > i)
{
  ttl = argument[i++];
}

var hitbox = instance_create(X, Y, Hitbox_obj);

with(hitbox)
{
  mask_index = mask;
  m_relPosX = relPosX;
  m_relPosY = relPosY;
  alarm[0] = ttl;
}

return hitbox;
