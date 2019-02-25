/// @description InputManager_RegisterButtonControlKbd_scr(buttonControl, keyCode)
/// @param buttonControl
/// @param  keyCode
var btnCtrl = argument0;
var keyCode = argument1;

//Add to the keys list and key to button control map
ds_list_add(m_keysList, keyCode);
m_keyToButtonControlMap[? keyCode] = btnCtrl;


