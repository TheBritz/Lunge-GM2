if(!variable_global_exists("EventManager"))
{
  global.EventManager = instance_create(0, 0, EventManager_obj);
}

return global.EventManager;