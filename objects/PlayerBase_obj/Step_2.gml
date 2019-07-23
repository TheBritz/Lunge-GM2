#region Inherited Events


/// @description Inherited Events
event_inherited();
#endregion

#region Player Wall Run
if(!m_playerIsWallRunning)
{
  if(m_impactVelH != 0 || 
	  (m_playerBoostPreviousFrame && Movable_GetTouchingSurfaceHor_scr(id) != 0))
	{ 
	  if(m_velocityV <= abs(m_playerWallRunStartSpeedThresh)*-1)
		{
			//Start wall running
			m_playerIsWallRunning = true;
			m_combatantSpriteLock = true;
			//image_angle = 90;
			sprite_set_properties(m_playerWallRunSprite, 0, undefined);
			//Set the scale sign according to the wall that is being run up
			image_xscale = abs(image_xscale) * sign(m_impactVelH);
			m_movementAirGravityMult = m_playerWallRunGravityMultiplierInactive;
		}
	}
}
else
{
	//Check if player has stopped wall running
	var isTooSlow = m_velocityV > abs(m_playerWallRunStopSpeedThresh) * -1;
	if(Movable_GetTouchingSurfaceHor_scr(id) == 0 || isTooSlow)
	{
		//Stop wall running
		m_playerIsWallRunning = false;
		m_combatantSpriteLock = false;
		m_movementAirGravityMult = undefined;
		
		sprite_set_properties(m_combatantSpriteFall, 0, undefined);
		//To-do: Experiment with a small hop-off if stop threshold was reached
		if(isTooSlow)
		{
			Movable_ChangeHSpeed_scr(-m_movementGroundJumpSpeed * .2 * m_facing);
			Movable_ChangeVSpeed_scr(-1000, m_movementGroundJumpSpeed * .25);
		}
	}
}
#endregion

#region Player Slide
//Slide landing
if(m_impactVelV > 0 && m_combatantSpriteOverspeed != m_combatantSpriteSlide && m_movementGroundSlideIsBuffered)
{
	m_combatantSpriteOverspeed = m_combatantSpriteSlide;
	Movable_ChangeHSpeed_scr(m_velocityH + 
	  (m_movementGroundSlideLandingSpeedBoost * sign(m_velocityH)), m_movementGroundSlideLandingSpeedBoost);
}

if(m_combatantSpriteOverspeed == m_playerSpriteOverspeedSlide)
{
  if(sprite_index == m_playerSpriteOverspeedSlide)
  {
    m_movementGroundOverspeedCorrectionHor = m_movementGroundOverspeedCorrectionHorSlide;
		m_movementGroundSlopeResistance = 0;
	  image_angle = m_movementGroundSlopeAngle;
	}
  else
  {
    m_movementGroundOverspeedCorrectionHor = m_movementGroundOverspeedCorrectionHorStandard;
		m_movementGroundSlopeResistance = 1;
		image_angle = 0;
  }
  
  if(!Combatant_IsInOverspeed_scr(id))
  {
    m_movementGroundSlopeResistance = 1;
		m_combatantSpriteOverspeed = m_combatantSpriteOverspeedStandard;
    m_movementGroundOverspeedCorrectionHor = m_movementGroundOverspeedCorrectionHorStandard;
		image_angle = 0;
	}
}
#endregion

if(instance_exists(m_spear))
{	
#region Charge Spear
  var groundMult = 1;
	if(Movable_IsGrounded_scr(id))
	{
		groundMult = m_spearChargeGroundedMult;
		
		//Stop boost cruise
		if(m_movementAirGravity == 0)
		{
		  m_movementAirGravity = undefined;
		}
	}
	
	var charge = get_modified_time() * m_spearChargeAmount * groundMult;
  PlayerSpear_AddCharge_scr(m_spear, charge, false);
#endregion

#region Position Spear
  var spearAngle = undefined;
  if(keyboard_check(vk_left) && !keyboard_check(vk_right))
  {
    if(keyboard_check(vk_up))
    {
      spearAngle = 135; 
    }
    else if(keyboard_check(vk_down))
    {
      spearAngle = 225;
    }
    else
    {
      spearAngle = 180;
    }
  }
  else if(keyboard_check(vk_right) && !keyboard_check(vk_left))
  {
    if(keyboard_check(vk_up))
    {
      spearAngle = 45; 
    }
    else if(keyboard_check(vk_down))
    {
      spearAngle = 315;
    }
    else
    {
      spearAngle = 0;
    }
  }
  else if(keyboard_check(vk_down) && !keyboard_check(vk_up))
  {
    spearAngle = 270;
  }
  else if(keyboard_check(vk_up) && !keyboard_check(vk_down))
  {
    spearAngle = 90;
  }
    
  var gpdSpearAngle = GamepadGetDirectionFromStickAxes_scr(0, GameStick.Right);
  if(!is_undefined(gpdSpearAngle))
  {
    spearAngle = PlayerBase_GetClosestSpearHoldAngle_scr(id, gpdSpearAngle); 
  } 
  
  if(InputManager_GetButtonControlState_scr(ButtonControls.Attack) == ButtonStates.JustPressed)
  {
    if(is_undefined(m_spear.m_imbedPointX))
    {
      if(m_spearCanLunge)
			{
				var spd = abs(Movable_GetHSpeed_scr(id));
        
        var attacks, attackSprite;
        var isGrounded = Movable_IsGrounded_scr(id);
        if(isGrounded)
        {
          if(spd < m_movementGroundMaxSpeed * m_combatantDashAttackSpeedThreshold)
          {
            attacks = m_playerSpriteDirectionalGroundAttacksAlt;
            attackSprite = m_combatantSpriteGroundAttack;
          }
          else
          {
            //Assign dashing sprite (temporarily using stationary)
            attacks = m_playerSpriteDirectionalGroundAttacksAlt;
            attackSprite = m_combatantSpriteGroundAttack;
          }
        }
        else
        {
          attacks = m_playerSpriteDirectionalAirAttacksAlt;
          attackSprite = m_combatantSpriteAirAttack;
        }
        
				var spearDir = floor(PlayerBase_GetSpearAimRelativeDirection_scr(id));
					
				if(ds_map_exists(attacks, spearDir))
				{
					attackSprite = attacks[? spearDir];
				}
	      Combatant_PlaySoundOn_scr(id, Stab_snd, AudioEmitterTypes.Attack, false, 1);
	      sprite_index = attackSprite;
        var sprSpd = sprite_get_speed(attackSprite);
        var sprNumber = sprite_get_number(attackSprite);
        var duration = sprNumber / sprSpd;
        EventManager_AddEvent_scr(PlayerBase_ResetSpearLunging_scr, duration);
        
	      //image_speed = m_combatantImageSpeedGroundAttack;
	      m_isAttacking = true;
				//m_spearIsLunging = true;
	      alarm[PlayerBaseAlarms.ResetIsLunging] = floor(sprite_get_number(sprite_index) / image_speed);
	      m_combatantState = CombatantStates.GroundAttack;	      
			}
    }
    else
    {
      //Pull spear out of object
      m_spear.m_imbedPointX = undefined;
      m_spear.m_imbedPointY = undefined;
    }
  }
  
  var xAdjust = 0;
  var yAdjust = 0;
  //if(m_spearLungeAdjust != 0)
  //{
  //  xAdjust = lengthdir_x(m_spearLungeAdjust, m_spear.image_angle);
  //  yAdjust = lengthdir_y(m_spearLungeAdjust, m_spear.image_angle);
  //}
  
  var xx = 0;
  var yy = 0;
  var spriteName = sprite_get_name(sprite_index);
  var posMap = SpritePositionDataGetData_scr(sprite_index, "weapon", image_index);
  if(!is_undefined(posMap))
  {
    xx = posMap[?"x"]*m_facing - sprite_xoffset;
    yy = posMap[?"y"]*sign(image_yscale) - sprite_yoffset;
  }
  else
  {
    var test = "test";
  }
  
  m_spear.x = x + xx + xAdjust ;
  m_spear.y = y + yy + yAdjust ;
  m_spear.depth = depth - 1;
  PlayerSpear_PositionSkeweredEnemies_scr(m_spear);
	#endregion
  
#region Player Boost
	var isPlayerBoosting = false;
  if(InputManager_GetButtonControlState_scr(ButtonControls.Detonate) == ButtonStates.JustPressed)
  {
		var detonationSpeed = PlayerSpear_Detonate_scr(m_spear);
    if(detonationSpeed > 0)
    {	
			m_movementAirGravity = 0;
			EventManager_AddEvent_scr(PlayerBase_ResetGravity_scr, m_spearDetonationCruiseTime);
			
			isPlayerBoosting = true;
      
			//Pull spear out of object
      m_spear.m_imbedPointX = undefined;
      m_spear.m_imbedPointY = undefined;  
    
      var angle = m_spear.image_angle + 180;
      if(angle >= 360) angle -= 360;
      
			var horSpeedMod = 1;
			
			#region Player Slide
      //Check to see if player is on the ground
      ////TODO: Make it so that player can transition to slide from a short distance above ground too
      //Check to see if detonation angle is downward and aligns with player movement
      if((angle >= 200 && angle <= 240 && sign(Movable_GetHSpeed_scr(id)) == -1)
        ||(angle >= 300 && angle <= 340 && sign(Movable_GetHSpeed_scr(id)) == 1))
      {
	      if(Movable_IsGrounded_scr(id))
	      {
					m_combatantSpriteOverspeed = m_combatantSpriteSlide;
					horSpeedMod = m_movementGroundSlideSpeedMult;
				}
				else
				{
					m_movementGroundSlideIsBuffered = true;
					//Start event
					EventManager_AddEvent_scr
					  (PlayerBase_Event_ResetSlideBuffer_scr, m_movementGroundSlideBufferTime);
				}
      }
      #endregion
			
      var vertComponent = lengthdir_y(m_spearDetonationSpeed, angle);
      if(vertComponent != 0 && sign(vertComponent) != sign(Movable_GetVSpeed_scr(id)))
      {
        Movable_ChangeVSpeed_scr(vertComponent, 1000);
      }
      else
      {
        Movable_AddMotion_scr(id, 270, vertComponent);
      }
      
      var horComponent = lengthdir_x(m_spearDetonationSpeed, angle) * horSpeedMod;
      if(horComponent != 0 && sign(horComponent) != sign(Movable_GetHSpeed_scr(id)))
      {
        Movable_ChangeHSpeed_scr(horComponent, 1000);
      }
      else
      {
        Movable_AddMotion_scr(id, 0, horComponent);
      }
      m_spearCanDetonate = false;
    }
  }
	else if(!InputManager_GetButtonControlState_scr(ButtonControls.Detonate) == ButtonStates.Pressed)
	{
		m_movementAirGravity = undefined;
	}
  
  var imbedCoords; 
  var angleBefore = m_spear.image_angle;
  if(!is_undefined(spearAngle) && !m_spearIsLunging) 
  {
    imbedCoords = PlayerSpear_SetAngle_scr(m_spear, spearAngle); 
  }
  else
  {
    imbedCoords = PlayerSpear_SetAngle_scr(m_spear, m_spear.image_angle); 
  }
  
  if(is_array(imbedCoords))
  {
    if(!place_meeting(imbedCoords[0], imbedCoords[1], Solid_obj))
    {
      x = imbedCoords[0];
      y = imbedCoords[1];
    }
    else if(angleBefore != m_spear.image_angle)
    {
      PlayerSpear_SetAngle_scr(m_spear, angleBefore); 
    }
    m_velocityH = 0;
    m_velocityV = 0;
  }
  
  if(!m_isAttacking && !m_movementGroundActivelyMoving && Movable_IsGrounded_scr(id))
  {
    var spearFacing = angle_get_horizontal_direction(m_spear.image_angle);
    if(m_facing != spearFacing && spearFacing != 0)
    {
      sprite_index = Player_Ground_Stationary_Idling_LookingBack_spr;
    }
    else
    {
      sprite_index = Player_spr;
    }
  }
}
#endregion

#region Previous Frame Variables
m_playerBoostPreviousFrame = false;
m_playerBoostPreviousFrame = isPlayerBoosting;
#endregion

