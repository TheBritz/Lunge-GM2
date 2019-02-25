/// @description Init
event_inherited();

enum CombatantStates
{
  Ground,
  Air,
  FastFall,
  GroundAttack,
  AirAttack,
  Block,
  HitStun,
  JumpCrouch,
  None
}

enum CombatantAlarms
{
  GroundReset = 1,
  JumpLag = 2
}

//Sprites
m_combatantSpriteIdle = undefined;
m_combatantImageSpeedIdle = undefined;
m_combatantSpriteRun = undefined;
m_combatantImageSpeedRun = undefined;
m_combatantSpriteJump = undefined;
m_combatantSpriteFall = undefined;
m_combatantSpriteGroundAttack = undefined;
m_combatantImageSpeedGroundAttack = undefined;
m_combatantSpriteHitStun = undefined;
m_combatantImageSpeed = undefined;
m_combatantSpriteJumpCrouch = undefined;
m_combatantImageSpeedJumpCrouch = undefined;
m_combatantSpriteDirectionChange = undefined;
m_combatantImageSpeedDirectionChange = undefined;
m_combatantSpriteOverspeed = undefined;
m_combatantImageSpeedOverspeed = undefined;

//Movement
m_movementGroundMaxSpeed = undefined;
m_movementGroundAccelHor = undefined;
m_movementGroundFriction = undefined;
m_movementGroundJumpSpeed = undefined;
m_movementGroundShortHopSpeedMod = .75;
m_movementGroundActivelyMoving = undefined;
m_movementGroundGravityMod = undefined;
m_movementJumpLag = room_speed/15;
m_movementGroundOverspeedThreshold = 2;

//Combat
m_combatantDashAttackSpeedThreshold = 1;

//Air
m_movementAirFlyMaxSpeed = undefined;
m_movementAirFallMaxSpeedVert = undefined;
m_movementAirFallMaxSpeedHor = undefined;
m_movementAirFallAccelHor = undefined;
m_movementAirGravity = undefined;
m_movementSuppressGravity = undefined;
m_movementAirAccelHor = undefined;
m_movementAirMaxSpeedHor = undefined;
m_movementAirFastFallSpeed = undefined;

m_combatantState = undefined;
m_combatantHp = undefined;

//Audio
enum AudioEmitterTypes
{
  Movement,
  Attack,
  Damage
}

Combatant_AudioCreateEmitters_scr();
//Movement Sounds
m_audioRun = undefined;
m_audioRunInstance = noone;
m_audioJump = undefined;
m_audioJumpInstance = undefined;

//Attack Sounds
m_audioGroundAttack = undefined;
m_audioGroundAttackInstance = undefined;

//Combat Hitboxes
m_hitboxesAttack = ds_list_create();

//Attack Maps
m_combatantAttackDamageMap = ds_map_create();
m_combatantAttackKnockbackMap = ds_map_create();
m_combatantAttackableType = undefined;

//Events
m_eventGettingHit = undefined;


