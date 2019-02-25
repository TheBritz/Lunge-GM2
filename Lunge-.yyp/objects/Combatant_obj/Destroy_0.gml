//Free audio emitters
for(var i = 0; i < ds_list_size(m_audioEmitterList); i++)
{
  var emitter = m_audioEmitterList[| i];
  audio_emitter_free(emitter);
}

ds_list_destroy(m_audioEmitterList);

