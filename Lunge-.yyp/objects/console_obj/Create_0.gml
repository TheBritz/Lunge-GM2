/// @description Console Init

//There can only be one
if(instance_number(object_index) > 1)
{
  instance_destroy();
}
else
{
  BuildAssetLists_scr();
  global.ReusableMetadataMap = ds_map_create();
  global.Console = id;
  
  //Console enums
  enum ConsoleMetadata
  {
    ParamCount,
    Description,
    Parameters,
    ParameterTypes,
    SuggestionListBuilder
  }
  
  enum ConsoleParamType
  {
    Description,
    DefaultSuggestionBuilder
  }
  
  //Customize these according to your own naming preferences:
  m_scriptSuffix = "_scr";
  m_scriptPrefix = "";
  
  m_errorList = ds_list_create();
  m_warningList = ds_list_create();
  m_consoleContent = ds_list_create();
  m_consoleDrawContent = ds_list_create();
  m_bufferDraw = true;
  m_bufferDrawLast = false;
  m_consoleHistory = ds_list_create();
  depth = -100000;
  m_commandString = "";
  m_intelliBgWidth = 0;
  m_intelliThresh = 1;
  m_intelliModeGuide = false;
  m_intelliGuideBufferRequired = false;
  m_intelliGuideHlCol = c_lime;
  m_intelliGuideCommand = undefined;
  m_intelliGuideInfo = undefined;
  m_intelliGuideInfo1 = undefined;
  m_intelliGuideInfoHl = undefined;
  m_intelliGuideInfo2 = undefined;
  m_intelliList = ds_list_create();
  m_intelliInfoList = ds_list_create();
  m_intelliIndex = -1;
  m_intelliBgColor = c_dkgray;
  m_intelliBgHlColor = c_gray;
  m_suggestionList = ds_list_create();
  m_suggestionDisplayList = ds_list_create();
  m_suggestionDrawX = 100;
  m_suggestionDrawWidth = 200;
  m_suggestionIndex = -1;
  m_suggestionMarginX = 4;
  m_width = 200;
  m_height = 100;
  m_historyIndex = -1;
  m_caretPos = 0;
  m_caretPosX = 0;
  m_caretPosY = 0;
  m_active = false;
  m_xPos = undefined;
  m_yPos = undefined;
  m_relPosX = .02;
  m_relPosY = .33;
  m_relWidth = .4;
  m_relHeight = .32;
  m_keySuppress = false;
  m_lastKey = -1;
  m_activationKey = 192;
  m_bgColor = c_black;
  m_textColor = c_white;
  m_drawBufferX = 14;
  m_drawBufferY = 6
  
  m_shiftMap = InitKbdShiftMap_scr();
  m_knownKeysMap = InitKbdKnownKeys_scr();
  var arr = InitConsoleCommands_scr();
  m_commandList = arr[0];
  m_commandNameList = arr[1];
  m_commandMap = arr[2];
  m_metadataMap = arr[3];
  m_validatorMap = arr[4];
  m_valMetadataMap = arr[5];
  m_valDisplayMap = arr[6];
  m_validTypes = arr[7];
}

