/// @description GetConsoleMetadata_scr(consoleCommand)
/// @param consoleCommand

var commandName = argument0;

if(ds_map_exists(m_metadataMap, commandName))
{
  var metadataScript = m_metadataMap[? commandName];
  ds_map_clear(global.ReusableMetadataMap);
  var metadata = script_execute(metadataScript, global.ReusableMetadataMap);
  
  return metadata;
}
else
{
  return undefined;
}

