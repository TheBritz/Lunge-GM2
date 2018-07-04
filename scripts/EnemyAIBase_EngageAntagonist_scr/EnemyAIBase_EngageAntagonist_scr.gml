/// @param aiInstance
/// @param antagonist

var ai = argument0;
var antagonist = argument1;

var map = EnemyAIBase_GetEngagementMap_scr();

if(!ds_map_exists(map, antagonist))
{
  map[? antagonist] = ds_list_create();
}

var engagerList = map[? antagonist];

ds_list_add(engagerList, ai);