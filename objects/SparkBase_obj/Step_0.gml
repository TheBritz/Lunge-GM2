/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

Combatant_ApplyGravity_scr();

//Get direction by getting dir from previous point to this point
var prevCoords = Entity_GetPreviousPosition_scr(id, 1);

if(!is_undefined(m_deccel))
{
  var deccelDir = point_direction(x, y, prevCoords[0], prevCoords[1]);
  Movable_AddMotion_scr(id, deccelDir, m_deccel);  
  var spd = Movable_GetSpeed_scr(id);
  if(spd < m_dissappearSpeed)
  {
    instance_destroy();
  }
}

