/// @description Change scale
var changeRateX, changeRateY;
if(m_increasing)
{
  if(!is_undefined(m_increasingRateX))
  {
    changeRateX = abs(m_increasingRateX);
  }
  else
  {
    changeRateX = abs(m_increasingRate);
  }
  
  if(!is_undefined(m_increasingRateY))
  {
    changeRateY = abs(m_increasingRateY);
  }
  else
  {
    changeRateY = abs(m_increasingRate);
  }
}
else
{
  if(!is_undefined(m_decreasingRateX))
  {
    changeRateX = -abs(m_decreasingRateX);
  }
  else
  {
    changeRateX = -abs(m_decreasingRate);
  }
  
  if(!is_undefined(m_decreasingRateY))
  {
    changeRateY = -abs(m_decreasingRateY);
  }
  else
  {
    changeRateY = -abs(m_decreasingRate);
  }
}

image_xscale += changeRateX;
image_yscale += changeRateY;

if(m_increasing && image_xscale > m_targetScale)
{
  m_increasing = false;
}
else if(!m_increasing && image_yscale < m_endScale)
{
   instance_destroy();
}

