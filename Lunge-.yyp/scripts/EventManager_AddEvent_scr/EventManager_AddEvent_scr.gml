///@param script
///@param time
///@param data
///@param isRepeating[optional]
///@param isRealTime[optional]

var eventManager = EventManager_GetEventManager_scr();

with(eventManager)
{
  var script = argument[0];
  var time = argument[1];
  var data = argument[2];
  var isRepeating = false;
  if(argument_count > 3)
  {
    isRepeating = argument[3];
  }
  var isRealTime = false;
  if(argument_count > 4)
  {
    isRealTime = argument[4];
  }

  var event = ds_map_create();

  event[? Event.Script] = script;
  event[? Event.Timer] = time;
  event[? Event.OriginalTime] = time;
  event[? Event.Data] = data;
  event[? Event.IsRepeating] = isRepeating;
  event[? Event.IsRealTime] = isRealTime;

  ds_list_add(m_scheduledEvents, event);
}