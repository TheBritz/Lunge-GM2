/// @description Entity_RegisterAnimationEvent_scr(entity, sprite, imageIndex, eventScript, eventArgs, eventID [optional], allowDuplicates [optional])
/// @param entity
/// @param  sprite
/// @param  imageIndex
/// @param  eventScript
/// @param  eventArgs
/// @param  eventID [optional]
/// @param  allowDuplicates [optional]

var entity = argument[0];
var sprite = argument[1];
var imageIndex = argument[2];
var eventScript = argument[3];
var eventArgs = argument[4];

var eventID = 0;
if(argument_count > 5)
{
  eventID = argument[5];    
}

var allowDuplicates = true;
if(argument_count > 6)
{
  allowDuplicates = argument[6];    
}

//Verify that this instance exists and is an entity object
if(instance_exists(entity) && object_is(entity.object_index, Entity_obj))
{
  with(entity)
  {
    if(is_undefined(m_animationEventsMap))
    {
      m_animationEventsMap = ds_map_create();
    }  
    
    //Check if the sprite map exists, otherwise create it
    var spriteMap;
    if(ds_map_exists(m_animationEventsMap, sprite))
    {
      spriteMap = m_animationEventsMap[? sprite];  
    }
    else
    {
      spriteMap = ds_map_create();
      m_animationEventsMap[? sprite] = spriteMap;
    }
    
    //Check if event list exists, otherwise create it
    var eventList;
    if(ds_map_exists(spriteMap, imageIndex))
    {
      eventList = spriteMap[? imageIndex];
    }
    else
    {
      eventList = ds_list_create();
      spriteMap[? imageIndex] = eventList;
    }
    
    if(!allowDuplicates)
    {
    }
    
    //Create an event map for this event and add it to the event list for this
    //image index.
    var eventMap = ds_map_create();
    eventMap[? EventMembers.Script] = eventScript;
    eventMap[? EventMembers.Args] = eventArgs;
    eventMap[? EventMembers.ID] = eventID; 
    ds_list_add(eventList, eventMap);
  }
} 
