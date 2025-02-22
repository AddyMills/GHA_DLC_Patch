menu_select_practice_mode_font = fontgrid_title_gh3
training_mode = TUTORIALS

script create_select_practice_mode_menu 
	disable_pause
	Change \{rich_presence_context = presence_main_menu}
	SpawnScriptNow \{Menu_Music_On}
	CreateScreenElement {
		Type = ContainerElement
		Id = spm_container
		PARENT = root_window
		Pos = (0.0, 0.0)
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = Venue_BG}
	displaySprite \{texture = practice_poster_2
		Id = spm_poster
		PARENT = spm_container
		Pos = (640.0, 340.0)
		Dims = (600.0, 600.0)
		Rot_Angle = -5
		just = [
			Center
			Center
		]}
	displaySprite \{tex = practice_typebar_1
		PARENT = spm_container
		Pos = (710.0, 240.0)
		Dims = (192.0, 75.0)
		Rot_Angle = -5
		just = [
			Center
			Center
		]
		rgba = [
			0
			0
			0
			255
		]
		Z = 5}
	displaySprite \{tex = practice_typebar_2
		PARENT = spm_container
		Pos = (555.0, 320.0)
		Dims = (220.0, 75.0)
		Rot_Angle = -5
		just = [
			Center
			Center
		]
		rgba = [
			0
			0
			0
			255
		]
		Z = 5}
	displaySprite \{tex = Tape_H_02
		PARENT = spm_container
		Pos = (775.0, 60.0)
		Dims = (160.0, 64.0)
		Rot_Angle = -20
		just = [
			Center
			Center
		]
		Z = 7}
	displaySprite {
		tex = Tape_H_02
		PARENT = <Id>
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		Z = 6
	}
	displaySprite \{tex = Tape_H_02
		PARENT = spm_container
		Pos = (500.0, 640.0)
		Dims = (160.0, 64.0)
		Rot_Angle = 20
		just = [
			Center
			Center
		]
		Z = 7
		flip_v}
	displaySprite {
		tex = Tape_H_02
		PARENT = <Id>
		Pos = (5.0, 5.0)
		rgba = [0 0 0 128]
		Z = 6
	}
	displaySprite \{tex = tape_V_02
		PARENT = spm_container
		Pos = (430.0, 120.0)
		Dims = (160.0, 96.0)
		Rot_Angle = 280
		just = [
			Center
			Center
		]
		Z = 7}
	displaySprite {
		tex = tape_V_02
		PARENT = <Id>
		Pos = (-5.0, 5.0)
		rgba = [0 0 0 128]
		Z = 6
	}
	player_device = ($primary_controller)
	if ((IsGuitarController controller = <player_device>) || ((ISPS3) && $enable_button_cheats = 1))
		tutorial_text = "tutorials"
	else
		tutorial_text = "tutorials*"
		practice_mode_footnote \{Alpha = 1}
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = spm_container
		Id = tutorials_text
		Text = <tutorial_text>
		font = text_a6
		Pos = (555.0, 320.0)
		Scale = 0.7
		Rot_Angle = -5
		just = [Center Center]
		event_handlers = [
			{pad_up switch_training_mode}
			{pad_down switch_training_mode}
			{pad_choose choose_training_mode}
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
		]
		z_priority = 10
	}
	displayText \{Id = practice_text
		PARENT = spm_container
		Text = "practice"
		font = text_a6
		Pos = (710.0, 245.0)
		Scale = 0.7
		just = [
			Center
			Center
		]
		rot = -5
		Z = 10}
	displayText \{PARENT = spm_container
		Text = "Select training mode"
		font = text_a11
		Pos = (655.0, 540.0)
		rgba = [
			255
			195
			20
			255
		]
		rot = -5
		Z = 10
		noshadow
		just = [
			Center
			Center
		]}
	fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = (320.0, 70.0)
	LaunchEvent \{Type = Focus
		Target = tutorials_text}
	update_training_menu
	if NOT (IsGuitarController controller = <player_device>)
		if NOT ((ISPS3) && $enable_button_cheats = 1)
			Change \{training_mode = PRACTICE}
			update_training_menu
		endif
	endif
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{Text = "SELECT"
		button = Green
		Z = 100}
	add_user_control_helper \{Text = "BACK"
		button = RED
		Z = 100}
	if ((IsGuitarController controller = <player_device>) || ((ISPS3) && $enable_button_cheats = 1))
		add_user_control_helper \{Text = "UP/DOWN"
			button = Strumbar
			Z = 100}
	endif
endscript

script destroy_select_practice_mode_menu 
	destroy_menu_backdrop
	clean_up_user_control_helpers
	destroy_menu \{menu_id = spm_container}
	destroy_menu \{menu_id = spm_scroll}
endscript

script switch_training_mode 
	player_device = ($primary_controller)
	if ((IsGuitarController controller = <player_device>) || ((ISPS3) && $enable_button_cheats = 1))
		generic_menu_up_or_down_sound
		if ($training_mode = TUTORIALS)
			Change \{training_mode = PRACTICE}
		else
			Change \{training_mode = TUTORIALS}
		endif
		update_training_menu
		practice_mode_footnote \{Alpha = 0}
	elseif NOT (IsGuitarController controller = <player_device>)
		Change \{training_mode = PRACTICE}
		update_training_menu
		practice_mode_footnote \{Alpha = 1}
	endif
endscript

script choose_training_mode 
	generic_menu_pad_choose_sound
	if ($training_mode = TUTORIALS)
		player_device = ($primary_controller)
		if ((IsGuitarController controller = <player_device>) || ((ISPS3) && $enable_button_cheats = 1))
			ui_flow_manager_respond_to_action \{action = select_tutorial}
		endif
	else
		ui_flow_manager_respond_to_action \{action = select_practice}
	endif
endscript

script update_training_menu 
	if ($training_mode = TUTORIALS)
		if ScreenElementExists \{Id = spm_poster}
			SetScreenElementProps \{Id = spm_poster
				texture = practice_poster_1}
		endif
		if ScreenElementExists \{Id = tutorials_text}
			SetScreenElementProps \{Id = tutorials_text
				rgba = [
					150
					140
					200
					255
				]
				Scale = 0.75}
		endif
		if ScreenElementExists \{Id = practice_text}
			SetScreenElementProps \{Id = practice_text
				rgba = [
					145
					145
					145
					255
				]
				Scale = 0.6}
		endif
	else
		if ScreenElementExists \{Id = spm_poster}
			SetScreenElementProps \{Id = spm_poster
				texture = practice_poster_2}
		endif
		if ScreenElementExists \{Id = tutorials_text}
			SetScreenElementProps \{Id = tutorials_text
				rgba = [
					145
					145
					145
					255
				]
				Scale = 0.6}
		endif
		if ScreenElementExists \{Id = practice_text}
			SetScreenElementProps \{Id = practice_text
				rgba = [
					220
					25
					30
					255
				]
				Scale = 0.75}
		endif
	endif
endscript

script practice_mode_footnote \{Alpha = 0}
	if NOT ScreenElementExists \{Id = footnote_overlay}
		CreateScreenElement \{Type = ContainerElement
			PARENT = spm_container
			Id = footnote_overlay
			Pos = (0.0, 0.0)
			just = [
				LEFT
				Top
			]
			Alpha = 0}
		CreateScreenElement \{Type = ContainerElement
			PARENT = footnote_overlay
			Id = practice_mode_footer
			Pos = (640.0, 645.0)
			z_priority = 1000
			just = [
				Center
				Bottom
			]
			Alpha = 1}
		CreateScreenElement \{Type = ContainerElement
			PARENT = practice_mode_footer
			Id = footer_gradient
			Pos = (0.0, -17.0)
			z_priority = 1000
			just = [
				Center
				Bottom
			]
			Alpha = 1
			Rot_Angle = 90}
		CreateScreenElement \{Type = SpriteElement
			PARENT = footer_gradient
			texture = gradient_128
			Dims = (33.0, 600.0)
			Pos = (0.0, 0.0)
			rgba = [
				0
				0
				0
				100
			]
			just = [
				Center
				Bottom
			]
			Alpha = 1}
		CreateScreenElement \{Type = SpriteElement
			PARENT = footer_gradient
			texture = gradient_128
			Dims = (33.0, 600.0)
			Pos = (0.0, 0.0)
			rgba = [
				20
				0
				10
				100
			]
			just = [
				Center
				Top
			]
			Alpha = 1
			flip_h}
		CreateScreenElement {
			Type = TextElement
			PARENT = practice_mode_footer
			Id = practice_mode_footer_text
			Scale = (0.7, 0.6)
			Text = "*CONNECT A GUITAR HERO® GUITAR CONTROLLER TO ACCESS TUTORIALS"
			Pos = (0.0, -2.0)
			rgba = (($G_menu_colors).md_violet_grey)
			font = text_a11
			just = [Center Bottom]
			font_spacing = 0.8
			Shadow
			shadow_offs = (1.0, 1.0)
			shadow_rgba = [0 0 0 255]
			Alpha = 1
			z_priority = 1002
		}
	endif
	if (<Alpha> = 1)
		SetScreenElementProps Id = practice_mode_footer_text Text = <Text>
		DoScreenElementMorph \{Id = footnote_overlay
			Alpha = 1
			Time = 0.25}
		RunScriptOnScreenElement \{Id = practice_mode_footer_text
			alert_footnote}
	else
		DoScreenElementMorph \{Id = footnote_overlay
			Alpha = 0
			Time = 0.25}
	endif
endscript

script alert_footnote 
	begin
	DoMorph \{Alpha = 0.5
		Time = 0.05}
	Wait \{0.05
		Second}
	DoMorph \{Alpha = 1
		Time = 0.05}
	Wait \{0.05
		Second}
	repeat 3
endscript
