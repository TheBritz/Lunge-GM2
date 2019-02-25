/// @argument engager
/// @argument target

var engager = argument0;
var target = argument1;

if(variable_global_exists("EngagementControllerMap"))
{
  var controllerMap = global.EngagementControllerMap;
  if(ds_map_exists(controllerMap, target))
  {
    var controller = controllerMap[? target];
    
    with(controller)
    {
      var engagerType = engager.object_index;
      var engagementList;
      if(!ds_map_exists(m_engagementMap, engagerType))
      {
        engagementList = ds_list_create();
        m_engagementMap[? engagerType] = engagementList;
        ds_list_add(m_engagementLists, engagementList);
      }
      else
      {
        engagementList = m_engagementMap[? engagerType];
      }
      
      if(ds_list_find_index(engagementList, engager) == -1)
      {
        ds_list_add(engagementList, engager);
      }
      return true;
    }
  }
}

return false;

