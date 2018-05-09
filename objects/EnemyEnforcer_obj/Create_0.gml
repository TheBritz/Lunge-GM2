/// @description EnemyEnforcer init
event_inherited();

mask_index = EnforcerBasicIdle_spr;

//Movable Members
m_slopeStickFactor = .7;

//AI members
m_aiAttackDistance = 42;
m_aiEngageDistance = 120;

//Combatant members
m_combatantHp = 2;
m_combatantSpriteIdle = EnforcerBasicIdle_spr;
m_combatantSpriteRun = EnforcerBasicRun_spr;
m_combatantSpriteGroundAttack = EnemyHollowGroundAttack_spr;
m_combatantImageSpeedGroundAttack = 12/room_speed;
m_combatantState = CombatantStates.Ground;
m_movementGroundMaxSpeed = 5;
m_movementAirFallMaxSpeedHor = 4.5;
m_movementGroundJumpSpeed = 7.5;

m_combatSprintAttackRange = array(m_aiEngageDistance + 5, m_aiEngageDistance + 30);
m_combatSprintAttackLikelihood = 100;

//Set knockback
Combatant_SetAttackKnockback_scr
  (EnemyHollowGroundAttack_spr, 5, 5);

Entity_RegisterAnimationEvent_scr(id, EnemyHollowGroundAttack_spr, 
  7, Combatant_AddHitboxAttack_scr, array(HitboxHollowMaskSlash_spr, 0, 0, 2));

