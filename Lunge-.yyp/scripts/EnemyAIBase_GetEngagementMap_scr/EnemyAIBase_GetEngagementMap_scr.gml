if(!variable_global_exists("global.AIEngagementMap"))
{
  global.AIEngagementMap = ds_map_create();
}

return global.AIEngagementMap;