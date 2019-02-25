/// @description Get shaft instance
m_shaft = instance_place(x, y, ElevatorShaft_obj);
//depth = m_shaft - 2;
m_yBottom = m_shaft.y + m_shaft.image_yscale * 
  sprite_get_height(m_shaft.sprite_index) - sprite_get_yoffset(sprite_index);

///Spawn player
if(y < 0)
{
  //This is the starting elevator, spawn the player
  m_player = instance_create(x, y, Player1_obj);
  m_player.m_combatantState = CombatantStates.None;
  m_player.m_playerState = PlayerStates.None;
  m_player.depth = depth + 1;
  
  //Play the descend audio
  audio_play_sound_on(m_audioEmitter, Descend_snd, false, 1);
}

