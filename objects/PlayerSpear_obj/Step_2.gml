/// @description Attack Collision
if(PlayerSpear_CanStrike_scr(id))
{
  mask_index = m_skewerHitbox;
  var hitList = global.ReusableHitList;
  ds_list_clear(hitList);
  var hitCount = instance_place_list(x, y, m_targetType, hitList, false);
  
  for(var i = 0; i < hitCount; i++)
  {
    var hit = hitList[|i];
    PlayerSpear_ImpaleEnemy_scr(id, hit);
  }
	
	if(hitCount > 0)
	{
		SleepManager_scr(global.HitSleepTime);
	}
}

///Wall Latch Collision
if(PlayerSpear_CanStrike_scr(id) && instance_exists(m_wielder) && 
   Combatant_GetState_scr(m_wielder) == CombatantStates.Air)
{
  mask_index = m_imbedHitbox;
  if(place_meeting(x, y, Solid_obj))
  {
    //Find the point of entry
    var incX = lengthdir_x(2, image_angle);
    var incY = lengthdir_y(2, image_angle);
    var xx = x;
    var yy = y;
    var xMod = 0;
    var yMod = 0;
    var maxX = x + lengthdir_x(m_imbedPosX, image_angle);
    var length;
    do
    {
      hit = collision_point(x + xMod, y + yMod, Solid_obj, false, false);
      if(instance_exists(hit))
      {
        m_imbedPointX = x + xMod;
        m_imbedPointY = y + yMod;
        break;
      }
      xMod += incX;
      yMod += incY;
    }until(abs(xMod) > maxX)
  }
}

///Imbed Positioning
PlayerSpear_SetAngle_scr(id, image_angle);

