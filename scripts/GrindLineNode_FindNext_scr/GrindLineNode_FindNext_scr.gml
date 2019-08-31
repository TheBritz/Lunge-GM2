//GrindLineNode object name will contain group name and place number
var name = object_get_name(object_index);

var nameArr = split(name, "_");
var base = nameArr[0];
var group = nameArr[1];
var place = real(nameArr[2]);
var suffix = nameArr[3];

var placeStr = string(++place);

var nameOfNext = base + "_" + group + "_" + placeStr + "_" + suffix;

var index = asset_get_index(nameOfNext);

if(index != -1)
{
	var closestNextNode = instance_nearest(x, y, index);
	m_nextNode = closestNextNode;
  m_nextNode.m_previousNode = id;
}



