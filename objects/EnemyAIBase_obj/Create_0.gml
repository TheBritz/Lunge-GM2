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
  //Reacting to an incoming attack
  ReactingToAttack,
  //Fleeing
  Fleeing
}

//Extensions
m_behaviorExtensions = undefined;

//aiBehaviors map stores behaviors (scripts) for each state they support
m_aiState = EnemyAIStates.Idling;
//Used to detect state change
m_aiStatePreviousFrame = m_aiState;
m_aiBehaviors = ds_map_create();
m_aiStateFrames = 0;

m_aiBehaviors[? EnemyAIStates.Idling] = EnemyAIBase_BehaviorIdling_scr;
m_aiBehaviors[? EnemyAIStates.PursuingAntagonist] = EnemyAIBase_BehaviorPursuing_scr;

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



