/// @description Movable_Init_scr()

//Collision step extension
m_collisionStepExtensions = undefined;

m_velocityH = 0;
m_velocityV = 0;
m_velocitySurfaceH = 0;
m_velocitySurfaceV = 0;

m_subH = 0;
m_subV = 0;

m_isSolidObservant = true;
m_collideH = 0;
m_collideV = 0;
m_impactVelH = 0;
m_impactVelV = 0;

//Value to keep movables attached to the ground when moving down slopes
m_slopeStickFactor = 0;

m_movementSuppressGravity = false;
m_movementAirGravity = undefined;
m_movementAirFallMaxSpeedVert = undefined;
m_movementUseFramerateAdjust = true;
m_movementGroundSlope = 0;
m_movementGroundSlopeAngle = 0;

m_isGrounded = false;
m_touchingSurfaceHor = 0;
m_touchingSurfaceHorInst = noone;
m_touchingSurfaceVert = 0;
m_touchingSurfaceVertInst = noone;
m_surfaceSpeedAdjustRate = .75;
m_surfaceLandingSpeedThreshold = 4;

m_timeSpeedModMult = undefined;
