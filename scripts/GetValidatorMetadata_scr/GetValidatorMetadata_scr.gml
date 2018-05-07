/// @description GetValidatorMetadata_scr(paramType)
/// @param paramType

var paramType = argument0;

var type = string_lower(paramType);

var metadataScript = m_valMetadataMap[? type];
if(!is_undefined(metadataScript))
{
  ds_map_clear(global.ReusableMetadataMap);
  var metadata = script_execute(metadataScript, global.ReusableMetadataMap);
  
  return metadata;
}
else
{
  return undefined;
}

