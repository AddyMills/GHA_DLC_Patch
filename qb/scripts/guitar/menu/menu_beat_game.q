beat_game_title = "YOU BEAT GUITAR HERO AEROSMITH ON \\c0%d!\\c0"
beat_game_message = "Think you've got what it takes to really\\n blow their minds? Try this bad boy out on \\c1%n\\c0. There may be a reward waiting for you if you succeed. Pain, fame and glory await, lil' rocker."
beat_game_message_expert = "Wow. You've mastered \\c1EXPERT\\c0 -- Go start a band already! Take it to the next level with the \\c1%n\\c0! Cheats can be unlocked in the options menu."

script create_beat_game_menu 
	create_menu_backdrop \{texture = Beat_Game_BG}
	menu_font = fontgrid_title_gh3
	get_current_band_info
	GetGlobalTags <band_info> Param = Name
	band_name = <Name>
	FormatText TextName = band_name_text "%s" S = <band_name>
	difficulty_text = "EXPERT"
	next_difficulty_text = "PRECISION MODE CHEAT"
	<DIFFICULTY> = ($current_difficulty)
	switch (<DIFFICULTY>)
		case EASY
		<difficulty_text> = "EASY"
		next_difficulty = MEDIUM
		<next_difficulty_text> = "MEDIUM"
		case MEDIUM
		<difficulty_text> = "MEDIUM"
		next_difficulty = HARD
		<next_difficulty_text> = "HARD"
		case HARD
		<difficulty_text> = "HARD"
		next_difficulty = EXPERT
		<next_difficulty_text> = "EXPERT"
	endswitch
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = beat_game_container
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	CreateScreenElement {
		Type = TextElement
		PARENT = beat_game_container
		Id = bgs_band_name
		just = [Center Top]
		font = <menu_font>
		Text = <band_name_text>
		Scale = 1.38
		rgba = (($G_menu_colors).pink)
		Pos = (640.0, 366.0)
	}
	GetScreenElementDims \{Id = bgs_band_name}
	if (<width> > 300)
		fit_text_in_rectangle \{Id = bgs_band_name
			Dims = (1060.0, 130.0)
			Pos = (640.0, 366.0)}
	endif
	FormatText TextName = Title_text $beat_game_title D = <difficulty_text>
	CreateScreenElement {
		Type = TextElement
		PARENT = beat_game_container
		Id = bgs_under_title
		just = [LEFT Top]
		font = <menu_font>
		Text = <Title_text>
		Scale = 1.0
		rgba = (($G_menu_colors).lt_violet_grey)
	}
	fit_text_in_rectangle \{Id = bgs_under_title
		Dims = (700.0, 65.0)
		Pos = (300.0, 428.0)}
	if (<DIFFICULTY> = EXPERT)
		FormatText TextName = motivation_text ($beat_game_message_expert) N = <next_difficulty_text>
	else
		FormatText TextName = motivation_text ($beat_game_message) N = <next_difficulty_text>
	endif
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = beat_game_container
		font = text_a4
		Text = <motivation_text>
		Dims = (1100.0, 700.0)
		Pos = (640.0, 468.0)
		rgba = (($G_menu_colors).dk_violet_grey)
		just = [Center Top]
		internal_just = [Center Top]
		Scale = 0.7
		z_priority = 3
	}
	<cheat> = "ALL DAY AND ALL OF THE NIGHT RIFF x 2"
	FormatText TextName = cheat_text "CHEAT HINT: %c" C = <cheat>
	if (<DIFFICULTY> = EXPERT)
		CreateScreenElement {
			Type = TextElement
			PARENT = beat_game_container
			Id = bgs_cheat_text
			just = [Center Top]
			font = <menu_font>
			Text = <cheat_text>
			Scale = 0.5
			Pos = (640.0, 622.0)
			rgba = (($G_menu_colors).lt_violet_grey)
		}
	endif
	button_font = buttonsxenon
	displaySprite \{Id = bgs_black_banner
		PARENT = beat_game_container
		tex = White
		Pos = (0.0, -2.0)
		Dims = (1240.0, 100.0)
		rgba = [
			0
			0
			0
			255
		]
		Z = -2}
	CreateScreenElement {
		Type = TextElement
		PARENT = beat_game_container
		Id = continue_text
		Scale = 1.0
		Pos = (40.0, 20.0)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [LEFT Center]
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action Params = {action = Continue}}
		]
	}
	SpawnScriptNow scroll_ticker_text Params = {ticker_text = <band_name_text>}
	LaunchEvent \{Type = Focus
		Target = continue_text}
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
	add_user_control_helper \{Text = "CONTINUE"
		button = Green
		Z = 100}
endscript

script destroy_beat_game_menu 
	Change \{check_for_unplugged_controllers = 0}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = beat_game_container}
	destroy_menu_backdrop
	KillSpawnedScript \{Name = scroll_ticker_text}
endscript
g_num_scrolling_texts = 0

script scroll_ticker_text {
		ticker_text = "I NEED TICKER TEXT!"
		ticker_space = " "
		ticker_pos = (0.0, 34.0)
		ticker_just = [LEFT Top]
		ticker_parent = beat_game_container
		ticker_x_scale = 1
		ticker_y_scale = 1
		ticker_font = text_a5
		ticker_rgba1 = (($G_menu_colors).dk_violet_grey)
		ticker_rgba2 = (($G_menu_colors).pink)
		ticker_alpha = 1
		ticker_z_priority = -1
		Time = 5
	}
	FormatText \{ChecksumName = ticker_text_id_1
		'scrolling_ticker_text_%i_1'
		I = $g_num_scrolling_texts}
	CreateScreenElement {
		Type = TextElement
		just = <ticker_just>
		Id = <ticker_text_id_1>
		PARENT = <ticker_parent>
		Pos = <ticker_pos>
		Scale = ((<ticker_x_scale> * (1.0, 0.0)) + (<ticker_y_scale> * (0.0, 1.0)))
		font = <ticker_font>
		Text = <ticker_text>
		rgba = <ticker_rgba1>
		Alpha = <ticker_alpha>
		z_priority = <ticker_z_priority>
	}
	GetScreenElementDims Id = <ticker_text_id_1>
	if (<width> > 0)
		multi = (1280 / <width>)
	else
		ScriptAssert \{"Can't perform this operation using a screen element with no width!"}
	endif
	ticker_text_with_space = (<ticker_text> + <ticker_space>)
	long_ticker_text = <ticker_text_with_space>
	StringLength String = <ticker_text_with_space>
	<ticker_text_with_space_length> = <str_len>
	begin
	StringLength String = <long_ticker_text>
	<long_ticker_text_length> = <str_len>
	if NOT (<long_ticker_text_length> < (127 - <ticker_text_with_space_length>))
		break
	endif
	<long_ticker_text> = (<long_ticker_text> + <ticker_text_with_space>)
	SetScreenElementProps Id = <ticker_text_id_1> Text = <long_band_text>
	GetScreenElementDims Id = <ticker_text_id_1>
	if (<width> > 1280)
		break
	endif
	repeat <multi>
	SetScreenElementProps Id = <ticker_text_id_1> Text = <long_ticker_text> Pos = <ticker_pos>
	FormatText \{ChecksumName = ticker_text_id_2
		'scrolling_ticker_text_%i_2'
		I = $g_num_scrolling_texts}
	CreateScreenElement {
		Id = <ticker_text_id_2>
		Type = TextElement
		just = <ticker_just>
		PARENT = <ticker_parent>
		Scale = ((<ticker_x_scale> * (1.0, 0.0)) + (<ticker_y_scale> * (0.0, 1.0)))
		font = <ticker_font>
		Text = <long_ticker_text>
		rgba = <ticker_rgba2>
		Alpha = <ticker_alpha>
		z_priority = <ticker_z_priority>
	}
	GetScreenElementDims Id = <ticker_text_id_1>
	SetScreenElementProps Id = <ticker_text_id_2> Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
	Change g_num_scrolling_texts = ($g_num_scrolling_texts + 1)
	First = 1
	begin
	if (<First>)
		DoScreenElementMorph Id = <ticker_text_id_1> Pos = (((-1.0, 0.0) * <width>) + <ticker_pos>) Time = <Time>
		DoScreenElementMorph Id = <ticker_text_id_2> Pos = <ticker_pos> Time = <Time>
	else
		DoScreenElementMorph Id = <ticker_text_id_2> Pos = (((-1.0, 0.0) * <width>) + <ticker_pos>) Time = <Time>
		DoScreenElementMorph Id = <ticker_text_id_1> Pos = <ticker_pos> Time = <Time>
	endif
	Wait <Time> Seconds
	if (<First>)
		SetScreenElementProps Id = <ticker_text_id_1> Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
		SetScreenElementProps Id = <ticker_text_id_2> Pos = <ticker_pos>
		<First> = 0
	else
		SetScreenElementProps Id = <ticker_text_id_2> Pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
		SetScreenElementProps Id = <ticker_text_id_1> Pos = <ticker_pos>
		<First> = 1
	endif
	repeat
endscript
