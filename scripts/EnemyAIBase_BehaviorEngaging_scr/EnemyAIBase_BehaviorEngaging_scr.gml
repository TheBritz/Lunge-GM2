/// @description EnemyAIBase_BehaviorEngaging_scr(extensionScript)
/// @param extensionScript

var extScript = argument0;

if(!is_undefined(extScript))
{
  script_execute(extScript);
}

if(instance_exists(m_aiTarget))
{
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
