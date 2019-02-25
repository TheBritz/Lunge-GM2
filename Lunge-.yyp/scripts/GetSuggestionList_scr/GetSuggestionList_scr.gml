/// @description GetSuggestionList_scr(commandString, paramIndex, paramType)
/// @param commandString
/// @param  paramIndex
/// @param  paramType

var cmd = argument0;
var paramNumber = argument1;
var paramType = argument2;

//Get the command
var cmdArr = split(cmd, "(");
var cmdText = cmdArr[0];

//Get the current argument text
var len = string_length(cmdText);
var cmdArgs = string_delete(cmd, 1, len + 1);
var argsArr = split(cmdArgs, ",");
var arg = argsArr[paramNumber];

//See if this parameter has a suggestion list builder
var metadata = GetConsoleMetadata_scr(cmdText);
if(!is_undefined(metadata) && ds_map_exists(metadata, ConsoleMetadata.SuggestionListBuilder))
{
  var suggestionBuilders = metadata[? ConsoleMetadata.SuggestionListBuilder];
  if(array_length_1d(suggestionBuilders) > paramNumber)
  {
    var suggestionBuilder = suggestionBuilders[paramNumber];
    ds_list_clear(m_suggestionList);
    script_execute(suggestionBuilder, arg, m_suggestionList);
    return m_suggestionList;
  }
}

//Check if this parameter type has a default suggestion builder
metadata = GetValidatorMetadata_scr(paramType);
if(!is_undefined(metadata) && ds_map_exists
  (metadata, ConsoleParamType.DefaultSuggestionBuilder))
{
  var suggestionBuilder = metadata[? ConsoleParamType.DefaultSuggestionBuilder];
  ds_list_clear(m_suggestionList);
  script_execute(suggestionBuilder, arg, m_suggestionList, m_suggestionDisplayList);
  return m_suggestionList;
}

ds_list_clear(m_suggestionList);


