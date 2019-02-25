/// @description PlayerBase_PlayRunStepSound_scr()
var player = argument0;
var runSound = choose(RunStep1_snd, RunStep2_snd, RunStep3_snd);
Combatant_PlaySoundOn_scr(player, runSound, AudioEmitterTypes.Movement, false, 1);

trace("Frame " + string(m_frameNumber) + ": PlayerBase_playRunStepSound_scr");
