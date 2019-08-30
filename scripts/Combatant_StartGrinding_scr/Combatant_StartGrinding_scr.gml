var combatant = argument0;
var grindNode = argument1;

with(combatant)
{
	m_movementIsGrinding = true;
	m_movementAirGravity = 0;
  m_movementGrindingCurrentNode = grindNode;
  
  var grindDir = sign(grindNode.m_nextNode.x - grindNode.x);
  var moveDir = sign(Movable_GetHSpeed_scr(combatant));
  
  m_movementGrindingDir = (grindDir == moveDir);
}