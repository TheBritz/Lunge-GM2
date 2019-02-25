var refreshRate;

if(!debug_mode)
{
	refreshRate = 1000000/delta_time;
}
else
{
	refreshRate = room_speed;
}

var adjustmentRatio = global.RoomSpeedDefault/refreshRate; 
return adjustmentRatio;