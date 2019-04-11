/// @description Movable_HandleMovement_scr()
if(m_isSolidObservant)
{
	m_movementGroundSlope = 0;
	m_movementGroundSlopeAngle = 0;
  m_isGrounded = false;
  var xStart = x;
  var velocityEffH = Movable_GetHSpeedEffective_scr(id);
  var velocityEffV = Movable_GetVSpeedEffective_scr(id);

  // Handle sub-pixel movement
  m_subH += velocityEffH;
  var roundedVelocityH = round(m_subH);
  m_subH -= roundedVelocityH;

  // Horizontal Movement
  if(roundedVelocityH = 0) m_impactVelH = 0;
  repeat (abs(roundedVelocityH)) 
  {
    if (!place_meeting(x + sign(roundedVelocityH), y, Solid_obj))
    {
      x += sign(roundedVelocityH); 
    }
    else 
    {
      //Before accepting the horizontal collision, check to see if we should be
      //adjusted higher due to a solid slope
      Movable_CheckSlopeCollision_scr();
      if(place_meeting(x + sign(roundedVelocityH), y, Solid_obj))
      {
        m_collideH = sign(velocityEffH);
        m_impactVelH = m_velocityH;
        m_velocityH = 0;
        break;
      }
      else
      {
        var test = "test";
      }
    }
    m_collideH = 0;
    m_impactVelH = 0;
  }  

  m_subV += velocityEffV;    
  var roundedVelocityV = round(m_subV);
  m_subV -= roundedVelocityV;

  // Vertical Movement
  if(roundedVelocityV = 0) m_impactVelV = 0;
  repeat (abs(roundedVelocityV))
  {
    var hitPlatform = false;
    var velocitySign = sign(roundedVelocityV)
    if(roundedVelocityV > 0)
    {
      var platform = instance_place(x, y + velocitySign, Platform_obj);
      if(instance_exists(platform))
      {
        if(bbox_bottom <= platform.y)
        {
          hitPlatform = true;
        }
      }
    }
    if (!hitPlatform && !place_meeting(x, y + velocitySign, Solid_obj))
      y += sign(roundedVelocityV); 
    else 
    {
      m_collideV = sign(velocityEffV);
      m_impactVelV = m_velocityV;
      m_velocityV = 0;
      break;
    }
    m_collideV = 0;
    m_impactVelV = 0;
  }

  var flatYCollision = m_impactVelV > 0;
  var preCheckY = y;

  Movable_CheckSlopeCollision_scr();

  if(flatYCollision && y > preCheckY)
  {
    y = preCheckY;
  }
  
  if(m_impactVelV > 0)
  {
    m_isGrounded = true;
  }
  else
  {
    m_isGrounded = place_meeting(x, y + 1, Solid_obj) || place_meeting(x, y + 1, Platform_obj);
  }
}
else
{
  //Update position without regard to solids
  x += velocityEffH;
  y += velocityEffV;
}
