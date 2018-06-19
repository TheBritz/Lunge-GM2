/// @description
/// @param sprite
/// @param category

var sprite = argument0;
var category = argument1;

var spriteName = sprite_get_name(sprite);

var key = spriteName + "-" + category;

return key;