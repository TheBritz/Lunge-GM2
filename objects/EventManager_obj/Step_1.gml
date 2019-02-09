/// @description Insert description here
// You can write your code in this editor

var size = ds_list_size(m_scheduledEvents);
var event;
for(var i = 0; i < size; i++)
{
	event = m_scheduledEvents[|i];
	event[?Event.Timer] = event[?Event.Timer] - delta_time;
	if(event[?Event.Timer] <= 0)
	{
		script_execute(event[?Event.Script], event[?Event.Data]);
		
		if(event[?Event.IsRepeating])
		{
			event[?Event.Timer] = event[?Event.OriginalTime];
		}
		else
		{
			ds_map_destroy(event);
			ds_list_delete(m_scheduledEvents, i);
		}
	}
}