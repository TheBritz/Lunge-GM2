/// @argument engager
/// @argument target

var engager = argument0;
var target = argument1;

var controller = EngagementController_GetTargetController_scr(target);
if(instance_exists(controller))
{  
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
      
    ds_list_add(engagementList, engager);
    return true;
  }
  
}

return false;

