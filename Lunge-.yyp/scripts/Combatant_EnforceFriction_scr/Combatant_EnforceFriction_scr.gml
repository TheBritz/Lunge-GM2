if(!m_movementGroundActivelyMoving)
{
  var frict;
  if(!is_undefined(m_movementGroundFriction))
  {
    frict = m_movementGroundFriction;
  }
  else
  {
    frict = global.Friction;
  }
  
  Movable_ChangeHSpeed_scr(0, frict);
}

if(m_combatantState == CombatantStates.Ground)
{
  if(!m_movementGroundActivelyMoving && 
     Movable_GetHSpeed_scr(id) == 0)
  {
    var motionInfo = Combatant_GetSpriteInfo_scr(sprite_index, SpriteInfoType.Movement);
    if(string_lower(motionInfo) != "stationary")
    {
      sprite_index = m_combatantSpriteIdle;
    }
  }
  else if(!is_undefined(m_combatantSpriteDirectionChange) &&
   sign(m_facing) != sign(Movable_GetHSpeed_scr(id)))
  {
    sprite_index = m_combatantSpriteDirectionChange;
  }
}
