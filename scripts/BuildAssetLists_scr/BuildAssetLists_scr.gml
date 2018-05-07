/// @description BuildAssetLists_scr()

global.AssetLists = ds_map_create();
var objectList = ds_list_create();
var scriptList = ds_list_create();
var spriteList = ds_list_create();
var roomList = ds_list_create();
global.AssetLists[? asset_object] = objectList;
global.AssetLists[? asset_script] = scriptList;
global.AssetLists[? asset_sprite] = spriteList;
global.AssetLists[? asset_room] = roomList;

for(var i = 0; i < 5000; i++)
{
  var spriteName = sprite_get_name(i);
  var objectName = object_get_name(i);
  var scriptName = script_get_name(i);
  var roomName = room_get_name(i);
  
  if(!is_undefined(spriteName) && spriteName != "<undefined>")
  {    
    ds_list_add(spriteList, i);
  }
  
  if(!is_undefined(scriptName) && scriptName != "<undefined>")
  {
    ds_list_add(scriptList, i);
  }
  
  if(!is_undefined(objectName) && objectName != "<undefined>")
  {
    ds_list_add(objectList, i);
  }
  
  if(!is_undefined(roomName) && roomName != "<undefined>")
  {
    ds_list_add(roomList, i);
  }
}

var test = "test";

