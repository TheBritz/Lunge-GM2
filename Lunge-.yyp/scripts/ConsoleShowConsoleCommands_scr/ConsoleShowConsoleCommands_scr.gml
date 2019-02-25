/// @description ConsoleShowConsoleCommands_scr()

PrintConsoleLine_scr("Valid Console Commands:");
PrintConsoleLine_scr();
for(var i = 0; i < ds_list_size(m_commandList); i++)
{
  var script = m_commandList[| i];
  var scriptName = script_get_name(script);
  scriptName = SanitizeConsoleScriptName_scr(scriptName);
  var printValue = scriptName;
  
  //Try to get parameters and description
  params = "";
  desc = "";
  var map = m_metadataMap;
  if(ds_map_exists(m_metadataMap, scriptName))
  {
    var metadata = GetConsoleMetadata_scr(scriptName);
    var params;
    var desc;
    if(!is_undefined(metadata))
    {
      params = metadata[? ConsoleMetadata.Parameters];
      desc = metadata[? ConsoleMetadata.Description];
      if(is_undefined(params)) params = "";
      if(is_undefined(desc)) desc = ""; 
    }
    else
    {
      params = "";
      desc = "";
    }
  }
  printValue = scriptName + "(" + params + ") - " + desc;
  PrintConsoleLine_scr(printValue);
  PrintConsoleLine_scr();
}

