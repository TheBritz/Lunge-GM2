m_active = place_meeting(x, y, PlayerBase_obj);

var destinationX;
var destinationY;

for(var i = 0; i < ds_list_size(m_targetList) i++)
{
  var target = m_targetList[|i];
  
  if(m_active)
  {
    destinationX = target.m_activePositionX;
    destinationY = target.m_activePositionY;
  }
  else
  {
    destinationX = target.x;
    destinationY = m_targetStartY;
  }
    
  with(target)
  {
    if(distance_to_point(destinationX, destinationY) <= abs(other.m_targetMoveSpeed))
    {
      x = destinationX;
      y = destinationY;
      speed = 0;
    }
    else
    {
      move_towards_point(destinationX, destinationY, other.m_targetMoveSpeed);
    }
  }
}



