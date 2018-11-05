/// @description Movable_GetVSpeedEffective_scr(movableInstance)
/// @param movableInstance
var movable = argument0;
var spd = Movable_GetVSpeed_scr(movable);
var frameAdjustment = GameController_GetFramerateSpeedAdjustment_scr();
return spd * frameAdjustment * global.SpeedModMult + global.SpeedModAdd;
