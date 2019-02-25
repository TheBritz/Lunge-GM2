/// @description Enemy Base Init
event_inherited();

enum EnemyAIStates
{
  //Sitting around, j-in' the d
  Idling,
  //Closing to a set distance with the target antagonist instance
  PursuingAntagonist,
  //Engaging the enemy, reacting to player with attacks and defensive moves
  EngagingAntagonist,
  //Attacking
  Attacking,
  //Performing a leaping attack
  LeapAttacking,
  //Reacting to an incoming attack
  ReactingToAttack,
  //Fleeing
  Fleeing
}

m_movementGroundAccelHor = .7;

//Extensions
m_behaviorExtensions = undefined;
m_behaviorTicker = 0;
m_behaviorTickrate = undefined;

//aiBehaviors map stores behaviors (scripts) for each state they support
m_aiState = EnemyAIStates.Idling;
m_aiSubState = undefined;
//Used to detect state change
m_aiStatePreviousFrame = m_aiState;
m_aiBehaviors = ds_map_create();
m_aiStateFrames = 0;

m_aiAttackDelayRange = undefined;
m_aiAttackDelayTimer = -1;
m_aiAttackCooldownTimer = -1;

m_aiBehaviors[? EnemyAIStates.Idling] = EnemyAIBase_BehaviorIdling_scr;
m_aiBehaviors[? EnemyAIStates.PursuingAntagonist] = EnemyAIBase_BehaviorPursuing_scr;
m_aiBehaviors[? EnemyAIStates.EngagingAntagonist] = EnemyAIBase_BehaviorEngaging_scr;
m_aiBehaviors[? EnemyAIStates.LeapAttacking] = EnemyAIBase_BehaviorLeapAttack_scr;
m_aiBehaviors[? EnemyAIStates.Attacking] = EnemyAIBase_BehaviorAttacking_scr;

//Triggers - these are eval scripts that run and when a set of conditions are
//satisfied, add one or more ai behaviors to the AI Behavior list
enum AiTriggers
{
  EvalScript,
  TriggerType,
  NumberOfPossibleBehaviors,
  NullWeight,
  BehaviorsAndWeights
}

enum AiTriggerType
{
  ChanceOrdered,
  ChanceRandom,
  ChoiceWeighted
}

m_aiTriggers = ds_list_create();


//Behaviors
enum Behaviors
{
  Script,
  FramesActive
}

//The antagonist type is the object type that will be perceived as the enemy
m_aiAntagonistType = Friendly_obj;
m_aiTarget = noone;
m_aiAttackDistance = 30;
m_aiEngageDistance = 120;
m_aiDisengageDistance = 200;
//Use this if you want to make the disengagement distance a proportion of the
//engagement distance (this value will be multiplied with the engage distance)
m_aiDisengageDistanceProportional = 1.5;


//Seed the antagonist scan alarm
m_aiAntagonistScanRate = round(room_speed/4);
alarm[11] = irandom(m_aiAntagonistScanRate) + 1;

//The distance at which an enemy can see an antagonist
m_aiSightMaxDist = 1000;

m_aiSightCone = array(70, -70);

//Whether or not this enemy can be skewered on the player's spear
m_skewerable = true;

//The range at which to start a leap attack
m_combatLeapAttackRange = undefined;
//The range at which to execute the slash of the leap attack
m_combatLeapAttackSlashRange = undefined;

m_combatLeapAttackMinimumtPeakHeightAboveTarget = undefined;
m_combatLeapAttackSpeedOncoming = undefined;
//A multiple of the max speed to use when leap attacking
m_combatLeapAttackSpeedOncomingModifier = undefined;
m_combatLeapAttackSpeedStationary = undefined;
//A multiple of the max speed to use when leap attacking
m_combatLeapAttackSpeedStationaryModifier = undefined;
//A multiple of the max speed to use when dashing
m_combatDashSpeedModifier = 1;
m_combatEngagingSpeedModifier = .75;


//Member variable assigned by the Engagement Controller 
m_engagementPosition = undefined;
m_engagementPositionVariance = 15;
m_engagementInPosition = false;



