/// @description EnemyAIBase_SetIdlingExtensionScript_scr(enemyAIBase, behaviorState [EnemyAIStates enum], extScript)
/// @param enemyAIBase
/// @param  behaviorState [EnemyAIStates enum]
/// @param  extScript

var enemy = argument0;
var behaviorState = argument1;
var extScript = argument2;

enemy.m_behaviorExtensions[? behaviorState] = extScript;


