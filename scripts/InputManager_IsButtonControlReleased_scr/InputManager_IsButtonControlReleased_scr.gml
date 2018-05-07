/// @description InputManger_IsButtonControlReleased_scr(buttonControl)
/// @param buttonControl
var buttonControl = argument0;

var buttonState = InputManager_GetButtonControlState_scr(buttonControl);

return(buttonState == ButtonStates.Released || buttonState == ButtonStates.JustReleased);
