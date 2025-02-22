calibrate_lag_menu_font = fontgrid_title_gh3
calibrate_lag_menu_line_pos = (420.0, 360.0)
calibrate_lag_menu_circle_dims = (96.0, 96.0)
calibrate_lag_menu_circle_velocity = 300
calibrate_lag_menu_circle_inital_pos = (420.0, -146.0)
calibrate_lag_menu_circle_separation = 320
calibrate_lag_menu_num_circles = 10
calibrate_lag_hilite_pos0 = (615.0, 443.0)
calibrate_lag_hilite_dims0 = (490.0, 50.0)
calibrate_lag_hilite_pos1 = (615.0, 495.0)
calibrate_lag_hilite_dims1 = (490.0, 50.0)
calibrate_lag_hilite_pos2 = (615.0, 548.0)
calibrate_lag_hilite_dims2 = (490.0, 50.0)
calibrate_lag_hilite_pos3 = (625.0, 595.0)
calibrate_lag_hilite_dims3 = (480.0, 50.0)
calibrate_lag_hilite_unselected = [
	110
	100
	120
	255
]
calibrate_lag_hilite_selected = [
	130
	100
	150
	255
]
calibrate_lag_results = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
calibrate_lag_circle_index = 0
calibrate_lag_real_time_requirement = 0
calibrate_lag_dirty = 0
calibrate_lag_end_checks = 0
calibrate_lag_started_finish = 0
calibrate_lag_cap = 200
calibrate_lag_early_window = -150
calibrate_lag_late_window = 400
cl_ready_for_input = 0
calibrate_lag_most_recent_in_game_setting = 0
calibrate_lag_section = NONE

script create_calibrate_lag_dialog_menu 
	if GotParam \{dialog_1}
		setup_calibration_lag_dialog_1
	elseif GotParam \{dialog_2}
		setup_calibration_lag_dialog_2
	endif
	if ($calibrate_lag_most_recent_in_game_setting = 1)
		<controller> = ($last_start_pressed_device)
	else
		<controller> = ($primary_controller)
	endif
	create_calibrate_background \{Z = 80}
	memcard_cleanup_messages
	create_popup_warning_menu {
		player_device = <controller>
		no_background
		Title = <Title_text>
		textblock = {
			Text = <body_text>
			Dims = (800.0, 400.0)
			Scale = 0.5
		}
		Menu_pos = (640.0, 490.0)
		dialog_dims = (288.0, 64.0)
		helper_pills = [SELECT]
		options = [
			{
				func = {ui_flow_manager_respond_to_action Params = {action = Continue}}
				Text = "CONTINUE"
				Scale = (1.0, 1.0)
			}
		]
	}
endscript

script destroy_calibrate_lag_dialog_menu 
	destroy_menu \{menu_id = cl_container}
	memcard_cleanup_messages
	destroy_popup_warning_menu
endscript

script create_calibrate_lag_menu \{from_in_game = 1}
	Change \{disable_menu_sounds = 1}
	Change calibrate_lag_most_recent_in_game_setting = <from_in_game>
	kill_start_key_binding
	Menu_Music_Off
	if ViewportExists \{Id = Bg_Viewport}
		disable_bg_viewport
	endif
	Change \{calibrate_lag_end_checks = 0}
	Change \{calibrate_lag_started_finish = 0}
	set_focus_color \{Color = white230}
	set_unfocus_color \{rgba = $calibrate_lag_hilite_unselected}
	Z = 100
	create_calibrate_background <...>
	calibrate_lag_fill_options Z = <Z> from_in_game = <from_in_game>
	if NOT ScreenElementExists \{Id = cl_container}
		return
	endif
	displaySprite {
		PARENT = cl_container
		Id = calibrate_lag_target
		tex = Options_Calibrate_Target
		Pos = ($calibrate_lag_menu_line_pos + ($calibrate_lag_menu_circle_dims * 0.5))
		just = [Center Center]
		Dims = (96.0, 96.0)
		Z = (<Z> + 50)
		Alpha = 0.75
	}
	displaySprite \{PARENT = cl_container
		Id = cl_ping_ID
		tex = Options_Audio_Ping
		Alpha = 0
		Scale = 5
		Z = 180
		just = [
			Center
			Center
		]
		Pos = (468.0, 406.0)}
	cl_ping_ID :DoMorph \{Alpha = 0}
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
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar
		Z = 100}
	if ($calibrate_lag_section = NONE)
		LaunchEvent \{Type = Focus
			Target = cl_vmenu}
	endif
	if ($calibrate_lag_section = video)
		LaunchEvent \{Type = pad_choose
			Target = calibrate_calibrate_option}
	elseif ($calibrate_lag_section = audio)
		LaunchEvent \{Type = pad_choose
			Target = calibrate_calibrate_option}
	endif
	Change \{disable_menu_sounds = 0}
endscript

script create_calibrate_background 
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = cl_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Venue_BG}
	displaySprite {
		PARENT = cl_container
		tex = Venue_BG
		Pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		just = [Center Center]
		Z = (<Z> - 4)
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = cl_container
		Id = as_light_overlay
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		just = [Center Center]
		z_priority = (<Z> - 1)
	}
	displaySprite {
		PARENT = cl_container
		tex = Options_Calibrate_Poster
		Pos = (250.0, 0.0)
		Dims = (432.0, 954.0)
		Z = <Z>
	}
	displaySprite {
		PARENT = cl_container
		tex = Options_Calibrate_Paper
		Pos = (600.0, -100.0)
		Dims = (610.0, 892.0)
		Z = (<Z> - 2)
	}
	displaySprite {
		PARENT = cl_container
		tex = Options_Calibrate_Paper
		just = [LEFT Bottom]
		Pos = (610.0, 970.0)
		Dims = (605.0, 590.0)
		Z = (<Z> - 1.5)
		flip_h
	}
	displaySprite {
		PARENT = cl_container
		tex = Toprockers_Tape_2
		Pos = (720.0, -100.0)
		Dims = (180.0, 80.0)
		Z = (<Z> + 2)
		Rot_Angle = 93
	}
	displaySprite {
		PARENT = cl_container
		tex = Toprockers_Tape_2
		rgba = [0 0 0 128]
		Pos = (725.0, -102.0)
		Dims = (180.0, 80.0)
		Z = (<Z> + 2)
		Rot_Angle = 93
	}
	<tape_offset> = (90.0, 325.0)
	displaySprite {
		PARENT = cl_container
		tex = Tape_V_01
		Pos = ((970.0, 106.0) + <tape_offset>)
		Dims = (96.0, 192.0)
		Z = (<Z> + 2)
		flip_v
		Rot_Angle = -6
	}
	displaySprite {
		PARENT = cl_container
		tex = Tape_V_01
		rgba = [0 0 0 128]
		Pos = ((975.0, 104.0) + <tape_offset>)
		Dims = (96.0, 192.0)
		Z = (<Z> + 2)
		flip_v
		Rot_Angle = -6
	}
	displaySprite {
		PARENT = cl_container
		tex = Tape_H_02
		Pos = (220.0, 566.0)
		Dims = (132.0, 64.0)
		Z = (<Z> + 2)
		Rot_Angle = 8
	}
	displaySprite {
		PARENT = cl_container
		tex = Tape_H_02
		rgba = [0 0 0 128]
		Pos = (212.0, 572.0)
		Dims = (132.0, 64.0)
		Z = (<Z> + 2)
		Rot_Angle = 8
	}
	displayText \{PARENT = cl_container
		Text = "HDTV LAG"
		Pos = (770.0, 80.0)
		font = fontgrid_title_gh3
		rgba = [
			0
			0
			0
			255
		]
		noshadow}
	upper_helper = "Some HDTVs have an audio/video delay that makes playing difficult. If you're ready to blame your TV, try calibrating."
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = cl_container
		Pos = (700.0, 80.0)
		Text = <upper_helper>
		font = text_a6
		Dims = (575.0, 0.0)
		allow_expansion
		rgba = [60 40 115 255]
		Scale = 0.56
		just = [LEFT Top]
		internal_just = [LEFT Top]
		z_priority = <Z>
	}
	GetScreenElementDims Id = <Id>
	GetScreenElementPosition Id = <Id>
endscript

script calibrate_lag_fill_options \{Z = 100}
	if (<from_in_game>)
		<controller> = ($last_start_pressed_device)
	else
		<controller> = ($primary_controller)
	endif
	CreateScreenElement {
		Type = SpriteElement
		PARENT = cl_container
		Id = calibrate_lag_hilite
		texture = Options_Calibrate_Hilite
		just = [LEFT Top]
		Pos = $calibrate_lag_hilite_pos0
		rgba = $calibrate_lag_hilite_unselected
		z_priority = <Z>
	}
	calib_eh = [
		{pad_back menu_calibrate_go_back}
	]
	new_menu {
		scrollid = cl_scroll
		vmenuid = cl_vmenu
		Menu_pos = (700.0, 435.0)
		event_handlers = <calib_eh>
		exclusive_device = <controller>
		text_left
		default_colors = 0
		Spacing = -5
		no_focus = 1
	}
	Wait \{2
		GameFrames}
	text_params = {PARENT = cl_vmenu Type = TextElement font = ($calibrate_lag_menu_font) rgba = ($menu_unfocus_color) Scale = 0.9}
	if NOT ScreenElementExists \{Id = cl_vmenu}
		return
	endif
	CreateScreenElement {
		<text_params>
		Id = calibrate_calibrate_option
		Text = "CALIBRATE"
		event_handlers = [
			{Focus menu_calibrate_focus Params = {Index = 0}}
			{unfocus menu_calibrate_unfocus Params = {Index = 0}}
			{pad_choose menu_calibrate_lag_create_circles Params = {Z = <Z> device_num = <controller>}}
		]
		z_priority = (<Z> + 1)
		Pos = (0.0, 14.0)
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((340.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1
	CreateScreenElement {
		<text_params>
		Id = calibrate_reset_option
		Text = "RESET"
		event_handlers = [
			{Focus menu_calibrate_focus Params = {Index = 1}}
			{unfocus menu_calibrate_unfocus Params = {Index = 1}}
			{pad_choose menu_calibrate_lag_reset_lag Params = {Z = <Z>}}
		]
		z_priority = (<Z> + 1)
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((340.0, 0.0) + <Height> * (0.0, 1.0)) only_if_larger_x = 1
	CreateScreenElement \{Type = ContainerElement
		PARENT = cl_vmenu
		Id = calibrate_manual_option_audio
		event_handlers = [
			{
				Focus
				menu_calibrate_focus
				Params = {
					Index = 2
				}
			}
			{
				unfocus
				menu_calibrate_unfocus
				Params = {
					Index = 2
				}
			}
			{
				pad_choose
				menu_calibrate_lag_manual_choose
				Params = {
					audio
				}
			}
		]}
	<container_id> = <Id>
	CreateScreenElement {
		<text_params>
		PARENT = <container_id>
		Id = lag_offset_text_audio
		Text = " "
		just = [LEFT Top]
		z_priority = (<Z> + 1)
		Pos = (40.0, 0.0)
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = cl_manual_adjust_up_arrow_audio
		PARENT = <container_id>
		texture = Online_Arrow
		just = [Center Bottom]
		Pos = (16.0, 16.0)
		rgba = ($calibrate_lag_hilite_unselected)
		Alpha = 1
		Scale = 0.65000004
		z_priority = (<Z> + 1)
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = cl_manual_adjust_down_arrow_audio
		PARENT = <container_id>
		texture = Online_Arrow
		just = [Center Top]
		Pos = (16.0, 20.0)
		rgba = ($calibrate_lag_hilite_unselected)
		Alpha = 1
		Scale = 0.65000004
		z_priority = (<Z> + 1)
	}
	CreateScreenElement \{Type = ContainerElement
		PARENT = cl_vmenu
		Id = calibrate_manual_option
		event_handlers = [
			{
				Focus
				menu_calibrate_focus
				Params = {
					Index = 3
				}
			}
			{
				unfocus
				menu_calibrate_unfocus
				Params = {
					Index = 3
				}
			}
			{
				pad_choose
				menu_calibrate_lag_manual_choose
			}
		]}
	<container_id> = <Id>
	CreateScreenElement {
		<text_params>
		PARENT = <container_id>
		Id = lag_offset_text
		Text = " "
		just = [LEFT Top]
		z_priority = (<Z> + 1)
		Pos = (40.0, 52.0)
	}
	calibrate_lag_update_text
	CreateScreenElement {
		Type = SpriteElement
		Id = cl_manual_adjust_up_arrow
		PARENT = <container_id>
		texture = Online_Arrow
		just = [Center Bottom]
		Pos = (16.0, 68.0)
		rgba = ($calibrate_lag_hilite_unselected)
		Alpha = 1
		Scale = 0.65000004
		z_priority = (<Z> + 1)
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = cl_manual_adjust_down_arrow
		PARENT = <container_id>
		texture = Online_Arrow
		just = [Center Top]
		Pos = (16.0, 72.0)
		rgba = ($calibrate_lag_hilite_unselected)
		Alpha = 1
		Scale = 0.65000004
		z_priority = (<Z> + 1)
	}
	SetScreenElementLock \{Id = cl_vmenu
		ON}
endscript

script calibrate_lag_update_text 
	GetGlobalTags \{user_options}
	CastToInteger \{lag_calibration}
	if (<lag_calibration> < 1000)
		<lag_calibration> = (<lag_calibration> + 1000)
	endif
	audio_lag = ((<lag_calibration> / 1000) - 1)
	CastToInteger \{audio_lag}
	FormatText TextName = lag_value_text "Audio: %d ms" D = <audio_lag>
	lag_offset_text_audio :SetProps Text = <lag_value_text>
	Mod A = <lag_calibration> B = 1000
	FormatText TextName = lag_value_text "Video: %d ms" D = <Mod>
	lag_offset_text :SetProps Text = <lag_value_text>
endscript

script destroy_calibrate_lag_menu 
	SpawnScriptNow \{Menu_Music_On}
	if ViewportExists \{Id = Bg_Viewport}
		enable_bg_viewport
	endif
	Change \{calibrate_lag_dirty = 0}
	destroy_menu_backdrop
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = do_calibration_update}
	destroy_menu \{menu_id = cl_scroll}
	destroy_menu \{menu_id = cl_container}
	if ScreenElementExists \{idcl_manual_adjust_handler}
		DestroyScreenElement \{Id = cl_manual_adjust_handler}
	endif
	LaunchEvent \{Type = Focus
		Target = root_window}
endscript

script menu_calibrate_focus 
	generic_menu_up_or_down_sound
	Wait \{1
		GameFrames}
	if (<Index> = 0)
		retail_menu_focus
		SetScreenElementProps \{Id = calibrate_lag_hilite
			Pos = $calibrate_lag_hilite_pos0
			Dims = $calibrate_lag_hilite_dims0}
	elseif (<Index> = 1)
		retail_menu_focus
		SetScreenElementProps \{Id = calibrate_lag_hilite
			Pos = $calibrate_lag_hilite_pos1
			Dims = $calibrate_lag_hilite_dims1}
	elseif (<Index> = 2)
		Obj_GetID
		retail_menu_focus Id = {<ObjID> child = 0}
		SetScreenElementProps \{Id = calibrate_lag_hilite
			Pos = $calibrate_lag_hilite_pos2
			Dims = $calibrate_lag_hilite_dims2}
		DoScreenElementMorph \{Id = cl_manual_adjust_up_arrow_audio
			rgba = $menu_focus_color}
		DoScreenElementMorph \{Id = cl_manual_adjust_down_arrow_audio
			rgba = $menu_focus_color}
	else
		Obj_GetID
		retail_menu_focus Id = {<ObjID> child = 0}
		SetScreenElementProps \{Id = calibrate_lag_hilite
			Pos = $calibrate_lag_hilite_pos3
			Dims = $calibrate_lag_hilite_dims3}
		DoScreenElementMorph \{Id = cl_manual_adjust_up_arrow
			rgba = $menu_focus_color}
		DoScreenElementMorph \{Id = cl_manual_adjust_down_arrow
			rgba = $menu_focus_color}
	endif
endscript

script menu_calibrate_unfocus 
	if (<Index> = 0)
		retail_menu_unfocus
	elseif (<Index> = 1)
		retail_menu_unfocus
	elseif (<Index> = 2)
		Obj_GetID
		retail_menu_unfocus Id = {<ObjID> child = 0}
		DoScreenElementMorph Id = cl_manual_adjust_up_arrow_audio rgba = ($calibrate_lag_hilite_unselected)
		DoScreenElementMorph Id = cl_manual_adjust_down_arrow_audio rgba = ($calibrate_lag_hilite_unselected)
	else
		Obj_GetID
		retail_menu_unfocus Id = {<ObjID> child = 0}
		DoScreenElementMorph Id = cl_manual_adjust_up_arrow rgba = ($calibrate_lag_hilite_unselected)
		DoScreenElementMorph Id = cl_manual_adjust_down_arrow rgba = ($calibrate_lag_hilite_unselected)
	endif
endscript

script play_calibrate_click 
	Wait \{0.583
		Seconds}
	FormatText TextName = tex "%t" T = (3 - <I>)
	SetScreenElementProps Id = cl_countdown_text Text = <tex>
	if ($calibrate_lag_section = audio)
		SoundEvent \{Event = GH_SFX_HitNoteSoundEvent}
	endif
endscript

script menu_calibrate_lag_create_circles 
	PlaySound \{Heavy_Crowd_Loop_Good_01
		buss = DEFAULT
		vol = 1
		num_loops = -1}
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if ($calibrate_lag_section = NONE)
		ui_flow_manager_respond_to_action \{action = show_dialog_1}
		return
	endif
	CreateScreenElement {
		PARENT = cl_container Type = TextElement font = ($calibrate_lag_menu_font) rgba = ($menu_unfocus_color)
		Id = clm_dummy_event_handler
		Text = ""
		z_priority = <Z>
	}
	LaunchEvent \{Type = Focus
		Target = clm_dummy_event_handler}
	LaunchEvent \{Type = unfocus
		Target = cl_vmenu}
	clean_up_user_control_helpers
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
	add_user_control_helper \{Text = "STRUM"
		button = Strumbar
		Z = 100}
	destroy_menu \{menu_id = cl_scroll}
	destroy_menu \{menu_id = calibrate_lag_hilite}
	kill_debug_elements
	init_play_log
	generic_menu_pad_choose_sound
	displaySprite {
		Id = cl_countdown_circle
		PARENT = cl_container
		tex = Song_Summary_Circle_2p
		Pos = ($calibrate_lag_menu_line_pos + (13.0, 14.0))
		rgba = [220 220 220 208]
		Dims = (72.0, 72.0)
		Z = 199
	}
	CreateScreenElement {
		Type = TextElement
		Id = cl_countdown_text
		PARENT = cl_container
		Pos = ($calibrate_lag_menu_line_pos + (47.0, 58.0))
		Scale = (1.0, 1.0)
		Text = ""
		font = ($calibrate_lag_menu_font)
		rgba = [0 0 0 255]
		z_priority = 200
	}
	<sep> = ($calibrate_lag_menu_circle_separation * 1.0)
	<vel> = ($calibrate_lag_menu_circle_velocity * 1.0)
	<seconds_between_circles> = (<sep> / <vel>)
	<I> = 0
	begin
	SpawnScriptNow \{cl_do_ping
		Params = {
			Time = 0.6
		}}
	SpawnScriptNow play_calibrate_click Params = {<...>}
	Wait (<seconds_between_circles> + 0.01) Seconds
	<I> = (<I> + 1)
	repeat 3
	Change \{calibrate_lag_circle_index = 0}
	half_circle_width = 0
	circle_index = 0
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <circle_index>
	circle_pos = (($calibrate_lag_menu_circle_inital_pos) - ((0.0, 1.0) * <circle_index> * ($calibrate_lag_menu_circle_separation)))
	<one_frame> = ((1.0 / 60.0) * $calibrate_lag_menu_circle_velocity)
	CastToInteger \{one_frame}
	<y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - <circle_pos>.(0.0, 1.0))
	<Steps> = (<y_off> / <one_frame>)
	CastToInteger \{Steps}
	<new_y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - (<Steps> * <one_frame>))
	<circle_pos> = ((<circle_pos>.(1.0, 0.0) * (1.0, 0.0)) + (<new_y_off> * (0.0, 1.0)))
	circle_alpha = 0.5
	if ($calibrate_lag_section = audio)
		<circle_alpha> = 0
	endif
	CreateScreenElement {
		Type = SpriteElement
		PARENT = cl_container
		texture = Options_Calibrate_Note
		Id = <circle_id>
		Pos = <circle_pos>
		Dims = ($calibrate_lag_menu_circle_dims)
		just = [LEFT Top]
		rgba = [255 255 255 255]
		z_priority = (<Z> + 51)
		Alpha = <circle_alpha>
	}
	<circle_id> :SetTags existence = 0 hit = 0 check = 1
	<circle_id> :SetTags initial_position = <circle_pos>
	<circle_id> :SetTags time_requirement = (<Steps> * (1.0 / 60.0))
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	LaunchEvent \{Type = unfocus
		Target = root_window}
	Wait \{1
		GameFrame}
	Change \{cl_ready_for_input = 0}
	SpawnScriptNow \{cl_do_ping
		Params = {
			Time = 0.6
		}}
	SpawnScriptNow do_calibration_update Params = {device_num = <device_num>}
	Wait \{0.563
		Seconds}
	SetScreenElementProps \{Id = cl_countdown_text
		Text = "GO!"
		Scale = 0.7}
	if ($calibrate_lag_section = audio)
		SoundEvent \{Event = GH_SFX_HitNoteSoundEvent}
	endif
	cl_ping_ID :DoMorph \{Alpha = 0}
	Wait \{0.4
		Seconds}
	SetScreenElementProps \{Id = cl_countdown_circle
		Alpha = 0}
	Change \{cl_ready_for_input = 1}
	DoScreenElementMorph \{Id = calibrate_lag_target
		Alpha = 1}
	Wait \{1
		GameFrame}
	SetScreenElementProps \{Id = cl_countdown_text
		Alpha = 0}
endscript

script menu_calibrate_go_back 
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if ScreenElementExists \{Id = cl_scroll}
		LaunchEvent \{Type = unfocus
			Target = cl_scroll}
	endif
	if ScreenElementExists \{Id = cl_vmenu}
		LaunchEvent \{Type = unfocus
			Target = cl_vmenu}
	endif
	if ($calibrate_lag_dirty = 1)
		ui_flow_manager_respond_to_action \{action = Continue}
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script menu_calibrate_lag_destroy_circles 
	circle_index = 0
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <circle_index>
	destroy_menu menu_id = <circle_id>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	destroy_menu \{menu_id = clm_dummy_event_handler}
endscript

script do_calibration_update 
	<circle_index> = 0
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <circle_index>
	<circle_id> :SetTags sounded = 0 pinged = 0
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	begin
	circle_index = 0
	num_circles_gone = 0
	delta_time = (1.0 / 60.0)
	if (($calibrate_lag_end_checks = 0) && $cl_ready_for_input)
		if ControllerMake UP <device_num>
			SpawnScriptNow menu_calibrate_lag_do_guitar_check_up_down Params = {device_num = <device_num>}
		endif
		if ControllerMake DOWN <device_num>
			SpawnScriptNow menu_calibrate_lag_do_guitar_check_up_down Params = {device_num = <device_num>}
		endif
		if ControllerMake X <device_num>
			SpawnScriptNow menu_calibrate_lag_do_guitar_check_choose Params = {device_num = <device_num>}
		endif
	endif
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <circle_index>
	<circle_id> :GetTags
	<existence> = (<existence> + <delta_time>)
	update_difference = (<delta_time>)
	position_change = (<update_difference> * ($calibrate_lag_menu_circle_velocity))
	CastToInteger \{position_change}
	GetScreenElementPosition Id = <circle_id>
	<ScreenELementPos> = (<ScreenELementPos> + (0.0, 1.0) * <position_change>)
	<target_pos> = ($calibrate_lag_menu_line_pos)
	diff = ((<ScreenELementPos>.(0.0, 1.0)) - (<target_pos>.(0.0, 1.0)))
	if (<diff> < 0)
		<diff> = (0 - <diff>)
	endif
	if IsXENON
		<cl_tweak> = ($calibrate_lag_tick_ms_offset_xenon / 1000.0)
	else
		<cl_tweak> = ($calibrate_lag_tick_ms_offset_ps3 / 1000.0)
	endif
	if ((($calibrate_lag_menu_circle_velocity) * <cl_tweak>) >= <diff>)
		if (<sounded> = 0)
			if ($calibrate_lag_section = audio)
				SoundEvent \{Event = GH_SFX_HitNoteSoundEvent}
			endif
			<circle_id> :SetTags sounded = 1
		endif
	endif
	if (<diff> < <position_change>)
		circle_alpha = 1
		if ($calibrate_lag_section = audio)
			<circle_alpha> = 0
		endif
		SetScreenElementProps Id = <circle_id> rgba = [135 0 180 255] Alpha = <circle_alpha>
	endif
	if ((<ScreenELementPos>.(0.0, 1.0)) > ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.0))))
		if (<hit> = 0 && <check> = 1)
			Change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
			<circle_id> :SetTags check = 0
		endif
		<num_circles_gone> = (<num_circles_gone> + 1)
		<circle_id> :Obj_SpawnScriptNow cl_fade_circle Params = {Id = <circle_id>}
	endif
	<circle_id> :SetProps Pos = (<ScreenELementPos>)
	<circle_id> :SetTags existence = <existence>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_circles_gone> = $calibrate_lag_menu_num_circles)
		SpawnScriptLater \{kill_off_and_finish_calibration}
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script cl_fade_circle 
	if ($calibrate_lag_section = video)
		<Id> :DoMorph rgba = [0 0 0 255] Alpha = 0.5 Time = 0.009
	endif
endscript

script cl_do_ping \{Time = 0.066}
	cl_ping_ID :DoMorph \{Scale = 10
		Alpha = 0}
	cl_ping_ID :DoMorph Scale = 1 Alpha = 1 Motion = ease_in Time = <Time>
	cl_ping_ID :DoMorph \{Alpha = 0
		Motion = ease_in
		Time = 0.1}
endscript

script menu_calibrate_lag_do_guitar_check_choose 
	if ($calibrate_lag_end_checks = 0)
		if NOT IsGuitarController controller = <device_num>
			menu_calibrate_lag_say_lines_are_even
		endif
	endif
endscript

script menu_calibrate_lag_do_guitar_check_up_down 
	if ($calibrate_lag_end_checks = 0)
		if IsGuitarController controller = <device_num>
			menu_calibrate_lag_say_lines_are_even
		endif
	endif
endscript

script menu_calibrate_lag_say_lines_are_even 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	FormatText ChecksumName = circle_id 'circle%d' D = ($calibrate_lag_circle_index)
	if NOT ScreenElementExists Id = <circle_id>
		return
	endif
	if NOT ScreenElementExists \{Id = calibrate_lag_target}
		return
	endif
	<circle_id> :GetTags
	GetScreenElementPosition Id = <circle_id>
	GetScreenElementDims Id = <circle_id>
	input_difference = (<time_requirement> - <existence>)
	new_input_diff = (<input_difference> * 1000)
	<new_input_diff> = (0 - <new_input_diff>)
	if (<new_input_diff> < $calibrate_lag_early_window)
		return
	endif
	if (<new_input_diff> > $calibrate_lag_late_window)
		return
	endif
	SetArrayElement ArrayName = calibrate_lag_results GlobalArray Index = ($calibrate_lag_circle_index) NewValue = <new_input_diff>
	output_log_text "Calibrate: %o" O = <new_input_diff> Color = White
	get_closest_circle_above_line
	<circle_id> :SetTags hit = 1
	Change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
	<closest_id> :SetProps Hide
	calibrate_lag_target :DoMorph \{Scale = 1.5
		relative_scale
		Time = 0.05}
	calibrate_lag_target :DoMorph \{Scale = 1.0
		relative_scale
		Time = 0.05}
	if (($calibrate_lag_circle_index) = ($calibrate_lag_menu_num_circles))
		Change \{calibrate_lag_end_checks = 1}
		kill_off_and_finish_calibration
	endif
endscript

script kill_off_and_finish_calibration 
	if ScreenElementExists \{Id = clm_dummy_event_handler}
		LaunchEvent \{Type = unfocus
			Target = clm_dummy_event_handler}
	endif
	KillSpawnedScript \{Name = do_calibration_update}
	menu_calibrate_lag_finish_up_calibration
	menu_calibrate_lag_destroy_circles
	if ($calibrate_lag_section = dialog_2)
		ui_flow_manager_respond_to_action \{action = show_dialog_2}
	endif
endscript

script get_closest_circle_above_line 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	I = 0
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <I>
	GetScreenElementPosition Id = <circle_id>
	if ((<ScreenELementPos>.(0.0, 1.0)) < ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.25))))
		<circle_id> :GetTags
		if NOT (<hit>)
			return closest_id = <circle_id> hit = 1
		endif
	endif
	<I> = (<I> + 1)
	repeat $calibrate_lag_menu_num_circles hit = 0
	return closest_id = <circle_id>
endscript

script menu_calibrate_lag_finish_up_calibration 
	if ($calibrate_lag_started_finish = 1)
		return
	endif
	Change \{calibrate_lag_started_finish = 1}
	Min = 50000.0
	MAX = -50000.0
	Index = 0
	num_hit = 0
	total_val = 0.0
	begin
	FormatText ChecksumName = circle_id 'circle%d' D = <Index>
	if NOT ScreenElementExists Id = <circle_id>
		return
	endif
	<circle_id> :GetTags
	if (<hit>)
		<num_hit> = (<num_hit> + 1)
		val = ($calibrate_lag_results [<Index>])
		if (<val> < <Min>)
			<Min> = (<val>)
		endif
		if (<val> > <MAX>)
			<MAX> = (<val>)
		endif
		<total_val> = (<total_val> + <val>)
	endif
	<Index> = (<Index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_hit> > 2)
		<total_val> = (<total_val> - <Min>)
		<total_val> = (<total_val> - <MAX>)
		avg = (<total_val> / (<num_hit> - 2))
		if (<avg> < 0)
			<avg> = 0
		elseif (<avg> > $calibrate_lag_cap)
			<avg> = $calibrate_lag_cap
		endif
		CastToInteger \{avg}
		GetGlobalTags \{user_options}
		if ($calibrate_lag_section = audio)
			old_lag = <lag_calibration>
			SetGlobalTags user_options Params = {lag_calibration = ((<avg> * 1000) + 1000)}
		elseif ($calibrate_lag_section = video)
			StopSound \{Heavy_Crowd_Loop_Good_01}
			old_lag = <lag_calibration>
			<old_lag> = ((<old_lag> / 1000) - 1)
			CastToInteger \{old_lag}
			<old_lag> = ((<old_lag> * 1000) + 1000)
			SetGlobalTags user_options Params = {lag_calibration = (<old_lag> + <avg>)}
		endif
	endif
	if ($calibrate_lag_section = audio)
		Change \{calibrate_lag_section = dialog_2}
	elseif ($calibrate_lag_section = video)
		Change \{calibrate_lag_section = NONE}
	endif
	LaunchEvent \{Type = Focus
		Target = root_window}
	Wait \{30
		GameFrames}
	if ($calibrate_lag_section = NONE)
		destroy_calibrate_lag_menu
		create_calibrate_lag_menu from_in_game = ($calibrate_lag_most_recent_in_game_setting)
	endif
	if GotParam \{avg}
		if GotParam \{old_lag}
			CastToInteger \{avg}
			if NOT (<old_lag> = <avg>)
				Change \{calibrate_lag_dirty = 1}
			endif
		endif
	endif
endscript

script menu_calibrate_lag_reset_lag 
	generic_menu_up_or_down_sound
	GetGlobalTags \{user_options}
	if (<lag_calibration> = 1000)
		return
	endif
	SetGlobalTags \{user_options
		Params = {
			lag_calibration = 1000
		}}
	calibrate_lag_update_text
	Change \{calibrate_lag_dirty = 1}
endscript

script menu_calibrate_lag_manual_choose 
	SetScreenElementProps \{Id = calibrate_lag_hilite
		rgba = $calibrate_lag_hilite_selected}
	RunScriptOnScreenElement \{Id = calibrate_lag_hilite
		pulse_lag_hilite}
	SetScreenElementProps \{Id = cl_vmenu
		block_events}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = cl_container
		Id = cl_manual_adjust_handler
		event_handlers = [
			{pad_up menu_calibrate_lag_manual_up Params = {<...>}}
			{pad_down menu_calibrate_lag_manual_down Params = {<...>}}
			{pad_choose menu_calibrate_lag_manual_back}
			{pad_back menu_calibrate_lag_manual_back}
		]
	}
	LaunchEvent \{Type = Focus
		Target = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script pulse_lag_hilite 
	begin
	GetScreenElementProps \{Id = calibrate_lag_hilite}
	match_rgba rgba1 = <rgba> rgba2 = $calibrate_lag_hilite_selected
	if (<rgba_match> = 1)
		DoMorph \{Id = calibrate_lag_hilite
			Alpha = 0.6
			Time = 0.4
			Motion = ease_out}
		DoMorph \{Id = calibrate_lag_hilite
			Alpha = 1
			Time = 0.6
			Motion = ease_in}
	else
		DoMorph \{Id = calibrate_lag_hilite
			Alpha = 1
			Time = 0.2
			Motion = ease_out}
		break
	endif
	repeat
endscript

script menu_calibrate_lag_manual_back 
	SetScreenElementProps \{Id = calibrate_lag_hilite
		rgba = $calibrate_lag_hilite_unselected}
	SetScreenElementProps \{Id = cl_vmenu
		unblock_events}
	DestroyScreenElement \{Id = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_up 
	do_morph = 0
	if GotParam \{audio}
		arrow_id = cl_manual_adjust_up_arrow_audio
		if menu_calibrate_lag_adjust \{Value = 1
				for_audio = 1}
			do_morph = 1
		endif
	else
		arrow_id = cl_manual_adjust_up_arrow
		if menu_calibrate_lag_adjust \{Value = 1}
			do_morph = 1
		endif
	endif
	if (<do_morph> = 1)
		DoScreenElementMorph Id = <arrow_id> Scale = 1.5 relative_scale
		DoScreenElementMorph Id = <arrow_id> Scale = 1.0 relative_scale Time = 0.15
	endif
	generic_menu_up_or_down_sound
endscript

script menu_calibrate_lag_manual_down 
	do_morph = 0
	if GotParam \{audio}
		arrow_id = cl_manual_adjust_down_arrow_audio
		if menu_calibrate_lag_adjust \{Value = -1
				for_audio = 1}
			do_morph = 1
		endif
	else
		arrow_id = cl_manual_adjust_down_arrow
		if menu_calibrate_lag_adjust \{Value = -1}
			do_morph = 1
		endif
	endif
	if (<do_morph> = 1)
		DoScreenElementMorph Id = <arrow_id> Scale = 1.5 relative_scale
		DoScreenElementMorph Id = <arrow_id> Scale = 1.0 relative_scale Time = 0.15
	endif
	generic_menu_up_or_down_sound
endscript

script menu_calibrate_lag_adjust \{Value = 1
		for_audio = 0}
	GetGlobalTags \{user_options}
	<audio_calibration> = ((<lag_calibration> / 1000) - 1)
	CastToInteger \{audio_calibration}
	<video_calibration> = <lag_calibration>
	CastToInteger \{video_calibration}
	Mod A = <video_calibration> B = 1000
	<video_calibration> = <Mod>
	if (<for_audio> = 1)
		<audio_calibration> = (<audio_calibration> + <Value>)
		if (<audio_calibration> > $calibrate_lag_cap)
			<audio_calibration> = 0
		elseif (<audio_calibration> < 0)
			<audio_calibration> = $calibrate_lag_cap
		endif
	else
		<video_calibration> = (<video_calibration> + <Value>)
		if (<video_calibration> > $calibrate_lag_cap)
			<video_calibration> = 0
		elseif (<video_calibration> < 0)
			<video_calibration> = $calibrate_lag_cap
		endif
	endif
	<new_lag_calibration> = ((<audio_calibration> * 1000) + 1000)
	<new_lag_calibration> = (<new_lag_calibration> + <video_calibration>)
	Change \{calibrate_lag_dirty = 1}
	SetGlobalTags user_options Params = {lag_calibration = <new_lag_calibration>}
	calibrate_lag_update_text
	return \{TRUE}
endscript
