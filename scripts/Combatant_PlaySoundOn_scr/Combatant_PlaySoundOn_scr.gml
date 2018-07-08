/// @description Combatant_PlaySoundOn_scr(combatant, soundID, emitterType, isLooping, priority, index [optional])
/// @param combatant
/// @param  soundID
/// @param  emitterType
/// @param  isLooping
/// @param  priority
/// @param  index[optional]
var combatant = argument[0];
var sndID = argument[1];
var emitterType = argument[2];
var isLooping = argument[3];
var priority = argument[4];
var index;

with(combatant)
{
  if(!is_undefined(sndID))
  {
    if(is_array(sndID))
    {
      var sndArr = sndID;
      sndID = undefined;
      if(argument_count > 5)
      {
        index = argument[5];
        if(index > 0 && index < array_length_1d(sndArr))
        {
          sndID = sndArr[index];
        }
      }
      if(is_undefined(sndID))
      {
        //No acceptable index was provided, use a random one
        sndID = sndArr[irandom(array_length_1d(sndArr) - 1)];
      }
    }
  }
  var emitter = m_audioEmitterMap[? emitterType];
  if(!is_undefined(emitter))
  {
    return audio_play_sound_on(emitter, sndID, isLooping, priority);
  }
}
