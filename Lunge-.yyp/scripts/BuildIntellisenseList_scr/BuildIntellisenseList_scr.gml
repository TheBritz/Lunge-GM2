/// @description BuildIntellisenseList_scr(partialCommand)
/// @param partialCommand

var str = argument0;

//The assumption here is that this is the first time this is occuring so the
//intellisense list should be cleared
ds_list_clear(m_intelliList);
ds_list_clear(m_intelliInfoList);

var commandName;
for(var i = 0; i < ds_list_size(m_commandNameList); i++)
{
  commandName = m_commandNameList[| i];
  
  if(string_pos(string_lower(str), string_lower(commandName + "(")) != 0)
  {
    //User may be typing this - add it to the intellisense list
    ds_list_add(m_intelliList, commandName);
    
    //Add parameters and description
    var info;
    var map = m_metadataMap;
    if(ds_map_exists(m_metadataMap, commandName))
    {
      var metadata = GetConsoleMetadata_scr(commandName);
      var params = metadata[? ConsoleMetadata.Parameters];
      var desc = metadata[? ConsoleMetadata.Description];
      if(is_undefined(params)) params = "";
      var info = "(" + params + ")"
      
      if(!is_undefined(desc))
      {
        info += " - " + desc;
      }
    }
    else
    {
      info = "()";
    }
    ds_list_add(m_intelliInfoList, info); 
  }
}

