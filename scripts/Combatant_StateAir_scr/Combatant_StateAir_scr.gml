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
  //var nextNode = m_movementGrindingCurrentNode.m_nextNode;
  var grindDirNode = m_movementGrindingCurrentNode;
  if(m_movementGrindingDir == 1)
  {
    grindDirNode = GrindLineNode_GetNext_scr
      (m_movementGrindingCurrentNode, m_movementGrindingDir);
  }
  
	if(instance_exists(grindDirNode))
  {
    //Position on the rail
    y = GrindLineNode_GetYPostion_scr(m_movementGrindingCurrentNode, x) - (bbox_bottom - y);
    
    //Use direction to the next node to tell if we're still on the current 
    //section
    var railDir = GrindLineNode_GetDirection_scr
		  (m_movementGrindingCurrentNode, m_movementGrindingDir);
    var grindPoint = Combatant_GetGrindPoint_scr(id);
    var grindDir = point_direction
      (grindPoint[0], grindPoint[1], grindDirNode.x, grindDirNode.y);
    var diff = abs(railDir - grindDir);
    if(diff > 90)
    {
      //Left the current node, check to see if the current next node has its 
      //own next node
      var nextNode = GrindLineNode_GetNext_scr
        (m_movementGrindingCurrentNode, m_movementGrindingDir);
      var nextNextNode = GrindLineNode_GetNext_scr
        (nextNode, m_movementGrindingDir);
      if((m_movementGrindingDir == -1 && instance_exists(nextNode)) || instance_exists(nextNextNode))
      {
        //Transitioned to a new rail
        m_movementGrindingCurrentNode = nextNode;
        railDir = GrindLineNode_GetDirection_scr
				  (m_movementGrindingCurrentNode, m_movementGrindingDir);
                  
        y = GrindLineNode_GetYPostion_scr(m_movementGrindingCurrentNode, x) - (bbox_bottom - y);
      }
      else
      {
        //Stop grinding
        Combatant_StopGrinding_scr(id);
      }
      
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

