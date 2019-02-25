 /// @param enemyInstance
/// @param targetInstance

var enemy = argument[0];
var target = argument[1];

var enemySpeed = Movable_GetHSpeed_scr(target);
//var targetHeight = target.y - m_combatLeapAttackMinimumtPeakHeightAboveTarget;

var dist = target.x - enemy.x;
dist -= 8 * sign(dist);
var jumpSpeed = undefined;
var leapAttackSpeed = undefined;
var targetSpeed = Movable_GetHSpeed_scr(target);
if(sign(targetSpeed) == 0 || sign(targetSpeed) != sign(dist))
{
  leapAttackSpeed = EnemyAIBase_GetLeapAttackSpeedOncoming_scr(enemy);
  var effectiveSpeed = leapAttackSpeed + targetSpeed;
  var travelTime = dist/effectiveSpeed;
  var grav = Combatant_GetEffectiveGravity_scr(enemy);
  jumpSpeed = jump_get_jump_speed_for_hangtime(travelTime, grav);
}
else
{
  //target is moving away, must assess whether to perform leap attack based on
  //how fast the target is moving away (must be going slow enough)
}

if(!is_undefined(jumpSpeed) && !is_undefined(leapAttackSpeed))
{
  Combatant_Jump_scr(undefined, jumpSpeed);
  with(enemy)
  {
    var spriteName = sprite_get_name(m_enemySpriteLeapAttack);
    sprite_index = m_enemySpriteLeapAttack;
    Movable_ChangeHSpeed_scr(leapAttackSpeed * sign(dist));
    m_aiSubState = LeapAttackingSubState.Leaping;
  }
}