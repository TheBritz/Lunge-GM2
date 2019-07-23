var timeMod = global.TimeSpeedModMult;
if(!is_undefined(m_timeSpeedModMult))
{
	timeMod = m_timeSpeedModMult;
}

return (delta_time/1000000 * timeMod);