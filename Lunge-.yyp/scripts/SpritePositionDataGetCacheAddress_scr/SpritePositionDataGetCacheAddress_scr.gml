/// @description

var dirName = "Sprite Position Data";
if(!directory_exists(dirName))
{
  directory_create(dirName);
}

var fileName = "Sprite Position Data.dsmap";
var filePath = dirName + "\\" + fileName;

return filePath;