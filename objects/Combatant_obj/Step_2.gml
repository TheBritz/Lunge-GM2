/// @description Ancestor Events
event_inherited();

///State Machine

switch(m_combatantState)
{
  case CombatantStates.Ground:
    Combatant_StateGround_scr();
    break;
  case CombatantStates.JumpCrouch:
    Combatant_CollisionSolidGround_scr();
    break;
  case CombatantStates.GroundAttack:
    Combatant_StateGroundAttack_scr();
    break;
  case CombatantStates.Air:
    Combatant_StateAir_scr();
    break;
  case CombatantStates.FastFall:
    Combatant_StateAir_scr();
    Movable_ChangeVSpeed_scr(m_movementAirFastFallSpeed);
    break;
}

///Position Audio Emitters
for(var i = 0; i < ds_list_size(m_audioEmitterList); i++)
{
  var emitter = m_audioEmitterList[| i];
  audio_emitter_position(emitter, x, y, 0);
}

///Position hitboxes and perform collision checks
for(var i = 0; i < ds_list_size(m_hitboxesAttack); i++)
{
  var hitbox = m_hitboxesAttack[| i];
  if(instance_exists(hitbox))
  {
    var coords = Hitbox_GetRelativeCoords_scr(hitbox);
    hitbox.image_xscale = image_xscale;
    hitbox.x = x + coords[0] * m_facing;
    hitbox.y = y + coords[1];
    
    var damage = Combatant_GetAttackDamage_scr(other.sprite_index);
    if(is_undefined(damage))
    {
      damage = 0;
    }
    
    var kbArr = Combatant_GetAttackKnockback_scr(other.sprite_index);
    if(!is_array(kbArr))
    {
      kbArr = array(0, 0); 
    }
    
    with(hitbox)
    {
      var hitList = global.ReusableHitList;
      ds_list_clear(hitList);
      var hitCount = 
        instance_place_list(x, y, other.m_combatantAttackableType, hitList, false);
      for(var ii = 0; ii < hitCount; ii++)
      {
        var hit = hitList[| ii];
        if(Hitbox_CanHit_scr(hitbox, hit))
        {
          Hitbox_ExclusionListAdd_scr(hitbox, hit);
          var kbDirX = sign(hit.x - x);
          Combatant_GetHit_scr(hit, damage, kbArr[0] * other.m_facing, -kbArr[1]);
        }
      }
    }
  }
  else
  {
    ds_list_delete(m_hitboxesAttack, i);
    i--;
  }
}

///Engine
var grav = m_movementAirGravity;
if(is_undefined(grav))
{
  grav = global.Gravity;
}

var state = Combatant_GetState_scr(id);
if((state == CombatantStates.Ground || 
   state == CombatantStates.GroundAttack) && 
   !is_undefined(m_movementGroundGravityMod))
{
  grav *= m_movementGroundGravityMod;
}
else
{
  var test = "test";
}

if(object_index == EnemyTestTarget_obj)
{
  var t = "t";
}

Combatant_ApplyGravity_scr(grav);