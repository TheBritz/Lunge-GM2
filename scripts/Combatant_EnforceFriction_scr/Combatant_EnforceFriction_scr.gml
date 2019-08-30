#region Handle Grinding Movement
if(instance_exists(m_movementGrindingCurrentNode))
{
  var nextNode = m_movementGrindingCurrentNode.m_nextNode;
	if(instance_exists(nextNode))
  {
    //Use direction to the next node to tell if we're still on the current 
    //section
    var railDir = GrindLineNode_GetDirection_scr()
      (m_movementGrindingCurrentNode.x, m_movementGrindingCurrentNode.y, nextNode.x, nextNode.y);
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
        var railDir = point_direction
          (m_movementGrindingCurrentNode.x, m_movementGrindingCurrentNode.y, nextNode.x, nextNode.y);
        Movable_SetDirection_scr(railDir);
      }
      else
      {
        //Stop grinding
        m_movementIsGrinding = false;
        m_movementGrindingCurrentNode = noone;
      }
    }
    
    //Handle Grinding
    if(m_movementIsGrinding)
    {
      y = GrindLineNode_GetYPostion_scr(m_movementGrindingCurrentNode, x);
    }
  }
  else
  {
    //Stop grinding
    m_movementIsGrinding = false;
    m_movementGrindingCurrentNode = noone;
  }
}
#endregion

#region Surface Movement
else
{
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

	var surface = Movable_GetTouchingSurfaceVertInst_scr(id);
	if(instance_exists(surface))
	{
	  var frictMotion = global.FrictionMovingSurface;
	  var surfSpd = Movable_GetHSpeed_scr(surface);
	  Movable_ChangeHSpeed_scr(surfSpd, frictMotion, undefined, true);
	}

	if(!m_combatantSpriteLock && m_combatantState == CombatantStates.Ground)
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
}
#endregion

