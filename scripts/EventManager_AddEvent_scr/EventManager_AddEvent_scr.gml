///@param script
///@param time
///@param data
///@param isRepeating

var script = argument0;
var time = argument1;
var data = argument2;
var isRepeating = argument3;

var event = ds_map_create();

event[? Event.Script] = script;
event[? Event.Timer] = time;
event[? Event.OriginalTime] = time;
event[? Event.Data] = data;
event[? Event.IsRepeating] = isRepeating;

ds_list_add(m_scheduledEvents, event);