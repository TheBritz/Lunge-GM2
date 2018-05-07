/// @description Movable_TestControls_scr()

var leftState = InputManager_GetButtonControlState_scr(ButtonControls.Left);
var rightState = InputManager_GetButtonControlState_scr(ButtonControls.Right);
var downState = InputManager_GetButtonControlState_scr(ButtonControls.Down);
var upState = InputManager_GetButtonControlState_scr(ButtonControls.Up);

if(leftState == ButtonStates.Pressed)
  Movable_ChangeHSpeed_scr(-10, 1);
  
if(rightState == ButtonStates.Pressed)
  Movable_ChangeHSpeed_scr(10, 1);
  
if(leftState == ButtonStates.Released && rightState == ButtonStates.Released)
  m_velocityH = 0;

if(downState == ButtonStates.Pressed)
  Movable_ChangeVSpeed_scr(10, 1);

if(upState == ButtonStates.Pressed)
  Movable_ChangeVSpeed_scr(-10, 1);
  
if(downState == ButtonStates.Released && upState == ButtonStates.Released)
  m_velocityV = 0;
