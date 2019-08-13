var stopMotion;
if(!is_undefined(m_collisionStepExtensions))
{
	var extCount = ds_list_size(m_collisionStepExtensions);
	for(var i = 0; i < extCount; i++)
	{
		var ext = m_collisionStepExtensions[|i];
		var retVal = script_execute(ext);
		
		if(retVal)
		{
			stopMotion = true;
		}
	}
}