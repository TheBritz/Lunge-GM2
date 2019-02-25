/// @description GetObjectTypes_scr(text, list)
/// @param text
/// @param  list

var text = argument0;
var retList = argument1;
var objectList = global.AssetLists[? asset_object];

var name;
for(var i = 0; i < ds_list_size(objectList); i++)
{
  name = object_get_name(i);
  if(string_pos(string_lower(text), string_lower(name)) != 0)
  {
    ds_list_add(retList, name);
  }    
}


