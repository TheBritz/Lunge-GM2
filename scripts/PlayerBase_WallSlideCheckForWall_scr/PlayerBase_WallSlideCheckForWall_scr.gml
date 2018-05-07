/// @description PlayerBase_WallSlideCheckForWall_scr(facingOverride, facingMod [optional])
/// @param facingOverride
/// @param  facingMod [optional]
//Check if there is a wall still
var facing = m_facing;
if(argument_count > 0)
{
  facing = sign(argument[0]);
}

if(argument_count > 1)
{
  facing *= sign(argument[1]);
}

var spriteOrigX = sprite_get_xoffset(mask_index);
var spriteWidth = sprite_get_width(mask_index);
var centerPointX = x - spriteOrigX + spriteWidth/2;
var hitboxX = centerPointX + (spriteWidth/2 + 10) * facing;
return(Hitbox_PlaceMeeting_scr(hitboxX, y + 20, Solid_obj, HitboxWallCheckSmall_spr));

