/// @description Spark Init
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//The base color
m_baseColor = undefined;

//List of colors
m_colors = undefined;

//The number of visual segments of the spark as the color darkens
//Set with Spark_SetNumberOfSegments_scr
m_numberOfSegments = undefined;

//The rate at which the spark deccelerates
m_deccel = undefined;

//The absolute speed at which point the spark dissappears
m_dissappearSpeed = 1;

//Members needed for gravity
m_movementAirGravity = undefined;
m_movementSuppressGravity = false;
m_movementAirFallMaxSpeedVert = undefined;

m_bounceQuotientH = 1;
m_bounceQuotientV = 1;

m_frictionQuotientH = 1;
m_frictionQuotientV = 1;





