//Check if the grind button is being pressed
if(InputManager_IsButtonControlPressed_scr(ButtonControls.Grind))
{
  var collision = GrindLineNode_CheckCollision_scr(id);
	
	if(collision)
	{
		var test = "test";
	}
	
	return collision;
}

return false;