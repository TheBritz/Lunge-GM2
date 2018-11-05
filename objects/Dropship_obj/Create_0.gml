/// @description EnemyEnforcer init
event_inherited();

//Movable
m_isSolidObservant = false;

//Dropship members
m_deploying = false;
m_passengers = ds_list_create();

//for test
ds_list_add(m_passengers, EnemyEnforcer_obj, EnemyEnforcer_obj, EnemyEnforcer_obj, EnemyEnforcer_obj);

mask_index = Dropship_spr;

//AI members
m_aiAttackDistance = 42;
m_aiEngageDistance = 200;

//Combatant members
m_combatantHp = 2;
m_combatantSpriteIdle = Dropship_spr;
m_combatantSpriteRun = Dropship_spr;
m_combatantSpriteEngage = Dropship_spr;
m_combatantState = CombatantStates.Ground;
m_movementGroundMaxSpeed = 5;
m_movementGroundAccelHor = .05;
m_movementGroundFriction = .05;
m_movementAirFallMaxSpeedHor = 4.5;
m_movementSuppressGravity = true;

EnemyAIBase_SetBehaviorExtensionScript_scr(id, EnemyAIStates.EngagingAntagonist, Dropship_BehaviorEngaging_scr);

