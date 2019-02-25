// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // Hitbox_obj
global.__objectDepths[1] = 0; // InputManager_obj
global.__objectDepths[2] = 0; // GameController_obj
global.__objectDepths[3] = 0; // Camera_obj
global.__objectDepths[4] = 0; // Entity_obj
global.__objectDepths[5] = 0; // Movable_obj
global.__objectDepths[6] = 0; // Combatant_obj
global.__objectDepths[7] = 0; // Friendly_obj
global.__objectDepths[8] = 0; // Enemy_obj
global.__objectDepths[9] = 0; // EnemyAIBase_obj
global.__objectDepths[10] = 0; // EnemyBas
global.__objectDepths[11] = 0; // EnemySkewered_obj
global.__objectDepths[12] = 0; // EnemyEnforcer_obj
global.__objectDepths[13] = 0; // EnemyTestTarget_obj
global.__objectDepths[14] = 0; // PlayerBase_obj
global.__objectDepths[15] = 0; // Player1_obj
global.__objectDepths[16] = 0; // Player1Test_obj
global.__objectDepths[17] = 0; // PlayerSpear_obj
global.__objectDepths[18] = 0; // SpearDetonation_obj
global.__objectDepths[19] = 0; // SolidSloped_obj
global.__objectDepths[20] = 0; // Solid_obj
global.__objectDepths[21] = 0; // Platform_obj
global.__objectDepths[22] = 0; // CombatChamber_obj
global.__objectDepths[23] = 0; // ElevatorShaft_obj
global.__objectDepths[24] = 0; // BloodLettingChamber_obj
global.__objectDepths[25] = 0; // ElevatorCar_obj
global.__objectDepths[26] = 0; // DoorClosed_obj
global.__objectDepths[27] = 0; // DoorOpen_obj
global.__objectDepths[28] = 0; // TrainingTargetPlatform_obj
global.__objectDepths[29] = 0; // MovementDust_obj
global.__objectDepths[30] = 0; // CollisionTrigger_obj
global.__objectDepths[31] = 0; // CollisionTriggerCameraMod_obj
global.__objectDepths[32] = 0; // CollisionTriggerExteriorCamera_obj
global.__objectDepths[33] = 0; // CollisionTriggerInteriorCamera_obj
global.__objectDepths[34] = 0; // HitboxRepresentation_obj
global.__objectDepths[35] = 0; // object25
global.__objectDepths[36] = 0; // console_obj


global.__objectNames[0] = "Hitbox_obj";
global.__objectNames[1] = "InputManager_obj";
global.__objectNames[2] = "GameController_obj";
global.__objectNames[3] = "Camera_obj";
global.__objectNames[4] = "Entity_obj";
global.__objectNames[5] = "Movable_obj";
global.__objectNames[6] = "Combatant_obj";
global.__objectNames[7] = "Friendly_obj";
global.__objectNames[8] = "Enemy_obj";
global.__objectNames[9] = "EnemyAIBase_obj";
global.__objectNames[10] = "EnemyBas";
global.__objectNames[11] = "EnemySkewered_obj";
global.__objectNames[12] = "EnemyEnforcer_obj";
global.__objectNames[13] = "EnemyTestTarget_obj";
global.__objectNames[14] = "PlayerBase_obj";
global.__objectNames[15] = "Player1_obj";
global.__objectNames[16] = "Player1Test_obj";
global.__objectNames[17] = "PlayerSpear_obj";
global.__objectNames[18] = "SpearDetonation_obj";
global.__objectNames[19] = "SolidSloped_obj";
global.__objectNames[20] = "Solid_obj";
global.__objectNames[21] = "Platform_obj";
global.__objectNames[22] = "CombatChamber_obj";
global.__objectNames[23] = "ElevatorShaft_obj";
global.__objectNames[24] = "BloodLettingChamber_obj";
global.__objectNames[25] = "ElevatorCar_obj";
global.__objectNames[26] = "DoorClosed_obj";
global.__objectNames[27] = "DoorOpen_obj";
global.__objectNames[28] = "TrainingTargetPlatform_obj";
global.__objectNames[29] = "MovementDust_obj";
global.__objectNames[30] = "CollisionTrigger_obj";
global.__objectNames[31] = "CollisionTriggerCameraMod_obj";
global.__objectNames[32] = "CollisionTriggerExteriorCamera_obj";
global.__objectNames[33] = "CollisionTriggerInteriorCamera_obj";
global.__objectNames[34] = "HitboxRepresentation_obj";
global.__objectNames[35] = "object25";
global.__objectNames[36] = "console_obj";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for