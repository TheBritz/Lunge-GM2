/// @description Insert description here
// You can write your code in this editor

draw_self();

var size = m_maximumPreviousTracked;
var xCurr, yCurr, xNext, yNext, colCur, colNext;
for(var i = 0; i < size - 1; i++)
{
  xCurr = m_xPreviousList[|i];
  yCurr = m_yPreviousList[|i];
  xNext = m_xPreviousList[|i+1];
  yNext = m_yPreviousList[|i+1];
  colCur = m_colors[|i];
  colNext = m_colors[|i+1];
  
  draw_line_color(xCurr, yCurr, xNext, yNext, colCur, colNext);
}
