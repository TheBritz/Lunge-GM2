/// @description ConsoleValidateParameterMetadataObjectType_scr()

var metadata = argument0;
metadata[? ConsoleParamType.Description] = "this parameter must be an existing Object. Call 'ShowObjects()' to see a list of valid objects.";
metadata[? ConsoleParamType.DefaultSuggestionBuilder] = GetObjectTypes_scr;
return metadata;
