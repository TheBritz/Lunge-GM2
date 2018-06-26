var cachePath = SpritePositionDataGetCacheAddress_scr();
var map = undefined;

if(file_exists(cachePath))
{
  var file = file_text_open_read(cachePath);
  var mapStr = file_text_read_string(file);
  map = json_decode(mapStr);
}
else
{
  map = ds_map_create();
}

return map;

