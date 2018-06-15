/// @description AI Behaviors
// You can write your code in this editor

// Inherit the parent event
event_inherited();

///AI Behaviors

//Check for state change
if(m_aiState != m_aiStatePreviousFrame)
{
  m_aiStateFrames = 0;
}

var behavior = m_aiBehaviors[? m_aiState];

if(is_undefined(behavior))
{
  //Reset to idling if there's no behavior for the current state.
  m_aiState = EnemyAIStates.Idling;
}

if(!is_undefined(behavior))
{
  var extScript = EnemyAIBase_GetExtensionScript_scr(id, m_aiState);
  script_execute(behavior, extScript);  
}

m_aiStatePreviousFrame = m_aiState;

