/// @description Insert description here
// You can write your code in this editor

var deltaTime = delta_time;
var refreshRate = 1000000/delta_time;

m_calcCumulative += refreshRate;

if(m_calcCounter >= m_calcSampleSize - 1)
{
  var averageRefreshRate = m_calcCumulative / m_calcSampleSize;
  var diffSmallest = 1000;
  var diff, thisRefreshRate;
  var adjustedRefreshRate = 1000;
  for(var i = 0; i < array_length_1d(m_commonRefreshRates); i++)
  {
	  thisRefreshRate = m_commonRefreshRates[i];
    diff = averageRefreshRate - thisRefreshRate;
    if(abs(diff) < diffSmallest)
    {
      adjustedRefreshRate = thisRefreshRate;
      diffSmallest = diff;
    }
  }
  
  room_speed = adjustedRefreshRate;
}
else
{
  m_calcCounter++;
  alarm[0] = m_calcInterval;
}

