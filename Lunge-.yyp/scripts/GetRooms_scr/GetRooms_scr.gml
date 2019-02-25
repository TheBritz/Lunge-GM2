/// @description GetRooms_scr(text, valueList, displayList)
/// @param text
/// @param  valueList
/// @param  displayList

var text = argument0;
var retList = argument1;
var roomList = global.AssetLists[? asset_room];

var name;
for(var i = 0; i < ds_list_size(roomList); i++)
{
  name = room_get_name(i);
  if(string_pos(string_lower(text), string_lower(name)) != 0)
  {
    ds_list_add(retList, name);
  }    
}


