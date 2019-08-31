/// @description Combatant_StateAir_scr()

//Set overspeed image
if(!m_combatantSpriteLock)
{
	var hSpeed = Movable_GetHSpeed_scr(id);
	if(abs(hSpeed) > m_movementAirFallMaxSpeedHor * m_movementGroundOverspeedThreshold && sign(hSpeed) == m_facing)
	{
	  if(!is_undefined(m_combatantSpriteOverspeed) && !m_isAttacking)
	  {
	    sprite_set_properties(m_combatantSpriteOverspeed, undefined, m_combatantImageSpeedOverspeed);
	  }
	}
	else if(!is_undefined(m_combatantSpriteFall) && !m_isAttacking)
	{
	  sprite_index = m_combatantSpriteFall;
	}
}

Combatant_LimitAirSpeed_scr();
Combatant_CollisionSolidAir_scr();

#region Handle Grinding Movement
if(instance_exists(m_movementGrindingCurrentNode))
{
  var nextNode = m_movementGrindingCurrentNode.m_nextNode;
	if(instance_exists(nextNode))
  {
    //Use direction to the next node to tell if we're still on the current 
    //section
    var railDir = GrindLineNode_GetDirection_scr
		  (m_movementGrindingCurrentNode, m_movementGrindingDir);
    var grindPoint = Combatant_GetGrindPoint_scr(id);
    var grindDir = point_direction
      (grindPoint[0], grindPoint[1], nextNode.x, nextNode.y);
    var diff = abs(railDir - grindDir);
    if(diff > 5)
    {
      //Left the current node, check to see if the current next node has its 
      //own next node
      if(instance_exists(nextNode.m_nextNode))
      {
        //Transitioned to a new rail
        m_movementGrindingCurrentNode = nextNode;
        nextNode = nextNode.m_nextNode;
        railDir = GrindLineNode_GetDirection_scr
				  (m_movementGrindingCurrentNode, m_movementGrindingDir);
      }
      else
      {
        //Stop grinding
        Combatant_StopGrinding_scr(id);
      }
    }
    
    //Handle Grinding
    if(m_movementIsGrinding)
    {
      y = GrindLineNode_GetYPostion_scr(m_movementGrindingCurrentNode, x) - (bbox_bottom - y);
			Movable_SetDirection_scr(railDir);
    }
  }
  else
  {
    //Stop grinding
		Combatant_StopGrinding_scr(id);
  }
}
#endregion

