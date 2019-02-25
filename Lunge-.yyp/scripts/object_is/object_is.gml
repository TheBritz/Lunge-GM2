/// @description object_is(object_index1, object_index2)
/// @param object_index1
/// @param  object_index2

//Returns true if objects are of the same type
//or if object_index2 is an ancestor of object_index1
var object_index1 = argument0;
var object_index2 = argument1;

return(object_index1 == object_index2 || object_is_ancestor(object_index1, object_index2));
