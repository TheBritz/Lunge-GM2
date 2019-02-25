enum AttackingSubState
{
  //Not yet in range, moving in close
  Approaching,
  //Close enough to the player to attack
  Attacking,
  //Attack has finished, recovering
  Recovering 
}

//Check if we are just starting the Leap Attack behavior 
if(m_aiStateFrames == 0)
{
  m_aiSubState = AttackingSubState.Approaching;
  //TODO: Replace placeholder enforcer sprite with a semi-random attack selection from an attack list 
  m_aiAttackSpriteCurrent = EnforcerBasic_Ground_Stationary_Attack0_spr;
  m_aiAttackRangeCurrent = Combatant_GetAttackRange_scr(m_aiAttackSpriteCurrent) - 5;
  m_aiAttackFrameNumberCurrent = sprite_get_number(m_aiAttackSpriteCurrent);
}

if(m_aiSubState == AttackingSubState.Approaching)
{
  var distToTarget = point_distance(x, y, m_aiTarget.x, m_aiTarget.y);
  if(distToTarget < m_aiAttackRangeCurrent)
  {
    m_aiSubState = AttackingSubState.Attacking;
	  sprite_index = m_aiAttackSpriteCurrent;
		image_speed = 1;
  }
  else
  {
    var diffX = m_aiTarget.x - x;
    m_facing = sign(diffX); 
    var moveSpeed = m_movementGroundMaxSpeed * sign(diffX) * m_combatDashSpeedModifier;
    Movable_ChangeHSpeed_scr(moveSpeed, m_movementGroundAccelHor);
  }
}
else if(m_aiSubState == AttackingSubState.Attacking)
{
	//Track the animation to its end
	if(sprite_index == m_aiAttackSpriteCurrent)
	{
		if(image_index + image_speed >= m_aiAttackFrameNumberCurrent)
		{
			//Animation will finish in the next frame, change to Recovering
			//m_aiState = EnemyAIStates.EngagingAntagonist;
			m_aiSubState = AttackingSubState.Recovering;
			var dirToPlayer = sign(m_aiTarget.x - x);
			if(m_facing == dirToPlayer)
			{
				sprite_index = m_combatantSpriteEngage;
				//Jump back
				Combatant_Jump_scr(1, m_movementGroundJumpSpeed * .3);
				Movable_ChangeHSpeed_scr(m_movementGroundMaxSpeed * dirToPlayer * -1)
			}
		}
	}
	else
	{
		m_aiState = EnemyAIStates.EngagingAntagonist;
	}
}
else if(m_aiSubState == AttackingSubState.Recovering)
{
	if(m_collideV == 1)
	{
		m_aiState = EnemyAIStates.EngagingAntagonist;
	}
}


var vSpeed = Movable_GetVSpeed_scr(id);
