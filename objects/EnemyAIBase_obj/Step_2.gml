/// @description AI Behaviors
// You can write your code in this editor

// Inherit the parent event
event_inherited();

///AI Behaviors

//Check for state change
if(m_aiState != m_aiStatePreviousFrame)
{
  m_aiStateFrames = 0;
  //The assumption is that the first sub-state for any behavior should be 0
  m_aiSubState = 0;
  //Reset the tickrate because the behavior script is expected to run and set
  //its own tickrate
  m_behaviorTickrate = undefined;
}
else
{
  m_aiStateFrames++;
}

var behavior = m_aiBehaviors[? m_aiState];

if(is_undefined(behavior))
{
  //Reset to idling if there's no behavior for the current state.
  m_aiState = EnemyAIStates.Idling;
}

if(!is_undefined(behavior))
{
  if(!is_undefined(m_behaviorTickrate))
  {
    //TO-DO: Account for time dilation
    m_behaviorTicker--;
    if(m_behaviorTicker <= 0)
    {
      var extScript = EnemyAIBase_GetExtensionScript_scr(id, m_aiState);
      script_execute(behavior, extScript);  
      m_behaviorTicker = m_behaviorTickrate;
    }
  }
  else
  {
    //If tickrate is undefined, assume that this behavior needs to be run every frame
    var extScript = EnemyAIBase_GetExtensionScript_scr(id, m_aiState);
    script_execute(behavior, extScript);  
  }
}

m_aiStatePreviousFrame = m_aiState;
