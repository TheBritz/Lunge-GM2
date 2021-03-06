/// @description Read Controls
//trace("Step " + string(global.StepNumber) + ": PlayerBase_GroundControlsMovement_scr");
var accelHor = 0;

//Left Joystick State
var deadzone = .2;
var speedMaxMod = 1;
var hState = gamepad_axis_value(m_playerIndex, gp_axislh);
var vState = gamepad_axis_value(m_playerIndex, gp_axislv);

if(abs(hState) < deadzone && abs(vState) < deadzone)
{
  //Kbd Movement
  var leftStateKbd = InputManager_GetButtonControlState_scr(ButtonControls.Left);
  var rightStateKbd = InputManager_GetButtonControlState_scr(ButtonControls.Right);
   
  if(leftStateKbd == ButtonStates.Pressed || leftStateKbd == ButtonStates.JustPressed)
  {
    accelHor -= m_movementGroundAccelHor;
    m_facing = -1;
  }
  
  if(rightStateKbd == ButtonStates.Pressed || rightStateKbd == ButtonStates.JustPressed)
  {
    accelHor += m_movementGroundAccelHor;
    m_facing = 1;
  }
}
else
{
  m_facing = sign(hState);
  accelHor = m_facing * m_movementGroundAccelHor;
  speedMaxMod = hState;
}

var slopeEffect = m_movementGroundSlope * (1 - m_movementGroundSlopeResistance) * sign(Movable_GetHSpeed_scr(id) * -1);
if(accelHor != 0 || slopeEffect != 0)
{	
  if(slopeEffect != 0)
	{
		var test = "test";
	}
	Movable_ChangeHSpeed_scr(m_movementGroundMaxSpeed * m_facing * abs(speedMaxMod), m_movementGroundAccelHor + slopeEffect, m_movementGroundOverspeedCorrectionHor - slopeEffect);
  m_movementGroundActivelyMoving = true;
}
else
{
  m_movementGroundActivelyMoving = false;
}

var jumpState = InputManager_GetButtonControlState_scr(ButtonControls.Jump);
if(jumpState == ButtonStates.JustPressed)
{
  //Change to jump crouch state
  if(!is_undefined(m_movementGroundJumpSpeed))
  {
    m_combatantState = CombatantStates.JumpCrouch;
    if(sprite_exists(m_combatantSpriteJumpCrouch))
    {
      sprite_index = m_combatantSpriteJumpCrouch;
    }
    if(!is_undefined(m_combatantImageSpeedJumpCrouch))
    {
      image_speed = m_combatantImageSpeedJumpCrouch;
    }
    //Que the jump event to occur after jump lag period
		EventManager_AddEvent_scr(PlayerBase_Jump_scr, m_movementJumpLag);
  }
}

var detonateState = InputManager_GetButtonControlState_scr(ButtonControls.Detonate);
if(detonateState == ButtonStates.JustPressed || detonateState == ButtonStates.Pressed)
{
  //Detonate spear
  if(m_spear.m_canDetonate)
  {
    
  }  
}

//Attack
if(InputManager_GetButtonControlState_scr(ButtonControls.Attack) == ButtonStates.JustPressed)
{
  
}

