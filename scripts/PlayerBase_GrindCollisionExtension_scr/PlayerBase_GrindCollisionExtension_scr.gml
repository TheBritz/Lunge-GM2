//Check if the grind button is being pressed
if(InputManager_IsButtonControlPressed_scr(ButtonControls.Grind))
{
  var node = GrindLineNode_CheckCollision_scr(id);
	
	if(instance_exists(node))
	{
		Combatant_StartGrinding_scr(combatant, node);
		return true;
	}
}

return false;