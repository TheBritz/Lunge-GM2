/// @description CollisionTriggerCameraMod_SetCameraValues_scr()

var camera = instance_find(Camera_obj, 0);

if(!is_undefined(m_cameraTargetValue))
{
  camera.m_cameraTarget = m_cameraTargetValue;
}

if(!is_undefined(m_targetTypeValue))
{
  camera.m_targetType = m_targetTypeValue;
}

if(!is_undefined(m_snapRateHorValue))
{
  camera.m_snapRateHor = m_snapRateHorValue;
}

if(!is_undefined(m_snapRateVertValue))
{
  camera.m_snapRateVert = m_snapRateVertValue;
}


if(!is_undefined(m_leadFacingViewMultiplierValue))
{
  camera.m_leadFacingViewMultiplier = m_leadFacingViewMultiplierValue;
}

if(!is_undefined(m_leadSpeedMultiplierHorValue))
{
  camera.m_leadSpeedMultiplierHor = m_leadSpeedMultiplierHorValue;
}

if(!is_undefined(m_verticalAdjustMultiplierValue))
{
  camera.m_verticalAdjustMultiplier = m_verticalAdjustMultiplierValue;
}

if(!is_undefined(m_leadSpeedMultiplierVertValue))
{
  camera.m_leadSpeedMultiplierVert = m_leadSpeedMultiplierVertValue;
}


