/// @description Movable_GetHSpeedEffective_scr(movableInstance)
/// @param movableInstance
var movable = argument0;
var spd = Movable_GetHSpeed_scr(movable) + m_velocitySurfaceH;
var frameAdjustment = GameController_GetFramerateSpeedAdjustment_scr();
return spd * frameAdjustment * global.SpeedModMult + global.SpeedModAdd;
