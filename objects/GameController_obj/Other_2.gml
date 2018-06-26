/// @description Init Game
// You can write your code in this editor

//Sprite Position Scanning - only if configured to do so
global.SpritePositionDataMap = SpritePositionDataLoadCache_scr();
if(ds_map_size(global.SpritePositionDataMap) == 0)
{
  var wepCat = array("weapon", c_red);
  SpritePositionDataScan_scr("Player", undefined, array(wepCat));
} 