/// @description Init Game
// You can write your code in this editor

//Sprite Position Scanning - only if configured to do so
global.SpritePositionDataMap = SpritePositionDataLoadCache_scr();
if(ds_map_size(global.SpritePositionDataMap) == 0)
{
  //Add categories
  SpritePositionDataAddCategory_scr("weapon", c_red);
  SpritePositionDataAddCategory_scr("sitPosition", make_color_rgb(255, 0, 255));
  SpritePositionDataAddCategory_scr("turretPosition", make_color_rgb(0, 255, 255));
  SpritePositionDataScan_scr("Player", undefined);
  SpritePositionDataScan_scr("HoverBike", undefined);
} 