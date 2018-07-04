/// @param aiInstance

var ai = argument0;

var engagerList = EnemyAIBase_GetEngagerList_scr(m_aiTarget);
var listSize = ds_list_size(engagerList);
for(var i = 0; i < listSize; i++)
{
  if(ai == engagerList[|i])
  {
    return i;
  }
}

return -1;


