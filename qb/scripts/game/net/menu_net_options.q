save_changes_message = "You are about to exit the Player Options. Any changes made will not be saved if you continue. Would you like to SAVE your changes first?"

script create_online_options_menu \{menu_title = "OPTIONS"
		menu_subtitle = "ONLINE OPTIONS"
		menu_id = online_options_menu
		vmenu_id = online_options_vmenu}
	setup_options_globals
	CreateScreenElement {
		Type = VScrollingMenu
		PARENT = root_window
		Id = <menu_id>
		just = [Center Top]
		Dims = (256.0, 350.0)
		Pos = (($online_general_menu_pos) + (0.0, 182.0))
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = ((128.0, 0.0) + (-8.0, 0.0))
		just = [Center Top]
		internal_just = [Center Center]
		Dims = (256.0, 350.0)
		padding_scale = 1.5
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action Params = {action = go_back}}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound Params = {UP}}
			{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = Online_Background}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = online_menu_ui_container
		Pos = (0.0, 0.0)}
	displaySprite Id = Online_Frame_Crown PARENT = online_menu_ui_container tex = Online_Frame_Crown Pos = (($online_general_menu_pos) + (0.0, -48.0)) Dims = (192.0, 96.0) just = [Center Top] Z = 3
	displaySprite Id = online_menu_box_top PARENT = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = ($online_general_menu_pos) Dims = (256.0, 64.0) just = [Center Top] Z = 2
	displaySprite Id = online_menu_box_top_fill PARENT = online_menu_ui_container tex = window_fill_cap rgba = [0 0 0 200] Pos = ($online_general_menu_pos) Dims = (256.0, 64.0) just = [Center Top] Z = 2
	displaySprite Id = online_menu_box_body PARENT = online_menu_ui_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (($online_general_menu_pos) + (0.0, 64.0)) Dims = (256.0, 432.0) just = [Center Top] Z = 2 flip_h
	displaySprite Id = online_menu_box_body_fill PARENT = online_menu_ui_container tex = window_fill_body_large rgba = [0 0 0 200] Pos = (($online_general_menu_pos) + (0.0, 64.0)) Dims = (256.0, 432.0) just = [Center Top] Z = 2 flip_h
	displaySprite Id = online_menu_box_bottom PARENT = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (($online_general_menu_pos) + (0.0, 496.0)) Dims = (256.0, 64.0) just = [Center Top] Z = 2 flip_h
	displaySprite Id = online_menu_box_bottom_fill PARENT = online_menu_ui_container tex = window_fill_cap rgba = [0 0 0 200] Pos = (($online_general_menu_pos) + (0.0, 496.0)) Dims = (256.0, 64.0) just = [Center Top] Z = 2 flip_h
	displaySprite Id = online_title_bar PARENT = online_menu_ui_container tex = store_frame_bottom_bg rgba = ($online_light_blue) Pos = (($online_general_menu_pos) + (0.0, 128.0)) Dims = (256.0, 128.0) just = [Center Center] Z = 3
	displaySprite Id = online_highlight PARENT = online_menu_ui_container tex = hilite_bar_01 rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (632.0, 0.0)) Dims = (256.0, 40.0) just = [Center Top] Z = 3
	displaySprite Id = online_bookend1 PARENT = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (502.0, 20.0)) Dims = (40.0, 40.0) just = [Center Center] Z = 3 flip_v
	displaySprite Id = online_bookend2 PARENT = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) Pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (774.0, 20.0)) Dims = (40.0, 40.0) just = [Center Center] Z = 3
	CreateScreenElement {
		Type = TextElement
		PARENT = online_menu_ui_container
		font = text_a4
		Scale = (0.65000004, 0.75)
		rgba = ($online_medium_blue)
		Text = <menu_title>
		just = [Center Top]
		Pos = (($online_general_menu_pos) + (0.0, 32.0))
		z_priority = 3.0
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = online_menu_ui_container
		font = fontgrid_title_gh3
		Scale = (0.7, 0.75)
		rgba = ($online_dark_purple)
		Text = <menu_subtitle>
		just = [Center Top]
		Pos = (($online_general_menu_pos) + (0.0, 115.0))
		z_priority = 4.0
	}
	selectable_menu_items = 0
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.5, 0.75)
		rgba = ($online_light_blue)
		Text = "QUICK MATCH OPTIONS"
		just = [LEFT Top]
		z_priority = 4.0
	}
	<Id> :SetTags menu_item = <selectable_menu_items>
	<Id> :SetProps event_handlers = [
		{Focus online_general_menu_focus Params = {Id = <Id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose online_options_select_quickmatch_player}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	CreateScreenElement {
		Type = TextElement
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		Text = "GAME OPTIONS"
		just = [LEFT Top]
		z_priority = 4.0
	}
	<Id> :SetTags menu_item = <selectable_menu_items>
	<Id> :SetProps event_handlers = [
		{Focus online_general_menu_focus Params = {Id = <Id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose online_options_select_player_pref}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	set_online_menu_highlight_pos Menu_items = <selectable_menu_items>
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
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
	LaunchEvent Type = Focus Target = <vmenu_id>
endscript

script destroy_online_options_menu 
	if ScreenElementExists \{Id = online_menu_ui_container}
		DestroyScreenElement \{Id = online_menu_ui_container}
	endif
	if ScreenElementExists \{Id = online_options_menu}
		DestroyScreenElement \{Id = online_options_menu}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script online_options_select_quickmatch_player 
	ui_flow_manager_respond_to_action \{action = select_quickmatch_pref}
endscript

script online_options_select_player_pref 
	ui_flow_manager_respond_to_action \{action = select_player_pref}
endscript

script create_online_quickmatch_prefs \{menu_id = quickmatch_options_menu
		vmenu_id = quickmatch_options_vmenu}
	save_intial_option_values
	game_mode_vmenu_id = game_mode_selection
	game_mode_text_id = game_mode_selection_text
	difficulty_vmenu_id = difficulty_selection
	difficulty_text_id = difficulty_selection_text
	num_songs_vmenu_id = number_of_songs_selection
	num_songs_text_id = number_of_songs_selection_text
	tie_breaker_vmenu_id = tie_breaker_selection
	tie_breaker_text_id = tie_breaker_selection_text
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = quickmatch_options_container
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = VScrollingMenu
		PARENT = quickmatch_options_container
		Id = <menu_id>
		just = [Center Top]
		Dims = (500.0, 480.0)
		Pos = (640.0, 300.0)
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = (205.0, 0.0)
		just = [Center Top]
		internal_just = [LEFT Top]
		Dims = (500.0, 480.0)
		event_handlers = [
			{pad_back check_for_options_change_go_back}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound Params = {UP}}
			{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
			{pad_option check_for_options_change_go_forward}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = Online_Background}
	frame_dims = (665.0, 588.0)
	center_pos = ((640.0, 380.0))
	create_UI_frame {
		PARENT = quickmatch_options_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($G_menu_colors).online_fill_rgba)
		z_priority = 2
	}
	displaySprite \{Id = Online_Frame_Crown
		PARENT = quickmatch_options_container
		tex = Online_Frame_Crown
		Pos = (640.0, 42.0)
		just = [
			Center
			Top
		]
		Z = 3
		Dims = (256.0, 105.0)}
	if ($ui_flow_manager_state [0] = quickmatch_player_options_fs)
		Title = "QUICK MATCH: PLAYER"
		game_mode_global = OptionsGameModeValue
		num_songs_global = OptionsNumSongsValue
		difficulty_global = OptionsDifficultyValue
		button_down_events = 2
		player_match = 1
	else
		Title = "QUICK MATCH: RANKED"
		game_mode_global = OptionsGameModeRanked
		num_songs_global = OptionsNumSongsRanked
		difficulty_global = OptionsDifficultyRanked
		button_down_events = 3
		player_match = 0
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = quickmatch_options_container
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_light_purple)
		Text = <Title>
		Pos = (640.0, 153.0)
		just = [Center Top]
		z_priority = 10.0
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((500.0, 0.0) + (<Height> * (0.0, 1.0))) start_x_scale = 0.85 start_y_scale = 0.85 only_if_larger_x = 1
	CreateScreenElement {
		Type = TextElement
		Id = game_mode
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		Text = "GAME MODE:"
		just = [LEFT Top]
		z_priority = 10.0
		event_handlers = [
			{Focus net_custom_ui_focus Params = {this_ID = game_mode text_id = <game_mode_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus Params = {text_id = <game_mode_text_id>}}
			{pad_choose net_custom_ui_change_focus Params = {this_ID = game_mode text_id = <game_mode_text_id> to = <game_mode_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params Params = {copy_from = <game_mode_global> copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		Id = <game_mode_vmenu_id>
		PARENT = game_mode
		Pos = (550.0, 0.0)
		just = [LEFT Top]
		internal_just = [LEFT Top]
		event_handlers = [
			{pad_up animate_helper_arrows Params = {direction = UP}}
			{pad_down animate_helper_arrows Params = {direction = DOWN}}
			{pad_up net_custom_up_down Params = {Text = <game_mode_text_id> Global = CopyOfGlobal Type = mode direction = UP player_match = <player_match>}}
			{pad_down net_custom_up_down Params = {Text = <game_mode_text_id> Global = CopyOfGlobal Type = mode direction = DOWN player_match = <player_match>}}
			{pad_back net_commit_or_reset_params Params = {Text = <game_mode_text_id> Global = <game_mode_global> Type = mode}}
			{pad_back net_custom_ui_change_unfocus Params = {action = Back to = <vmenu_id> from = <game_mode_vmenu_id> Menu = options}}
			{pad_choose net_commit_or_reset_params Params = {commit copy_from = CopyOfGlobal copy_to = <game_mode_global>}}
			{pad_choose net_custom_ui_change_unfocus Params = {action = choose to = <vmenu_id> from = <game_mode_vmenu_id> Menu = options}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		Id = <game_mode_text_id>
		PARENT = <game_mode_vmenu_id>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		Text = ($FilterTypes.mode.values [($<game_mode_global>)])
		just = [LEFT Top]
		z_priority = 10.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 375
	if NOT ($ui_flow_manager_state [0] = quickmatch_player_options_fs)
		CreateScreenElement {
			Type = TextElement
			Id = DIFFICULTY
			PARENT = <vmenu_id>
			font = fontgrid_title_gh3
			Scale = 0.65000004
			rgba = ($online_light_blue)
			Text = "DIFFICULTY:"
			just = [LEFT Top]
			z_priority = 10.0
			event_handlers = [
				{Focus net_custom_ui_focus Params = {this_ID = DIFFICULTY text_id = <difficulty_text_id> VMenu = <vmenu_id>}}
				{unfocus net_custom_ui_unfocus Params = {text_id = <difficulty_text_id>}}
				{pad_choose net_custom_ui_change_focus Params = {this_ID = DIFFICULTY text_id = <difficulty_text_id> to = <difficulty_vmenu_id> from = <vmenu_id>}}
				{pad_choose net_copy_intial_params Params = {copy_from = <difficulty_global> copy_to = CopyOfGlobal}}
			]
		}
		CreateScreenElement {
			Type = VMenu
			Id = <difficulty_vmenu_id>
			PARENT = DIFFICULTY
			Pos = (550.0, 0.0)
			just = [LEFT Top]
			internal_just = [LEFT Top]
			event_handlers = [
				{pad_up animate_helper_arrows Params = {direction = UP}}
				{pad_down animate_helper_arrows Params = {direction = DOWN}}
				{pad_up net_custom_up_down Params = {Text = <difficulty_text_id> Global = CopyOfGlobal Type = diff direction = UP player_match = <player_match>}}
				{pad_down net_custom_up_down Params = {Text = <difficulty_text_id> Global = CopyOfGlobal Type = diff direction = DOWN player_match = <player_match>}}
				{pad_back net_commit_or_reset_params Params = {Text = <difficulty_text_id> Global = <difficulty_global> Type = diff}}
				{pad_back net_custom_ui_change_unfocus Params = {action = Back to = <vmenu_id> from = <difficulty_vmenu_id> Menu = options diff_focus}}
				{pad_choose net_commit_or_reset_params Params = {commit copy_from = CopyOfGlobal copy_to = <difficulty_global>}}
				{pad_choose net_custom_ui_change_unfocus Params = {action = choose to = <vmenu_id> from = <difficulty_vmenu_id> Menu = options diff_focus}}
			]
		}
		CreateScreenElement {
			Type = TextElement
			Id = <difficulty_text_id>
			PARENT = <difficulty_vmenu_id>
			font = fontgrid_title_gh3
			Scale = 1.0
			rgba = ($online_light_blue)
			Text = ($FilterTypes.diff.values [($<difficulty_global>)])
			just = [LEFT Top]
			z_priority = 10.0
		}
		fit_text_into_menu_item Id = <Id> max_width = 375
	endif
	CreateScreenElement {
		Type = TextElement
		Id = number_of_songs
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		Text = "NUMBER OF SONGS:"
		just = [LEFT Top]
		z_priority = 10.0
		event_handlers = [
			{Focus net_custom_ui_focus Params = {this_ID = number_of_songs text_id = <num_songs_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus Params = {text_id = <num_songs_text_id>}}
			{pad_choose net_custom_ui_change_focus Params = {this_ID = number_of_songs text_id = <num_songs_text_id> to = <num_songs_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params Params = {copy_from = <num_songs_global> copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		Id = <num_songs_vmenu_id>
		PARENT = number_of_songs
		Pos = (550.0, 0.0)
		just = [LEFT Top]
		internal_just = [LEFT Top]
		event_handlers = [
			{pad_up animate_helper_arrows Params = {direction = UP}}
			{pad_down animate_helper_arrows Params = {direction = DOWN}}
			{pad_up net_custom_up_down Params = {Text = <num_songs_text_id> Global = CopyOfGlobal Type = num_songs direction = UP player_match = <player_match>}}
			{pad_down net_custom_up_down Params = {Text = <num_songs_text_id> Global = CopyOfGlobal Type = num_songs direction = DOWN player_match = <player_match>}}
			{pad_back net_commit_or_reset_params Params = {Text = <num_songs_text_id> Global = <num_songs_global> Type = num_songs}}
			{pad_back net_custom_ui_change_unfocus Params = {action = Back to = <vmenu_id> from = <num_songs_vmenu_id> Menu = options}}
			{pad_choose net_commit_or_reset_params Params = {commit copy_from = CopyOfGlobal copy_to = <num_songs_global>}}
			{pad_choose net_custom_ui_change_unfocus Params = {action = choose to = <vmenu_id> from = <num_songs_vmenu_id> Menu = options}}
		]
	}
	if ($OptionsGameModeValue = 4)
		<Text> = ($FilterTypes.num_songs.values_coop [($<num_songs_global>)])
	else
		<Text> = ($FilterTypes.num_songs.values [($<num_songs_global>)])
	endif
	CreateScreenElement {
		Type = TextElement
		Id = <num_songs_text_id>
		PARENT = <num_songs_vmenu_id>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		Text = <Text>
		just = [LEFT Top]
		z_priority = 10.0
	}
	fit_text_into_menu_item Id = <Id> max_width = 375
	CreateScreenElement {
		Type = TextElement
		Id = submit_selection
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		Text = "DONE"
		just = [LEFT Top]
		z_priority = 10.0
		event_handlers = [
			{Focus net_custom_ui_focus Params = {this_ID = submit_selection VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus}
			{pad_choose check_for_options_change_go_forward}
		]
	}
	<vmenu_id> :SetTags current_focus = first_time
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
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
	add_user_control_helper \{Text = "CANCEL"
		button = RED
		Z = 100}
	add_user_control_helper \{Text = "START SEARCH"
		button = BLUE
		Z = 100}
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar
		Z = 100}
	LaunchEvent Type = Focus Target = <vmenu_id>
	begin
	LaunchEvent Type = pad_down Target = <vmenu_id>
	repeat <button_down_events>
endscript

script destroy_online_quickmatch_prefs 
	if ScreenElementExists \{Id = quickmatch_options_container}
		DestroyScreenElement \{Id = quickmatch_options_container}
	endif
	clean_up_user_control_helpers
	destroy_menu \{menu_id = quickmatch_options_menu}
	destroy_menu_backdrop
endscript

script create_online_player_prefs \{menu_id = game_options_menu
		vmenu_id = game_options_vmenu}
	highway_layout_vmenu_id = highway_layout_selection
	highway_layout_text_id = highway_layout_selection_text
	CreateScreenElement {
		Type = VScrollingMenu
		PARENT = root_window
		Id = <menu_id>
		just = [Center Top]
		Dims = (500.0, 480.0)
		Pos = (640.0, 330.0)
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		PARENT = <menu_id>
		Id = <vmenu_id>
		Pos = (250.0, 0.0)
		just = [Center Top]
		internal_just = [LEFT Top]
		Dims = (500.0, 480.0)
		event_handlers = [
			{pad_back check_for_options_change_go_back}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound Params = {UP}}
			{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = Online_Background}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = player_options_container
		Pos = (0.0, 0.0)}
	frame_dims = (665.0, 588.0)
	center_pos = ((640.0, 380.0))
	create_UI_frame {
		PARENT = player_options_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($G_menu_colors).online_fill_rgba)
		z_priority = 2
	}
	displaySprite \{Id = Online_Frame_Crown
		PARENT = player_options_container
		tex = Online_Frame_Crown
		Pos = (640.0, 42.0)
		just = [
			Center
			Top
		]
		Z = 3
		Dims = (256.0, 105.0)}
	CreateScreenElement {
		Type = TextElement
		PARENT = player_options_container
		font = fontgrid_title_gh3
		Scale = 0.85
		rgba = ($online_light_purple)
		Text = "GAME OPTIONS"
		Pos = (640.0, 153.0)
		just = [Center Top]
		z_priority = 10.0
	}
	CreateScreenElement {
		Type = TextElement
		Id = highway_layout
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		Text = "HIGHWAY LAYOUT:"
		just = [LEFT Top]
		z_priority = 10.0
		event_handlers = [
			{Focus net_custom_ui_focus Params = {this_ID = highway_layout text_id = <highway_layout_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus Params = {text_id = <highway_layout_text_id>}}
			{pad_choose net_custom_ui_change_focus Params = {this_ID = highway_layout text_id = <highway_layout_text_id> to = <highway_layout_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params Params = {copy_from = OptionsHighwayValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		Id = <highway_layout_vmenu_id>
		PARENT = highway_layout
		Pos = (500.0, 0.0)
		just = [LEFT Top]
		internal_just = [LEFT Top]
		event_handlers = [
			{pad_up animate_helper_arrows Params = {direction = UP}}
			{pad_down animate_helper_arrows Params = {direction = DOWN}}
			{pad_up net_custom_up_down Params = {Text = <highway_layout_text_id> Global = CopyOfGlobal Type = vport direction = UP}}
			{pad_down net_custom_up_down Params = {Text = <highway_layout_text_id> Global = CopyOfGlobal Type = vport direction = DOWN}}
			{pad_back net_commit_or_reset_params Params = {Text = <highway_layout_text_id> Global = OptionsHighwayValue Type = vport}}
			{pad_back net_custom_ui_change_unfocus Params = {action = Back to = <vmenu_id> from = <highway_layout_vmenu_id>}}
			{pad_choose net_commit_or_reset_params Params = {commit copy_from = CopyOfGlobal copy_to = OptionsHighwayValue}}
			{pad_choose net_custom_ui_change_unfocus Params = {action = choose to = <vmenu_id> from = <highway_layout_vmenu_id>}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		Id = <highway_layout_text_id>
		PARENT = <highway_layout_vmenu_id>
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		Text = ($FilterTypes.vport.values [($OptionsHighwayValue)])
		just = [LEFT Top]
		z_priority = 10.0
	}
	CreateScreenElement {
		Type = TextElement
		Id = submit_selection
		PARENT = <vmenu_id>
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		Text = "DONE"
		just = [LEFT Top]
		z_priority = 10.0
		event_handlers = [
			{Focus net_custom_ui_focus Params = {this_ID = submit_selection VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus}
			{pad_choose check_for_options_change_go_forward}
		]
	}
	<vmenu_id> :SetTags current_focus = first_time
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
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
	LaunchEvent Type = Focus Target = <vmenu_id>
endscript

script destroy_online_player_prefs 
	if ScreenElementExists \{Id = player_options_container}
		DestroyScreenElement \{Id = player_options_container}
	endif
	if ScreenElementExists \{Id = game_options_menu}
		DestroyScreenElement \{Id = game_options_menu}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script create_online_options_changed_dialog \{menu_id = online_options_changed_menu
		vmenu_id = online_options_changed_vmenu
		Pos = (500.0, 516.0)
		Z = 100
		save_func = options_changed_select_save
		save_params = {
		}
		nosave_func = options_changed_select_dont_save
		nosave_params = {
		}}
	<Menu_pos> = (575.0, 487.0)
	set_focus_color \{Color = pink}
	set_unfocus_color \{Color = dk_violet_grey}
	create_popup_warning_menu {
		textblock = {
			Text = $save_changes_message
			Dims = (700.0, 320.0)
			Scale = 0.6
		}
		no_background
		Menu_pos = <Menu_pos>
		dialog_dims = (600.0, 80.0)
		options = [
			{
				func = <save_func>
				Params = <save_params>
				Text = "SAVE CHANGES"
			}
			{
				func = <nosave_func>
				Params = <nosave_params>
				Text = "CONTINUE WITHOUT SAVING"
			}
		]
	}
endscript

script destroy_online_options_changed_dialog 
	destroy_popup_warning_menu
	destroy_menu_backdrop
	if ScreenElementExists \{Id = online_options_changed_menu}
		DestroyScreenElement \{Id = online_options_changed_menu}
	endif
endscript

script options_changed_select_save 
	FormatText \{ChecksumName = player_status
		'player1_status'}
	switch (($OptionsHighwayValue))
		case 0
		Change StructureName = <player_status> highway_layout = default_highway
		case 1
		Change StructureName = <player_status> highway_layout = solo_highway
	endswitch
	SetGlobalTags user_options Params = {
		online_game_mode = ($OptionsGameModeValue)
		online_difficulty = ($OptionsDifficultyValue)
		online_num_songs = ($OptionsNumSongsValue)
		online_tie_breaker = ($OptionsTieBreakerValue)
		online_highway = ($OptionsHighwayValue)
	}
	destroy_online_options_changed_dialog
	ui_flow_manager_respond_to_action \{action = dialog_response_selected_save}
endscript

script options_changed_select_dont_save 
	revert_option_changes
	destroy_online_options_changed_dialog
	ui_flow_manager_respond_to_action \{action = dialog_response_selected_dont_save}
endscript

script check_for_options_change_go_forward 
	if ((($OptionsGameModeValue) = ($TempGameModeValue)) &&
			(($OptionsDifficultyValue) = ($TempDifficultyValue)) &&
			(($OptionsNumSongsValue) = ($TempNumSongsValue)) &&
			(($OptionsTieBreakerValue) = ($TempTieBreakerValue)) &&
			(($OptionsHighwayValue) = ($TempHighwayValue)) &&
			(($OptionsGameModeRanked) = ($TempGameModeRanked)) &&
			(($OptionsDifficultyRanked) = ($TempDifficultyRanked)) &&
			(($OptionsNumSongsRanked) = ($TempNumSongsRanked)))
		ui_flow_manager_respond_to_action \{action = start_quickmatch}
	else
		SetGlobalTags user_options Params = {
			online_game_mode = ($OptionsGameModeValue)
			online_difficulty = ($OptionsDifficultyValue)
			online_num_songs = ($OptionsNumSongsValue)
			online_tie_breaker = ($OptionsTieBreakerValue)
			online_highway = ($OptionsHighwayValue)
			online_game_mode_ranked = ($OptionsGameModeRanked)
			online_difficulty_ranked = ($OptionsDifficultyRanked)
			online_num_songs_ranked = ($OptionsNumSongsRanked)
		}
		if ScreenElementExists \{Id = quickmatch_options_vmenu}
			LaunchEvent \{Type = unfocus
				Target = quickmatch_options_vmenu}
		endif
		create_online_options_changed_dialog \{save_func = ui_flow_manager_respond_to_action
			save_params = {
				action = save
			}
			nosave_func = check_for_options_change_no_save_continue}
	endif
endscript

script check_for_options_change_no_save_continue 
	destroy_online_options_changed_dialog
	ui_flow_manager_respond_to_action \{action = start_quickmatch}
endscript

script check_for_options_change_go_back 
	revert_option_changes
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script save_intial_option_values 
	Printf \{"--- save_intial_option_values ---"}
	Change TempGameModeValue = ($OptionsGameModeValue)
	Change TempDifficultyValue = ($OptionsDifficultyValue)
	Change TempNumSongsValue = ($OptionsNumSongsValue)
	Change TempTieBreakerValue = ($OptionsTieBreakerValue)
	Change TempHighwayValue = ($OptionsHighwayValue)
	Change TempGameModeRanked = ($OptionsGameModeRanked)
	Change TempDifficultyRanked = ($OptionsDifficultyRanked)
	Change TempNumSongsRanked = ($OptionsNumSongsRanked)
endscript

script revert_option_changes 
	Printf \{"--- revert_option_changes ---"}
	Change OptionsGameModeValue = ($TempGameModeValue)
	Change OptionsDifficultyValue = ($TempDifficultyValue)
	Change OptionsNumSongsValue = ($TempNumSongsValue)
	Change OptionsTieBreakerValue = ($TempTieBreakerValue)
	Change OptionsHighwayValue = ($TempHighwayValue)
	Change OptionsGameModeRanked = ($TempGameModeRanked)
	Change OptionsDifficultyRanked = ($TempDifficultyRanked)
	Change OptionsNumSongsRanked = ($TempNumSongsRanked)
endscript

script setup_options_globals 
	Printf \{"--- setup_options_globals ---"}
	GetGlobalTags \{user_options}
	Change OptionsGameModeValue = <online_game_mode>
	Change OptionsDifficultyValue = <online_difficulty>
	Change OptionsNumSongsValue = <online_num_songs>
	Change OptionsTieBreakerValue = <online_tie_breaker>
	Change OptionsHighwayValue = <online_highway>
	Change OptionsGameModeRanked = <online_game_mode_ranked>
	Change OptionsDifficultyRanked = <online_difficulty_ranked>
	Change OptionsNumSongsRanked = <online_num_songs_ranked>
endscript

script remove_save_dialog 
	destroy_popup_warning_menu
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	if ScreenElementExists \{Id = quickmatch_options_vmenu}
		LaunchEvent \{Type = Focus
			Target = quickmatch_options_vmenu}
	endif
endscript
