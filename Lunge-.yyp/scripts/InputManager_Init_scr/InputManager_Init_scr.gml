m_keyToButtonControlMap = ds_map_create();
m_keysList = ds_list_create();
m_gamepadToButtonControlMap = ds_map_create();
m_gamepadList = ds_list_create();
m_buttonControlStates = ds_map_create();

//Init button control state map (all states should start released)
m_buttonControlStates[? ButtonControls.Left] = ButtonStates.Released;
m_buttonControlStates[? ButtonControls.Right] = ButtonStates.Released;
m_buttonControlStates[? ButtonControls.Down] = ButtonStates.Released;
m_buttonControlStates[? ButtonControls.Up] = ButtonStates.Released;
m_buttonControlStates[? ButtonControls.Attack] = ButtonStates.Released;
m_buttonControlStates[? ButtonControls.Jump] = ButtonStates.Released;
m_buttonControlStates[? ButtonControls.Block] = ButtonStates.Released;
