/// @description Init

//Door
m_door = noone;

m_active = false;
m_targetList = ds_list_create();
m_targetStartY = y + global.TileSize * 2.5;
m_targetMoveSpeed = 2;

//Find reference point
m_referenceX = x - sprite_xoffset + sprite_width/2;
var holdHeight = PlayerBase_GetSpearHoldHeightAboveGround_scr(Player1_obj);
m_referenceY = bbox_bottom - holdHeight;

var thrustDist = PlayerBase_GetSpearThrustDistance_scr(Player1_obj);
thrustDist = thrustDist + (Player1_obj.m_spear.sprite_width - Player1_obj.m_spear.sprite_xoffset);
var thrustReduction = -2;

var angleInc = 45;
var angle, activePosX, activePosY, target;
for(var i = 0; i * angleInc <= 180; i++;)
{
  angle = i * angleInc;
  activePosX = m_referenceX + lengthdir_x(thrustDist + thrustReduction, angle);
  activePosY = m_referenceY + lengthdir_y(thrustDist + thrustReduction, angle);
  target = instance_create(activePosX, m_targetStartY, EnemyTestTarget_obj);
  target.m_activePositionX = activePosX;
  target.m_activePositionY = activePosY;   
  ds_list_add(m_targetList, target);
} 

