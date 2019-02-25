/// @description ConsoleValidateParameterRoom_scr(value)
/// @param value

var value = argument0;

if(asset_get_type(value) == asset_room)
{
  return asset_get_index(value);
}
else
{
  return undefined;
}

