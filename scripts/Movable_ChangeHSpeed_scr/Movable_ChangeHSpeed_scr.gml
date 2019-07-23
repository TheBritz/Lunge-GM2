/// @description Movable_ChangeHSpeed_scr(targetSpeed, acceleration[optional])
/// @param targetSpeed
/// @param acceleration[optional]
/// @param overspeedCorrection[optional]
/// @param modifySurfaceSpeed [optional]

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

var modifySurfaceSpeed = false;
if(argument_count > 3)
{
  modifySurfaceSpeed = argument[3];
} 

if(object_index == Player1_obj && !modifySurfaceSpeed)
{
  var isPlayer = true;
}

if(!is_undefined(acceleration))
{
  if(!is_undefined(overspeedCorrection))
  {
    var velocity;
    if(modifySurfaceSpeed)
    {
      velocity = m_velocityH;
    }
    else
    {
      velocity = m_velocitySurfaceH;
    }
    
    //Check for overspeed
    if(sign(targetSpeed) == sign(velocity) && abs(velocity) > abs(targetSpeed))
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
  
  if(modifySurfaceSpeed)
  {     
    if (m_velocitySurfaceH < targetSpeed)
    {
      m_velocitySurfaceH = 
        min(m_velocitySurfaceH + acceleration, targetSpeed); 
    }
    else
    {
      m_velocitySurfaceH = 
        max(m_velocitySurfaceH - acceleration, targetSpeed);
    }
  }
  else
  {
    if (m_velocityH < targetSpeed)
    {
      m_velocityH = min(m_velocityH + acceleration, targetSpeed); 
    }
    else
    {
      m_velocityH = max(m_velocityH - acceleration, targetSpeed);
    }
  }
}
else
{
  if(modifySurfaceSpeed)
  {
    m_velocitySurfaceH = targetSpeed;
  }
  else
  {
    m_velocityH = targetSpeed;
  }
}
