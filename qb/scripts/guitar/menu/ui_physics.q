ui_physics_struct = {
	hardware_letterbox = 1
	Top = 0
	RIGHT = 1280
	Bottom = 720
	LEFT = 0
}
g_GRAVITY = 1000.0
g_DRAG_FORCE = -20.0
doing_you_rock_test = 0
physics_test_type = 3

script create_ui_physics_test 
	Change \{doing_you_rock_test = 0}
	check_screen_for_physics
	if GotParam \{Debug}
		destroy_debugging_menu
		create_menu_backdrop \{texture = White
			rgba = [
				50
				50
				50
				255
			]}
	endif
	new_menu \{scrollid = scrolling_ui_physics_test
		vmenuid = vmenu_ui_physics_test
		Menu_pos = (0.0, 0.0)
		use_backdrop = 0
		exclusive_device = $primary_controller
		event_handlers = [
			{
				pad_up
				ui_physics_scroll_up
				Params = {
					Debug
				}
			}
			{
				pad_down
				ui_physics_scroll_down
				Params = {
					Debug
				}
			}
			{
				pad_back
				destroy_ui_physics_test
				Params = {
					Debug
				}
			}
		]}
	LaunchEvent \{Type = Focus
		Target = vmenu_ui_physics_test}
	switch $physics_test_type
		case 1
		CreateScreenElement \{Type = TextElement
			PARENT = root_window
			Id = test_type_text
			font = text_A1
			Scale = 0.75
			rgba = [
				210
				210
				210
				250
			]
			Pos = (320.0, 100.0)
			Text = "GRAVITY & DRAG"
			z_priority = 100.0}
		CreateScreenElement \{Type = PhysicsElement
			Id = slime_container
			PARENT = root_window
			Pos = (450.0, 50.0)
			Mass = 40.0
			Center = (63.0, 63.0)
			Radius = 89.1
			elasticity = 0.75
			check_screen_collision
			apply_gravity
			apply_drag}
		CreateScreenElement \{Type = SpriteElement
			Id = slime
			PARENT = slime_container
			texture = slime
			Pos = (0.0, 0.0)
			just = [
				LEFT
				Top
			]
			z_priority = 30}
		CreateScreenElement \{Type = PhysicsElement
			Id = weight_container
			PARENT = root_window
			Pos = (650.0, 50.0)
			Mass = 100.0
			Center = (63.0, 63.0)
			Radius = 89.1
			elasticity = 0.25
			check_screen_collision
			apply_gravity
			apply_drag}
		CreateScreenElement \{Type = SpriteElement
			Id = Weight
			PARENT = weight_container
			texture = Weight
			Pos = (0.0, 0.0)
			just = [
				LEFT
				Top
			]
			z_priority = 30}
		case 2
		CreateScreenElement \{Type = TextElement
			PARENT = root_window
			Id = test_type_text
			font = text_A1
			Scale = 0.75
			rgba = [
				210
				210
				210
				250
			]
			Pos = (460.0, 100.0)
			Text = "INITIAL FORCE WITH FANS ON CORNERS"
			z_priority = 100.0}
		CreateScreenElement \{Type = PhysicsElement
			Id = snake_test_container
			PARENT = root_window
			Pos = (550.0, 100.0)
			Mass = 40.0
			Center = (63.0, 63.0)
			Radius = 89.1
			elasticity = 0.75
			initial_force = (-2000000.0, -1500000.0)
			apply_gravity}
		RunScriptOnScreenElement Id = <Id> check_screen_collisions Params = {Id = <Id>}
		CreateScreenElement \{Type = SpriteElement
			Id = snake_head
			PARENT = snake_test_container
			texture = slime
			Pos = (0.0, 0.0)
			just = [
				LEFT
				Top
			]
			z_priority = 30}
		RunScriptOnScreenElement \{Id = snake_test_container
			apply_positional_force
			Params = {
				Id = snake_test_container
				force_pos = (1160.0, 640.0)
				Force = (-150000.0, 0.0)
				dist = 40
				horizontal
			}}
		RunScriptOnScreenElement \{Id = snake_test_container
			apply_positional_force
			Params = {
				Id = snake_test_container
				force_pos = (1160.0, 640.0)
				Force = (0.0, -150000.0)
				dist = 40
				vertical
			}}
		RunScriptOnScreenElement \{Id = snake_test_container
			apply_positional_force
			Params = {
				Id = snake_test_container
				force_pos = (1200.0, 120.0)
				Force = (-150000.0, 0.0)
				dist = 40
				horizontal
			}}
		RunScriptOnScreenElement \{Id = snake_test_container
			apply_positional_force
			Params = {
				Id = snake_test_container
				force_pos = (1200.0, 120.0)
				Force = (0.0, 150000.0)
				dist = 40
				vertical
			}}
		RunScriptOnScreenElement \{Id = snake_test_container
			apply_positional_force
			Params = {
				Id = snake_test_container
				force_pos = (80.0, 80.0)
				Force = (150000.0, 0.0)
				dist = 40
				horizontal
			}}
		RunScriptOnScreenElement \{Id = snake_test_container
			apply_positional_force
			Params = {
				Id = snake_test_container
				force_pos = (80.0, 80.0)
				Force = (0.0, 150000.0)
				dist = 40
				vertical
			}}
		RunScriptOnScreenElement \{Id = snake_test_container
			apply_positional_force
			Params = {
				Id = snake_test_container
				force_pos = (120.0, 600.0)
				Force = (150000.0, 0.0)
				dist = 40
				horizontal
			}}
		RunScriptOnScreenElement \{Id = snake_test_container
			apply_positional_force
			Params = {
				Id = snake_test_container
				force_pos = (120.0, 600.0)
				Force = (0.0, -150000.0)
				dist = 40
				vertical
			}}
		case 3
		CreateScreenElement \{Type = TextElement
			PARENT = root_window
			Id = test_type_text
			font = text_A1
			Scale = 0.75
			rgba = [
				210
				210
				210
				250
			]
			Pos = (320.0, 100.0)
			Text = "YOU ROCK TEST"
			z_priority = 100.0}
		LaunchEvent \{Type = unfocus
			Target = vmenu_ui_physics_test}
		Change \{doing_you_rock_test = 1}
		create_exploding_text \{PARENT = 'you_rock_physics'
			Text = "You Rock!"}
	endswitch
	if GotParam \{Debug}
		add_user_control_helper \{Text = "BACK"
			button = RED
			Z = 100}
		LaunchEvent \{Type = Focus
			Target = vmenu_ui_physics_test}
	endif
endscript

script ui_physics_scroll_up 
	Change physics_test_type = ($physics_test_type - 1)
	if ($physics_test_type = 0)
		Change \{physics_test_type = 3}
	endif
	destroy_ui_physics_test
	if GotParam \{Debug}
		create_ui_physics_test \{Debug}
	endif
endscript

script ui_physics_scroll_down 
	Change physics_test_type = ($physics_test_type + 1)
	if ($physics_test_type = 4)
		Change \{physics_test_type = 1}
	endif
	destroy_ui_physics_test
	if GotParam \{Debug}
		create_ui_physics_test \{Debug}
	endif
endscript

script destroy_ui_physics_test 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_ui_physics_test}
	destroy_menu_backdrop
	DestroyScreenElement \{Id = test_type_text}
	if ScreenElementExists \{Id = snake_test_container}
		DestroyScreenElement \{Id = snake_test_container}
	endif
	if ScreenElementExists \{Id = slime_container}
		DestroyScreenElement \{Id = slime_container}
	endif
	if ScreenElementExists \{Id = weight_container}
		DestroyScreenElement \{Id = weight_container}
	endif
	if ($doing_you_rock_test)
		destroy_exploding_text
	endif
	if GotParam \{Debug}
		create_debugging_menu
	endif
endscript

script apply_continuous_force \{Force = (0.0, 0.0)}
	begin
	<Id> :ApplyForce Force = <Force>
	GetScreenElementProps Id = <Id>
	Wait \{1
		GameFrame}
	repeat
endscript

script apply_positional_force \{force_pos = (0.0, 0.0)
		Force = (0.0, 0.0)
		dist = 0}
	begin
	GetScreenElementProps Id = <Id>
	if GotParam \{horizontal}
		<y_pos> = ((<Pos>.(0.0, 1.0)) + (<Center>.(0.0, 1.0)))
		if (<y_pos> > ((<force_pos>.(0.0, 1.0)) - <dist>) &&
				<y_pos> < ((<force_pos>.(0.0, 1.0)) + <dist>))
			<Id> :ApplyForce Force = <Force>
		endif
	elseif GotParam \{vertical}
		<x_pos> = ((<Pos>.(1.0, 0.0)) + (<Center>.(1.0, 0.0)))
		if (<x_pos> > ((<force_pos>.(1.0, 0.0)) - <dist>) &&
				<x_pos> < ((<force_pos>.(1.0, 0.0)) + <dist>))
			<Id> :ApplyForce Force = <Force>
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script vector_magnitude \{vect = (0.0, 0.0)}
	<vect_x> = (<vect>.(1.0, 0.0))
	<vect_y> = (<vect>.(0.0, 1.0))
	<vect_x> = (<vect_x> * <vect_x>)
	<vect_y> = (<vect_y> * <vect_y>)
	Sqrt (<vect_x> + <vect_y>)
	return magnitude = <Sqrt>
endscript

script normalize_vector \{vect = (0.0, 0.0)}
	vector_magnitude vect = <vect>
	if (<magnitude> > 0.0)
		<vect_x> = ((<vect>.(1.0, 0.0)) / <magnitude>)
		<vect_y> = ((<vect>.(0.0, 1.0)) / <magnitude>)
		return vect = ((<vect_x> * (1.0, 0.0)) + (<vect_y> * (0.0, 1.0)))
	else
		ScriptAssert \{"Trying to normalize a zero vector"}
	endif
endscript

script check_screen_collisions {
		Top = ($ui_physics_struct.Top)
		LEFT = ($ui_physics_struct.LEFT)
		Bottom = ($ui_physics_struct.Bottom)
		RIGHT = ($ui_physics_struct.RIGHT)
		top_offset = 0
		left_offset = 0
		bottom_offset = 0
		right_offset = 0
	}
	<Top> = (<Top> + <top_offset>)
	<LEFT> = (<LEFT> + <left_offset>)
	<Bottom> = (<Bottom> + <bottom_offset>)
	<RIGHT> = (<RIGHT> + <right_offset>)
	<TL> = ((<Top> * (0.0, 1.0)) + (<LEFT> * (1.0, 0.0)))
	<BR> = ((<Bottom> * (0.0, 1.0)) + (<RIGHT> * (1.0, 0.0)))
	begin
	<Id> :CircleAABBCollisionCheck TL = <TL> BR = <BR>
	Wait \{1
		GameFrame}
	repeat
endscript

script check_screen_for_physics 
	GetDisplaySettings
	PrintStruct <...>
	if (<widescreen> = FALSE)
		Change \{StructureName = ui_physics_struct
			Top = 36}
		Change \{StructureName = ui_physics_struct
			RIGHT = 1096}
		Change \{StructureName = ui_physics_struct
			Bottom = 684}
		Change \{StructureName = ui_physics_struct
			LEFT = 184}
	else
		Change \{StructureName = ui_physics_struct
			Top = 0}
		Change \{StructureName = ui_physics_struct
			RIGHT = 1280}
		Change \{StructureName = ui_physics_struct
			Bottom = 720}
		Change \{StructureName = ui_physics_struct
			LEFT = 0}
	endif
endscript
