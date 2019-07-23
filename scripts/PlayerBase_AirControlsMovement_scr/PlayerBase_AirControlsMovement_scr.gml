/// @description Read Controls
//trace("Step " + string(global.StepNumber) + ": PlayerBase_AirControlsMovement_scr");

//Left Joystick State
var deadzone = .2;
var speedMaxMod = 1;
var hState = gamepad_axis_value(m_playerIndex, gp_axislh);
var vState = gamepad_axis_value(m_playerIndex, gp_axislv);

if(abs(hState) < deadzone && abs(vState) < deadzone)
{
  //Basic Movement
	var upState = InputManager_GetButtonControlState_scr(ButtonControls.Up);
  var leftState = InputManager_GetButtonControlState_scr(ButtonControls.Left);
  var rightState = InputManager_GetButtonControlState_scr(ButtonControls.Right);
  var downState = InputManager_GetButtonControlState_scr(ButtonControls.Down);
  
  var accelHor = 0;
  if(leftState == ButtonStates.Pressed || leftState == ButtonStates.JustPressed)
  {
    accelHor -= m_movementAirFallAccelHor;
  }
  
  if(rightState == ButtonStates.Pressed || rightState == ButtonStates.JustPressed)
  {
    accelHor += m_movementAirFallAccelHor;
  }
  
  if(downState == ButtonStates.JustPressed &&
     Movable_GetVSpeed_scr(id) >= -2)
  {
    m_combatantState = CombatantStates.FastFall;
  }
	
	if(m_playerIsWallRunning && InputManager_GetButtonControlState_scr(ButtonControls.Jump) == ButtonStates.JustPressed)
	{
		Movable_ChangeHSpeed_scr(-m_movementGroundJumpSpeed * m_facing);
		Movable_ChangeVSpeed_scr(-1000, m_movementGroundJumpSpeed * .5);
	}
	
	if(m_playerIsWallRunning)
	{
		 if(upState == ButtonStates.Pressed || upState == ButtonStates.JustPressed)
		{
			m_movementAirGravityMult = m_playerWallRunGravityMultiplierActive;
		}
		else
		{
			m_movementAirGravityMult = m_playerWallRunGravityMultiplierInactive
		}
	}
}
else
{
	if(abs(hState) > deadzone)
	{
    m_facing = sign(hState);
	}
	accelHor = m_facing * m_movementGroundAccelHor;
  speedMaxMod = hState;
	if(m_playerIsWallRunning)
	{
		if(abs(vState) > deadzone)
		{
			m_movementAirGravityMult = m_playerWallRunGravityMultiplierActive;
		}
		else
		{
			m_movementAirGravityMult = m_playerWallRunGravityMultiplierInactive
		}
	}
	
	if(m_playerIsWallRunning && InputManager_GetButtonControlState_scr(ButtonControls.Jump) == ButtonStates.JustPressed)
	{
		Movable_ChangeHSpeed_scr(-m_movementGroundJumpSpeed * m_facing);
		Movable_ChangeVSpeed_scr(-1000, m_movementGroundJumpSpeed * .5);
	}
}

var spdH = Movable_GetHSpeed_scr(id);
if(abs(spdH) > m_movementAirFallMaxSpeedHor)
{
}

if(accelHor != 0)
{
  Movable_ChangeHSpeed_scr(m_movementAirFallMaxSpeedHor * m_facing * abs(speedMaxMod), m_movementAirFallAccelHor * GameController_GetFramerateSpeedAdjustment_scr(), 0);
}

//Attack
if(InputManager_GetButtonControlState_scr(ButtonControls.Attack) == ButtonStates.JustPressed)
{
  //m_combatantState = CombatantStates.GroundAttack;
  //sprite_index = m_combatantSpriteGroundAttack;
  //m_activelyMoving = false;
  //alarm[1] = 12;
}

