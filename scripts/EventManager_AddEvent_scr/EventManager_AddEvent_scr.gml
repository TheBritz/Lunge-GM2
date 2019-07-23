///@param script
///@param time
///@param isRepeating[optional]
///@param data[optional]
///@param instance[optional]
///@param isRealTime[optional]
///@param runIfNoInstance[optional]

//By default, registering instance is captured and will be used as context when
//event is called. This can be changed via optional instance parameter.
var instance = id;
var eventManager = EventManager_GetEventManager_scr();

with(eventManager)
{
  var script = argument[0];
  var time = argument[1];
	
	var isRepeating = false;
  if(argument_count > 2)
  {
    isRepeating = argument[2];
  }
	
	data = undefined;
	if(argument_count > 3)
	{
    var data = argument[3];
	}
	//Setting this paramter to 'noone' or 'undefined' indicates that no instance 
	//context is expected and event will always be run.
	if(argument_count > 4)
	{
		instance = argument[4];
	}
  
  var isRealTime = false;
  if(argument_count > 5)
  {
    isRealTime = argument[5];
  }
	//By default, event will not run if given instance does not exist. Setting
	//this parameter to true will force execution with EventManager context. Only
	//use if events will perform necessary checks.
	var runIfNoInstance = false;
	if(argument_count > 6)
	{
		runIfNoInstance = argument[6];
	}

  var event = ds_map_create();

  event[? Event.Script] = script;
  event[? Event.Timer] = time;
  event[? Event.OriginalTime] = time;
	event[? Event.Instance] = instance;
  event[? Event.Data] = data;
  event[? Event.IsRepeating] = isRepeating;
  event[? Event.IsRealTime] = isRealTime;

  ds_list_add(m_scheduledEvents, event);
}