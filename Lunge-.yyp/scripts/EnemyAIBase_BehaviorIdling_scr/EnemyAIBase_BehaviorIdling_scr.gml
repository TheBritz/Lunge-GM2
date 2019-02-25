/// @description EnemyAIBase_BehaviorIdling_scr(extesionScript)
/// @param extesionScript

var extScript = argument0;

if(!is_undefined(extScript))
{
  script_execute(extScript);
}

//Look for a friendly combatant to attack
EnemyAIBase_SupportingBehaviorLookForAntagonist_scr();

