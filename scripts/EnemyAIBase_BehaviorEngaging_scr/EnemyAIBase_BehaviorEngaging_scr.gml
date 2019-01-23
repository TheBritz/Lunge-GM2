/// @description EnemyAIBase_BehaviorEngaging_scr(extensionScript)
/// @param extensionScript

var extScript = argument0;

if(!is_undefined(extScript))
{
  script_execute(extScript);
}

m_behaviorTickrate = 1;
m_engagementInPosition = false;

if(instance_exists(m_aiTarget))
{
  //Decrement
  if(m_aiAttackDelayTimer > 0)
  {
    m_aiAttackDelayTimer--;
    if(m_aiAttackDelayTimer < 0)
    {
      //Execute attack
    }
  }
  
  if(!is_undefined(m_combatantSpriteEngage))
  {
    sprite_index = m_combatantSpriteEngage;
  }
  
  if(!is_undefined(m_engagementPosition))
  {
    var diffX = m_aiTarget.x - x;
    var diffXEngage = diffX + m_engagementPosition;
    m_facing = sign(diffX); 
		var speedBuffer = abs(Movable_GetHSpeed_scr(id) * 3);
    if(abs(diffXEngage) > m_engagementPositionVariance + speedBuffer)
    {
      var engageSpeed = m_movementGroundMaxSpeed * sign(diffXEngage); 
      if(sign(m_engagementPosition) == sign(diffX))
      {
        engageSpeed *= m_combatDashSpeedModifier;
      }
      else
      {
        engageSpeed *= m_combatEngagingSpeedModifier;
      }
      
      Movable_ChangeHSpeed_scr(engageSpeed, m_movementGroundAccelHor);
      EnemyAIBase_BehaviorSurveyForJumpNeed_scr();
    }
		else if(abs(diffXEngage) > m_engagementPositionVariance)
		{
			var slowingSpeed = m_movementGroundMaxSpeed/2 * sign(diffXEngage); 
			Movable_ChangeHSpeed_scr(slowingSpeed, m_movementGroundAccelHor);
		}
    else
    {
      Movable_ChangeHSpeed_scr(0, m_movementGroundAccelHor);
			m_engagementInPosition = true;
    }
  }
  
  var dist = point_distance(m_aiTarget.x, m_aiTarget.y, x, y);
  if(dist > m_aiDisengageDistance)
  {
    //Disengage
    //m_aiState = EnemyAIStates.PursuingAntagonist;
    //m_aiAttackDelayTimer = -1;
  }
}
else
{
  m_aiState = EnemyAIStates.Idling;
}
