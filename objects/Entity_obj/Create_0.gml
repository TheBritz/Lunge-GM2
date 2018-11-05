/// @description Entity Init
m_facing = 1;
m_xPreviousList = ds_list_create();
m_yPreviousList = ds_list_create();
m_maximumPreviousTracked = 5;
for(var i = 0; i < m_maximumPreviousTracked; i++)
{
  ds_list_add(m_xPreviousList, xstart);
  ds_list_add(m_yPreviousList, ystart);
}

//Member to support animation events
m_animationEventsMap = undefined;
m_lastImageIndex = 0;
m_lastSpriteIndex = undefined;
enum EventMembers
{
  Script,
  Args,
  ID
}

//Apply animation frame speed adjustment
m_isUsingFrameSpeedAdjustedAnimations = true;
m_imageSpeedCore = undefined;

//For debug purposes
m_frameNumber = 0;
last_image = image_index;

