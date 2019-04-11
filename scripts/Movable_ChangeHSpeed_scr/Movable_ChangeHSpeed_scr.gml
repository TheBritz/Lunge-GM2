/// @description Movable_ChangeHSpeed_scr(targetSpeed, acceleration[optional])
/// @param targetSpeed
/// @param acceleration[optional]
/// @param overspeedCorrection[optional]

var targetSpeed = argument[0];
var acceleration = undefined;
if(argument_count > 1) 
  acceleration = argument[1];

var overspeedCorrection = undefined;
if(argument_count > 2)
{
  overspeedCorrection = argument[2];
	if(overspeedCorrection < 0) overspeedCorrection = 0;
} 

if(!is_undefined(acceleration))
{
  if(!is_undefined(overspeedCorrection))
  {
    //Check for overspeed
    if(sign(targetSpeed) == sign(m_velocityH) && abs(m_velocityH) > abs(targetSpeed))
    {
      //Use overspeed correction rate
      acceleration = overspeedCorrection;
    }
  }
  
  if(m_movementUseFramerateAdjust)
  {
    acceleration *= GameController_GetFramerateSpeedAdjustment_scr() * global.AccelModMult;
    acceleration += global.AccelModAdd;
  }
  
  if (m_velocityH < targetSpeed)
      m_velocityH = min(m_velocityH + acceleration, targetSpeed); 
  else
      m_velocityH = max(m_velocityH - acceleration, targetSpeed);
}
else
{
  m_velocityH = targetSpeed;
}
