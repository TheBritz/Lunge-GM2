/// @description Insert description here
// You can write your code in this editor

room_speed = 1000;
m_calcInterval = 2;
m_calcCumulative = 0;
m_fpsCumulative = 0;
m_calcCounter = 0;
m_calcSampleSize = 60;
alarm[0] = m_calcInterval;

m_commonRefreshRates = array(24, 30, 60, 96, 120, 144, 165, 240);
