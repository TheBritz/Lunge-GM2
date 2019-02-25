/// @description Combatant_CreateAutioEmitter_scr(audioEmitterType)
/// @param audioEmitterType
var emitterType = argument0;
var emitter = audio_emitter_create();
ds_list_add(m_audioEmitterList, emitter);
m_audioEmitterMap[? emitterType] = emitter;
return emitter;
