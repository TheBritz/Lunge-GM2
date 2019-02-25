/// @description EnemyAI_AddTrigger_scr(evalScript, triggerType, possibleBehaviorNumber, nullWeight, behaviorOption1, weight1, behaviorOption2, weight2, ...)
/// @param evalScript
/// @param  triggerType
/// @param  possibleBehaviorNumber
/// @param  nullWeight
/// @param  behaviorOption1
/// @param  weight1
/// @param  behaviorOption2
/// @param  weight2
/// @param  ...

var evalScript = argument0;

//  TriggerType Effects:
//  >ChanceOrdered
//    Uses weight as a <weight> in 100 chance for the behavior option running.
//    Chance calculations are performed in order as they are passed in meaning
//    First behavior options have priority. May result in no behavior.
//  
//  >ChanceRandom
//    Same as above except chance calculations are performed randomly so no 
//    option has more priority than the others.
//
//  >ChoiceWeighted
//    Chooses options based on the weight values given. Higher weights are more
//    likely to be chosen. If the nullWeight parameter is greater than 0, this 
//    may result in no behavior selection.
var triggerType = argument1; 

//The number of behaviors that are allowed to be added by this trigger 
//(typically 1)
