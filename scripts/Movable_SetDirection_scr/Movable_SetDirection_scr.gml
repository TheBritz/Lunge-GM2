/// @description Set the movement direction
/// @param direction

var newDir = argument0;

//Use Game Maker's built-in variables to take advantage of its movement calculations
hspeed = m_velocityH;
vspeed = m_velocityV;

//Set the new direction
direction = newDir;

//Read the new hspeed and vspeed
m_velocityH = hspeed;
m_velocityV = vspeed;

//Unset built-in variables
hspeed = 0;
vspeed = 0;