/// @description Entity_GetPreviousPosition_scr(entity, framesPast)
/// @param entity
/// @param  framesPast
var entity = argument0;
var framesPast = argument1;
with(entity)
{
  if(framesPast > 0 && framesPast <= m_maximumPreviousTracked)
  {
    var prevx = m_xPreviousList[| framesPast - 1];
    var prevy = m_yPreviousList[| framesPast - 1];
    return array(prevx, prevy);
  }
}

