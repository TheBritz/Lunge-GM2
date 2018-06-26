/// @description Init

//Globals
GameController_InitGlobals_scr();

//Create utilities
instance_create(0, 0, Hitbox_obj);
instance_create(0, 0, InputManager_obj);
instance_create(0, 0, console_obj);
var camera = instance_create(0, 0, Camera_obj);
camera.m_cameraTarget = Player1_obj;


