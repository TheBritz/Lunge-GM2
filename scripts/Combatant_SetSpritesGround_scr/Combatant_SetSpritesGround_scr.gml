var hSpeed = Movable_GetHSpeed_scr(id);
if(hSpeed != 0)
{
  //Set overspeed image  
  if(abs(hSpeed) > m_movementGroundMaxSpeed * m_movementGroundOverspeedThreshold && sign(hSpeed) == m_facing)
  {
    if(!is_undefined(m_combatantSpriteOverspeed))
    {
      sprite_set_properties(m_combatantSpriteOverspeed, undefined, m_combatantImageSpeedOverspeed);
      var overspeedDust = instance_create(x, bbox_bottom + 2, OverspeedDust_obj);
      overspeedDust.image_xscale = m_facing;
      overspeedDust.depth = depth -1;
    }
  }
  else if(!is_undefined(m_combatantSpriteRun))
  {
    sprite_set_properties(m_combatantSpriteRun, undefined, m_combatantImageSpeedRun);
  }
}
else if(!is_undefined(m_combatantSpriteIdle))
{
  //sprite_set_properties(m_combatantSpriteIdle, undefined, m_combatantImageSpeedIdle);
}
