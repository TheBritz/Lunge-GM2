/// @description EnemyBasher_BehaviorEngaging_scr()

var frames = EnemyAIBase_GetCurrentStateFrames_scr(id);

var choice = choose_weighted
  (undefined, 90, EnemyBasher_BehaviorLungeAttack_scr, 3);
