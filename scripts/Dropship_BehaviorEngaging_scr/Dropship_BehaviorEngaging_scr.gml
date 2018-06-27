/// @description Dropship_BehaviorEngaging_scr()

if(!m_deploying)
{
  if(abs(m_velocityH) < 2)
  {
    m_deploying = true;
  }
}
else
{
  var passengerCount = ds_list_size(m_passengers);
  for(var i = passengerCount - 1; i >= 0; i--)
  {
    var passenger = m_passengers[|i];
    var randomX = irandom_range(-55, 55);
    instance_create(x + randomX, y, passenger);
    ds_list_delete(m_passengers, i);
  }
}