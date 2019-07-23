/// @description PlayerBase_obj Init
event_inherited();

//Initialize as an engageable target
EngagementController_InitializeTarget_scr(id);

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
m_spearChargeAmount = 15;
m_spearChargeGroundedMult = 10;
m_spearCanDetonate = true;
m_spearCanDetonateSecondary = true;
m_spearLungeDist = 30;
m_spearLungeAdjust = 0;
m_spearLungeAngle = undefined;
m_spearHoldX = 0;
m_spearHoldY = 0;
m_spearIsLunging = false;
m_isAttacking = false;
m_spearLungeTime = 8;
m_spearLungeDelay = 12;
m_spearCanLunge = true;
m_spearHoldAngleIncrement = 22.5;
m_spearDetonationSpeed = 12;
m_spearDetonationSpeedSecondary = 8;
m_spearDetonationIsCruising = false;
m_spearDetonationCruiseTime = .2;
m_spearDetonationSecondaryAvailable = true;

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
m_combatantSpriteSlide = Player_Ground_Sliding_spr;
m_playerSpriteWallCling = PlayerWallCling_spr;
m_combatantSpriteGroundAttack = Player_Ground_Stationary_Attacking_spr;
m_combatantSpriteAirAttack = Player_Air_Attacking_spr;

enum AttackDirection
{
	Forward,
	Behind,
	Up,
	Down
}

//Air attacks
m_playerSpriteDirectionalAirAttacksAlt = PlayerBase_BuildDirectionalAttackMap_scr(Player_Air_Attacking_spr, 1, "_spr");

var size = ds_map_size(m_playerSpriteDirectionalAirAttacksAlt);
var key = ds_map_find_first(m_playerSpriteDirectionalAirAttacksAlt);
var spr = m_playerSpriteDirectionalAirAttacksAlt[? key];
for(var i = 0; i < size; i++)
{
	var spriteName = sprite_get_name(spr);
	Entity_RegisterAnimationEvent_scr
	  (id, spr, 0, PlayerBase_Ground_Stationary_Attack_scr, undefined);
  Entity_RegisterAnimationEvent_scr
	  (id, spr, -1, PlayerBase_ResetSpearLunging_scr, undefined);
	key = ds_map_find_next(m_playerSpriteDirectionalAirAttacksAlt, key);
	spr = m_playerSpriteDirectionalAirAttacksAlt[? key];
}

//Ground attacks
m_playerSpriteDirectionalGroundAttacksAlt = PlayerBase_BuildDirectionalAttackMap_scr(Player_Ground_Stationary_Attacking_spr, 1, "_spr");

var size = ds_map_size(m_playerSpriteDirectionalGroundAttacksAlt);
var key = ds_map_find_first(m_playerSpriteDirectionalGroundAttacksAlt);
var spr = m_playerSpriteDirectionalGroundAttacksAlt[? key];
for(var i = 0; i < size; i++)
{
	var spriteName = sprite_get_name(spr);
	Entity_RegisterAnimationEvent_scr
	  (id, spr, 0, PlayerBase_Ground_Stationary_Attack_scr, undefined);
  Entity_RegisterAnimationEvent_scr
	  (id, spr, -1, PlayerBase_ResetSpearLunging_scr, undefined);
	key = ds_map_find_next(m_playerSpriteDirectionalGroundAttacksAlt, key);
	spr = m_playerSpriteDirectionalGroundAttacksAlt[? key];
}

m_playerSpriteDirectionalGroundAttacks = ds_map_create();
m_playerSpriteDirectionalGroundAttacks[? AttackDirection.Forward] = Player_Ground_Stationary_Attacking_spr;
m_playerSpriteDirectionalGroundAttacks[? AttackDirection.Behind] = Player_Ground_Stationary_Attacking_Behind_spr;
m_combatantImageSpeedGroundAttack = .5;
m_combatantSpriteJumpCrouch = PlayerJumpCrouch_spr;
m_combatantSpriteDirectionChange = PlayerRunDirectionChange_spr;
m_combatantSpriteOverspeed = PlayerRunOverspeed_spr;
//m_combatantSpriteOverspeed = Player_Ground_Sliding_spr;
m_combatantSpriteOverspeedStandard = m_combatantSpriteOverspeed;

m_playerSpriteOverspeedSlide = Player_Ground_Sliding_spr;
m_movementGroundOverspeedCorrectionHorSlide = .3;
m_movementGroundSlideSpeedMult = 1.33;
m_movementGroundSlideBufferTime = .2;
m_movementGroundSlideIsBuffered = false;
m_movementGroundSlideLandingSpeedBoost = 4;

m_combatantState = CombatantStates.Ground;

//Combatant Movement

m_movementAirFallMaxSpeedHor = 7.5;
m_movementGroundAccelHor = 1;
m_movementGroundOverspeedCorrectionHor = .5;
m_movementGroundOverspeedCorrectionHorStandard = .5;
m_movementAirFallAccelHor = .25;
m_movementGroundFriction = .5;
m_movementGroundMaxSpeed = 6;
m_movementGroundJumpSpeed = 13.5;
m_movementAirFallMaxSpeedVert = 12;
m_movementAirFastFallSpeed = m_movementAirFallMaxSpeedVert * 1.3;
m_movementAirGravityFloatMult = .7;
m_movementAirGravityFallMult = 1.25;
m_movementAirGravityMult = 1;
m_movementAirIsJumping = false;

m_combatantDashAttackSpeedThreshold = .6;


m_playerState = PlayerStates.None;
m_analogStickUsed = false;

//Player-specific movment
m_playerMovementWallLatchTime = .2 * room_speed;
m_playerMovementWallSlideGravity = .07;
m_playerMovementWallSlideMaxSpeed = 5;
m_playerMovementJumpGrav = global.Gravity * .7;
m_playerMovementModifyGrav = false;
m_movementJumpLag = .05;
m_playerMovementJumpShortSpeed = m_movementGroundJumpSpeed * .75; 
m_playerWallLatchJumpSpeed = 10;
m_playerWallSlideJumpSpeed = 8.5;
m_playerWallJumpLateralSpeedRatio = .7;
m_playerWallLatchSpeedThresh = 4;
m_playerWallSlideSpeedThresh = 1.5;
m_playerWallDetonateSpeed = 14;

m_playerWallRunStartSpeedThresh = 12;
m_playerWallRunStopSpeedThresh = 1.5;
m_playerWallRunGravityMultiplierActive = .45;
m_playerWallRunGravityMultiplierInactive = .7;
m_playerWallRunSprite = PlayerWallRun_spr;
m_playerIsWallRunning = false;

m_playerBoostPreviousFrame = false;

//Audio
//m_audioRun = Run_snd;
m_audioJump = PlayerJump_snd;
//m_audioGroundAttack = array();
//Register run step sounds with specific frames of the run animation
Entity_RegisterAnimationEvent_scr(id, PlayerRun_spr, 
  11, PlayerBase_PlayRunStepSound_scr, id);
Entity_RegisterAnimationEvent_scr(id, PlayerRun_spr, 
  5, PlayerBase_PlayRunStepSound_scr, id);  
  
Entity_RegisterAnimationEvent_scr(id, PlayerRun_spr, 
  1, PlayerBase_ThrowMovmentDust_scr, id);
Entity_RegisterAnimationEvent_scr(id, PlayerRun_spr, 
  7, PlayerBase_ThrowMovmentDust_scr, id);

//Neutral Ground Attack animation event
//Entity_RegisterAnimationEvent_scr(id, Player_Ground_Stationary_Attacking_spr,
//  1, PlayerBase_Ground_Stationary_Attack_scr, undefined);
Entity_RegisterAnimationEvent_scr(id, Player_Ground_Stationary_Attacking_Behind_spr,
  1, PlayerBase_Ground_Stationary_Attack_scr, undefined);
  
  
//Register hitboxes with 
Entity_RegisterAnimationEvent_scr(id, PlayerAttackGroundDash_spr, 
  4, Combatant_AddHitboxAttack_scr, array(HitboxPlayerSlash_spr, 73, 0, 4));
Combatant_SetAttackDamage_scr(PlayerAttackGroundDash_spr, 5);
Combatant_SetAttackKnockback_scr(PlayerAttackGroundDash_spr, 5, 5);



