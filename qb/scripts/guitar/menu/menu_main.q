g_mm_base_menu_pos = (874.0, 360.0)
g_mm_menu_max_width = 220

script create_main_menu_backdrop 
	shut_down_character_hub
	create_menu_backdrop \{texture = GH3_Main_Menu_BG}
	CreateScreenElement {
		Type = ContainerElement
		Id = main_menu_text_container
		PARENT = root_window
		Pos = ($g_mm_base_menu_pos)
		just = [LEFT Top]
		z_priority = 3
	}
	CreateScreenElement \{Type = ContainerElement
		Id = main_menu_bg_container
		PARENT = root_window
		Pos = (0.0, 0.0)
		z_priority = 3}
	CreateScreenElement \{Type = SpriteElement
		Id = main_menu_godrays1
		PARENT = main_menu_bg_container
		texture = Main_Menu_BG2
		Pos = (400.0, 330.0)
		Dims = (1280.0, 1280.0)
		just = [
			Center
			Center
		]
		z_priority = 1
		Alpha = 0
		BLEND = Add}
	RunScriptOnScreenElement Id = <Id> rotate_menu_element Params = {Time = 30 Id = <Id>}
	CreateScreenElement \{Type = SpriteElement
		Id = main_menu_godrays2
		PARENT = main_menu_bg_container
		texture = Main_Menu_BG2
		Pos = (400.0, 330.0)
		Dims = (1280.0, 1280.0)
		just = [
			Center
			Center
		]
		z_priority = 1
		Alpha = 0
		BLEND = Add
		flip_v}
	RunScriptOnScreenElement Id = <Id> rotate_menu_element Params = {Time = 60 Id = <Id>}
	CreateScreenElement \{Type = SpriteElement
		PARENT = main_menu_bg_container
		texture = Main_Menu_illustrations
		Pos = (55.0, 0.0)
		Dims = (720.0, 720.0)
		just = [
			LEFT
			Top
		]
		z_priority = 2
		Alpha = 0.9}
	CreateScreenElement \{Type = SpriteElement
		PARENT = main_menu_bg_container
		texture = Main_Menu_logo
		Pos = (870.0, 65.0)
		Scale = 1
		just = [
			Center
			Top
		]
		z_priority = 2}
endscript
main_menu_movie_first_time = 1

script create_main_menu 
	ResetScoreUpdateReady
	GetGlobalTags \{user_options}
	menu_audio_settings_update_guitar_volume vol = <guitar_volume>
	menu_audio_settings_update_band_volume vol = <band_volume>
	menu_audio_settings_update_sfx_volume vol = <sfx_volume>
	SetSoundBussParams {Crowd = {vol = ($Default_BussSet.Crowd.vol)}}
	if ($main_menu_movie_first_time = 0)
		FadeToBlack \{ON
			Time = 0
			Alpha = 1.0
			z_priority = 900}
	endif
	create_main_menu_backdrop
	if ($main_menu_movie_first_time = 0 && $invite_controller = -1)
		Change \{main_menu_movie_first_time = 1}
		FadeToBlack \{OFF
			Time = 0}
	endif
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	kill_start_key_binding
	UnPauseGame
	Change \{current_num_players = 1}
	Change StructureName = player1_status controller = ($primary_controller)
	Change \{player_controls_valid = 0}
	disable_pause
	SpawnScriptNow \{Menu_Music_On}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] NOT_FOCUSABLE}
	else
		demo_mode_disable = {}
	endif
	DeRegisterAtoms
	RegisterAtoms \{Name = Achievement
		$Achievement_Atoms}
	Change \{setlist_previous_tier = 1}
	Change \{setlist_previous_song = 0}
	Change \{setlist_previous_tab = tab_setlist}
	Change \{current_song = beyondbeautiful}
	Change \{end_credits = 0}
	Change \{battle_sudden_death = 0}
	Change \{StructureName = player1_status
		character_id = Axel}
	Change \{StructureName = player2_status
		character_id = Axel}
	safe_create_gh3_pause_menu
	new_menu {
		scrollid = main_menu_scrolling_menu
		vmenuid = vmenu_main_menu
		use_backdrop = 0
		Menu_pos = ($g_mm_base_menu_pos)
		focus_color = dk_violet_red
		unfocus_color = md_violet_grey
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound Params = {UP}}
			{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
		]
	}
	Change \{rich_presence_context = presence_main_menu}
	<text_x_scale> = 0.8
	<text_y_scale> = 1.0
	text_params = {
		Type = TextElement
		font = text_a5
		Scale = ((<text_x_scale> * (1.0, 0.0)) + (<text_y_scale> * (0.0, 1.0)))
		rgba = (($G_menu_colors).md_violet_grey)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($G_menu_colors).Block)
		z_priority = 60
	}
	<menu_offset> = (0.0, 45.0)
	<HLBar_dims> = (240.0, 45.0)
	<BE_dims> = (32.0, 46.0)
	<BEL_pos> = ((((<HLBar_dims>.(-1.0, 0.0)) / 2) * (1.0, 0.0)) + (-16.0, 0.0))
	<BER_pos> = ((((<HLBar_dims>.(1.0, 0.0)) / 2) * (1.0, 0.0)) + (16.0, 0.0))
	mm_hilite_color = (($G_menu_colors).lt_plum)
	CreateScreenElement \{Type = ContainerElement
		Id = main_menu_career
		PARENT = vmenu_main_menu
		event_handlers = [
			{
				Focus
				main_menu_highlight
				Params = {
					option = 'career'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				Params = {
					option = 'career'
				}
			}
			{
				pad_choose
				main_menu_select_career
			}
		]}
	CreateScreenElement {
		<text_params>
		PARENT = main_menu_career
		Id = main_menu_career_text
		Text = "CAREER"
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle {
		Id = <Id>
		Dims = ((<Height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement \{Type = ContainerElement
		Id = main_menu_career_HL
		Pos = (0.0, -8.0)
		PARENT = main_menu_career
		Alpha = 0}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_career_HLBar
		PARENT = main_menu_career_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <HLBar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_career_BEL
		PARENT = main_menu_career_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_career_BER
		PARENT = main_menu_career_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{Id = main_menu_career_HL
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement \{Type = ContainerElement
		Id = main_menu_quickplay
		PARENT = vmenu_main_menu
		event_handlers = [
			{
				Focus
				main_menu_highlight
				Params = {
					option = 'quickplay'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				Params = {
					option = 'quickplay'
				}
			}
			{
				pad_choose
				main_menu_select_quickplay
			}
		]}
	CreateScreenElement {
		<text_params>
		PARENT = main_menu_quickplay
		Id = main_menu_quickplay_text
		Pos = (<menu_offset>)
		Text = "QUICKPLAY"
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle {
		Id = <Id>
		Dims = ((<Height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		Id = main_menu_quickplay_HL
		PARENT = main_menu_career
		Pos = (<menu_offset> + (0.0, -8.0))
		Alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_quickplay_HLBar
		PARENT = main_menu_quickplay_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <HLBar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_quickplay_BEL
		PARENT = main_menu_quickplay_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_quickplay_BER
		PARENT = main_menu_quickplay_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{Id = main_menu_quickplay_HL
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement \{Type = ContainerElement
		Id = main_menu_multiplayer
		PARENT = vmenu_main_menu
		event_handlers = [
			{
				Focus
				main_menu_highlight
				Params = {
					option = 'multiplayer'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				Params = {
					option = 'multiplayer'
				}
			}
			{
				pad_choose
				main_menu_select_multiplayer
			}
		]}
	CreateScreenElement {
		<text_params>
		PARENT = main_menu_multiplayer
		Id = main_menu_multiplayer_text
		Pos = (<menu_offset> * 2)
		Text = "MULTIPLAYER"
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle {
		Id = <Id>
		Dims = ((<Height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		Id = main_menu_multiplayer_HL
		PARENT = main_menu_career
		Pos = ((<menu_offset> * 2) + (0.0, -8.0))
		Alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_multiplayer_HLBar
		PARENT = main_menu_multiplayer_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <HLBar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_multiplayer_BEL
		PARENT = main_menu_multiplayer_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_multiplayer_BER
		PARENT = main_menu_multiplayer_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{Id = main_menu_multiplayer_HL
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement {
		Type = ContainerElement
		Id = main_menu_training
		PARENT = vmenu_main_menu
		event_handlers = [
			{Focus main_menu_highlight Params = {option = 'training'}}
			{unfocus main_menu_unhighlight Params = {option = 'training'}}
			{pad_choose main_menu_select_training}
		]
		<demo_mode_disable>
	}
	CreateScreenElement {
		<text_params>
		PARENT = main_menu_training
		Id = main_menu_training_text
		Pos = (<menu_offset> * 3)
		Text = "TRAINING"
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle {
		Id = <Id>
		Dims = ((<Height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		Id = main_menu_training_HL
		PARENT = main_menu_career
		Pos = ((<menu_offset> * 3) + (0.0, -8.0))
		Alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_training_HLBar
		PARENT = main_menu_training_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <HLBar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_training_BEL
		PARENT = main_menu_training_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_training_BER
		PARENT = main_menu_training_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{Id = main_menu_training_HL
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement {
		Type = ContainerElement
		Id = main_menu_leaderboards
		PARENT = vmenu_main_menu
		event_handlers = [
			{Focus main_menu_highlight Params = {option = 'leaderboards'}}
			{unfocus main_menu_unhighlight Params = {option = 'leaderboards'}}
			{pad_choose main_menu_select_xbox_live}
		]
		<demo_mode_disable>
	}
	if IsXENON
		CreateScreenElement {
			<text_params>
			PARENT = main_menu_leaderboards
			Id = main_menu_leaderboards_text
			Pos = (<menu_offset> * 4)
			Text = "Xbox LIVE"
		}
	else
		CreateScreenElement {
			<text_params>
			PARENT = main_menu_leaderboards
			Id = main_menu_leaderboards_text
			Pos = (<menu_offset> * 4)
			Text = "ONLINE"
		}
	endif
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle {
		Id = <Id>
		Dims = ((<Height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		Id = main_menu_leaderboards_HL
		PARENT = main_menu_career
		Pos = ((<menu_offset> * 4) + (0.0, -8.0))
		Alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_leaderboards_HLBar
		PARENT = main_menu_leaderboards_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <HLBar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_leaderboards_BEL
		PARENT = main_menu_leaderboards_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_leaderboards_BER
		PARENT = main_menu_leaderboards_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{Id = main_menu_leaderboards_HL
		Scale = (1.0, 0.01)
		relative_scale}
	CreateScreenElement \{Type = ContainerElement
		Id = main_menu_options
		PARENT = vmenu_main_menu
		event_handlers = [
			{
				Focus
				main_menu_highlight
				Params = {
					option = 'options'
				}
			}
			{
				unfocus
				main_menu_unhighlight
				Params = {
					option = 'options'
				}
			}
			{
				pad_choose
				main_menu_select_options
			}
		]}
	CreateScreenElement {
		<text_params>
		PARENT = main_menu_options
		Id = main_menu_options_text
		Pos = (<menu_offset> * 5)
		Text = "OPTIONS"
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle {
		Id = <Id>
		Dims = ((<Height> * (0.0, 1.0)) + (($g_mm_menu_max_width) * (1.0, 0.0)))
		only_if_larger_x = 1
		start_x_scale = <text_x_scale>
		start_y_scale = <text_y_scale>
	}
	CreateScreenElement {
		Type = ContainerElement
		Id = main_menu_options_HL
		PARENT = main_menu_career
		Pos = ((<menu_offset> * 5) + (0.0, -8.0))
		Alpha = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_options_HLBar
		PARENT = main_menu_options_HL
		texture = hilite_bar_01
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <HLBar_dims>
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_options_BEL
		PARENT = main_menu_options_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BEL_pos>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = main_menu_options_BER
		PARENT = main_menu_options_HL
		texture = character_hub_hilite_bookend
		rgba = <mm_hilite_color>
		Alpha = 1
		Dims = <BE_dims>
		Pos = <BER_pos>
	}
	DoScreenElementMorph \{Id = main_menu_options_HL
		Scale = (1.0, 0.01)
		relative_scale}
	if ($enable_button_cheats = 1)
		CreateScreenElement \{Type = ContainerElement
			Id = main_menu_debug_menu
			PARENT = vmenu_main_menu
			event_handlers = [
				{
					Focus
					main_menu_highlight
					Params = {
						option = 'debug_menu'
					}
				}
				{
					unfocus
					main_menu_unhighlight
					Params = {
						option = 'debug_menu'
					}
				}
				{
					pad_choose
					ui_flow_manager_respond_to_action
					Params = {
						action = select_debug_menu
					}
				}
			]}
		CreateScreenElement {
			<text_params>
			Scale = (0.5, 0.5)
			PARENT = main_menu_debug_menu
			Id = main_menu_debug_menu_text
			Pos = (<menu_offset> * 6)
			Text = "DEBUG MENU"
		}
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
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar
		Z = 100}
	if NOT ($invite_controller = -1)
		Change \{invite_controller = -1}
		ui_flow_manager_respond_to_action \{action = select_xbox_live}
		FadeToBlack \{OFF
			Time = 0}
	else
		LaunchEvent \{Type = Focus
			Target = vmenu_main_menu}
	endif
endscript

script main_menu_highlight 
	<Time> = 0
	<A> = 0.6
	FormatText ChecksumName = text_id 'main_menu_%o_text' O = <option>
	SetScreenElementProps Id = <text_id> no_shadow
	DoScreenElementMorph {
		Id = <text_id>
		rgba = ($menu_focus_color)
		Time = <Time>
	}
	if NOT (<option> = 'debug_menu')
		FormatText ChecksumName = hl_id 'main_menu_%o_HL' O = <option>
		DoScreenElementMorph Id = <hl_id> Alpha = <A> Scale = (1.0, 1.0) Time = <Time>
		RunScriptOnScreenElement Id = <hl_id> wiggle_hilite Params = {Id = <hl_id>}
	endif
endscript

script main_menu_unhighlight 
	<Time> = 0.6
	FormatText ChecksumName = text_id 'main_menu_%o_text' O = <option>
	SetScreenElementProps Id = <text_id> Shadow shadow_offs = (3.0, 3.0) shadow_rgba = (($G_menu_colors).BLACK)
	DoScreenElementMorph {
		Id = <text_id>
		rgba = ($menu_unfocus_color)
		Time = (<Time> / 4)
	}
	if NOT (<option> = 'debug_menu')
		FormatText ChecksumName = hl_id 'main_menu_%o_HL' O = <option>
		DoScreenElementMorph Id = <hl_id> Alpha = 0.2 Scale = 1
		DoScreenElementMorph Id = <hl_id> Alpha = 0 Scale = 0.9 Time = <Time> Motion = ease_out
	endif
endscript

script wiggle_hilite 
	if NOT ScreenElementExists Id = <Id>
		return
	endif
	<Id> :DoMorph Pos = {(0.0, 2.0) Relative} Scale = 1.02 Time = 0.05
	<Id> :DoMorph Pos = {(0.0, -3.0) Relative} Scale = 0.97999996 Time = 0.05
	<Id> :DoMorph Pos = {(0.0, 1.0) Relative} Scale = 1.0 Time = 0.05
	return
endscript

script glow_new_downloads_text 
	begin
	if ScreenElementExists \{Id = new_downloads_text_glow}
		new_downloads_text_glow :DoMorph Alpha = 0 Time = <Time>
	endif
	if ScreenElementExists \{Id = new_downloads_text_glow}
		new_downloads_text_glow :DoMorph Alpha = 1 Time = <Time>
	endif
	repeat
endscript

script glow_menu_element \{ON = 1
		OFF = 1
		tween = 1}
	if NOT ScreenElementExists Id = <Id>
		return
	endif
	Wait RandomRange (0.0, 5.0) Seconds
	begin
	<Id> :DoMorph Alpha = 1 Time = <tween> Motion = smooth
	Wait <ON> Seconds
	<Id> :DoMorph Alpha = 0 Time = <tween> Motion = smooth
	Wait <OFF> Seconds
	repeat
endscript

script rotate_menu_element \{Time = 30}
	if NOT ScreenElementExists Id = <Id>
		return
	endif
	rot_interval = (<Time> / 4)
	Wait RandomRange (0.0, 2.0) Seconds
	Clockwise = Random (@ 1 @ 0 )
	if (<Clockwise> = 1)
		begin
		<Id> :DoMorph Alpha = 0 Rot_Angle = 0
		<Id> :DoMorph Rot_Angle = 90 Alpha = Random (@ 0.25 @ 0.5 )Time = <rot_interval>
		<Id> :DoMorph Rot_Angle = 180 Alpha = Random (@ 1.0 @ 0.0 )Time = <rot_interval>
		<Id> :DoMorph Rot_Angle = 270 Alpha = Random (@ 0.25 @ 0.5 )Time = <rot_interval>
		<Id> :DoMorph Rot_Angle = 359 Alpha = 0 Time = <rot_interval>
		repeat
	else
		begin
		<Id> :DoMorph Alpha = 0 Rot_Angle = 0
		<Id> :DoMorph Rot_Angle = -90 Alpha = Random (@ 0.25 @ 0.5 )Time = <rot_interval>
		<Id> :DoMorph Rot_Angle = -180 Alpha = Random (@ 1.0 @ 0.0 )Time = <rot_interval>
		<Id> :DoMorph Rot_Angle = -270 Alpha = Random (@ 0.25 @ 0.5 )Time = <rot_interval>
		<Id> :DoMorph Rot_Angle = -359 Alpha = 0 Time = <rot_interval>
		repeat
	endif
endscript

script destroy_main_menu 
	KillSpawnedScript \{Name = glow_new_downloads_text}
	clean_up_user_control_helpers
	PrintStruct X = ($ui_flow_manager_state)
	destroy_menu \{menu_id = main_menu_scrolling_menu}
	destroy_menu \{menu_id = main_menu_text_container}
	destroy_menu_backdrop
	DestroyScreenElement \{Id = main_menu_bg_container}
endscript

script main_menu_select_career 
	Change \{game_mode = p1_career}
	Change \{current_num_players = 1}
	Change \{StructureName = player1_status
		part = GUITAR}
	Change \{StructureName = player2_status
		part = GUITAR}
	ui_flow_manager_respond_to_action \{action = select_career}
endscript

script main_menu_select_quickplay 
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
	Change \{StructureName = player1_status
		part = GUITAR}
	Change \{StructureName = player2_status
		part = GUITAR}
	ui_flow_manager_respond_to_action \{action = select_quickplay}
endscript

script main_menu_select_multiplayer 
	Change \{game_mode = p2_faceoff}
	Change \{current_num_players = 2}
	Change \{StructureName = player1_status
		part = GUITAR}
	Change \{StructureName = player2_status
		part = GUITAR}
	ui_flow_manager_respond_to_action \{action = select_multiplayer}
endscript

script main_menu_select_training 
	Change \{game_mode = training}
	Change \{current_num_players = 1}
	Change \{came_to_practice_from = main_menu}
	Change \{StructureName = player1_status
		part = GUITAR}
	Change \{StructureName = player2_status
		part = GUITAR}
	ui_flow_manager_respond_to_action \{action = select_training}
endscript

script main_menu_select_xbox_live 
	ui_flow_manager_respond_to_action \{action = select_xbox_live}
endscript

script main_menu_select_options 
	ui_flow_manager_respond_to_action \{action = select_options}
endscript
