menu_select_difficulty_p1_difficulty_index = 0
menu_select_difficulty_p2_difficulty_index = 0
menu_select_difficulty_first_time_p1 = 1
menu_select_difficulty_first_time_p2 = 1
sd_highlight_time = 0.05
g_showing_multiplayer_sd_screen = 0

script create_select_difficulty_menu 
	disable_pause
	if (($current_num_players = 2))
		if (($is_network_game) = 1)
			exclusive_device = ($primary_controller)
		endif
		create_mp_select_difficulty_menu
		return
	endif
	Change \{g_showing_multiplayer_sd_screen = 0}
	SpawnScriptNow \{Menu_Music_On}
	base_menu_pos = (260.0, 235.0)
	main_menu_font = fontgrid_title_gh3
	menu_vspacing = 20
	completion_scale = 0.5
	menu_font = text_a6
	if (($player1_status.bot_play = 1) || ($is_network_game))
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_pro_faceoff)
			exclusive_mp_controllers = [0 , 0]
			SetArrayElement ArrayName = exclusive_mp_controllers Index = 0 NewValue = ($player1_device)
			SetArrayElement ArrayName = exclusive_mp_controllers Index = 1 NewValue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	Change \{rich_presence_context = presence_song_list}
	new_menu {
		scrollid = scrolling_select_difficulty
		vmenuid = vmenu_select_difficulty
		Menu_pos = <base_menu_pos>
		use_backdrop = 0
		Spacing = <menu_vspacing>
		exclusive_device = <exclusive_device>
	}
	if ($game_mode = p1_career)
	else
		if GotParam \{Song}
			Change current_song = <Song>
		endif
	endif
	SetScreenElementProps \{Id = vmenu_select_difficulty
		internal_just = [
			LEFT
			Top
		]}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = sd_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Venue_BG}
	displaySprite \{PARENT = sd_container
		tex = Difficulty_1p_BG
		Pos = (640.0, 0.0)
		just = [
			Center
			Top
		]
		Dims = (920.0, 720.0)
		Z = 1}
	p1_diff_index = 8
	CreateScreenElement {
		Type = SpriteElement
		Id = sd_white_p1
		PARENT = sd_container
		texture = White
		Pos = ($g_sd_hilite_props [<p1_diff_index>].Pos)
		just = [Top LEFT]
		Dims = (285.0, 37.0)
		rgba = [171 189 177 255]
		Alpha = 0.9
	}
	displaySprite \{PARENT = sd_container
		tex = Toprockers_Tape_1
		Pos = (1150.0, 0.0)
		Dims = (180.0, 128.0)
		Z = 50
		Rot_Angle = 90}
	displaySprite \{PARENT = sd_container
		tex = Toprockers_Tape_1
		Pos = (1155.0, 3.0)
		Dims = (180.0, 128.0)
		rgba = [
			0
			0
			0
			100
		]
		Z = 49
		Rot_Angle = 90}
	displaySprite \{PARENT = sd_container
		tex = Toprockers_Tape_2
		Pos = (260.0, 550.0)
		Z = 50
		Rot_Angle = 90
		Dims = (180.0, 128.0)}
	displaySprite \{PARENT = sd_container
		tex = Toprockers_Tape_2
		Pos = (264.0, 555.0)
		rgba = [
			0
			0
			0
			100
		]
		Z = 49
		Rot_Angle = 90
		Dims = (180.0, 128.0)}
	if ($game_mode = p1_career)
		get_diff_completion_text
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty
		Id = easy_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "EASY"
		just = [LEFT Top]
		font_spacing = 0
		event_handlers = [
			{Focus sd_highlight_menuitem Params = {Player = 1 Index = 8 difficulty_index = 0}}
			{pad_choose selected_difficulty Params = {diff = EASY}}
		]
	}
	fit_text_in_rectangle Id = <Id> Dims = (210.0, 50.0)
	completion_pos = (465.0, 290.0)
	if ($game_mode = p1_career)
		CreateScreenElement {
			Type = TextElement
			PARENT = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [RIGHT Center]
			Pos = <completion_pos>
			Text = (<diff_completion_text> [0])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty
		Id = medium_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "MEDIUM"
		just = [LEFT Top]
		font_spacing = 0
		event_handlers = [
			{Focus sd_highlight_menuitem Params = {Player = 1 Index = 9 difficulty_index = 1}}
			{pad_choose selected_difficulty Params = {diff = MEDIUM}}
		]
	}
	fit_text_in_rectangle Id = <Id> Dims = (210.0, 50.0)
	<completion_pos> = (465.0, 360.0)
	if ($game_mode = p1_career)
		CreateScreenElement {
			Type = TextElement
			PARENT = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [RIGHT Center]
			Pos = <completion_pos>
			Text = (<diff_completion_text> [1])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty
		Id = hard_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "HARD"
		just = [LEFT Top]
		font_spacing = 0
		event_handlers = [
			{Focus sd_highlight_menuitem Params = {Player = 1 Index = 10 difficulty_index = 2}}
			{pad_choose selected_difficulty Params = {diff = HARD}}
		]
	}
	fit_text_in_rectangle Id = <Id> Dims = (210.0, 50.0)
	<completion_pos> = (465.0, 430.0)
	if ($game_mode = p1_career)
		CreateScreenElement {
			Type = TextElement
			PARENT = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [RIGHT Center]
			Pos = <completion_pos>
			Text = (<diff_completion_text> [2])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty
		Id = expert_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "EXPERT"
		just = [LEFT Top]
		font_spacing = 0
		event_handlers = [
			{Focus sd_highlight_menuitem Params = {Player = 1 Index = 11 difficulty_index = 3}}
			{pad_choose selected_difficulty Params = {diff = EXPERT}}
		]
	}
	fit_text_in_rectangle Id = <Id> Dims = (210.0, 50.0)
	<completion_pos> = (465.0, 500.0)
	if ($game_mode = p1_career)
		CreateScreenElement {
			Type = TextElement
			PARENT = sd_container
			font = <main_menu_font>
			Scale = <completion_scale>
			just = [RIGHT Center]
			Pos = <completion_pos>
			Text = (<diff_completion_text> [3])
			rgba = [122 98 122 255]
			z_priority = 100
		}
	endif
	Change \{disable_menu_sounds = 1}
	Change \{sd_highlight_time = 0.0}
	Change \{sd_highlight_menuitem_morph = 0}
	if ($menu_select_difficulty_first_time_p1 = 1)
		if IsXENON
			if GetGameProfileSetting \{gsid = 1}
				begin
				if (<game_setting> < 3)
					break
				endif
				LaunchEvent \{Type = pad_down
					Target = vmenu_select_difficulty}
				<game_setting> = (<game_setting> - 1)
				repeat
			endif
		endif
	else
		launch_num = 0
		switch ($current_difficulty)
			case MEDIUM
			<launch_num> = 1
			case HARD
			<launch_num> = 2
			case EXPERT
			<launch_num> = 3
		endswitch
		if (<launch_num>)
			begin
			LaunchEvent \{Type = pad_down
				Target = vmenu_select_difficulty}
			repeat <launch_num>
		endif
	endif
	Change \{sd_highlight_menuitem_morph = 1}
	Change \{disable_menu_sounds = 0}
	Change \{sd_highlight_time = 0.05}
	if English
		select_diff_tex = difficulty_title_en
	elseif French
		select_diff_tex = difficulty_title_fr
	elseif Spanish
		select_diff_tex = difficulty_title_sp
	elseif German
		select_diff_tex = difficulty_title_de
	elseif Italian
		select_diff_tex = difficulty_title_it
	endif
	CreateScreenElement {
		Type = SpriteElement
		PARENT = sd_container
		texture = <select_diff_tex>
		Pos = (757.0, 491.0)
		Dims = (192.0, 192.0)
		rgba = [255 255 255 255]
		just = [Center Center]
		z_priority = 80
	}
	displaySprite \{PARENT = sd_container
		tex = Instrument_2p_Overlay
		Pos = (0.0, 0.0)
		Dims = (1280.0, 720.0)
		Z = 50
		rgba = [
			105
			56
			7
			160
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
endscript

script destroy_select_difficulty_menu 
	destroy_gamertags
	destroy_ready_icons
	Change \{g_sd_p1_ready = 0}
	Change \{g_sd_p2_ready = 0}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_select_difficulty}
	destroy_menu \{menu_id = scrolling_select_difficulty2}
	destroy_menu \{menu_id = sd_container}
	destroy_menu_backdrop
endscript

script selected_difficulty 
	if ($transitions_locked = 0)
		LaunchEvent \{Type = unfocus
			Target = vmenu_select_difficulty}
	endif
	Change current_difficulty = <diff>
	Change current_difficulty2 = <diff>
	Change \{menu_select_difficulty_first_time_p1 = 0}
	if ($coop_dlc_active = 1)
		ui_flow_manager_respond_to_action \{action = continue_coop}
	else
		ui_flow_manager_respond_to_action \{action = Continue}
	endif
endscript
player_selecting_difficulty = 1
g_sd_hilite_props = [
	{
		Pos = (224.0, 275.0)
	}
	{
		Pos = (224.0, 325.0)
	}
	{
		Pos = (224.0, 375.0)
	}
	{
		Pos = (224.0, 425.0)
	}
	{
		Pos = (830.0, 275.0)
	}
	{
		Pos = (830.0, 325.0)
	}
	{
		Pos = (830.0, 375.0)
	}
	{
		Pos = (830.0, 425.0)
	}
	{
		Pos = (216.0, 235.0)
	}
	{
		Pos = (216.0, 305.0)
	}
	{
		Pos = (216.0, 375.0)
	}
	{
		Pos = (216.0, 445.0)
	}
]
g_sd_p1_ready = 0
g_sd_p2_ready = 0

script create_mp_select_difficulty_menu 
	Change \{g_showing_multiplayer_sd_screen = 1}
	Change \{g_sd_p1_ready = 0}
	Change \{g_sd_p2_ready = 0}
	Printf ($net_can_send_approval = 1)
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = DIFFICULTY
		}
	endif
	SpawnScriptNow \{Menu_Music_On}
	Printf \{"--- create_mp_select_difficulty_menu"}
	create_menu_backdrop \{texture = Venue_BG}
	menu_pos_p1 = (240.0, 280.0)
	menu_pos_p2 = (850.0, 280.0)
	menu_font = text_a6
	if ($is_network_game = 1)
		event_handlers_p1 = [
			{pad_up select_difficulty_generic_sound Params = {Player = 1 UP}}
			{pad_down select_difficulty_generic_sound Params = {Player = 1 DOWN}}
			{pad_back net_difficulty_go_back Params = {Player = 1 Index = menu_select_difficulty_p1_difficulty_index}}
			{pad_start menu_show_gamercard}
		]
	else
		event_handlers_p1 = [
			{pad_up select_difficulty_generic_sound Params = {Player = 1 UP}}
			{pad_down select_difficulty_generic_sound Params = {Player = 1 DOWN}}
			{pad_back menu_sd_back_up Params = {Player = 1}}
		]
	endif
	event_handlers_p2 = [
		{pad_up select_difficulty_generic_sound Params = {Player = 2 UP}}
		{pad_down select_difficulty_generic_sound Params = {Player = 2 DOWN}}
		{pad_back menu_sd_back_up Params = {Player = 2}}
	]
	if ($is_network_game = 1)
		<exclusive_dev> = $player1_device
	else
		<exclusive_dev> = $player2_device
	endif
	if ($is_network_game = 1)
		no_focus_value = 1
	else
		no_focus_value = 0
	endif
	new_menu {
		scrollid = scrolling_select_difficulty
		vmenuid = vmenu_select_difficulty
		Menu_pos = <menu_pos_p1>
		use_backdrop = (0)
		font = <menu_font>
		font_size = 1.0
		event_handlers = <event_handlers_p1>
		exclusive_device = $player1_device
		no_focus = <no_focus_value>
	}
	new_menu {
		scrollid = scrolling_select_difficulty2
		vmenuid = vmenu_select_difficulty2
		Menu_pos = <menu_pos_p2>
		use_backdrop = (0)
		font = <menu_font>
		font_size = 1.0
		event_handlers = <event_handlers_p2>
		exclusive_device = <exclusive_dev>
		no_focus = <no_focus_value>
	}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = sd_container
		Pos = (0.0, 0.0)}
	displaySprite \{PARENT = sd_container
		tex = Difficulty_2p_BG
		Pos = (640.0, 0.0)
		just = [
			Center
			Top
		]
		Dims = (915.0, 720.0)
		Z = 1}
	p1_diff_index = 0
	p2_diff_index = 4
	if ($is_network_game = 1)
		ui_print_gamertags \{pos1 = (270.0, 95.0)
			pos2 = (1010.0, 95.0)
			just1 = [
				LEFT
				Top
			]
			just2 = [
				RIGHT
				Top
			]}
	else
		displayText PARENT = sd_container Text = "player" font = <menu_font> Pos = (260.0, 160.0) Scale = 1 rgba = [171 189 177 255] noshadow
		GetScreenElementDims Id = <Id>
		if (<width> > 150)
			SetScreenElementProps Id = <Id> Scale = 1
			fit_text_in_rectangle Id = <Id> Dims = ((150.0, 0.0) + ((0.0, 1.0) * <Height>)) Pos = (260.0, 160.0)
		endif
		displayText PARENT = sd_container Text = "player" font = <menu_font> Pos = (870.0, 160.0) Scale = 1 rgba = [171 189 177 255] noshadow
		GetScreenElementDims Id = <Id>
		if (<width> > 150)
			SetScreenElementProps Id = <Id> Scale = 1
			fit_text_in_rectangle Id = <Id> Dims = ((150.0, 0.0) + ((0.0, 1.0) * <Height>)) Pos = (860.0, 160.0)
		endif
		displayText \{PARENT = sd_container
			Text = "1"
			font = text_A11_Large
			Pos = (320.0, 180.0)
			Scale = 1
			rgba = [
				171
				189
				177
				255
			]
			noshadow}
		displayText \{PARENT = sd_container
			Text = "2"
			font = text_A11_Large
			Pos = (930.0, 180.0)
			Scale = 1
			rgba = [
				171
				189
				177
				255
			]
			noshadow}
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = sd_white_p1
		PARENT = sd_container
		texture = White
		Pos = ($g_sd_hilite_props [<p1_diff_index>].Pos)
		just = [LEFT Top]
		Dims = (215.0, 48.0)
		rgba = [171 189 177 240]
		Alpha = 0.9
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = sd_white_p2
		PARENT = sd_container
		texture = White
		Pos = ($g_sd_hilite_props [<p2_diff_index>].Pos)
		just = [LEFT Top]
		Dims = (215.0, 48.0)
		rgba = [171 189 177 240]
		Alpha = 0.9
	}
	displaySprite \{PARENT = sd_container
		tex = Toprockers_Tape_1
		Pos = (1150.0, 0.0)
		Dims = (212.0, 128.0)
		Z = 50
		Rot_Angle = 90}
	displaySprite \{PARENT = sd_container
		tex = Toprockers_Tape_1
		Pos = (1155.0, 3.0)
		Dims = (212.0, 128.0)
		rgba = [
			0
			0
			0
			100
		]
		Z = 49
		Rot_Angle = 90}
	displaySprite \{PARENT = sd_container
		tex = Toprockers_Tape_2
		Pos = (230.0, 550.0)
		Z = 50
		Rot_Angle = 90
		Dims = (212.0, 128.0)}
	displaySprite \{PARENT = sd_container
		tex = Toprockers_Tape_2
		Pos = (235.0, 553.0)
		rgba = [
			0
			0
			0
			100
		]
		Z = 49
		Rot_Angle = 90
		Dims = (212.0, 128.0)}
	if ($game_mode = p2_quickplay)
		initial_pos = (635.0, 592.0)
		rot = 0
		displayText {
			Id = sd_songs_completed_p1
			PARENT = sd_container
			Pos = <initial_pos>
			Scale = 0.75
			font = text_a6
			rgba = [220 180 90 255]
			rot = <rot>
			just = [Center Center]
			noshadow
			Z = 15
		}
		displayText \{PARENT = sd_container
			Id = sd_combined_diff_text
			Pos = (640.0, 500.0)
			just = [
				Center
				Center
			]
			font = text_a6
			rgba = [
				200
				160
				70
				255
			]
			Scale = 1.25
			noshadow
			Z = 15}
	endif
	if ($is_network_game = 1)
		<choose_script> = net_request_difficulty
		<highlight_script> = net_sd_highlight_menuitem
	else
		<choose_script> = temp_selected_difficulty
		<highlight_script> = sd_highlight_menuitem
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "EASY"
		just = [LEFT Top]
		event_handlers = [
			{Focus <highlight_script> Params = {Player = 1 Index = 0 difficulty_index = 0}}
			{pad_choose <choose_script> Params = {Player = 1 diff = EASY}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle Id = <Id> Dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "MEDIUM"
		just = [LEFT Top]
		event_handlers = [
			{Focus <highlight_script> Params = {Player = 1 Index = 1 difficulty_index = 1}}
			{pad_choose <choose_script> Params = {Player = 1 diff = MEDIUM}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle Id = <Id> Dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "HARD"
		just = [LEFT Top]
		event_handlers = [
			{Focus <highlight_script> Params = {Player = 1 Index = 2 difficulty_index = 2}}
			{pad_choose <choose_script> Params = {Player = 1 diff = HARD}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle Id = <Id> Dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "EXPERT"
		just = [LEFT Top]
		event_handlers = [
			{Focus <highlight_script> Params = {Player = 1 Index = 3 difficulty_index = 3}}
			{pad_choose <choose_script> Params = {Player = 1 diff = EXPERT}}
		]
		exclusive_device = $player1_device
	}
	fit_text_in_rectangle Id = <Id> Dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty2
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "EASY"
		just = [LEFT Top]
		event_handlers = [
			{Focus sd_highlight_menuitem Params = {Player = 2 Index = 4 difficulty_index = 0}}
			{pad_choose temp_selected_difficulty Params = {Player = 2 diff = EASY}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle Id = <Id> Dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty2
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "MEDIUM"
		just = [LEFT Top]
		event_handlers = [
			{Focus sd_highlight_menuitem Params = {Player = 2 Index = 5 difficulty_index = 1}}
			{pad_choose temp_selected_difficulty Params = {Player = 2 diff = MEDIUM}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle Id = <Id> Dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty2
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "HARD"
		just = [LEFT Top]
		event_handlers = [
			{Focus sd_highlight_menuitem Params = {Player = 2 Index = 6 difficulty_index = 2}}
			{pad_choose temp_selected_difficulty Params = {Player = 2 diff = HARD}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle Id = <Id> Dims = (180.0, 50.0)
	CreateScreenElement {
		Type = TextElement
		PARENT = vmenu_select_difficulty2
		Id = elxpert_title_text
		font = <menu_font>
		rgba = [60 35 20 255]
		Text = "EXPERT"
		just = [LEFT Top]
		event_handlers = [
			{Focus sd_highlight_menuitem Params = {Player = 2 Index = 7 difficulty_index = 3}}
			{pad_choose temp_selected_difficulty Params = {Player = 2 diff = EXPERT}}
		]
		exclusive_device = $player2_device
	}
	fit_text_in_rectangle Id = <Id> Dims = (180.0, 50.0)
	displaySprite \{PARENT = sd_container
		tex = Instrument_2p_Overlay
		Pos = (0.0, 0.0)
		Dims = (1280.0, 720.0)
		Z = 50
		rgba = [
			105
			56
			7
			160
		]}
	if ($is_network_game = 1)
		create_ready_icons \{pos1 = (260.0, 200.0)
			pos2 = (880.0, 190.0)}
	else
		create_ready_icons \{pos1 = (260.0, 200.0)
			pos2 = (880.0, 180.0)}
	endif
	Change \{disable_menu_sounds = 1}
	Change \{sd_highlight_menuitem_morph = 0}
	if ($is_network_game = 0)
		Change \{disable_menu_sounds = 1}
		Change \{sd_highlight_time = 0.0}
		Change \{sd_highlight_menuitem_morph = 0}
		if ($menu_select_difficulty_first_time_p1 = 1)
			if IsXENON
				if GetGameProfileSetting \{gsid = 1}
					begin
					if (<game_setting> < 3)
						break
					endif
					LaunchEvent \{Type = pad_down
						Target = vmenu_select_difficulty}
					<game_setting> = (<game_setting> - 1)
					repeat
				endif
			endif
		else
			launch_num = 0
			switch ($current_difficulty)
				case MEDIUM
				<launch_num> = 1
				case HARD
				<launch_num> = 2
				case EXPERT
				<launch_num> = 3
			endswitch
			if (<launch_num>)
				begin
				LaunchEvent \{Type = pad_down
					Target = vmenu_select_difficulty}
				repeat <launch_num>
			endif
		endif
		if ($menu_select_difficulty_first_time_p2 = 1)
			if IsXENON
				if GetGameProfileSetting \{gsid = 2}
					begin
					if (<game_setting> < 3)
						break
					endif
					LaunchEvent \{Type = pad_down
						Target = vmenu_select_difficulty2}
					<game_setting> = (<game_setting> - 1)
					repeat
				endif
			endif
		else
			launch_num = 0
			switch ($current_difficulty2)
				case MEDIUM
				<launch_num> = 1
				case HARD
				<launch_num> = 2
				case EXPERT
				<launch_num> = 3
			endswitch
			if (<launch_num>)
				begin
				LaunchEvent \{Type = pad_down
					Target = vmenu_select_difficulty2}
				repeat <launch_num>
			endif
		endif
		Change \{sd_highlight_menuitem_morph = 1}
		Change \{disable_menu_sounds = 0}
		Change \{sd_highlight_time = 0.05}
	else
		Change \{menu_select_difficulty_p1_difficulty_index = 0}
		Change \{menu_select_difficulty_p2_difficulty_index = 0}
	endif
	if NOT ($game_mode = p2_quickplay)
		if English
			select_diff_tex = difficulty_title_en
		elseif French
			select_diff_tex = difficulty_title_fr
		elseif Spanish
			select_diff_tex = difficulty_title_sp
		elseif German
			select_diff_tex = difficulty_title_de
		elseif Italian
			select_diff_tex = difficulty_title_it
		endif
		CreateScreenElement {
			Type = SpriteElement
			PARENT = sd_container
			texture = <select_diff_tex>
			Pos = (640.0, 491.0)
			Dims = (160.0, 160.0)
			rgba = [255 255 255 255]
			just = [Center Center]
			z_priority = 80
		}
	endif
	Change \{sd_highlight_menuitem_morph = 1}
	Change \{disable_menu_sounds = 0}
	add_user_control_helper \{Text = "SELECT"
		button = Green
		Z = 100}
	add_user_control_helper \{Text = "BACK"
		button = RED
		Z = 100}
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar
		Z = 100}
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message \{current_state = DIFFICULTY
			action = approval}
		Change \{net_can_send_approval = 0}
	endif
endscript
sd_highlight_menuitem_morph = 0

script sd_highlight_menuitem \{Player = 1
		Index = 0
		Time = 0.05}
	Time = ($sd_highlight_time)
	if (<Player> = 1)
		Change menu_select_difficulty_p1_difficulty_index = <difficulty_index>
	else
		Change menu_select_difficulty_p2_difficulty_index = <difficulty_index>
	endif
	Min = ($menu_select_difficulty_p1_difficulty_index)
	MathMin A = ($menu_select_difficulty_p1_difficulty_index) B = ($menu_select_difficulty_p2_difficulty_index)
	CastToInteger \{Min}
	difficulty_index = <Min>
	if (<Player> = 1)
		if (g_sd_p1_ready = 1)
			return
		endif
		if ScreenElementExists \{Id = sd_white_p1}
			RunScriptOnScreenElement Id = sd_white_p1 menu_sd_move_highlight Params = {Player = <Player> Time = <Time> Pos = ($g_sd_hilite_props [<Index>].Pos)}
		endif
	else
		if (g_sd_p2_ready = 1)
			return
		endif
		if ScreenElementExists \{Id = sd_white_p2}
			RunScriptOnScreenElement Id = sd_white_p2 menu_sd_move_highlight Params = {Player = <Player> Time = <Time> Pos = ($g_sd_hilite_props [<Index>].Pos)}
		endif
	endif
	if ($game_mode = p2_quickplay)
		if ScreenElementExists \{Id = sd_songs_completed_p1}
			sd_songs_completed_p1 :GetTags
		endif
		if ScreenElementExists \{Id = sd_combined_diff_text}
			my_diff = ($difficulty_list [<difficulty_index>])
			get_difficulty_text DIFFICULTY = <my_diff>
			if English
				<difficulty_text> = (<difficulty_text> + "!")
			endif
			SetScreenElementProps Id = sd_combined_diff_text Text = <difficulty_text> Scale = 1
			fit_text_in_rectangle \{Id = sd_combined_diff_text
				Dims = (165.0, 50.0)
				keep_ar = 1}
			sd_songs_completed_p1 :GetTags
			if GotParam \{diff_completion_text}
				SetScreenElementProps Id = sd_songs_completed_p1 Text = (<diff_completion_text> [<difficulty_index>])
				GetScreenElementDims \{Id = sd_songs_completed_p1}
				if (<width> > 350)
					SetScreenElementProps \{Id = sd_songs_completed_p1
						Scale = 0.75}
					fit_text_in_rectangle Id = sd_songs_completed_p1 Dims = ((350.0, 0.0) + <Height> * (0.0, 0.75))
				endif
			endif
		endif
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		if (($menu_select_difficulty_p1_difficulty_index != $menu_select_difficulty_p2_difficulty_index) && ($g_showing_multiplayer_sd_screen = 1))
			sd_create_score_balancing_notice
		else
			if ScreenElementExists \{Id = score_balancing_container}
				DestroyScreenElement \{Id = score_balancing_container}
			endif
		endif
	endif
endscript

script sd_create_score_balancing_notice 
	<ONE> = $menu_select_difficulty_p1_difficulty_index
	<two> = $menu_select_difficulty_p2_difficulty_index
	if ($is_network_game = 1)
		<two> = (<two> - 4)
		if (<ONE> = <two>)
			if ScreenElementExists \{Id = score_balancing_container}
				DestroyScreenElement \{Id = score_balancing_container}
			endif
			return
		endif
	endif
	if ((<ONE> = 0 && <two> = 1) || (<ONE> = 1 && <two> = 0))
		<average_diff> = "MEDIUM-EASY"
	elseif ((<ONE> = 0 && <two> = 2) || (<ONE> = 2 && <two> = 0))
		<average_diff> = "MEDIUM"
	elseif ((<ONE> = 0 && <two> = 3) || (<ONE> = 3 && <two> = 0))
		<average_diff> = "MEDIUM-HARD"
	elseif ((<ONE> = 1 && <two> = 2) || (<ONE> = 2 && <two> = 1))
		<average_diff> = "MEDIUM-HARD"
	elseif ((<ONE> = 1 && <two> = 3) || (<ONE> = 3 && <two> = 1))
		<average_diff> = "HARD"
	elseif ((<ONE> = 2 && <two> = 3) || (<ONE> = 3 && <two> = 2))
		<average_diff> = "EXPERT-HARD"
	endif
	FormatText TextName = score_balancing_text "SCORE BALANCING IS ON---BASED ON %a DIFFICULTY" A = <average_diff>
	if ScreenElementExists \{Id = score_balancing_container}
		DestroyScreenElement \{Id = score_balancing_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		PARENT = sd_container
		Id = score_balancing_container
		Pos = (0.0, 0.0)}
	<Z> = 20
	<Pos> = (640.0, 556.0)
	CreateScreenElement {
		Type = SpriteElement
		PARENT = score_balancing_container
		Id = score_balancing_text_bg
		texture = Control_pill_body
		Pos = <Pos>
		just = [Center Center]
		rgba = (($G_menu_colors).dk_violet_grey)
		z_priority = <Z>
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = score_balancing_container
		Pos = (<Pos> + (0.0, 3.0))
		just = [Center Center]
		Text = <score_balancing_text>
		rgba = (($G_menu_colors).lt_violet_grey)
		Scale = (0.45000002, 0.6)
		z_priority = (<Z> + 1)
		font = text_a6
	}
	GetScreenElementDims Id = <Id>
	bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
	score_balancing_text_bg :SetProps Dims = <bg_dims>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = score_balancing_container
		texture = Control_pill_end
		Pos = (<Pos> - <width> * (0.5, 0.0))
		rgba = (($G_menu_colors).dk_violet_grey)
		just = [RIGHT Center]
		flip_v
		z_priority = <Z>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = score_balancing_container
		texture = Control_pill_end
		Pos = (<Pos> + <width> * (0.5, 0.0))
		rgba = (($G_menu_colors).dk_violet_grey)
		just = [LEFT Center]
		z_priority = <Z>
	}
endscript

script select_difficulty_generic_sound 
	if (<Player> = 1)
		if ($g_sd_p1_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	else
		if ($g_sd_p2_ready = 0)
			generic_menu_up_or_down_sound <...>
		endif
	endif
endscript

script temp_selected_difficulty \{Player = 1}
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if (<Player> = 1)
		if ($g_sd_p1_ready = 0)
			SetScreenElementProps \{Id = vmenu_select_difficulty
				disable_pad_handling}
			Change current_difficulty = <diff>
			FormatText ChecksumName = ready_container 'ready_container_p%d' D = <Player>
			if ScreenElementExists Id = <ready_container>
				drop_in_ready_sign Player = <Player> from_sd = 1
			endif
		endif
	else
		if ($g_sd_p2_ready = 0)
			SetScreenElementProps \{Id = vmenu_select_difficulty2
				disable_pad_handling}
			Change current_difficulty2 = <diff>
			FormatText ChecksumName = ready_container 'ready_container_p%d' D = <Player>
			if ScreenElementExists Id = <ready_container>
				drop_in_ready_sign Player = <Player> from_sd = 1
			endif
		endif
	endif
	Wait \{0.3
		Seconds}
	if (($g_sd_p1_ready) && ($g_sd_p2_ready))
		Change \{menu_flow_locked = 1}
		Wait \{0.5
			Seconds}
		Change \{menu_flow_locked = 0}
		diff_index_p1 = ($difficulty_list_props.($current_difficulty).Index)
		diff_index_p2 = ($difficulty_list_props.($current_difficulty2).Index)
		Min = <diff_index_p1>
		MathMin A = <diff_index_p1> B = <diff_index_p2>
		CastToInteger \{Min}
		difficulty_index = <Min>
		Change current_difficulty_coop = ($difficulty_list [<difficulty_index>])
		Change \{menu_select_difficulty_first_time_p1 = 0}
		Change \{menu_select_difficulty_first_time_p2 = 0}
		if ($coop_dlc_active = 1)
			ui_flow_manager_respond_to_action \{action = continue_coop
				create_params = {
					Player = 2
				}}
		else
			ui_flow_manager_respond_to_action \{action = Continue
				create_params = {
					Player = 2
				}}
		endif
	endif
	Change \{transitions_locked = 0}
endscript

script menu_sd_back_up \{Player = 1}
	if ($menu_flow_locked = 1)
		return
	endif
	if (<Player> = 1)
		if ($g_sd_p1_ready = 1)
			SetScreenElementProps \{Id = vmenu_select_difficulty
				enable_pad_handling}
			FormatText ChecksumName = ready_container 'ready_container_p%d' D = <Player>
			if ScreenElementExists Id = <ready_container>
				drop_out_ready_sign Player = <Player> from_sd = 1
			endif
		else
			menu_flow_go_back
		endif
	else
		if ($g_sd_p2_ready = 1)
			SetScreenElementProps \{Id = vmenu_select_difficulty2
				enable_pad_handling}
			FormatText ChecksumName = ready_container 'ready_container_p%d' D = <Player>
			if ScreenElementExists Id = <ready_container>
				drop_out_ready_sign Player = <Player> from_sd = 1
			endif
		else
			menu_flow_go_back
		endif
	endif
endscript

script menu_sd_move_highlight 
	FormatText ChecksumName = hilight_container 'sd_white_p%d' D = <Player>
	if ($sd_highlight_menuitem_morph = 1)
		DoScreenElementMorph Id = <hilight_container> Pos = <Pos> Time = <Time>
	else
		DoScreenElementMorph Id = <hilight_container> Pos = <Pos>
	endif
endscript
