/// @description EnemyAIBase_BehaviorEngaging_scr(extensionScript)
/// @param extensionScript

var extScript = argument0;

if(!is_undefined(extScript))
{
  script_execute(extScript);
}

m_behaviorTickrate = 6;

if(instance_exists(m_aiTarget))
{
  if(!is_undefined(m_combatantSpriteEngage))
  {
    sprite_index = m_combatantSpriteEngage;
  }
  
  if(!is_undefined(m_engagementPosition))
  {
    var diffX = m_aiTarget.x - x;
    var diffXEngage = diffX + m_engagementPosition;
    m_facing = sign(diffX); 
    if(abs(diffXEngage) > m_engagementPositionVariance)
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
    else
    {
      Movable_ChangeHSpeed_scr(0, m_movementGroundAccelHor);
    }
  }
  
  var dist = point_distance(m_aiTarget.x, m_aiTarget.y, x, y);
  if(dist > m_aiDisengageDistance)
  {
    m_aiState = EnemyAIStates.PursuingAntagonist;
  }
}
else
{
  m_aiState = EnemyAIStates.Idling;
}
