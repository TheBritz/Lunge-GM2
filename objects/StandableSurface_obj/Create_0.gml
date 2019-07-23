/// @description Insert description here
// You can write your code in this editor
Movable_Init_scr();

m_neighborMaxDistHor = 120;
m_neighborMaxDistVert = 120;
m_neighbors = ds_list_create();

//Platfor Paths Map
//+Key:Object Type  Value:Destination Map
//|--+Key:Destination Platform instance  Value:Path list
//   |--+List of platforms to navigate to (path)   
m_platformPaths = ds_map_create();
