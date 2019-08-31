/// @description Movable_HandleMovement_scr()

var velocityEffH = Movable_GetHSpeedEffective_scr(id);
var velocityEffV = Movable_GetVSpeedEffective_scr(id);

if(m_isSolidObservant)
{
	m_touchingSurfaceHor = 0;
	m_movementGroundSlope = 0;
	m_movementGroundSlopeAngle = 0;
  m_isGrounded = false;
  var xStart = x;
  
  // Handle sub-pixel movement
  m_subH += velocityEffH; 
	
  var roundedVelocityH = round(m_subH);
  m_subH -= roundedVelocityH;

  // Horizontal Movement
  if(roundedVelocityH = 0) m_impactVelH = 0;
	var stopMoving = false;
  repeat (abs(roundedVelocityH)) 
  {
    if (!place_meeting(x + sign(roundedVelocityH), y, Solid_obj))
    {
		  stopMoving = Movable_ExecuteCollisionStepExtensions_scr();
			
			if(!stopMoving)
			{
        x += sign(roundedVelocityH);
			}
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
		
		if(stopMoving)
		{
			break;
		}
  }  

  m_subV += velocityEffV;    
  var roundedVelocityV = round(m_subV);
  m_subV -= roundedVelocityV;

  // Vertical Movement
  if(roundedVelocityV == 0) m_impactVelV = 0;
	var stopMoving = false;
  repeat (abs(roundedVelocityV))
  {
    var hitPlatform = false;
    var velocitySign = sign(roundedVelocityV)
    if(roundedVelocityV > 0)
    {
      var platform = instance_place(x, y + velocitySign, PlatformMoving_obj);
			var exists = instance_exists(platform); 
      if(!exists)
			{
				platform = instance_place(x, y + velocitySign, Platform_obj);
				exists = instance_exists(platform);
			}
			
			if(exists)
      {
        if(bbox_bottom <= platform.bbox_top)
        {
          hitPlatform = true;
        }
      }
    }
    if (!hitPlatform && !place_meeting(x, y + velocitySign, Solid_obj))
		{
      stopMoving = Movable_ExecuteCollisionStepExtensions_scr();
			
			if(!stopMoving)
			{
			  y += sign(roundedVelocityV);
			}
		}
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
  
  if(m_impactVelV > m_surfaceLandingSpeedThreshold)
  {
		Movable_HandleSurfaceLanding_scr(id);
		m_isGrounded = true;
		m_touchingSurfaceVert = 1;
  }
  else
  {
  }
	
	//Prioritize moving surface
	var standingSurf = instance_place(x, y + 1, StandableSurfaceMoving_obj);
	var exists = instance_exists(standingSurf);
	if(!exists)
	{
		//Try for a non-moving platform
		standingSurf = instance_place(x, y + 1, StandableSurface_obj);
		exists = instance_exists(standingSurf);
		if(exists)
		{
			if(object_is(standingSurf.object_index, SolidSloped_obj))
			{
				exists = false;
			}
		}
	}
		
	if(exists)
	{
		m_isGrounded = true;
		m_touchingSurfaceVert = 1;
		m_touchingSurfaceVertInst = standingSurf;
	  //m_velocitySurfaceH = standingSurf.m_velocityH;
	}
	else
	{
    if(object_index == Player1_obj)
    {
      var test = "test";
    }
		m_velocityH += m_velocitySurfaceH;
		m_velocitySurfaceH = 0;
	}
	
	if(m_impactVelH > 0)
	{
		m_touchingSurfaceHor = 1;
	}
	else if(m_impactVelH < 0)
	{
		m_touchingSurfaceHor = -1;
	}
	else
	{
		if(place_meeting(x + 1, y, Solid_obj))
		{
			m_touchingSurfaceHor = 1;
			m_touchingSurfaceHorInst = instance_place(x + 1, y, Solid_obj);
		}
		else if(place_meeting(x - 1, y, Solid_obj))
		{
			m_touchingSurfaceHor = -1;
			m_touchingSurfaceHorInst = instance_place(x - 1, y, Solid_obj);
		}
	}
}
else
{
  //Update position without regard to solids
  x += velocityEffH;
  y += velocityEffV;
}
