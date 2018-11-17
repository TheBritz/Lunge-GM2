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
  m_aiSubState = LeapAttackingSubState.Approaching;
}

if(m_aiSubState == LeapAttackingSubState.Approaching)
{
  var distToTarget = point_distance(x, y, m_aiTarget.x, m_aiTarget.y);
  if(distToTarget < m_combatLeapAttackRange)
  {
    EnemyAI_StartLeapAttack_scr(id, m_aiTarget);
  }
  else
  {
    var diffX = m_aiTarget.x - x;
    m_facing = sign(diffX); 
    var moveSpeed = m_movementGroundMaxSpeed * sign(diffX) * m_combatDashSpeedModifier;
    Movable_ChangeHSpeed_scr(moveSpeed, m_movementGroundAccelHor);
  }
}
else if(m_aiSubState == LeapAttackingSubState.Leaping)
{
  var distToTarget = point_distance(x, y, m_aiTarget.x, m_aiTarget.y);
  if(distToTarget < m_combatLeapAttackSlashRange)
  {
    sprite_set_properties(m_enemySpriteLeapAttackSlash, undefined, undefined);
  }
  else
  {
    sprite_set_properties(m_enemySpriteLeapAttack, undefined, undefined);
  }

  if(m_impactVelV != 0)
  {
    m_aiState = EnemyAIStates.EngagingAntagonist;
  }
}

var vSpeed = Movable_GetVSpeed_scr(id);
