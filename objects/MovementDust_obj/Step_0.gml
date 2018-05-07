/// @description Change scale
var changeRate;
if(m_increasing)
{
  changeRate = abs(m_increasingRate);
}
else
{
  changeRate = -abs(m_descreasingRate);
}

image_xscale += changeRate;
image_yscale += changeRate;

if(m_increasing && image_xscale > m_targetScale)
{
  m_increasing = false;
}
else if(!m_increasing && image_xscale < m_endScale)
{
   instance_destroy();
}

