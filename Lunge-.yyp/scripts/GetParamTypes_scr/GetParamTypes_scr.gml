/// @description GetParamTypes_scr(command)
/// @param command

var command = argument0;
var paramTypes = undefined;
var metadata = GetConsoleMetadata_scr(command);

if(!is_undefined(metadata))
{
  if(ds_map_exists(metadata, ConsoleMetadata.ParameterTypes))
  {
    return metadata[? ConsoleMetadata.ParameterTypes];
  }
  else
  {
    //Get parameter types from the parameters
    if(ds_map_exists(metadata, ConsoleMetadata.Parameters))
    {
      var params = metadata[? ConsoleMetadata.Parameters];
      var paramsArr = split(params, ",");
      var maxInd = array_length_1d(paramsArr) - 1;
      paramTypes[maxInd] = undefined;
      for(var i = 0; i < array_length_1d(paramsArr); i++)
      {
        var param = paramsArr[i];
        for(var n = 0; n < ds_list_size(m_validTypes); n++)
        {
          if(string_pos(m_validTypes[| n] + " ", string_lower(param)) != 0)
          {
            paramTypes[i] = m_validTypes[| n];
          } 
        }
      }
    }
    
    return paramTypes;
  }
}

