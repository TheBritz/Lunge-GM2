/// @description Movable_Init_scr()

m_velocityH = 0;
m_velocityV = 0;

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

m_isGrounded = false;
