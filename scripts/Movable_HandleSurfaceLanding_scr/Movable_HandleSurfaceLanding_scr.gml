/// @param movable
/// @param surface

var movable = argument0;

var standingSurf = instance_place(x, y + 1, StandableSurface_obj);
if(instance_exists(standingSurf))
{
	var surfSpd = Movable_GetHSpeed_scr(standingSurf);
	
	if(surfSpd != 0)
	{
		var movSpd = Movable_GetHSpeed_scr(movable);
	
		var targetSpd = surfSpd * m_surfaceSpeedAdjustRate;
		if(abs(movSpd) < abs(surfSpd) * m_surfaceSpeedAdjustRate)
		{
			//Movable_ChangeHSpeed_scr(targetSpd);
		}
	}
	
	m_touchingSurfaceVertInst = standingSurf;
}