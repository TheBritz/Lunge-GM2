/// @description EnemyAIBase_SetIdlingExtensionScript_scr(enemyAIBase, behaviorState [EnemyAIStates enum], extScript)
/// @param enemyAIBase
/// @param behaviorState [enum:EnemyAIStates]
/// @param extScript

var enemy = argument0;
var behaviorState = argument1;
var extScript = argument2;

var behaviorExtentions = EnemyAIBase_GetExtensionMap_scr(enemy);
behaviorExtentions[? behaviorState] = extScript;


