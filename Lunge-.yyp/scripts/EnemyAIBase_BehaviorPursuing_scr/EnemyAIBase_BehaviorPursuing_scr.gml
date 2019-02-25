/// @description EnemyAIBase_BehaviorPursuing_scr(extesionScript)
/// @param extesionScript

var extScript = argument0;

if(!is_undefined(extScript))
{
  script_execute(extScript);
}

//Move towards combatant
var horDist = m_aiTarget.x - x;
if(is_array(m_combatSprintAttackRange) && is_within_range(abs(horDist), m_combatSprintAttackRange[0], m_combatSprintAttackRange[1]))
{
  if(roll_chance(m_combatSprintAttackLikelihood))
  {
    //Sprint Attack
    var test = "test";
  }
}
else if(abs(horDist) < m_aiEngageDistance)
{
  //Engage target
  m_aiState = EnemyAIStates.EngagingAntagonist;
  EngagementController_EngageTarget_scr(id, m_aiTarget);
}
else
{
  m_facing = sign(horDist);
  Movable_ChangeHSpeed_scr(m_movementGroundMaxSpeed * m_facing, m_movementGroundAccelHor);
  EnemyAIBase_BehaviorSurveyForJumpNeed_scr();
} 
