/// @description Combatant_GetSpritePositionType_scr
/// @param sprite
/// @param infoType

var sprite = argument0;
var infoType = argument1;

var sprStr = sprite_get_name(sprite);

var sprInfoArray = split(sprStr, "_");

if(array_length_1d(sprInfoArray) > infoType)
{
  return sprInfoArray[infoType];
}

return "";