/// @description EnemyAIBase_BehaviorIdling_scr(extesionScript)
/// @param extesionScript

var extScript = argument0;

if(!is_undefined(extScript))
{
  script_execute(extScript);
}

//Move towards combatant
var horDist = m_aiTarget.x - x;
if(abs(horDist) < m_aiEngageDistance)
{
  //Engage target
  m_aiState = EnemyAIStates.EngagingAntagonist;
}
else
{
  m_facing = sign(horDist);
  Movable_ChangeHSpeed_scr(m_movementGroundMaxSpeed * m_facing, m_movementGroundAccelHor);
} 
