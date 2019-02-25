/// @description UpdateIntellisenseList_scr(partialCommand)
/// @param partialCommand

var str = argument0;

//The intellisense list has already been built, this is being called whenever
//the user types another key
var commandName;
for(var i = 0; i < ds_list_size(m_intelliList); i++)
{
  commandName = m_intelliList[| i];
  if(string_pos(string_lower(str), string_lower(commandName)) == 0)
  {
    ds_list_delete(m_intelliList, i);
    ds_list_delete(m_intelliInfoList, i);
    i--; 
  }
}

