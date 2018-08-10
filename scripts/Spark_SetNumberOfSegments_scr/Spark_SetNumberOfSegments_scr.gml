/// @param sparkInstance
/// @param numberOfSegments

var sparkInstance = argument0;
var numberOfSegments = argument1;

with(sparkInstance)
{
  //Set the entity track positions value
  Entity_SetMaximumPreviousTracked_scr(id, numberOfSegments);
}