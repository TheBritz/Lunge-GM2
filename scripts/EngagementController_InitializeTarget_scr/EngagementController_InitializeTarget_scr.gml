/// @argument target

var target = argument0;

var engagementController = instance_create(0, 0, EngagementController_obj);
engagementController.m_target = target;

global.EngagementControllerMap[? target] = engagementController;
