/// @description InitConsoleCommands_scr()

var commandList = ds_list_create();
var commandNameList = ds_list_create();
var commandMap = ds_map_create();
var metadataMap = ds_map_create();
var validatorMap = ds_map_create();
var valMetadataMap = ds_map_create();
var valDisplayMap = ds_map_create();
var validTypes = ds_list_create();
var consolePrefix = "Console";
var metadataPrefix = "ConsoleMetadata";
var validatorPrefix = "ConsoleValidateParameter";
var valMetadataPrefix = "ConsoleValidateParameterMetadata";
var scriptName;
for(var i = 0; i < 3000; i++)
{
  scriptName = script_get_name(i);
  if(!is_undefined(scriptName))
  {
    if(string_pos(consolePrefix, scriptName) == 1 && 
    string_pos(metadataPrefix, scriptName) != 1 &&
    string_pos(validatorPrefix, scriptName) != 1 &&
    string_pos(valMetadataPrefix, scriptName) != 1)
    {
      //Remove the Console prefix  
      var cmdName = string_delete(scriptName, 1, string_length(consolePrefix));
      cmdName = string_replace(cmdName, m_scriptSuffix, "");
      commandMap[? cmdName] = i;
      //Add this script since it's a Console script
      ds_list_add(commandList, i);
      ds_list_add(commandNameList, cmdName);
      //Add metadata for the script if it exists
      var metadataName = string_replace
        (scriptName, consolePrefix, metadataPrefix);
      var metadata = asset_get_index(metadataName);
      if(metadata != -1)
      {
        metadataMap[? cmdName] = metadata;
      }
    }
    else if(string_pos(validatorPrefix, scriptName) == 1 &&
    string_pos(valMetadataPrefix, scriptName) != 1)
    {
      var paramType = string_replace(scriptName, validatorPrefix, "");
      paramType = string_replace(paramType, m_scriptSuffix, "");
      var paramTypeLower = string_lower(paramType);
      valDisplayMap[? paramTypeLower] = paramType;
      //Add the script to the validator map
      validatorMap[? paramTypeLower] = i;
      
      //Try to get the metadata
      var metadataScriptName = valMetadataPrefix + paramType + m_scriptSuffix;
      var metadataScript = asset_get_index(metadataScriptName);
      if(metadataScript != -1)
      {
        //If metadata script exists, add it
        valMetadataMap[? paramTypeLower] = metadataScript
      }
      
      ds_list_add(validTypes, paramTypeLower);
    }
  }
}

return array(commandList, commandNameList, commandMap, metadataMap, validatorMap, valMetadataMap, valDisplayMap, validTypes);

