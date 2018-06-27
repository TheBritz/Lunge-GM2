/// @param EnemyAIInstance
var instance = argument0;

with(instance)
{
  if(is_undefined(m_behaviorExtensions))
  {
    m_behaviorExtensions = ds_map_create();
  }

  return m_behaviorExtensions;
}