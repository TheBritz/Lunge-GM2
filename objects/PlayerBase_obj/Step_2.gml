#region Inherited Events
/// @description Inherited Events
event_inherited();
#endregion

#region Position Spear
if(instance_exists(m_spear))
{
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
      if(abs(Movable_GetHSpeed_scr(id)) < (m_movementGroundMaxSpeed * 
        m_combatantDashAttackSpeedThreshold) && m_spearCanLunge)
      {
        Combatant_PlaySoundOn_scr(id, Stab_snd, AudioEmitterTypes.Attack, false, 1);
        sprite_index = m_combatantSpriteGroundAttack;
        image_speed = m_combatantImageSpeedGroundAttack;
        m_spearIsLunging = true;
        alarm[PlayerBaseAlarms.ResetIsLunging] = round(sprite_get_number(sprite_index) / image_speed);
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
  
  if(InputManager_GetButtonControlState_scr(ButtonControls.Detonate) == ButtonStates.JustPressed)
  {
    if(m_spearCanDetonate && instance_exists(PlayerSpear_Detonate_scr(m_spear)))
    {
      //Pull spear out of object
      m_spear.m_imbedPointX = undefined;
      m_spear.m_imbedPointY = undefined;  
    
      var angle = m_spear.image_angle + 180;
      if(angle >= 360) angle -= 360;
      
      var vertComponent = lengthdir_y(m_spearDetonationSpeed, angle);
      if(sign(vertComponent) != sign(Movable_GetVSpeed_scr(id)))
      {
        Movable_ChangeVSpeed_scr(vertComponent, 1000);
      }
      else
      {
        Movable_AddMotion_scr(id, 270, vertComponent);
      }
      
      var horComponent = lengthdir_x(m_spearDetonationSpeed, angle);
      if(sign(horComponent) != sign(Movable_GetHSpeed_scr(id)))
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
  
  if(!m_spearIsLunging && !m_movementGroundActivelyMoving)
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

