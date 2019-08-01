/// @description Insert description here
// You can write your code in this editor

m_maxNodeWidth = undefined;
m_maxNodeHeight = undefined;

m_nextNode = noone;
m_previousNode = noone;

m_lineColor = c_red;

m_nodeList = ds_list_create();

if(!sprite_exists(sprite_index))
{
	sprite_index = GrindLineNode_spr;
}
