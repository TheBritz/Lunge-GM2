/// @description SanitizeConsoleScriptName_scr(consoleScriptName)
/// @param consoleScriptName

var scriptName = argument0;
var consolePrefix = "Console";
var metadataPrefix = "ConsoleMetadata";
if(string_pos(consolePrefix, scriptName) == 1 && 
string_pos(metadataPrefix, scriptName) != 1)
{
  //Remove the Console prefix  
  scriptName = string_delete(scriptName, 1, string_length(consolePrefix));
  scriptName = string_replace(scriptName, "_scr", "");
}

return scriptName;

