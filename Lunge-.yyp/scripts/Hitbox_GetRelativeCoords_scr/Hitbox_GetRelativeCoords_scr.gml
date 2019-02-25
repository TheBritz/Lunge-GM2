var hitbox = argument0;
if(instance_exists(hitbox) && object_is(hitbox.object_index, Hitbox_obj))
{
  with(hitbox)
  {
    return array(m_relPosX, m_relPosY);
  }
}
