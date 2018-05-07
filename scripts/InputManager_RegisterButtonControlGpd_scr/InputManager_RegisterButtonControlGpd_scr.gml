/// @description InputManager_RegisterButtonControlGpd_scr(buttonControl [ButtonControls enum], gamepadButton)
/// @param buttonControl [ButtonControls enum]
/// @param  gamepadButton
var btnCtrl = argument0;
var keyCode = argument1;

//Add to the keys list and key to button control map
ds_list_add(m_gamepadList, keyCode);
m_gamepadToButtonControlMap[? keyCode] = btnCtrl;


