/// @description GamepadGetDirectionFromStickAxes_scr(device, stick [GameStick enum], deadzone [optional])
/// @param device
/// @param  stick [GameStick enum]
/// @param  deadzone [optional]
enum GameStick
{
  Left,
  Right
}

var device = argument[0];
var stick = argument[1];
//TO-DO: Create a global deadzone value
var deadzone = .2;
if(argument_count > 2)
{
  deadzone = argument[2];
}

var axisH = undefined;
var axisV = undefined; 
if(stick == GameStick.Left)
{
  axisH = gamepad_axis_value(device, gp_axislh);
  axisV = gamepad_axis_value(device, gp_axislv); 
}
else if(stick == GameStick.Right)
{
  axisH = gamepad_axis_value(device, gp_axisrh);
  axisV = gamepad_axis_value(device, gp_axisrv);
}

var dir = undefined;
if(!is_undefined(axisH))
{
  if(abs(axisH) > deadzone || abs(axisV) > deadzone)
  {
    var hspeedHolder = hspeed;
    var vspeedHolder = vspeed;
    
    hspeed = axisH;
    vspeed = axisV;
    
    dir = direction;
    
    hspeed = hspeedHolder;
    vspeed = vspeedHolder;
  }
}

return dir;
