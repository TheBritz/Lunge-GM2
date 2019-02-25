/// @description EnemyAI_BehaviorTemplate_scr(getAttributes, framesActive or attributeReturnMap)
/// @param getAttributes
/// @param  framesActive or attributeReturnMap

enum BehaviorAttributes
{
  Suppresses,           //The behavior(s) that will not run while this behavior is active.
  SuppressedBy,         //The behavior(s) that will prevent this behavior from running while they're active. 
  Eliminates,           //The behavior(s) that will be removed when this behavior is activated.
  EliminatedBy,         //This behavior(s) that will will remove this behavior while they're active.
  AlwaysIncrementFrames //When true, this behavior's framesActive value will always be incremented, even when inactive.
}

var getAttributes = argument0;

if(getAttributes)
{
  //Return this behavior's attributes
  var attributeMap = argument1;
}
else
{
  //Run behavior
  var framesActive = argument1;
}
