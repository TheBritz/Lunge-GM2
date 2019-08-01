
if(is_undefined(m_collisionStepExtensions))
{
	m_collisionStepExtensions = ds_list_create();
}

var extScript = argument0;

ds_list_add(m_collisionStepExtensions, extScript);