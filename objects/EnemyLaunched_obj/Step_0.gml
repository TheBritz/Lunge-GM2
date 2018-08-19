/// @description Wall collision stick to wall
// You can write your code in this editor

if(m_impactVelH != 0)
{ 
  if(!is_undefined(m_enemySpriteStuckToWallSevered) && !PlayerBase_WallSlideCheckForWall_scr(undefined, undefined, 30))
  {
    sprite_index = m_enemySpriteStuckToWallSevered;
    image_xscale = sign(m_impactVelH);
    if(!is_undefined(m_enemySpriteSeveredLegs))
    {
      with(instance_create(x, y + 6, EnemyLaunched_obj))
      {
        sprite_index = other.m_enemySpriteSeveredLegs;
        m_velocityH = other.m_impactVelH * .75;
        m_velocityV = other.m_velocityV;
        image_xscale = other.image_xscale;
      }
    }
    m_velocityH = 0;
    m_velocityV = 0;
    m_movementAirGravity = 0;
    image_angle = 0;
    image_yscale = 1; 
  }
  else if(!is_undefined(m_enemySpriteStuckToWall))
  {
    m_velocityH = 0;
    m_velocityV = 0;
    m_movementAirGravity = 0;
    image_angle = 0;
    image_yscale = 1;
    image_xscale = sign(m_impactVelH);
    sprite_index = m_enemySpriteStuckToWall;
  }
}

event_inherited();



