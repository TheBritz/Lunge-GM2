/// @description
/// @param sprite
/// @param category
/// @param frame

var sprite = argument0;
var category = argument1;
var frame = argument2;

var spriteName = sprite_get_name(sprite);

var key = spriteName + "-" + category + "-" + string(frame);

return key;