/// @param baseSprite
/// @param interval
/// @param spriteSuffix

var baseSprite = argument0;
var interval = argument1;
var spriteSuffix = argument2;

var directionalMap = ds_map_create();

directionalMap[? 0] = baseSprite;
var baseName = sprite_get_name(baseSprite);
baseName = string_replace(baseName, spriteSuffix, "");

var thisName, thisSprite;
for(i = interval; i < 360; i += interval)
{
  thisName = baseName + "_" + string(i) + spriteSuffix;
	thisSprite = asset_get_index(thisName);
	if(thisSprite > -1)
	{
		directionalMap[? i] = thisSprite;
	}
}

return directionalMap;
