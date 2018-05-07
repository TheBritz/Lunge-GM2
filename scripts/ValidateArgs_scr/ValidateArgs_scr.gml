/// @description ValidateArgs_scr(command, args, errorList, warningList)
/// @param command
/// @param  args
/// @param  errorList
/// @param  warningList

var cmd = argument0;
var args = argument1;
var errorList = argument2;
var warningList = argument3;
//Clear the error and warning lists. If an error is added to the list, the
//command will not run. If a warning is added to the list, the command will
//still be executed
ds_list_clear(errorList);
ds_list_clear(warningList);

var paramTypes = GetParamTypes_scr(cmd);
var metadata = GetConsoleMetadata_scr(cmd);
if(!is_undefined(metadata))
{
  var paramNames = metadata[? ConsoleMetadata.Parameters];
  var requiredParamNumber = 0;
  if(!is_undefined(paramNames))
  {
    paramNames = split(paramNames, ",");
    for(var i = 0; i < array_length_1d(paramNames); i++)
    {
      if(string_pos("[optional]", paramNames[i]) == 0)
      {
        requiredParamNumber++;
      }
    }
    
    if(array_length_1d(args) > array_length_1d(paramNames))
    {
      ds_list_add(warningList, "Warning: Too many parameters entered, excess parameters have been ignored.");
    }
  }
  
  var argsConverted = args;
  var argNumber = array_length_1d(args);
  if(argNumber == 1 && args[0] = "")
  {
    argNumber--;
  }
  
  if(requiredParamNumber > argNumber)
  {
    ds_list_add(errorList, "Error: Insufficient number of arguments provided; command: '" + cmd + "' accepts a minimum of " + string(requiredParamNumber) + " argument(s).");
  }
  
  for(var i = 0; i < array_length_1d(args); i++)
  {
    var paramName = "{param name not found}";
    if(!is_undefined(paramNames))
    {
      if(array_length_1d(paramNames) > i)
      {
        paramName = paramNames[i];
      }
    }
    
    if(array_length_1d(paramTypes) > i)
    { 
      if(!is_undefined(paramTypes[i]))
      {
        var thisType = string_lower(paramTypes[i]); 
        var validatorScript = m_validatorMap[? thisType];
        if(!is_undefined(validatorScript))
        {
          var validValue = script_execute(validatorScript, args[i]);
          if(!is_undefined(validValue))
          {
            argsConverted[i] = validValue;
          }
          else
          {
            var error = "Error: '" + string(args[i]) + "' is not a valid argument for parameter: '" + paramName + "'"; 
            
            //Get parameter type description for error
            var valMetadata = GetValidatorMetadata_scr(thisType);
            if(!is_undefined(valMetadata))
            {
              if(ds_map_exists(valMetadata, ConsoleParamType.Description))
              {
                var desc = valMetadata[? ConsoleParamType.Description];
                error += " - " + desc;  
              }
            }
            
            ds_list_add(errorList, error);
          }
        }
        else
        {
          var warning = "Warning: "
          if(thisType == "")
          {
            //Warn the user that this parameter wasn't typed and so validation
            //couldn't occur
            warning += "Parameter '" + paramName + "' doesn't have a parameter type so the console could not validate the argument '" + args[i] + "'. command parameters should be given valid parameter types via the command's metadata script. Failing to do this can result in a crash. Search '>>Console Metadata Info' for more info.";       
          }
          else
          {
            //Warn the user that this parameter has an invalid type and so 
            //validation couldn't occur
            var firstChar = string_char_at(thisType, 1);
            firstChar = string_upper(firstChar);
            var thisTypeCamelCase = string_delete(thisType, 1, 1);
            thisTypeCamelCase = string_insert(firstChar, thisType, 1);
            warning += "Parameter '" + paramName + "' has an invalid type. '" + thisType + "'. To make this a valid type create the script: " + m_scriptPrefix + "'ConsoleValidateParameter" + thisTypeCamelCase + m_scriptSuffix + "' that accepts a string value, validates it, and returns the converted version. Search: '>>Console Parameter Validation Info' for more info.";
          }
          
          ds_list_add(warningList, warning);
        }
      }
      else
      {
        var warning = "Warning: ";
        warning += "Parameter '" + paramName + "' doesn't have a parameter type so the console could not validate the argument '" + args[i] + "'. command parameters should be given valid parameter types via the command's metadata script. Failing to do this can result in a crash. Search '>>Console Metadata Info' for more info.";       
        ds_list_add(warningList, warning);
      }
    }
  }
  
  return argsConverted;
}
else
{
  return undefined;
}


