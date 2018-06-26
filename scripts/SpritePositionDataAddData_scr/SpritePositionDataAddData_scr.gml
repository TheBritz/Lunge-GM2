/// @description SpritePositionDataAddData_scr
/// @param sprite
/// @param category
/// @param frame
/// @param x
/// @param y

var sprite = argument0;
var category = argument1;
var frame = argument2;
var X = argument3;
var Y = argument4;

var key = SpritePositionDataBuildDataKey_scr(sprite, category, frame);

var map = SpritePositionDataGetDataMap_scr();

var dataEntry = ds_map_create();
dataEntry[?"x"] = X;
dataEntry[?"y"] = Y;
ds_map_add_map(map, key, dataEntry);

