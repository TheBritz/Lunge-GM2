/// @param grindLineNode
/// @param grindDirection

var grindLineNode = argument[0];

var grindDir = 1;
if(argument_count > 1)
{
  grindDir = argument[1];
}

with(grindLineNode)
{
  if(grindDir == 1)
  {
    return m_nextNode;
  }
  else if(grindDir == -1)
  {
    return m_previousNode;
  }
}

return noone;