/// @description Make calculations for AI use
// You can write your code in this editor

var centerX, centerY, width, height, distLeftToRight, distRightToLeft, distTopToBottom, distTopToTop, distBottomToTop;
var instanceNumber = instance_number(StandableSurface_obj);

while(m_initIndex < instanceNumber)
{
  var standable = instance_find(StandableSurface_obj, m_initIndex++);
  with(standable)
  {
    with(StandableSurface_obj)
    { 
      if(id != standable)
      {
        //Calculate distances
        distLeftToRight = standable.bbox_left - bbox_right;
        distRightToLeft = bbox_left - standable.bbox_right;
        distTopToBottom = standable.bbox_top - bbox_bottom;
        distTopToTop = standable.bbox_top - bbox_top;
        distBottomToTop = bbox_top - standable.bbox_bottom;
        if(abs(distLeftToRight) < m_neighborMaxDistHor ||
           abs(distRightToLeft) < m_neighborMaxDistHor ||
           (distLeftToRight <= 0 && distRightToLeft <= 0)) 
        {
          if(abs(distTopToBottom) < m_neighborMaxDistVert || 
             abs(distBottomToTop) < m_neighborMaxDistVert ||
             (distTopToBottom <= 0 && distTopToTop <= 0))
          {
            ds_list_add(standable.m_neighbors, id);
          }
        } 
      }
    }
  }
}

if(m_neighborInitComplete)
{
  m_initIndex = 0;
  //Calculate platform paths
  while(m_initIndex < instanceNumber)
  {
    var standable = instance_find(StandableSurface_obj, m_initIndex++);
    
  }
}

//Destroy self
instance_destroy();