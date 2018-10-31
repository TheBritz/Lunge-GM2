/// @description EnemyEnforcer init
event_inherited();

mask_index = EnforcerBasic_Ground_Stationary_Idle_spr;

//Movable Members
m_slopeStickFactor = .7;

//AI members
m_aiAttackDistance = 42;
m_aiEngageDistance = 450;
m_aiAttackDelayRange = array(round(room_speed/3), round(room_speed*2));

//Combatant members
m_combatantHp = 2;
m_combatantSpriteIdle = EnforcerBasic_Ground_Stationary_Idle_spr;
m_combatantSpriteRun = EnforcerBasic_Ground_Moving_Run_spr;
m_combatantSpriteEngage = EnforcerBasic_Ground_Stationary_Combat_spr;
m_combatantSpriteGroundAttack = EnemyHollowGroundAttack_spr;
m_combatantImageSpeedGroundAttack = 12/room_speed;
m_combatantState = CombatantStates.Ground;
m_movementGroundMaxSpeed = 5;
m_movementAirFallMaxSpeedHor = 4.5;
m_movementGroundJumpSpeed = 7.5;

m_combatSprintAttackRange = array(m_aiEngageDistance + 5, m_aiEngageDistance + 30);
m_combatSprintAttackLikelihood = 100;

m_enemySpriteLeapAttack = EnforcerBasic_Air_LeapAttack_spr;
m_enemySpriteLeapAttackSlash = EnforcerBasic_Air_LeapAttackSlash_spr;


//Enemy members
m_enemySpriteLaunched = EnforcerBasic_Launched_Flying_spr;
m_enemySpriteImpaled = EnforcerBasic_Impaled_spr;
m_enemySpriteStuckToWall = EnforcerBasic_StuckToWall_spr;
m_enemySpriteStuckToWallSevered = EnforcerBasic_StuckToWall_Severed_spr;
m_enemySpriteSeveredLegs = EnforcerBasic_SeveredLegs_spr;

//Set knockback
Combatant_SetAttackKnockback_scr
  (EnemyHollowGroundAttack_spr, 5, 5);
  
//Combat AI members
m_combatLeapAttackSpeedOncomingModifier = 1.5;
m_combatLeapAttackRange = 350;
m_combatLeapAttackSlashRange = 120;
m_combatEngagingSpeedModifier = .8;
m_combatDashSpeedModifier = 1.25;


