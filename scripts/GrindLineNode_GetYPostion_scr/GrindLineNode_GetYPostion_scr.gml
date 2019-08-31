/// @param grindLineNode
/// @param x

var grindLineNode = argument0;
var X = argument1;

with(grindLineNode)
{
  if(instance_exists(m_nextNode))
  {
    var h = m_nextNode.y - y;
    var w = m_nextNode.x - x;
    
    var slope = h/w;
    
    var interiorX = X - x;
    
    var Y = interiorX * slope + y;
    
    return Y;
  }
}