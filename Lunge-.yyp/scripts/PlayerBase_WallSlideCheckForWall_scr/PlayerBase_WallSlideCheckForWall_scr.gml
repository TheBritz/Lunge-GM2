/// @description PlayerBase_WallSlideCheckForWall_scr(facingOverride, facingMod [optional])
/// @param facingOverride[optional]
/// @param facingMod[optional]
/// @param yShift[optional]
//Check if there is a wall still
var facing = m_facing;
var yShift = 20;
if(argument_count > 0 && !is_undefined(argument[0]))
{
  facing = sign(argument[0]);
}

if(argument_count > 1 && !is_undefined(argument[1]))
{
  facing *= sign(argument[1]);
}

if(argument_count > 2 && !is_undefined(argument[2]))
{
  yShift = argument[2];
}

var spriteOrigX = sprite_get_xoffset(mask_index);
var spriteWidth = sprite_get_width(mask_index);
var centerPointX = x - spriteOrigX + spriteWidth/2;
var hitboxX = centerPointX + (spriteWidth/2 + 10) * facing;
return(Hitbox_PlaceMeeting_scr(hitboxX, y + yShift, Solid_obj, HitboxWallCheckSmall_spr));

