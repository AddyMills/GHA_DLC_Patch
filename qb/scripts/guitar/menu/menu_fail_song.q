is_boss_song = 0
is_guitar_controller = 0

script create_fail_song_menu 
	menu_font = fontgrid_title_gh3
	fail_song_menu_fade_out_lose_anim_sounds
	restore_player_selected_character_info \{player_status = player1_status}
	restore_player_selected_character_info \{player_status = player2_status}

	get_song_struct Song = ($current_song)
	if StructureContains Structure = <song_struct> boss
		Change \{is_boss_song = 1}
	else
		Change \{is_boss_song = 0}
	endif
	<Menu_pos> = (640.0, 420.0)
	<song_name_pos> = (640.0, 347.0)
	<completion_text_pos> = (640.0, 402.0)
	completion = 0
	get_song_end_time Song = ($current_song)
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
		if (<completion> > 99)
			completion = 99
		endif
	endif
	CastToInteger \{completion}
	if (($game_mode = p1_career))
		if ($is_boss_song = 1)
			<Menu_pos> = (640.0, 420.0)
		else
			<Menu_pos> = (640.0, 401.0)
			<song_name_pos> = (640.0, 338.0)
			<completion_text_pos> = (640.0, 390.0)
		endif
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		Min = ($difficulty_list_props.($current_difficulty).Index)
		MathMin A = <Min> B = ($difficulty_list_props.($current_difficulty2).Index)
		CastToInteger \{Min}
		difficulty_index = <Min>
		get_difficulty_text_upper DIFFICULTY = ($difficulty_list [<difficulty_index>])
	else
		get_difficulty_text_upper DIFFICULTY = ($current_difficulty)
	endif
	get_song_title Song = ($current_song)
	GetUpperCaseString <Song_Title>
	FormatText TextName = completion_text "%d" D = <completion>
	song_failed_off = (640.0, 217.0)
	Z = 100.0
	offwhite = [223 223 223 255]
	new_menu scrollid = fail_song_scrolling_menu vmenuid = fail_song_vmenu_id use_backdrop = 0 Spacing = -58 Menu_pos = <Menu_pos>
	create_pause_menu_frame Z = (<Z> - 10)
	SetScreenElementProps \{Id = fail_song_vmenu_id
		internal_just = [
			Center
			Center
		]}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = fail_song_static_text_container
		internal_just = [
			Center
			Center
		]
		Pos = (0.0, 0.0)
		z_priority = 2}
	displaySprite PARENT = fail_song_static_text_container tex = Dialog_Title_BG flip_v Pos = (416.0, 100.0) Dims = (224.0, 224.0) Z = <Z>
	displaySprite PARENT = fail_song_static_text_container tex = Dialog_Title_BG Pos = (640.0, 100.0) Dims = (224.0, 224.0) Z = <Z>
	if ($is_boss_song = 1)
		Title = "BATTLE LOST"
	else
		Title = "SONG FAILED"
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = fail_song_static_text_container
		font = <menu_font>
		Text = <Title>
		just = [Center Center]
		Pos = {<song_failed_off> Relative}
		rgba = [223 223 223 255]
		Scale = (1.2, 1.2)
		z_priority = (<Z> + 0.1)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((285.0, 0.0) + (<Height> * (0.0, 1.0))) keep_ar = 1 only_if_larger_x = 1 start_x_scale = 1.2 start_y_scale = 1.2
	if ($current_song = bossjoe)
		final_blow_powerup = -1
		<final_blow_powerup> = ($player2_status.final_blow_powerup)
		Printf Channel = trchen "FINAL BLOW %s" S = <final_blow_powerup>
		if (<final_blow_powerup> > -1)
			<completion_text_pos> = (420.0, 345.0)
			<completion_text_just> = [LEFT Center]
			<completion_fit_dims> = (400.0, 400.0)
			CreateScreenElement {
				Type = HMenu
				PARENT = fail_song_static_text_container
				Id = final_blow_stacker
				just = [RIGHT Center]
				Pos = (840.0, 400.0)
				internal_just = [RIGHT Center]
				Scale = <completion_text_scale>
			}
			<finalblow_scale> = 0.7
			CreateScreenElement {
				Type = TextElement
				font = <menu_font>
				PARENT = final_blow_stacker
				just = [Center Center]
				rgba = [210 130 0 255]
				Shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				z_priority = (<Z> + 0.1)
				Scale = <finalblow_scale>
				Text = "FINAL BLOW:"
				rgba = [223 223 223 255]
			}
			fit_text_in_rectangle {
				Id = <Id>
				Dims = (320.0, 400.0)
				keep_ar = 1
				only_if_larger_x = 1
				start_x_scale = <finalblow_scale>
				start_y_scale = <finalblow_scale>
			}
			CreateScreenElement \{Type = ContainerElement
				PARENT = final_blow_stacker
				Dims = (64.0, 64.0)}
			final_blow_attack_icon = ($battlemode_powerups [<final_blow_powerup>].card_texture)
			CreateScreenElement {
				Type = SpriteElement
				PARENT = <Id>
				texture = <final_blow_attack_icon>
				rgba = [255 255 255 255]
				just = [LEFT Top]
				Pos = (10.0, -5.0)
				Dims = (64.0, 64.0)
				z_priority = (<Z> + 0.1)
			}
		else
			<completion_text_pos> = (640.0, 368.0)
			<completion_text_just> = [Center Center]
			<completion_fit_dims> = (425.0, 400.0)
		endif
		CreateScreenElement {
			Type = HMenu
			PARENT = fail_song_static_text_container
			Id = fail_completion_stacker
			just = <completion_text_just>
			Pos = <completion_text_pos>
			internal_just = [Center Center]
			Scale = <completion_text_scale>
		}
		<completion_text_params> = {
			Type = TextElement
			font = <menu_font>
			PARENT = fail_completion_stacker
			just = [Center Center]
			rgba = (($G_menu_colors).pink)
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			z_priority = (<Z> + 0.1)
		}
		lost_text = "JOE PERRY "
		CreateScreenElement <completion_text_params> Scale = 2 Text = <lost_text> rgba = [223 223 223 255]
		CreateScreenElement <completion_text_params> Scale = 2 Text = "WINS" rgba = [223 223 223 255]
		CreateScreenElement <completion_text_params> Scale = 1 Text = " "
		CreateScreenElement <completion_text_params> Scale = 1 Text = "ON"
		CreateScreenElement <completion_text_params> Scale = 1 Text = " "
		CreateScreenElement <completion_text_params> Scale = 1 Text = <difficulty_text>
		SetScreenElementLock \{Id = fail_completion_stacker
			ON}
		fit_text_in_rectangle {
			Id = fail_completion_stacker
			Dims = <completion_fit_dims>
			keep_ar = 1
			only_if_larger_x = 1
			start_x_scale = <completion_text_scale>
			start_y_scale = <completion_text_scale>
		}
	else
		<song_title_scale> = 1.65
		fill_song_title_and_completion_details <...> PARENT = fail_song_static_text_container
	endif
	set_focus_color \{Color = pink}
	set_unfocus_color \{Color = dk_violet_grey}
	text_scale = (0.9, 0.95)
	if NOT English
		text_scale = (0.9, 0.85)
	endif
	displaySprite Id = hi_right PARENT = fail_song_static_text_container tex = Dialog_Highlight Pos = (770.0, 533.0) just [LEFT Top] Scale = (1.0, 1.0) Z = (<Z> + 0.3) rgba = (($G_menu_colors).pink)
	displaySprite Id = hi_left PARENT = fail_song_static_text_container tex = Dialog_Highlight flip_v just = [RIGHT Top] Pos = (500.0, 533.0) Scale = (1.0, 1.0) Z = (<Z> + 0.3) rgba = (($G_menu_colors).pink)
	if NOT GotParam \{exclusive_device}
		exclusive_device = ($primary_controller)
	endif
	demo_mode_disable = {}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = fail_song_vmenu_id
		event_handlers = [
			{Focus retry_highlight_focus Params = {Id = song_failed_retry}}
			{unfocus retail_menu_unfocus Params = {Id = song_failed_retry}}
			{pad_choose fail_song_menu_select_retry_song}
		]
		Dims = (100.0, 100.0)
		z_priority = (<Z> + 0.1)
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <Id>
		Id = song_failed_retry
		font = <menu_font>
		Text = "RETRY SONG"
		rgba = ($menu_unfocus_color)
		Scale = <text_scale>
		just = [Center Top]
	}
	SetScreenElementProps {
		Id = <Id>
		exclusive_device = <exclusive_device>
		Scale = <text_scale>
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 220)
		fit_text_in_rectangle Id = <Id> Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0)) start_x_scale = (<text_scale>.(1.0, 0.0)) start_y_scale = (<text_scale>.(0.0, 1.0))
	endif
	Change \{is_guitar_controller = 0}
	player_device = ($primary_controller)
	if IsGuitarController controller = <player_device>
		Change \{is_guitar_controller = 1}
	endif
	if (($game_mode = p1_career && $is_boss_song = 0))
		CreateScreenElement {
			Type = ContainerElement
			PARENT = fail_song_vmenu_id
			event_handlers = [
				{Focus practice_highlight_focus Params = {Id = song_failed_practice}}
				{unfocus retail_menu_unfocus Params = {Id = song_failed_practice}}
				{pad_choose fail_song_menu_select_practice}
			]
			Dims = (100.0, 100.0)
			z_priority = (<Z> + 0.1)
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = <Id>
			Id = song_failed_practice
			font = <menu_font>
			Text = "PRACTICE"
			rgba = ($menu_unfocus_color)
			Scale = <text_scale>
			just = [Center Top]
		}
		SetScreenElementProps {
			Id = <Id>
			exclusive_device = <exclusive_device>
			Scale = <text_scale>
		}
		GetScreenElementDims Id = <Id>
		if (<width> > 220)
			fit_text_in_rectangle Id = <Id> Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0))
		endif
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG Pos = (460.0, 412.0) Dims = (360.0, 122.0) Z = <Z>
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG flip_h Pos = (460.0, 534.0) Dims = (360.0, 122.0) Z = <Z>
	elseif ($is_boss_song = 1 && $is_guitar_controller = 1)
		CreateScreenElement {
			Type = ContainerElement
			PARENT = fail_song_vmenu_id
			event_handlers = [
				{Focus practice_highlight_focus Params = {Id = song_failed_tutorial}}
				{unfocus retail_menu_unfocus Params = {Id = song_failed_tutorial}}
				{pad_choose fail_song_menu_select_tutorial}
			]
			Dims = (100.0, 100.0)
			z_priority = (<Z> + 0.1)
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = <Id>
			Id = song_failed_tutorial
			font = <menu_font>
			Text = "TUTORIAL"
			rgba = ($menu_unfocus_color)
			Scale = <text_scale>
			just = [Center Top]
		}
		SetScreenElementProps {
			Id = <Id>
			exclusive_device = <exclusive_device>
			Scale = <text_scale>
		}
		GetScreenElementDims Id = <Id>
		if (<width> > 220)
			fit_text_in_rectangle Id = <Id> Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0))
		endif
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG Pos = (460.0, 427.0) Dims = (360.0, 122.0) Z = <Z>
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG flip_h Pos = (460.0, 549.0) Dims = (360.0, 122.0) Z = <Z>
	else
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG Pos = (460.0, 430.0) Dims = (360.0, 100.0) Z = <Z>
		displaySprite PARENT = fail_song_static_text_container tex = Dialog_BG flip_h Pos = (460.0, 530.0) Dims = (360.0, 100.0) Z = <Z>
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = fail_song_vmenu_id
		event_handlers = [
			{Focus newsong_highlight_focus Params = {Id = song_failed_new_song}}
			{unfocus retail_menu_unfocus Params = {Id = song_failed_new_song}}
			{pad_choose fail_song_menu_select_new_song}
		]
		Dims = (100.0, 100.0)
		z_priority = (<Z> + 0.1)
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <Id>
		Id = song_failed_new_song
		font = <menu_font>
		Text = "NEW SONG"
		rgba = ($menu_unfocus_color)
		Scale = <text_scale>
		just = [Center Top]
	}
	SetScreenElementProps {
		Id = <Id>
		exclusive_device = <exclusive_device>
		Scale = <text_scale>
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 220)
		fit_text_in_rectangle Id = <Id> Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = fail_song_vmenu_id
		event_handlers = [
			{Focus quit_highlight_focus Params = {Id = song_failed_new_quit}}
			{unfocus retail_menu_unfocus Params = {Id = song_failed_new_quit}}
			{pad_choose fail_song_menu_select_quit}
		]
		Dims = (100.0, 100.0)
		z_priority = (<Z> + 0.1)
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <Id>
		Id = song_failed_new_quit
		font = <menu_font>
		Text = "QUIT"
		rgba = ($menu_unfocus_color)
		Scale = <text_scale>
		just = [Center Top]
	}
	SetScreenElementProps {
		Id = <Id>
		exclusive_device = <exclusive_device>
		Scale = <text_scale>
	}
	GetScreenElementDims Id = <Id>
	if (<width> > 220)
		fit_text_in_rectangle Id = <Id> Dims = ((220.0, 0.0) + <Height> * (0.0, 1.0))
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
		Z = 10000}
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar
		Z = 10000}
	PauseGame
	kill_start_key_binding
endscript

script fail_song_menu_fade_out_lose_anim_sounds 
	SetSoundParams \{GH3_Guit_Axel_A_Loss1
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Guit_Axel_A_Loss2
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Drummer_Lose_01
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Drummer_Lose_02
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Guit_Izzy_A_Loss1
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Guit_John_A_Loss1
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Guit_John_A_Loss2
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Guitarist_Judy_A_loss_armsUp
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Guitarist_Judy_A_loss_stomp
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Guit_Lars_A_Win2
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Singer_male_NSLose4
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Guit_xavi_A_Loss4
		vol = 0
		Time = 1.0}
	SetSoundParams \{GH3_Singer_Steven_Lose01
		vol = 0
		Time = 1.0}
endscript

script fail_song_menu_select_tutorial 
	player_device = ($primary_controller)
	if IsGuitarController controller = <player_device>
		ui_flow_manager_respond_to_action \{action = select_tutorial}
	endif
endscript

script destroy_fail_song_menu 
	clean_up_user_control_helpers
	restore_start_key_binding
	destroy_menu \{menu_id = fail_song_scrolling_menu}
	destroy_pause_menu_frame
	destroy_menu \{menu_id = fail_song_static_text_container}
endscript

script fail_song_menu_select_practice 
	GH3_SFX_fail_song_stop_sounds
	ui_flow_manager_respond_to_action \{action = select_practice}
endscript

script fail_song_menu_select_retry_song 
	GH3_SFX_fail_song_stop_sounds
	UnPauseGame
	ui_flow_manager_respond_to_action \{action = select_retry}
	restart_song
endscript

script fail_song_menu_select_new_song 
	GH3_SFX_fail_song_stop_sounds
	if ($coop_dlc_active = 1)
		Change \{game_mode = p2_faceoff}
	endif
	ui_flow_manager_respond_to_action \{action = select_new_song}
endscript

script fail_song_menu_select_quit 
	ui_flow_manager_respond_to_action \{action = select_quit}
endscript

script retry_highlight_focus 
	retail_menu_focus Id = <Id>
	if ScreenElementExists \{Id = hi_left}
		if ScreenElementExists \{Id = hi_right}
			GetScreenElementDims Id = <Id>
			SetScreenElementProps Id = hi_left Pos = ((635.0, 475.0) - <width> * (0.5, 0.0)) flip_v
			SetScreenElementProps Id = hi_right Pos = ((645.0, 475.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						SetScreenElementProps Id = hi_left Pos = ((635.0, 471.0) - <width> * (0.5, 0.0)) flip_v
						SetScreenElementProps Id = hi_right Pos = ((645.0, 471.0) + <width> * (0.5, 0.0))
					endif
				else
					SetScreenElementProps Id = hi_left Pos = ((635.0, 455.0) - <width> * (0.5, 0.0)) flip_v
					SetScreenElementProps Id = hi_right Pos = ((645.0, 455.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script practice_highlight_focus 
	retail_menu_focus Id = <Id>
	if ScreenElementExists \{Id = hi_left}
		if ScreenElementExists \{Id = hi_right}
			GetScreenElementDims Id = <Id>
			SetScreenElementProps Id = hi_left Pos = ((635.0, 495.0) - <width> * (0.5, 0.0)) flip_v
			SetScreenElementProps Id = hi_right Pos = ((645.0, 495.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						SetScreenElementProps Id = hi_left Pos = ((635.0, 515.0) - <width> * (0.5, 0.0)) flip_v
						SetScreenElementProps Id = hi_right Pos = ((645.0, 515.0) + <width> * (0.5, 0.0))
					endif
				else
					SetScreenElementProps Id = hi_left Pos = ((635.0, 495.0) - <width> * (0.5, 0.0)) flip_v
					SetScreenElementProps Id = hi_right Pos = ((645.0, 495.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script newsong_highlight_focus 
	retail_menu_focus Id = <Id>
	if ScreenElementExists \{Id = hi_left}
		if ScreenElementExists \{Id = hi_right}
			GetScreenElementDims Id = <Id>
			SetScreenElementProps Id = hi_left Pos = ((635.0, 515.0) - <width> * (0.5, 0.0)) flip_v
			SetScreenElementProps Id = hi_right Pos = ((645.0, 515.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						SetScreenElementProps Id = hi_left Pos = ((635.0, 555.0) - <width> * (0.5, 0.0)) flip_v
						SetScreenElementProps Id = hi_right Pos = ((645.0, 555.0) + <width> * (0.5, 0.0))
					endif
				else
					SetScreenElementProps Id = hi_left Pos = ((635.0, 535.0) - <width> * (0.5, 0.0)) flip_v
					SetScreenElementProps Id = hi_right Pos = ((645.0, 535.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script quit_highlight_focus 
	retail_menu_focus Id = <Id>
	if ScreenElementExists \{Id = hi_left}
		if ScreenElementExists \{Id = hi_right}
			GetScreenElementDims Id = <Id>
			SetScreenElementProps Id = hi_left Pos = ((635.0, 555.0) - <width> * (0.5, 0.0)) flip_v
			SetScreenElementProps Id = hi_right Pos = ((645.0, 555.0) + <width> * (0.5, 0.0))
			if ($game_mode = p1_career)
				if ($is_boss_song = 1)
					if ($is_guitar_controller = 1)
						SetScreenElementProps Id = hi_left Pos = ((635.0, 596.0) - <width> * (0.5, 0.0)) flip_v
						SetScreenElementProps Id = hi_right Pos = ((645.0, 596.0) + <width> * (0.5, 0.0))
					endif
				else
					SetScreenElementProps Id = hi_left Pos = ((635.0, 575.0) - <width> * (0.5, 0.0)) flip_v
					SetScreenElementProps Id = hi_right Pos = ((645.0, 575.0) + <width> * (0.5, 0.0))
				endif
			endif
		endif
	endif
endscript

script fill_song_title_and_completion_details 
	RequireParams \{[
			PARENT
			UpperCaseString
		]
		All}
	CreateScreenElement {
		Type = TextElement
		PARENT = <PARENT>
		Id = fail_song_song_name
		font = <menu_font>
		just = [Center Center]
		Text = <UpperCaseString>
		Pos = <song_name_pos>
		rgba = [223 223 223 255]
		Scale = <song_title_scale>
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<Z> + 0.1)
	}
	fit_text_in_rectangle {
		Id = fail_song_song_name
		Dims = (430.0, 65.0)
		keep_ar = 1
		only_if_larger_x = 1
		start_x_scale = <song_title_scale>
		start_y_scale = <song_title_scale>
	}
	<completion_text_scale> = 0.5
	CreateScreenElement {
		Type = HMenu
		PARENT = <PARENT>
		Id = fail_completion_stacker
		just = [Center Center]
		Pos = <completion_text_pos>
		internal_just = [Center Center]
		Scale = <completion_text_scale>
	}
	<completion_text_params> = {
		Type = TextElement
		font = <menu_font>
		PARENT = fail_completion_stacker
		just = [Center Center]
		rgba = (($G_menu_colors).light_brown)
		Shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
		z_priority = (<Z> + 0.1)
	}
	CreateScreenElement <completion_text_params> Scale = 1 Text = "COMPLETED"
	CreateScreenElement <completion_text_params> Scale = 1 Text = " "
	CreateScreenElement <completion_text_params> Scale = 2 Text = <completion_text>
	CreateScreenElement <completion_text_params> Scale = 1 Text = "% "
	CreateScreenElement <completion_text_params> Scale = 1 Text = "ON"
	CreateScreenElement <completion_text_params> Scale = 1 Text = " "
	CreateScreenElement <completion_text_params> Scale = 2 Text = <difficulty_text>
	SetScreenElementLock \{Id = fail_completion_stacker
		ON}
	fit_text_in_rectangle {
		Id = fail_completion_stacker
		Dims = (405.0, 400.0)
		keep_ar = 1
		only_if_larger_x = 1
		start_x_scale = <completion_text_scale>
		start_y_scale = <completion_text_scale>
	}
endscript
