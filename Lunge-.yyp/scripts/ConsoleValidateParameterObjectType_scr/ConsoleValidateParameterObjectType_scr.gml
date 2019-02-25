/// @description ConsoleValidateParameterObjectType_scr(value)
/// @param value

var value = argument0
var assetType = asset_get_type(value)
if(assetType == asset_object)
{
  return asset_get_index(value);
}

return undefined;

