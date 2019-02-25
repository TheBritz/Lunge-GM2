/// @description Check if all targets have been hit
var allHit = true;
var target;
for(var i = 0; i < ds_list_size(m_targetList); i++)
{
  target = m_targetList[|i];
  if(target.sprite_index != EnemyTestTargetHit_spr)
  {
    allHit = false;
    break;
  }     
}

if(allHit)
{
  if(instance_exists(m_door))
  {
    with(m_door)
    {
      instance_destroy();
    }
  }
}

