g_max_venues = 0
g_venue_index = 0
g_venue_pos_add = (0.0, 720.0)
g_venue_current_pos = (0.0, 0.0)
g_venue_poster_space = 360
g_last_venue_selected = NONE

script create_select_venue_menu \{Player = 1}
	Change \{g_venue_index = 0}
	Change \{g_last_venue_selected = $current_level}
	kill_start_key_binding
	UnPauseGame
	if ($game_mode = p1_career)
		FormatText ChecksumName = bandname_id 'band%i_info_%g' I = ($current_band) G = ($game_mode_names.$game_mode)
		GetGlobalTags <bandname_id> Param = first_venue_movie_played
		if (<first_venue_movie_played> = 0)
			get_progression_globals game_mode = ($game_mode)
			if StructureContains Structure = ($<tier_global>) initial_movie
				Menu_Music_Off
				PlayMovieAndWait movie = ($<tier_global>.initial_movie)
				get_movie_id_by_name movie = ($<tier_global>.initial_movie)
				SetGlobalTags <Id> Params = {unlocked = 1}
			endif
			SetGlobalTags <bandname_id> Params = {first_venue_movie_played = 1}
		endif
	endif
	if ($progression_play_completion_movie = 1)
		get_progression_globals game_mode = ($game_mode)
		FormatText ChecksumName = tiername 'tier%i' I = ($progression_completion_tier)
		if StructureContains Structure = ($<tier_global>.<tiername>) completion_movie
			Menu_Music_Off
			PlayMovieAndWait movie = ($<tier_global>.<tiername>.completion_movie)
			get_movie_id_by_name movie = ($<tier_global>.<tiername>.completion_movie)
			SetGlobalTags <Id> Params = {unlocked = 1}
		endif
		Change \{progression_play_completion_movie = 0}
	endif
	Change \{g_venue_current_pos = (0.0, 0.0)}
	SpawnScriptNow \{Menu_Music_On}
	if (($player1_status.bot_play = 1) || ($is_network_game))
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle ||
				$game_mode = p2_quickplay)
			exclusive_mp_controllers = [0 , 0]
			SetArrayElement ArrayName = exclusive_mp_controllers Index = 0 NewValue = ($player1_device)
			SetArrayElement ArrayName = exclusive_mp_controllers Index = 1 NewValue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	CreateScreenElement \{Type = ContainerElement
		Id = venue_container
		PARENT = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		Id = Venue_Overlay
		PARENT = root_window
		texture = Venue_Overlay
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]
		z_priority = 30
		Dims = (1280.0, 720.0)}
	CreateScreenElement \{Type = SpriteElement
		Id = shadowhole
		PARENT = root_window
		texture = overlay_spotlight
		Pos = (640.0, 360.0)
		just = [
			Center
			Center
		]
		z_priority = 31
		Dims = (1280.0, 720.0)
		rgba = [
			255
			153
			204
			255
		]
		Alpha = 0.5
		BLEND = Add}
	RunScriptOnScreenElement Id = <Id> circulator Params = {Time = 3 offs = 100 lag = 1 Clockwise}
	GetRandomValue \{Name = bg_offset
		Integer
		A = 5760
		B = 12240}
	<bg_1_pos> = ((-10.0, 0.0) + (<bg_offset> * (0.0, -1.0)))
	<bg_2_pos> = (<bg_1_pos> + (0.0, 6480.0))
	CreateScreenElement {
		Type = SpriteElement
		PARENT = venue_container
		Id = backposter_1
		Pos = <bg_1_pos>
		texture = Venue_BackPoster
		z_priority = 0
		Dims = (1300.0, 6480.0)
		just = [LEFT Top]
	}
	RunScriptOnScreenElement Id = <Id> circulator
	CreateScreenElement {
		Type = SpriteElement
		PARENT = venue_container
		Id = backposter_2
		Pos = <bg_2_pos>
		texture = Venue_BackPoster
		z_priority = 0
		Dims = (1300.0, 6480.0)
		just = [LEFT Top]
	}
	RunScriptOnScreenElement Id = <Id> circulator
	get_progression_globals \{game_mode = $game_mode}
	number_of_tiers = (<tier_global>.num_tiers)
	level_count = 0
	tier_num = 1
	poster_index = 0
	poster_dist = 720
	bg_pos = (0.0, 0.0)
	<poster_rot> = 1
	begin
	<poster_rot> = (<poster_rot> * -1)
	available = 1
	if (<tier_num> > <number_of_tiers>)
		break
	endif
	FormatText ChecksumName = Tier 'tier%i' I = <tier_num>
	if StructureContains Structure = (<tier_global>.<Tier>) unlocked_levels
		my_level = (<tier_global>.<Tier>.unlocked_levels [<level_count>])
		GetArraySize (<tier_global>.<Tier>.unlocked_levels)
		level_count = (<level_count> + 1)
		if (<level_count> >= <array_Size>)
			level_count = 0
			<tier_num> = (<tier_num> + 1)
		endif
	else
		my_level = (<tier_global>.<Tier>.Level)
		level_count = 0
		<tier_num> = (<tier_num> + 1)
		if StructureContains Structure = ($LevelZones.<my_level>) debug_only
			available = 0
		endif
		if ($game_mode = p1_career)
			get_current_band_checksum
			final_checksum = <band_checksum>
			ExtendCRC <final_checksum> ($LevelZones.<my_level>.Name) out = final_checksum
			unlocked = 1
			GetGlobalTags <final_checksum> noassert = 1
			if (<unlocked> = 0)
				<available> = 0
			endif
		else
			FormatText ChecksumName = venue_checksum 'venue_%s' S = ($LevelZones.<my_level>.Name)
			unlocked = 1
			GetGlobalTags <venue_checksum> noassert = 1
			if (<unlocked> = 0)
				<available> = 0
			endif
		endif
		if ($is_network_game = 1)
			<available> = 1
		endif
	endif
	if (<available> = 1)
		FormatText ChecksumName = venue_id 'venue_%d' D = <poster_index>
		CreateScreenElement {
			Type = TextElement
			PARENT = venue_container
			Id = <venue_id>
			font = text_A1
			event_handlers = [
				{Focus venue_focus Params = {level_checksum = <my_level>}}
				{unfocus retail_menu_unfocus}
				{pad_up venue_scroll_up}
				{pad_down venue_scroll_down}
				{pad_back venue_go_back Params = {Player = <Player>}}
				{pad_choose select_venue_choose_venue Params = {level_checksum = <my_level> Player = <Player>}}
			]
			exclusive_device = <exclusive_device>
		}
		if (<poster_rot> = 1)
			<poster_angle> = RandomRange (0.0, 5.0)
		else
			<poster_angle> = RandomRange (-5.0, 0.0)
		endif
		new_poster_pos = ((640.0, 360.0) - (($g_venue_poster_space + <poster_dist>) * <poster_index>) * (0.0, 1.0))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = venue_container
			Pos = <new_poster_pos>
			texture = ($LevelZones.<my_level>.BG)
			z_priority = 20
			Dims = (720.0, 720.0)
			just = [Center Center]
			Rot_Angle = <poster_angle>
		}
		RunScriptOnScreenElement Id = <Id> circulator
		GetUpperCaseString ($LevelZones.<my_level>.Title)
		<poster_index> = (<poster_index> + 1)
	endif
	repeat
	GetArraySize \{$LevelZoneArray}
	old_size = (<array_Size>)
	get_LevelZoneArray_size
	if (<array_Size> > <old_size>)
		venue_index = (<array_Size> - 1)
		begin
		get_LevelZoneArray_checksum Index = <venue_index>
		available = 1
		if Is_LevelZone_Downloaded level_checksum = <level_checksum>
			if (<Download> = 1 &&
					$is_network_game = 1)
				available = 0
			endif
		else
			available = 0
		endif
		if StructureContains Structure = ($LevelZones.<level_checksum>.Name) debug_only
			available = 0
		endif
		if (<available> = 1)
			FormatText ChecksumName = venue_id 'venue_%d' D = <poster_index>
			CreateScreenElement {
				Type = TextElement
				PARENT = venue_container
				Id = <venue_id>
				font = text_A1
				event_handlers = [
					{Focus venue_focus Params = {level_checksum = <level_checksum>}}
					{unfocus retail_menu_unfocus}
					{pad_back venue_go_back Params = {Player = <Player>}}
					{pad_choose select_venue_choose_venue Params = {level_checksum = <level_checksum> Player = <Player>}}
				]
				exclusive_device = <exclusive_device>
			}
			new_poster_pos = ((640.0, 360.0) - (($g_venue_poster_space + <poster_dist>) * <poster_index>) * (0.0, 1.0))
			CreateScreenElement {
				PARENT = venue_container
				Type = SpriteElement
				Pos = <new_poster_pos>
				texture = ($LevelZones.<level_checksum>.BG)
				z_priority = 20
				Dims = (720.0, 720.0)
				just = [Center Center]
			}
			GetUpperCaseString ($LevelZones.<level_checksum>.Title)
			displaySprite PARENT = venue_container tex = White Pos = (<new_poster_pos> + (0.0, -100.0)) just = [Center Center] Scale = (90.0, 15.0) Z = 21
			displayText {
				PARENT = venue_container
				Text = <UpperCaseString>
				Z = 22
				just = [Center Center]
				rgba = [88 1 17 255]
				font = fontgrid_title_gh3
				noshadow
			}
			fit_text_in_rectangle Id = <Id> Dims = (360.0, 70.0) Pos = (<new_poster_pos> + (0.0, -95.0))
			<poster_index> = (<poster_index> + 1)
		endif
		<venue_index> = (<venue_index> + 1)
		repeat (<array_Size> - <old_size>)
	endif
	PrintStruct <...>
	Change g_max_venues = <poster_index>
	Change \{disable_menu_sounds = 1}
	FormatText \{ChecksumName = venue_id
		'venue_%d'
		D = 0}
	LaunchEvent Type = Focus Target = <venue_id>
	tier_num = 1
	begin
	FormatText ChecksumName = Tier 'tier%i' I = <tier_num>
	my_level = (<tier_global>.<Tier>.Level)
	if (<my_level> = $g_last_venue_selected)
		break
	endif
	venue_scroll_up \{morph = 0}
	<tier_num> = (<tier_num> + 1)
	repeat <number_of_tiers>
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
	SetMenuAutoRepeatTimes \{(0.3, 0.3)}
endscript

script destroy_select_venue_menu 
	destroy_menu \{menu_id = Venue_Overlay}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = venue_container}
	DestroyScreenElement \{Id = shadowhole}
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
endscript

script venue_go_back 
	Change \{current_level = $g_last_venue_selected}
	ui_flow_manager_respond_to_action action = go_back create_params = {Player = <Player>}
endscript

script venue_focus 
	Change current_level = <level_checksum>
	retail_menu_focus
endscript

script venue_scroll_down \{Time = 0.35000002
		morph = 1}
	if ($g_venue_index - 1 < 0)
		return
	endif
	Change g_venue_index = ($g_venue_index - 1)
	FormatText \{ChecksumName = venue_id
		'venue_%d'
		D = $g_venue_index}
	LaunchEvent Type = Focus Target = <venue_id>
	generic_menu_up_or_down_sound \{UP}
	if ScreenElementExists \{Id = venue_container}
		Change g_venue_current_pos = ($g_venue_current_pos - $g_venue_pos_add - ($g_venue_poster_space * (0.0, 1.0)))
		if (<morph> = 1)
			venue_container :DoMorph Pos = $g_venue_current_pos Time = <Time> Motion = ease_out
		else
			venue_container :SetProps \{Pos = $g_venue_current_pos}
		endif
	endif
endscript

script venue_scroll_up \{Time = 0.35000002
		morph = 1}
	if ($g_venue_index + 1 >= $g_max_venues)
		return
	endif
	Change g_venue_index = ($g_venue_index + 1)
	FormatText \{ChecksumName = venue_id
		'venue_%d'
		D = $g_venue_index}
	LaunchEvent Type = Focus Target = <venue_id>
	generic_menu_up_or_down_sound \{DOWN}
	if ScreenElementExists \{Id = venue_container}
		Change g_venue_current_pos = ($g_venue_current_pos + $g_venue_pos_add + ($g_venue_poster_space * (0.0, 1.0)))
		if (<morph> = 1)
			venue_container :DoMorph Pos = $g_venue_current_pos Time = <Time> Motion = ease_out
		else
			venue_container :SetProps \{Pos = $g_venue_current_pos}
		endif
	endif
endscript

script select_venue_choose_venue 
	Change \{g_last_venue_selected = $current_level}
	ui_flow_manager_respond_to_action action = Continue create_params = {Player = <Player>}
endscript

script circulator \{Time = 2
		lag = 0
		offs = 5}
	GetTags
	if GotParam \{Clockwise}
		offs00 = (<offs> * (1.0, 0.0))
		offs04 = (<offs> * (1.0, 1.0))
		offs03 = (<offs> * (1.0, -1.0))
		offs02 = (<offs> * (-1.0, -1.0))
		offs01 = (<offs> * (-1.0, 1.0))
		DoMorph Pos = {<offs00> Relative}
	else
		offs00 = (<offs> * (-1.0, 0.0))
		offs01 = (<offs> * (1.0, 1.0))
		offs02 = (<offs> * (1.0, -1.0))
		offs03 = (<offs> * (-1.0, -1.0))
		offs04 = (<offs> * (-1.0, 1.0))
		DoMorph Pos = {<offs00> Relative}
	endif
	if NOT ScreenElementExists Id = <Id>
		return
	endif
	Wait <lag> Seconds
	begin
	DoMorph Pos = {<offs01> Relative} Time = <Time> Motion = smooth
	DoMorph Pos = {<offs02> Relative} Time = <Time> Motion = smooth
	DoMorph Pos = {<offs03> Relative} Time = <Time> Motion = smooth
	DoMorph Pos = {<offs04> Relative} Time = <Time> Motion = smooth
	repeat
endscript
