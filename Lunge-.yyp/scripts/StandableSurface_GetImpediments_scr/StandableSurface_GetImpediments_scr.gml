/// @description StandableSurface_GetImpediments_scr(standableInstance, width, height)
/// @param standableInstance
/// @param height
/// @param width

var standable = argument0;
var width = argument1;
var height = argument2;

var retList = global.ReusableHitList;
ds_list_clear(retList);

if(instance_exists(standable))
{
  var distLeftToRight, distRightToLeft, distTopToBottom, distTopToTop, distBottomToTop;
  with(standable)
  {
    for(var i = 0; i < ds_list_size(m_neighbors); i++)
    {
      var neighbor = m_neighbors[|i];
      if(neighbor.object_index == Solid_obj)
      {
        with(neighbor)
        {
          distLeftToRight = standable.bbox_left - bbox_right;
          distRightToLeft = bbox_left - standable.bbox_right;
          distTopToBottom = standable.bbox_top - bbox_bottom;
          distTopToTop = standable.bbox_top - bbox_top;
          distBottomToTop = bbox_top - standable.bbox_bottom;
        
          var isVerticalBlocker = distTopToBottom > 0 && height >= distTopToBottom;
          isVerticalBlocker = isVerticalBlocker || (distTopToTop > 0 && distTopToBottom <= 0);
          if(isVerticalBlocker)
          {
            var isHorizontalBlocker = distLeftToRight > 0 && width >= distLeftToRight;
            isHorizontalBlocker = isHorizontalBlocker || (distRightToLeft > 0 && width >= distRightToLeft);
            isHorizontalBlocker = isHorizontalBlocker || (distRightToLeft < 0 && distLeftToRight < 0);
            if(isHorizontalBlocker)
            {
              ds_list_add(retList, neighbor);
            }
          }
        }
      }
    }
  }
}

return retList;