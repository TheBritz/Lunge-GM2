if(audio_exists(m_audioRunInstance))
{
	audio_stop_sound(m_audioRunInstance);
}
var jumpState = InputManager_GetButtonControlState_scr(ButtonControls.Jump);
if(jumpState == ButtonStates.Pressed)
{
	Movable_ChangeVSpeed_scr(-m_movementGroundJumpSpeed);
}
else
{
	Movable_ChangeVSpeed_scr(-m_playerMovementJumpShortSpeed);
}
m_combatantState = CombatantStates.Air;
Combatant_PlaySoundOn_scr(id, m_audioJump, AudioEmitterTypes.Movement, false, 1);

