m_audioEmitterList = ds_list_create();
m_audioEmitterMap = ds_map_create();
m_audioEmitterMovement = Combatant_CreateAudioEmitter_scr(AudioEmitterTypes.Movement);
m_audioEmitterAttack = Combatant_CreateAudioEmitter_scr(AudioEmitterTypes.Attack);

