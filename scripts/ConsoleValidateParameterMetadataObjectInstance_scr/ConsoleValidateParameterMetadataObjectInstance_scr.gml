/// @description ConsoleValidateParameterMetadataObjectInstance_scr()

var metadata = argument0;
metadata[? ConsoleParamType.Description] = "This parameter must be an existing instance of an Object. Call 'ShowObjectInstances()' to see a list of active object instances.";
return metadata;
