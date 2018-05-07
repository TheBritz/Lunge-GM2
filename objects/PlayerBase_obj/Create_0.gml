/// @description PlayerBase_obj Init
event_inherited();

enum PlayerBaseAlarms
{
  ResetIsLunging = 3,
  ResetCanLunge = 4
}

m_slopeStickFactor = .5;
m_movementAirGravity = .6;
m_movementGroundGravityMod = 4;

//Spear
m_spear = noone;
m_spearChargeAmount = 2.5;
m_spearCanDetonate = true;
m_spearLungeDist = 30;
m_spearLungeAdjust = 0;
m_spearLungeAngle = undefined;
m_spearHoldX = 0;
m_spearHoldY = 0;
m_spearIsLunging = false;
m_spearLungeTime = 8;
m_spearLungeDelay = 12;
m_spearCanLunge = true;
m_spearHoldAngleIncrement = 22.5;
m_spearDetonationSpeed = 12;

m_playerIndex = undefined;

//Unique Player States
enum PlayerStates
{
  WallLatch,
  WallSlide,
  None
}

enum PlayerAlarms
{
  WallLatchToSlide = 0,
  JumpLag = 2
}

m_combatantHp = 3;

//Sprites
//m_combatantSpriteRun = PlayerRun_spr
//m_combatantSpriteJump = PlayerJump_spr
m_combatantSpriteIdle = Player_spr;
m_combatantSpriteFall = PlayerFall_spr;
m_combatantSpriteRun = PlayerRun_spr;
m_playerSpriteWallCling = PlayerWallCling_spr;
m_combatantSpriteGroundAttack = PlayerAttackGroundDash_spr;
m_combatantSpriteJumpCrouch = PlayerJumpCrouch_spr;
m_combatantImageSpeedGroundAttack = 18/room_speed;
m_combatantSpriteDirectionChange = PlayerRunDirectionChange_spr;

m_combatantState = CombatantStates.Ground;

//Combatant Movement

m_movementAirFallMaxSpeedHor = 7.5;
m_movementGroundAccelHor = 1;
m_movementAirFallAccelHor = .25;
m_movementGroundFriction = .5;
m_movementGroundMaxSpeed = 6;
m_movementGroundJumpSpeed = 13.5;
m_movementAirFallMaxSpeedVert = 10;
m_movementAirFastFallSpeed = m_movementAirFallMaxSpeedVert * 1.3;


m_playerState = PlayerStates.None;
m_analogStickUsed = false;

//Player-specific movment
m_playerMovementWallLatchTime = .2*room_speed;
m_playerMovementWallSlideGravity = .07;
m_playerMovementWallSlideMaxSpeed = 5;
m_playerMovementJumpGrav = global.Gravity * .7;
m_playerMovementModifyGrav = false;
m_movementJumpLag = room_speed/10;
m_playerMovementJumpShortSpeed = m_movementGroundJumpSpeed * .75; 
m_playerWallLatchJumpSpeed = 10;
m_playerWallSlideJumpSpeed = 8.5;
m_playerWallJumpLateralSpeedRatio = .7;
m_playerWallLatchSpeedThresh = 4;
m_playerWallSlideSpeedThresh = 1.5;
m_playerWallDetonateSpeed = 14;

//Audio
//m_audioRun = Run_snd;
m_audioJump = PlayerJump_snd;
//m_audioGroundAttack = array();
//Register run step sounds with specific frames of the run animation
Entity_RegisterAnimationEvent_scr(id, PlayerRun_spr, 
  1, PlayerBase_PlayRunStepSound_scr, id);
Entity_RegisterAnimationEvent_scr(id, PlayerRun_spr, 
  5, PlayerBase_PlayRunStepSound_scr, id);  
  
Entity_RegisterAnimationEvent_scr(id, PlayerRun_spr, 
  1, PlayerBase_ThrowMovmentDust_scr, id);
Entity_RegisterAnimationEvent_scr(id, PlayerRun_spr, 
  3, PlayerBase_ThrowMovmentDust_scr, id);
  Entity_RegisterAnimationEvent_scr(id, PlayerRun_spr, 
  5, PlayerBase_ThrowMovmentDust_scr, id);
Entity_RegisterAnimationEvent_scr(id, PlayerRun_spr, 
  7, PlayerBase_ThrowMovmentDust_scr, id);  
  
  
//Register hitboxes with 
Entity_RegisterAnimationEvent_scr(id, PlayerAttackGroundDash_spr, 
  4, Combatant_AddHitboxAttack_scr, array(HitboxPlayerSlash_spr, 73, 0, 4));
Combatant_SetAttackDamage_scr(PlayerAttackGroundDash_spr, 5);
Combatant_SetAttackKnockback_scr(PlayerAttackGroundDash_spr, 5, 5);



