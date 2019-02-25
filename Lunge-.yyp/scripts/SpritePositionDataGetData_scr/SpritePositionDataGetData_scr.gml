/// @description SpritePositionDataGetData_scr
/// @param sprite
/// @param category
/// @param frame

var sprite = argument0;
var category = argument1;
var frame = floor(argument2);

var key = SpritePositionDataBuildDataKey_scr(sprite, category, frame); 

var map = SpritePositionDataGetDataMap_scr();

return map[? key];