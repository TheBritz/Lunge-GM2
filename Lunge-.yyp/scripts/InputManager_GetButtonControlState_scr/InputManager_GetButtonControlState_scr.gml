/// @description InputManager_GetButtonControlState_scr(button)
/// @param button
var button = argument0; 

with(InputManager_obj)
{
  var buttonState = m_buttonControlStates[? button];
  return buttonState;
}
