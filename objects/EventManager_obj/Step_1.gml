/// @description Insert description here
// You can write your code in this editor

var event;
for(var i = 0; i < ds_list_size(m_scheduledEvents); i++)
{
	event = m_scheduledEvents[|i];
  //Decrement Time - could be real time, global game time, or a subject's game time
  var timeMod = 1;
  if(!event[?Event.IsRealTime])
  {
    
  }
  
	event[?Event.Timer] = event[?Event.Timer] - (delta_time / 1000000 * global.TimeSpeedModMult + global.TimeSpeedModAdd);
	if(event[?Event.Timer] <= 0)
	{
		var instance = event[?Event.Instance];
		var instanceExists = instance_exists(event[?Event.Instance]);
		if(instance == noone || is_undefined(instance) || 
		  (!instanceExists && event[?Event.RunIfNoInstance]))
		{
		  script_execute(event[?Event.Script], event[?Event.Data]);
		}
		else if(instanceExists)
		{
			with(instance)
			{
				script_execute(event[?Event.Script], event[?Event.Data]);
			}
		}
		
		
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