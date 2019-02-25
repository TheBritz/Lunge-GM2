/// @description Engagement Controller Init
//This class manages and coordinates enemy AI combat with a Friendly

//Create the engagement controller map if it doesn't exist. This map connects 
//engagement controller instances with their corresponding target instances
if(!variable_global_exists("EngagementControllerMap"))
{
  global.EngagementControllerMap = ds_map_create();  
}

//This map stores lists of engaged instances by their type
m_engagementMap = ds_map_create();

//Similar to engagement map but instead of a simple list, the values stored is
//a two-member array each with lists in them. Enemies on the left of the target
//are in the list at index 0 while enemies on the right are in the list at 
//index 1. These lists are ordered closest-to-furthest. 
m_engagementMapPositionOrdered = ds_map_create();

//This list stores the lists of engaged instances for iteration
m_engagementLists = ds_list_create();

//The target instance
m_target = noone;

//The rate at which this controller will assess and direct engagement
m_tickRate = 8;
m_ticker = m_tickRate;

m_defaultEngagementDistance = 600;

m_engagementPositionAssignementsByPos = ds_map_create();
m_engagementPositionAssignementsByEnemy = ds_map_create();
m_engagementPositionRangeWidth = 20;
m_engagementPositionSeparation = 50;
m_engagementNumberOnLeft = 0;
m_engagementNumberOnRight = 0;


