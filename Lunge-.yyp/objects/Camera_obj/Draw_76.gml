/// @description Position Camera
if(instance_exists(m_cameraTarget))
{
  var adjustX = Camera_GetPositionAdjustmentsX_scr(m_cameraTarget);
  var centerPointX = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )/2 - adjustX;
  var diffX = centerPointX - m_cameraTarget.x; 
  var snapRateHor = m_snapRateHor / GameController_GetFramerateSpeedAdjustment_scr();
  var snapRateVert = m_snapRateVert / GameController_GetFramerateSpeedAdjustment_scr();
  
  if(variable_instance_exists(m_cameraTarget, "m_facing"))
  {
    if(sign(diffX) != m_cameraTarget.m_facing)
    {
      snapRateHor *= m_snapRateHorFacingModMult;
    }
  }
  
  if(abs(diffX) < m_settleThreshold)
  {
    __view_set( e__VW.XView, 0, m_cameraTarget.x - __view_get( e__VW.WView, 0 )/2 + adjustX );
  }
  else
  {
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (-diffX/snapRateHor) );
  }
  
  var adjustY = Camera_GetPositionAdjustmentsY_scr(m_cameraTarget);
  var centerPointY = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )/2 - adjustY;
  var diffY = centerPointY - m_cameraTarget.y;
  if(abs(diffY) < m_settleThreshold)
  {
    __view_set( e__VW.YView, 0, m_cameraTarget.y - __view_get( e__VW.HView, 0 )/2 + adjustY );
  }
  else
  {
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (-diffY/snapRateVert) );
  }
}

