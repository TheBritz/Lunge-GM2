/// @param sleepTime

var sleepTime = argument0;

var sleepMgr;
if(!instance_exists(SleepManager_obj))
{
	sleepMgr = instance_create(0, 0, SleepManager_obj);
}
else
{
	sleepMgr = SleepManager_obj;
}

sleepMgr.m_sleepTime = sleepTime;
