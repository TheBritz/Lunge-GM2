var target = argument0;
var controller = noone;

if(variable_global_exists("EngagementControllerMap"))
{
  var controllerMap = global.EngagementControllerMap;
  if(ds_map_exists(controllerMap, target))
  {
    var controller = controllerMap[? target];
  }
}

return controller;
