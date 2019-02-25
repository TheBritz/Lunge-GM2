/// @description Write Sprite Position Data to file
var data = SpritePositionDataGetDataMap_scr();
var dataStr = json_encode(data);

var cacheAddress = SpritePositionDataGetCacheAddress_scr();
var cacheFile = file_text_open_write(cacheAddress);

file_text_write_string(cacheFile, dataStr);
file_text_close(cacheFile);

