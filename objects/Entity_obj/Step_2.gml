/// @description Add to previous lists
ds_list_insert(m_xPreviousList, 0, x);
ds_list_insert(m_yPreviousList, 0, y);

if(ds_list_size(m_xPreviousList) > m_maximumPreviousTracked)
{
  ds_list_delete(m_xPreviousList, m_maximumPreviousTracked);
}

if(ds_list_size(m_yPreviousList) > m_maximumPreviousTracked)
{
  ds_list_delete(m_yPreviousList, m_maximumPreviousTracked);
}

///Monitor for animation events
//Check to see if the image index has changed (this doesn't need to run unless
//the image index or the sprite index has iterated)
if(sprite_index == Player_Ground_Stationary_Attacking_spr)
{
  var test = "test";
}
var effectiveIndex = floor(image_index);
var maxIndex = sprite_get_number(sprite_index);
if(effectiveIndex > maxIndex - 1)
{
  effectiveIndex = maxIndex
}

var isNewSpriteIndex = sprite_index != m_lastSpriteIndex;
if(isNewSpriteIndex)
{
  //Reset the last sprite index snince the sprite has changed
  m_lastImageIndex = effectiveIndex;
}

if(effectiveIndex != m_lastImageIndex || isNewSpriteIndex)
{ 
  if(!is_undefined(m_animationEventsMap))
  {
    if(ds_map_size(m_animationEventsMap) > 0)
    {
      if(ds_map_exists(m_animationEventsMap, sprite_index))
      {
        var indexMap = m_animationEventsMap[? sprite_index];
        //Build up imageIndexList
        var imageIndexList = ds_list_create();
        var diff = effectiveIndex - m_lastImageIndex;
        if(abs(diff) > 1)
        {
          var addVal = sign(image_speed);
          var value = m_lastImageIndex
          do
          {
            ds_list_add(imageIndexList, value);
            value += addVal;
            if(value < 0)
            {
              //Go back to the sprite max
              value = sprite_get_number(sprite_index) - 1;
            }
            else if(value >= sprite_get_number(sprite_index))
            {
              //Go back down to zero
              value = 0;
            } 
          }until(value == effectiveIndex) 
        }
        else
        {
          //We only shifted by one, just add the effective image index
          ds_list_add(imageIndexList, effectiveIndex);
        }
        
        var thisIndex;
        for(var n = 0; n < ds_list_size(imageIndexList); n++)
        { 
          thisIndex = imageIndexList[| n];
          if(ds_map_exists(indexMap, thisIndex))
          {           
            //Execute every image index event we moved through
            var eventList;
            
            eventList = indexMap[? thisIndex];
            //Execute each event for the sprite/image index combination
            for(var i = 0; i < ds_list_size(eventList); i++)
            {
              var eventMap = eventList[|i];
              script_execute(eventMap[? EventMembers.Script], 
                eventMap[? EventMembers.Args]);
            }            
          }
        }
        //Destroy the list to conserve resources
        ds_list_destroy(imageIndexList);
      }
    }
  }
  
  m_lastImageIndex = floor(image_index);
  m_lastSpriteIndex = sprite_index;
}

