setlist_random_images_scroll_num = 0
setlist_random_images_highest_num = 0
setlist_random_bg_images = [
	{
		texture = Setlist_Shoeprint
		flippable
		shoeprint
	}
	{
		texture = Setlist_Gum
		flippable
		Dims = (128.0, 128.0)
		loffset = (20.0, 0.0)
		roffset = (160.0, 0.0)
	}
	{
		texture = setlist_coin
		flippable
		Dims = (96.0, 96.0)
		loffset = (70.0, 0.0)
		roffset = (115.0, 0.0)
	}
	{
		texture = setlist_wrigleys_gum
		Dims = (400.0, 400.0)
		minRot = -50
		loffset = (-180.0, 0.0)
		only_left
		low_z
	}
	{
		texture = setlist_ernieBall
		Dims = (384.0, 384.0)
		only_right
		roffset = (-30.0, 0.0)
		low_z
	}
	{
		texture = setlist_button_GunsNRoses
		Dims = (256.0, 256.0)
		loffset = (-50.0, 0.0)
		roffset = (50.0, 0.0)
	}
]
setlist_solid_lines = [
	Setlist_Page1_Line_Solid1
	Setlist_Page1_Line_Solid2
	Setlist_Page1_Line_Solid3
]
setlist_dotted_lines = [
	Setlist_Page1_Line_Dotted1
	Setlist_Page1_Line_Dotted2
	Setlist_Page1_Line_Dotted3
]
setlist_loop_stars = [
	Setlist_Page1_Loop_Star1
	Setlist_Page1_Loop_Star2
	Setlist_Page1_Loop_Star3
]
setlist_event_handlers = [
	{
		pad_up
		setlist_scroll
		Params = {
			Dir = UP
		}
	}
	{
		pad_down
		setlist_scroll
		Params = {
			Dir = DOWN
		}
	}
	{
		pad_back
		setlist_go_back
	}
	{
		pad_option2
		change_tab
		Params = {
			tab = tab_setlist
			button = 1
		}
	}
	{
		pad_option
		change_tab
		Params = {
			tab = tab_bonus
			button = 1
		}
	}
	{
		pad_l1
		change_tab
		params = {
			tab = tab_downloads
			button = 1
		}
	}
	{
		pad_start
		menu_show_gamercard
	}
]
setlist_line_index = 0
setlist_line_max = 26
setlist_menu_pos = (340.0, 440.0)
setlist_begin_text = (0.0, 0.0)
setlist_background_pos = (0.0, 0.0)
setlist_background_loop_pos = (0.0, 676.0)
setlist_background_loop_num = 0
setlist_page1_loop_pos = (160.0, 768.0)
setlist_page1_num = 0
setlist_selection_index = 0
setlist_selection_tier = 1
setlist_selection_song = 0
setlist_selection_found = 0
setlist_num_songs = 0
setlist_previous_tier = 1
setlist_previous_song = 0
setlist_previous_tab = tab_setlist
setlist_clip_last_rot = 0
setlist_clip_rot_neg = 0
setlist_solid_line_pos = (0.0, 0.0)
setlist_dotted_line_pos = (0.0, 0.0)
setlist_solid_line_add = (0.0, 80.0)
setlist_line_num = 0
setlist_page3_pos = (210.0, 86.0)
setlist_page3_num = 0
setlist_page3_dims = (1254.0, 533.0)
setlist_page2_pos = (240.0, 50.0)
setlist_page2_num = 0
setlist_page2_dims = (819.0, 666.0)
setlist_page1_dims = (922.0, 512.0)
setlist_text_z = 4.1
g_gh3_setlist = NULL
current_tab = tab_setlist
setlist_page1_z = 0
setlist_page2_z = 0
setlist_page3_z = 0
current_setlist_songpreview = NONE
target_setlist_songpreview = NONE
setlist_songpreview_changing = 0

script display_as_made_famous_by \{Rot_Angle = -7
		Time = 0.25}
	destroy_menu \{menu_id = setlist_original_artist}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = root_window
		Id = setlist_original_artist
		Rot_Angle = <Rot_Angle>
		Alpha = 0
	}
	displaySprite {
		PARENT = setlist_original_artist
		tex = White
		Dims = (130.0, 50.0)
		just = [Center Top]
		Pos = <Pos>
		rgba = [0 0 0 255]
		Z = 500
	}
	displaySprite {
		PARENT = setlist_original_artist
		tex = White
		just = [Center Top]
		Dims = (130.0, 25.0)
		Pos = (<Pos> + (0.0, 25.0))
		rgba = [223 223 223 255]
		Z = 501
	}
	displayText {
		PARENT = setlist_original_artist
		Text = ($sl_as_made)
		font = text_a3
		just = [Center Top]
		Pos = (<Pos>)
		Z = 502
		Scale = (0.8, 0.5)
		rgba = [223 223 223 255]
		noshadow
	}
	fit_text_in_rectangle Id = <Id> Dims = (75.0, 15.0)
	displayText {
		PARENT = setlist_original_artist
		Text = ($sl_famous_by)
		just = [Center Top]
		font = text_a3
		Pos = (<Pos> + (0.0, 25.0))
		Z = 502
		Scale = (0.72499996, 0.5)
		rgba = [0 0 0 255]
		noshadow
	}
	fit_text_in_rectangle Id = <Id> Dims = (90.0, 15.0)
	DoScreenElementMorph Id = setlist_original_artist Alpha = 1 Time = <Time>
endscript

script set_song_icon 
	if NOT GotParam \{No_wait}
		Wait \{0.5
			Seconds}
	endif
	if NOT GotParam \{Song}
		<Song> = ($target_setlist_songpreview)
	endif
	if (<Song> = NONE && $current_tab = tab_setlist)
		return
	endif
	if ($current_tab = tab_setlist)
		get_tier_from_song Song = <Song>
		get_progression_globals game_mode = ($game_mode)
		FormatText ChecksumName = tiername 'tier%d' D = <tier_number>
		if StructureContains Structure = ($<tier_global>.<tiername>) setlist_icon
			song_icon = ($<tier_global>.<tiername>.setlist_icon)
		else
			song_icon = setlist_icon_generic
		endif
	elseif ($current_tab = tab_downloads)
		song_icon = setlist_icon_download
	else
		song_icon = setlist_icon_generic
	endif
	mini_rot = RandomRange (0.0, 8.0)
	if ScreenElementExists \{Id = sl_clipart}
		SetScreenElementProps Id = sl_clipart texture = <song_icon>
		DoScreenElementMorph Id = sl_clipart Alpha = 1 Time = 0.25 Rot_Angle = <mini_rot>
	endif
	if ScreenElementExists \{Id = sl_clipart_shadow}
		SetScreenElementProps Id = sl_clipart_shadow texture = <song_icon>
		DoScreenElementMorph Id = sl_clipart_shadow Alpha = 1 Time = 0.25 Rot_Angle = <mini_rot>
	endif
	if ScreenElementExists \{Id = sl_clip}
		GetScreenElementProps \{Id = sl_clip}
		rot_clip_a = <Rot_Angle>
		rot_clip_b = (<rot_clip_a> + 10)
		SetScreenElementProps Id = sl_clip Rot_Angle = <rot_clip_b>
		DoScreenElementMorph Id = sl_clip Alpha = 1 Rot_Angle = <rot_clip_a> Time = 0.25
	endif
	if NOT (<Song> = NONE)
		get_song_original_artist Song = <Song>
		if ($we_have_songs = TRUE && <original_artist> = 0)
			if ScreenElementExists \{Id = sl_clipart}
				GetScreenElementProps \{Id = sl_clipart}
			endif
		endif
	endif
endscript

script get_tier_from_song 
	num_tiers = ($g_gh3_setlist.num_tiers)
	tier_index = 1
	begin
	FormatText ChecksumName = tier_name 'tier%d' D = <tier_index>
	GetArraySize ($g_gh3_setlist.<tier_name>.songs)
	song_index = 0
	begin
	song_checksum = ($g_gh3_setlist.<tier_name>.songs [<song_index>])
	if (<song_checksum> = <Song>)
		return tier_number = <tier_index>
	endif
	<song_index> = (<song_index> + 1)
	repeat <array_Size>
	<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>
	Printf \{"Did not find tier!"}
	return \{tier_number = 1}
endscript

script clear_setlist_clip_and_art 
	destroy_menu \{menu_id = setlist_original_artist}
	if ScreenElementExists \{Id = sl_clipart}
		SetScreenElementProps \{Id = sl_clipart
			Alpha = 0}
	endif
	if ScreenElementExists \{Id = sl_clipart_shadow}
		SetScreenElementProps \{Id = sl_clipart_shadow
			Alpha = 0}
	endif
	if ScreenElementExists \{Id = sl_clip}
		SetScreenElementProps \{Id = sl_clip
			Alpha = 0}
	endif
endscript

script setlist_go_back 
	if (($transitions_locked = 0) && ($is_network_game = 0))
		LaunchEvent \{Type = unfocus
			Target = vmenu_setlist}
	endif
	begin
	if ($changing_tab = 0)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	if ($is_network_game = 1)
		if ($g_tie_breaker_song = 0)
			net_setlist_go_back
		endif
	else
		ui_flow_manager_respond_to_action action = go_back create_params = {Player = ($current_num_players)}
	endif
endscript

script displaySprite \{just = [
			LEFT
			Top
		]
		rgba = [
			255
			255
			255
			255
		]
		Dims = {
		}
		BlendMode = {
		}
		internal_just = {
		}
		Scale = {
		}
		Alpha = 1}
	Printf \{"replace displaySprite calls with standard CreateScreenElement ones please"}
	if GotParam \{Rot_Angle}
		rot_struct = {Rot_Angle = <Rot_Angle>}
	else
		rot_struct = {}
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <Id>
		PARENT = <PARENT>
		texture = <tex>
		Dims = <Dims>
		rgba = <rgba>
		Pos = <Pos>
		just = <just>
		internal_just = <internal_just>
		z_priority = <Z>
		Scale = <Scale>
		<rot_struct>
		BLEND = <BlendMode>
		Alpha = <Alpha>
	}
	if GotParam \{flip_v}
		<Id> :SetProps flip_v
	endif
	if GotParam \{flip_h}
		<Id> :SetProps flip_h
	endif
	return Id = <Id>
endscript

script displayText \{Id = {
		}
		just = [
			LEFT
			Top
		]
		rgba = [
			210
			130
			0
			250
		]
		font = text_a5
		rot = 0}
	Printf \{"replace displayText calls with standard CreateScreenElement ones please"}
	CreateScreenElement {
		Type = TextElement
		PARENT = <PARENT>
		font = <font>
		Scale = <Scale>
		rgba = <rgba>
		Text = <Text>
		Id = <Id>
		Pos = <Pos>
		just = <just>
		Rot_Angle = <rot>
		z_priority = <Z>
		font_spacing = <font_spacing>
	}
	if GotParam \{noshadow}
		<Id> :SetProps noshadow
	else
		<Id> :SetProps Shadow shadow_offs = (3.0, 3.0) shadow_rgba [0 0 0 255]
	endif
	return Id = <Id>
endscript

script create_setlist_menu 
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = Song
		}
	endif
	if ($is_network_game = 1)
		Change \{current_tab = tab_setlist}
		Change \{setlist_previous_tier = 1}
		Change \{setlist_previous_song = 0}
		Change \{setlist_previous_tab = tab_setlist}
	endif
	if ($end_credits = 1 && $current_song = trainkeptarollin)
		Progression_EndCredits
		return
	endif
	Change \{boss_wuss_out = 0}
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
	Change \{progression_unlocked_guitar = -1}
	Change \{progression_unlocked_guitar2 = -1}
	Change \{rich_presence_context = presence_song_list}
	Menu_Music_Off
	get_progression_globals game_mode = ($game_mode)
	Change g_gh3_setlist = <tier_global>
	create_setlist_scrolling_menu
	change \{setlist_page3_z = 3.3}
	Change \{setlist_page2_z = 3.4}
	Change \{setlist_page1_z = 3.5}
	Change \{setlist_random_images_scroll_num = 0}
	Change \{setlist_random_images_highest_num = 0}
	change_tab tab = ($setlist_previous_tab)
	setlist_display_random_bg_image
	if ($is_network_game)
		Change \{setlist_previous_tier = 1}
		Change \{setlist_previous_song = 0}
		Change \{setlist_previous_tab = tab_setlist}
		create_setlist_popup
		<bg_helper_pos> = (140.0, 585.0)
		if ($current_tab = tab_setlist)
			setlist_show_helperbar Pos = (<bg_helper_pos> + (64.0, 4.0))
		elseif ($current_tab = tab_bonus)
			setlist_show_helperbar {
				Pos = (<bg_helper_pos> + (64.0, 4.0))
				text_option1 = ($sl_setlist_big)
				button_option1 = "\\b6"
			}
		endif
	endif
	Change \{disable_menu_sounds = 1}
	begin
	if ($setlist_selection_tier >= $setlist_previous_tier)
		if ($setlist_selection_song >= $setlist_previous_song)
			break
		endif
	endif
	last_tier = ($setlist_selection_tier)
	last_song = ($setlist_selection_song)
	LaunchEvent \{Type = pad_down
		Target = vmenu_setlist}
	if (<last_tier> = $setlist_selection_tier)
		if (<last_song> = $setlist_selection_song)
			break
		endif
	endif
	repeat
	Change \{disable_menu_sounds = 0}
	if ($setlist_selection_found = 1)
		FormatText \{ChecksumName = tier_checksum
			'tier%s'
			S = $setlist_selection_tier}
		Song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
		Change target_setlist_songpreview = <Song>
	else
		Change \{target_setlist_songpreview = NONE}
	endif
	if ($g_keep_song_preview = 0)
		destroy_setlist_songpreview_monitor
		SpawnScriptLater \{setlist_songpreview_monitor}
	endif
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message \{current_state = Song
			action = approval}
		Change \{net_can_send_approval = 0}
	endif
endscript
g_top_rockers_setlist = 0

script create_setlist_scrolling_menu 
	kill_start_key_binding
	UnPauseGame
	if ($player1_status.bot_play = 1 || $g_top_rockers_setlist = 1)
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
	if ($is_network_game = 1)
		if NOT ($net_current_flow_state = Song)
			no_focus_value = 1
		else
			no_focus_value = 0
		endif
	else
		no_focus_value = 1
	endif
	new_menu {
		scrollid = scrolling_setlist
		vmenuid = vmenu_setlist
		tierlist = $g_gh3_setlist
		use_backdrop = 0
		no_wrap
		Z = -1
		event_handlers = $setlist_event_handlers
		on_choose = setlist_choose_song
		on_right = setlist_debug_completesong
		on_l3 = setlist_debug_unlockall
		on_left = NullScript
		exclusive_device = <exclusive_device>
		no_focus = <no_focus_value>
		focus_color = BLACK
		unfocus_color = dk_violet_grey
	}
	if ($is_network_game = 1)
		if ScreenElementExists \{Id = dl_content_warning}
			DestroyScreenElement \{Id = dl_content_warning}
		endif
	endif
endscript

script destroy_setlist_scrolling_menu 
	KillSpawnedScript \{Name = scroll_ticker_text}
	destroy_menu \{menu_id = scrolling_setlist}
	clean_up_user_control_helpers
endscript

script destroy_setlist_songpreview_monitor 
	UnPauseSpawnedScript \{setlist_songpreview_monitor}
	begin
	if ($setlist_songpreview_changing = 0)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	KillSpawnedScript \{Name = setlist_songpreview_monitor}
	if NOT ($current_setlist_songpreview = NONE)
		get_song_prefix Song = ($current_setlist_songpreview)
		FormatText ChecksumName = song_preview '%s_preview' S = <song_prefix>
		StopSound <song_preview>
		SongUnLoadFSBIfDownloaded
	endif
endscript

script destroy_setlist_menu 
	KillSpawnedScript \{Name = net_match_download_songs}
	KillSpawnedScript \{Name = scroll_ticker_text}
	if ($g_keep_song_preview = 0)
		destroy_setlist_songpreview_monitor
		Change \{target_setlist_songpreview = NONE}
	endif
	if ScreenElementExists \{Id = setlist_overlay}
		DestroyScreenElement \{Id = setlist_overlay}
	endif
	Change setlist_previous_tier = ($setlist_selection_tier)
	Change setlist_previous_song = ($setlist_selection_song)
	Change setlist_previous_tab = ($current_tab)
	destroy_menu \{menu_id = setlist_original_artist}
	destroy_menu \{menu_id = scrolling_setlist}
	destroy_menu \{menu_id = setlist_menu}
	destroy_menu \{menu_id = setlist_loops_menu}
	destroy_menu \{menu_id = setlist_bg_container}
	reset_vars \{del}
	clean_up_user_control_helpers
	destroy_setlist_popup
endscript

script setlist_choose_song \{device_num = 0}
	if GotParam \{song_count}
		if ($is_network_game = 1)
			net_request_song Tier = <Tier> song_count = <song_count>
		else
			if ($transitions_locked = 0)
				LaunchEvent \{Type = unfocus
					Target = vmenu_setlist}
			endif
			FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
			Change current_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
			SetGlobalTags Progression Params = {current_tier = <Tier>}
			SetGlobalTags Progression Params = {current_song_count = <song_count>}
			Change \{current_level = $g_last_venue_selected}
			get_song_struct Song = ($current_song)
			if ((StructureContains Structure = <song_struct> boss) || $game_mode = p2_battle)
				get_current_battle_first_play
				if (<first_battle_play> = 1 || (StructureContains Structure = <song_struct> boss))
					ui_flow_manager_respond_to_action action = show_help device_num = (<device_num>) create_params = {boss = (<song_struct>.Checksum)}
					return
				endif
			endif
			ui_flow_manager_respond_to_action action = Continue device_num = (<device_num>)
		endif
	endif
endscript

script setlist_debug_completesong 
	if ($game_mode = training || $is_network_game = 1)
		return
	endif
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		Level = ($current_level)
		FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
		Change current_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
		SetGlobalTags Progression Params = {current_tier = <Tier>}
		SetGlobalTags Progression Params = {current_song_count = <song_count>}
		PrintStruct <...>
		load_songqpak song_name = ($current_song) async = 0
		setup_gemarrays song_name = ($current_song) DIFFICULTY = ($current_difficulty) player_status = player1_status
		calc_songscoreinfo
		Change StructureName = player1_status Score = ($player1_status.base_score * 2.8 + 1)
		Progression_SongWon
		if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
			menu_top_rockers_check_for_new_top_score
		endif
		songpreview = ($current_setlist_songpreview)
		change_tab tab = ($current_tab)
		Change current_setlist_songpreview = <songpreview>
		if ($current_song = bossjoe || $current_song = walkthiswayrundmc)
			if ($current_song = bossjoe)
				find_secret_character_index \{info_name = JoeP}
				<boss_character> = <Index>
			elseif ($current_song = walkthiswayrundmc)
				find_secret_character_index \{info_name = DMC}
				<boss_character> = <Index>
			endif
			if (<boss_character> >= 0)
				unlocked_for_purchase = 1
				GetGlobalTags ($Secret_Characters [<boss_character>].Id)
				if (<unlocked_for_purchase> = 0)
					SetGlobalTags ($Secret_Characters [<boss_character>].Id) Params = {unlocked_for_purchase = 1}
				endif
			endif
		endif
		Change \{disable_menu_sounds = 1}
		begin
		if (<Tier> = $setlist_selection_tier)
			if (<song_count> = $setlist_selection_song)
				break
			endif
		endif
		last_tier = ($setlist_selection_tier)
		last_song = ($setlist_selection_song)
		LaunchEvent \{Type = pad_down
			Target = vmenu_setlist}
		if (<last_tier> = $setlist_selection_tier)
			if (<last_song> = $setlist_selection_song)
				break
			endif
		endif
		repeat
		Change \{disable_menu_sounds = 0}
		Change \{StructureName = player1_status
			new_cash = 0}
		Change \{progression_play_completion_movie = 0}
		Change \{progression_unlock_tier_last_song = 0}
		Change current_level = <Level>
		Change \{end_credits = 0}
	endif
endscript

script setlist_debug_unlockall 
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		if ($game_mode = training || $is_network_game = 1)
			return
		endif
		Level = ($current_level)
		get_progression_globals game_mode = ($game_mode)
		GlobalTags_UnlockAll SongList = <tier_global>
		GlobalTags_UnlockAll \{SongList = GH3_Bonus_Songs}
		Change \{StructureName = player1_status
			NOTES_HIT = 100}
		Change \{StructureName = player1_status
			total_notes = 100}
		Change \{StructureName = player2_status
			NOTES_HIT = 100}
		Change \{StructureName = player2_status
			total_notes = 100}
		if ($game_mode = p1_career)
			UpdateAtoms \{Name = Progression}
		endif
		UpdateAtoms \{Name = Achievement}
		songpreview = ($current_setlist_songpreview)
		change_tab tab = ($current_tab)
		Change current_setlist_songpreview = <songpreview>
		Change \{disable_menu_sounds = 1}
		begin
		if (<Tier> = $setlist_selection_tier)
			if (<song_count> = $setlist_selection_song)
				break
			endif
		endif
		last_tier = ($setlist_selection_tier)
		last_song = ($setlist_selection_song)
		LaunchEvent \{Type = pad_down
			Target = vmenu_setlist}
		if (<last_tier> = $setlist_selection_tier)
			if (<last_song> = $setlist_selection_song)
				break
			endif
		endif
		repeat
		Change \{disable_menu_sounds = 0}
		Change \{StructureName = player1_status
			new_cash = 0}
		Change \{progression_play_completion_movie = 0}
		Change \{progression_unlock_tier_last_song = 0}
		Change current_level = <Level>
		Change \{end_credits = 0}
	endif
endscript

script setlist_scroll \{Dir = DOWN}
	if ($setlist_num_songs = 0)
		return
	endif
	if (<Dir> = DOWN)
		if ($setlist_selection_index + 1 = $setlist_num_songs)
			return
		endif
	else
		if ($setlist_selection_index - 1 < 0)
			return
		endif
	endif
	generic_menu_up_or_down_sound <Dir>
	FormatText \{ChecksumName = textid
		'id_song%i'
		I = $setlist_selection_index
		AddToStringLookup = TRUE}
	retail_menu_unfocus Id = <textid>
	SetScreenElementProps Id = <textid> no_shadow
	if (<Dir> = DOWN)
		jump_tier = 0
		Change setlist_selection_index = ($setlist_selection_index + 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		begin
		FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = $setlist_selection_tier
		FormatText \{ChecksumName = tier_checksum
			'tier%s'
			S = $setlist_selection_tier}
		GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
		Change setlist_selection_song = ($setlist_selection_song + 1)
		if ($setlist_selection_song = <array_Size>)
			Change \{setlist_selection_song = 0}
			Change setlist_selection_tier = ($setlist_selection_tier + 1)
			jump_tier = 1
		endif
		FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = ($setlist_selection_song + 1) S = $setlist_selection_tier AddToStringLookup = TRUE
		for_bonus = 0
		if ($current_tab = tab_bonus)
			<for_bonus> = 1
		endif
		if IsSongAvailable song_checksum = <song_checksum> Song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song]) for_bonus = <for_bonus>
			break
		endif
		repeat
		jump_tier_amt = (0.0, -240.0)
		if ($setlist_selection_index = 1)
			song_jump_amt = (0.0, -160.0)
			GetScreenElementProps \{Id = sl_clipart}
			SetScreenElementProps Id = sl_clipart Pos = (<Pos> - (0.0, 80.0))
			GetScreenElementProps \{Id = sl_clipart_shadow}
			SetScreenElementProps Id = sl_clipart_shadow Pos = (<Pos> - (0.0, 80.0))
			GetScreenElementProps \{Id = sl_clip}
			SetScreenElementProps Id = sl_clip Pos = (<Pos> - (0.0, 80.0))
			GetScreenElementProps \{Id = sl_highlight}
			SetScreenElementProps Id = sl_highlight Pos = (<Pos> - (0.0, 80.0))
		else
			song_jump_amt = (0.0, -80.0)
		endif
	else
		jump_tier = 0
		Change setlist_selection_index = ($setlist_selection_index - 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		begin
		FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = $setlist_selection_tier
		FormatText \{ChecksumName = tier_checksum
			'tier%s'
			S = $setlist_selection_tier}
		GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
		Change setlist_selection_song = ($setlist_selection_song - 1)
		if ($setlist_selection_song = -1)
			Change setlist_selection_tier = ($setlist_selection_tier - 1)
			FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = $setlist_selection_tier
			FormatText \{ChecksumName = tier_checksum
				'tier%s'
				S = $setlist_selection_tier}
			GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
			Change setlist_selection_song = (<array_Size> - 1)
			jump_tier = 1
		endif
		FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = ($setlist_selection_song + 1) S = $setlist_selection_tier AddToStringLookup = TRUE
		for_bonus = 0
		if ($current_tab = tab_bonus)
			<for_bonus> = 1
		endif
		if IsSongAvailable song_checksum = <song_checksum> Song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song]) for_bonus = <for_bonus>
			break
		endif
		repeat
		jump_tier_amt = (0.0, 240.0)
		if ($setlist_selection_index = 0)
			song_jump_amt = (0.0, 160.0)
			GetScreenElementProps \{Id = sl_clipart}
			SetScreenElementProps Id = sl_clipart Pos = (<Pos> + (0.0, 80.0))
			GetScreenElementProps \{Id = sl_clipart_shadow}
			SetScreenElementProps Id = sl_clipart_shadow Pos = (<Pos> + (0.0, 80.0))
			GetScreenElementProps \{Id = sl_clip}
			SetScreenElementProps Id = sl_clip Pos = (<Pos> + (0.0, 80.0))
			GetScreenElementProps \{Id = sl_highlight}
			SetScreenElementProps Id = sl_highlight Pos = (<Pos> + (0.0, 80.0))
		else
			song_jump_amt = (0.0, 80.0)
		endif
	endif
	FormatText \{ChecksumName = tier_checksum
		'tier%s'
		S = $setlist_selection_tier}
	Song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
	Change target_setlist_songpreview = <Song>
	clear_setlist_clip_and_art
	KillSpawnedScript \{Name = set_song_icon}
	SpawnScriptNow \{set_song_icon}
	FormatText \{ChecksumName = textid
		'id_song%i'
		I = $setlist_selection_index
		AddToStringLookup = TRUE}
	retail_menu_focus Id = <textid>
	SetScreenElementProps Id = <textid> Shadow
	<not_header> = 1
	if ($current_tab = tab_setlist)
		if (<jump_tier> = 1)
			Change setlist_begin_text = ($setlist_begin_text + <jump_tier_amt>)
			SetScreenElementProps \{Id = scrolling_setlist
				Pos = $setlist_begin_text}
			Change setlist_background_pos = ($setlist_background_pos + <jump_tier_amt>)
			<not_header> = 0
		endif
	endif
	if (<not_header>)
		Change setlist_begin_text = ($setlist_begin_text + <song_jump_amt>)
		SetScreenElementProps \{Id = scrolling_setlist
			Pos = $setlist_begin_text}
		Change setlist_background_pos = ($setlist_background_pos + <song_jump_amt>)
	endif
	SetScreenElementProps \{Id = setlist_menu
		Pos = $setlist_background_pos}
	SetScreenElementProps \{Id = setlist_bg_container
		Pos = $setlist_background_pos}
	SetScreenElementProps \{Id = setlist_loops_menu
		Pos = $setlist_background_pos}
	<Tier> = $setlist_selection_tier
	setlist_prefix = ($g_gh3_setlist.prefix)
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	get_song_covered_by Song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
	if GotParam \{covered_by}
		setlist_footnote \{Alpha = 1}
	else
		setlist_footnote \{Alpha = 0}
	endif
	if ($setlist_clip_rot_neg)
		SetScreenElementProps Id = sl_clip Rot_Angle = (0 - $setlist_clip_last_rot)
		Change \{setlist_clip_rot_neg = 0}
	else
		GetRandomValue \{Name = rot
			A = 10.0
			B = -30.0}
		SetScreenElementProps Id = sl_clip Rot_Angle = <rot>
		Change setlist_clip_last_rot = <rot>
		Change \{setlist_clip_rot_neg = 1}
	endif
	if (<Dir> = DOWN)
		Change setlist_random_images_scroll_num = ($setlist_random_images_scroll_num + 1)
		if ($setlist_random_images_scroll_num > $setlist_random_images_highest_num)
			Change setlist_random_images_highest_num = ($setlist_random_images_scroll_num)
			Mod A = ($setlist_random_images_highest_num) B = 4
			if (<Mod> = 0)
				setlist_display_random_bg_image
			endif
		endif
		Change setlist_background_loop_num = ($setlist_background_loop_num + 1)
		if ($setlist_background_loop_num = 10)
			Change \{setlist_background_loop_num = 0}
			Change setlist_background_loop_pos = ($setlist_background_loop_pos + (0.0, 1308.0))
			displaySprite \{PARENT = setlist_menu
				tex = Setlist_BG_Loop
				Pos = $setlist_background_loop_pos
				Dims = (1280.0, 1308.0)
				Z = 3.1}
		endif
		Change setlist_page1_num = ($setlist_page1_num + 1)
		if ($setlist_page1_num = 4)
			Change \{setlist_page1_num = 0}
			Change setlist_page1_loop_pos = ($setlist_page1_loop_pos + (0.0, 512.0))
			displaySprite \{PARENT = setlist_loops_menu
				tex = Setlist_Page1_Loop
				Pos = $setlist_page1_loop_pos
				Dims = $setlist_page1_dims
				Z = $setlist_page1_z}
		endif
		if ($current_tab = tab_bonus)
			Change setlist_page2_num = ($setlist_page2_num + 1)
			if ($setlist_page2_num = 5)
				Change \{setlist_page2_num = 0}
				Change setlist_page2_pos = ($setlist_page2_pos + (0.0, 665.5))
				displaySprite \{PARENT = setlist_loops_menu
					tex = Setlist_Page2_Loop
					Pos = $setlist_page2_pos
					Dims = $setlist_page2_dims
					Z = $setlist_page2_z}
			endif
		endif
		Change setlist_line_num = ($setlist_line_num + 1)
		if ($setlist_line_num = 1)
			Change \{setlist_line_num = 0}
			<I> = 1
			if NOT (<not_header>)
				<I> = 3
			endif
			begin
			if ($setlist_line_index = $setlist_line_max)
				Change \{setlist_line_index = 0}
			endif
			<Line> = Random (@ ($setlist_solid_lines [0]) @ ($setlist_solid_lines [1]) @ ($setlist_solid_lines [2]) )
			displaySprite PARENT = setlist_menu tex = <Line> Pos = $setlist_solid_line_pos Dims = (896.0, 16.0) Z = ($setlist_page1_z + 0.1)
			Change setlist_line_index = ($setlist_line_index + 1)
			if ($setlist_line_index = $setlist_line_max)
				Change \{setlist_line_index = 0}
			endif
			<Line> = Random (@ ($setlist_dotted_lines [0]) @ ($setlist_dotted_lines [1]) @ ($setlist_dotted_lines [2]) )
			displaySprite PARENT = setlist_menu tex = <Line> Pos = $setlist_dotted_line_pos Dims = (896.0, 16.0) Z = ($setlist_page1_z + 0.1)
			Change setlist_line_index = ($setlist_line_index + 1)
			Change setlist_solid_line_pos = (($setlist_solid_line_pos) + ($setlist_solid_line_add))
			Change setlist_dotted_line_pos = (($setlist_dotted_line_pos) + ($setlist_solid_line_add))
			repeat <I>
		endif
		change setlist_page3_num = ($setlist_page3_num + 1)
		if ($setlist_page3_num = 5)
			change \{setlist_page3_num = 0}
			change setlist_page3_pos = ($setlist_page3_pos + (0.0, 532.0))
			displaySprite \{parent = setlist_loops_menu
				tex = Setlist_Page3_Loop
				Pos = $setlist_page3_pos
				dims = $setlist_page3_dims
				z = $setlist_page3_z}
		endif
	else
		Change setlist_random_images_scroll_num = ($setlist_random_images_scroll_num - 1)
		Change setlist_background_loop_num = ($setlist_background_loop_num - 1)
		Change setlist_page1_num = ($setlist_page1_num - 1)
		Change setlist_line_num = ($setlist_line_num - 1)
		Change setlist_line_index = ($setlist_line_index + 1)
		if ($setlist_line_index = $setlist_line_max)
			Change \{setlist_line_index = 0}
		endif
		change setlist_page3_num = ($setlist_page3_num - 1)
		Change setlist_page2_num = ($setlist_page2_num - 1)
	endif
	if GotParam \{UP}
		generic_menu_up_or_down_sound \{UP}
	endif
	if GotParam \{DOWN}
		generic_menu_up_or_down_sound \{DOWN}
	endif
endscript

script setlist_footnote \{Alpha = 1}
	if NOT ScreenElementExists \{Id = setlist_overlay}
		CreateScreenElement {
			Type = ContainerElement
			PARENT = root_window
			Id = setlist_overlay
			Pos = (0.0, 0.0)
			just = [LEFT Top]
			Alpha = <Alpha>
		}
		CreateScreenElement \{Type = ContainerElement
			PARENT = setlist_overlay
			Id = setlist_footer
			Pos = (640.0, 645.0)
			z_priority = 1000
			just = [
				Center
				Bottom
			]
			Alpha = 1}
		CreateScreenElement \{Type = ContainerElement
			PARENT = setlist_footer
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
			PARENT = setlist_footer
			Id = setlist_footer_text
			Scale = (0.7, 0.6)
			Text = ($sl_cover_of_hit)
			Pos = (0.0, -1.0)
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
		<Tier> = $setlist_selection_tier
		setlist_prefix = ($g_gh3_setlist.prefix)
		FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
		FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
		get_song_artist Song = (($g_gh3_setlist).<tier_checksum>.songs [($setlist_selection_song)]) with_year = 0
		FormatText \{ChecksumName = artistid
			'artist_id%d'
			D = $setlist_num_songs}
		GetUpperCaseString <song_artist>
		song_artist = <UpperCaseString>
		StringLength String = <song_artist>
		StringToCharArray String = <song_artist>
		FormatText TextName = Text ($sl_cover_of_artist_hit) A = <song_artist>
		SetScreenElementProps Id = setlist_footer_text Text = <Text>
		DoScreenElementMorph \{Id = setlist_overlay
			Alpha = 1
			Time = 0.25}
	else
		SetScreenElementProps \{Id = setlist_footer_text
			Text = $sl_cover_of_hit}
		DoScreenElementMorph \{Id = setlist_overlay
			Alpha = 0.85
			Time = 0.25}
	endif
endscript

script setlist_display_random_bg_image 
	Side = 0
	old_image = 0
	begin
	can_left = 1
	can_right = 1
	flippable = 0
	mydims = (128.0, 128.0)
	minRot = -5
	maxRot = 5
	loffset = (0.0, 0.0)
	roffset = (0.0, 0.0)
	just = [LEFT Top]
	GetArraySize ($setlist_random_bg_images)
	begin
	GetRandomValue A = 0 B = (<array_Size> -1) Integer Name = randimage
	myimage = ($setlist_random_bg_images [<randimage>].texture)
	if NOT (<myimage> = <old_image>)
		if StructureContains Structure = ($setlist_random_bg_images [<randimage>]) flippable
			<flippable> = 1
		endif
		if StructureContains Structure = ($setlist_random_bg_images [<randimage>]) Dims
			<mydims> = ($setlist_random_bg_images [<randimage>].Dims)
		endif
		if StructureContains Structure = ($setlist_random_bg_images [<randimage>]) minRot
			<minRot> = ($setlist_random_bg_images [<randimage>].minRot)
		endif
		if StructureContains Structure = ($setlist_random_bg_images [<randimage>]) maxRot
			<maxRot> = ($setlist_random_bg_images [<randimage>].maxRot)
		endif
		if StructureContains Structure = ($setlist_random_bg_images [<randimage>]) loffset
			<loffset> = ($setlist_random_bg_images [<randimage>].loffset)
		endif
		if StructureContains Structure = ($setlist_random_bg_images [<randimage>]) roffset
			<roffset> = ($setlist_random_bg_images [<randimage>].roffset)
		endif
		if StructureContains Structure = ($setlist_random_bg_images [<randimage>]) only_left
			<can_right> = 0
		endif
		if StructureContains Structure = ($setlist_random_bg_images [<randimage>]) only_right
			<can_left> = 0
		endif
		if StructureContains Structure = ($setlist_random_bg_images [<randimage>]) center_just
			<just> = [Center Center]
		endif
		if StructureContains Structure = ($setlist_random_bg_images [<randimage>]) low_z
			<z_priority> = 3.2
		else
			<z_priority> = 6
		endif
		<old_image> = <myimage>
		break
	endif
	repeat
	GetRandomValue \{A = 300
		B = 600
		Integer
		Name = randdown}
	if (<Side> = 0)
		if (<can_left> = 1)
			imagepos = (($setlist_random_images_highest_num * (0.0, 300.0)) + ((0.0, 1.0) * <randdown>) + <loffset>)
		else
			imagepos = (($setlist_random_images_highest_num * (0.0, 300.0)) + ((0.0, 1.0) * <randdown>) + <roffset> + (1000.0, 0.0))
		endif
	else
		if (<can_right> = 1)
			imagepos = (($setlist_random_images_highest_num * (0.0, 300.0)) + ((0.0, 1.0) * <randdown>) + <roffset> + (1000.0, 0.0))
		else
			imagepos = (($setlist_random_images_highest_num * (0.0, 300.0)) + ((0.0, 1.0) * <randdown>) + <loffset>)
		endif
	endif
	imageflag = {}
	if (<flippable> = 1)
		GetRandomValue \{A = 1
			B = 3
			Integer
			Name = randflip}
		if (<randflip> = 1)
			imageflag = {flip_h flip_v}
		elseif (<randflip> = 2)
			imageflag = {flip_h}
		else
			imageflag = {flip_v}
		endif
	endif
	GetRandomValue A = <minRot> B = <maxRot> Name = randrot
	if StructureContains Structure = ($setlist_random_bg_images [<randimage>]) shoeprint
		displaySprite PARENT = setlist_bg_container tex = <myimage> Pos = <imagepos> Dims = (512.0, 512.0) Rot_Angle = <randrot> Z = 2 BlendMode = Subtract
		displaySprite PARENT = setlist_bg_container tex = <myimage> Pos = <imagepos> Dims = (512.0, 512.0) Rot_Angle = <randrot> Z = 2 BlendMode = Subtract
		displaySprite PARENT = setlist_bg_container tex = <myimage> Pos = <imagepos> Dims = (512.0, 512.0) Rot_Angle = <randrot> Z = 2 BlendMode = Subtract
	else
		displaySprite PARENT = setlist_bg_container tex = <myimage> Pos = <imagepos> Dims = <mydims> Rot_Angle = <randrot> Z = <z_priority> <imageflag> just = <just>
		displaySprite PARENT = setlist_bg_container tex = <myimage> Pos = <imagepos> Dims = <mydims> Rot_Angle = <randrot> Z = <z_priority> <imageflag> just = <just>
	endif
	<Side> = 1
	repeat 2
endscript

script setlist_songpreview_monitor 
	begin
	if NOT ($current_setlist_songpreview = $target_setlist_songpreview)
		Change \{setlist_songpreview_changing = 1}
		Song = ($target_setlist_songpreview)
		SongUnLoadFSB
		Wait \{0.5
			Second}
		if ($target_setlist_songpreview != <Song> || $target_setlist_songpreview = NONE)
			Change \{current_setlist_songpreview = NONE}
			Change \{setlist_songpreview_changing = 0}
		else
			get_song_prefix Song = <Song>
			get_song_struct Song = <Song>
			if StructureContains Structure = <song_struct> streamname
				song_prefix = (<song_struct>.streamname)
			endif
			if NOT SongLoadFSB song_prefix = <song_prefix>
				Change \{setlist_songpreview_changing = 0}
				DownloadContentLost
				return
			endif
			FormatText ChecksumName = song_preview '%s_preview' S = <song_prefix>
			get_song_struct Song = <Song>
			SoundBussUnlock \{Music_Setlist}
			SoundBussUnlock \{Band_Balance}
			SoundBussUnlock \{Guitar_Balance}
			if StructureContains Structure = <song_struct> Name = band_playback_volume
				setlistvol = ((<song_struct>.band_playback_volume))
				SetSoundBussParams {Music_Setlist = {vol = <setlistvol>}}
				SetSoundBussParams {Band_Balance = {vol = ((<song_struct>.band_playback_volume) - 1.5)}}
				SetSoundBussParams \{Guitar_Balance = {
						vol = -1.5
					}}
			else
				SetSoundBussParams \{Music_Setlist = {
						vol = 0.0
					}}
				SetSoundBussParams \{Band_Balance = {
						vol = -1.5
					}}
				SetSoundBussParams \{Guitar_Balance = {
						vol = -1.5
					}}
			endif
			SoundBussLock \{Music_Setlist}
			SoundBussLock \{Band_Balance}
			SoundBussLock \{Guitar_Balance}
			PlaySound <song_preview> buss = Music_Setlist
			Change current_setlist_songpreview = <Song>
			Change \{setlist_songpreview_changing = 0}
		endif
	elseif NOT ($current_setlist_songpreview = NONE)
		Song = ($current_setlist_songpreview)
		get_song_prefix Song = <Song>
		FormatText ChecksumName = song_preview '%s_preview' S = <song_prefix>
		if NOT IsSoundPlaying <song_preview>
			Change \{setlist_songpreview_changing = 1}
			if NOT SongLoadFSB song_prefix = <song_prefix>
				Change \{setlist_songpreview_changing = 0}
				DownloadContentLost
				return
			endif
			SoundBussUnlock \{Music_Setlist}
			SoundBussUnlock \{Band_Balance}
			SoundBussUnlock \{Guitar_Balance}
			if StructureContains Structure = <song_struct> Name = band_playback_volume
				setlistvol = ((<song_struct>.band_playback_volume))
				SetSoundBussParams {Music_Setlist = {vol = <setlistvol>}}
				SetSoundBussParams {Band_Balance = {vol = ((<song_struct>.band_playback_volume) - 1.5)}}
				SetSoundBussParams \{Guitar_Balance = {
						vol = -1.5
					}}
			else
				SetSoundBussParams \{Music_Setlist = {
						vol = 0.0
					}}
				SetSoundBussParams \{Band_Balance = {
						vol = -1.5
					}}
				SetSoundBussParams \{Guitar_Balance = {
						vol = -1.5
					}}
			endif
			SoundBussLock \{Music_Setlist}
			SoundBussLock \{Band_Balance}
			SoundBussLock \{Guitar_Balance}
			PlaySound <song_preview> buss = Music_Setlist
			Change \{setlist_songpreview_changing = 0}
		endif
	endif
	Wait \{1
		GameFrame}
	repeat
endscript
changing_tab = 0

script change_tab \{tab = tab_setlist
		button = 0}
	Change \{changing_tab = 1}
	if ($current_tab = <tab> && <button> = 1)
		Change \{changing_tab = 0}
		return
	endif
	if (<tab> = tab_setlist)
		if NOT ($current_tab = <tab>)
			menu_setlist_setlist_tab_sound
		endif
		get_progression_globals game_mode = ($game_mode)
	elseif (<tab> = tab_bonus)
		if NOT ($current_tab = <tab>)
			menu_setlist_bonus_tab_sound
		endif
		get_progression_globals game_mode = ($game_mode) Bonus
	elseif (<tab> = tab_downloads)
		if NOT ($current_tab = <tab>)
			menu_setlist_downloads_tab_sound
		endif
		get_progression_globals game_mode = ($game_mode) download
	endif
	Change g_gh3_setlist = <tier_global>
	Change current_tab = <tab>
	destroy_setlist_scrolling_menu
	create_setlist_scrolling_menu
	reset_vars \{del}
	destroy_menu \{menu_id = setlist_original_artist}
	destroy_menu \{menu_id = setlist_loops_menu}
	destroy_menu \{menu_id = setlist_menu}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = setlist_loops_menu
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	switch <tab>
		case tab_setlist
		change \{setlist_page3_z = 3.3}
		Change \{setlist_page2_z = 3.4}
		Change \{setlist_page1_z = 3.5}
		displaySprite \{PARENT = setlist_loops_menu
			tex = Setlist_Page1_Loop
			Pos = $setlist_page1_loop_pos
			Dims = $setlist_page1_dims
			Z = $setlist_page1_z}
		displaySprite parent = setlist_loops_menu tex = Setlist_Page3_Loop Pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		case tab_downloads
		change \{setlist_page3_z = 3.5}
		change \{setlist_page2_z = 3.4}
		change \{setlist_page1_z = 3.3}
		displaySprite \{parent = setlist_loops_menu
			tex = Setlist_Page1_Loop
			Pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		change setlist_page3_pos = ($setlist_page3_pos + (0.0, 40.0))
		displaySprite parent = setlist_loops_menu tex = Setlist_Page3_Loop Pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		case tab_bonus
		change \{setlist_page3_z = 3.3}
		Change \{setlist_page2_z = 3.8}
		Change \{setlist_page1_z = 3.4}
		displaySprite \{PARENT = setlist_loops_menu
			tex = Setlist_Page1_Loop
			Pos = $setlist_page1_loop_pos
			Dims = $setlist_page1_dims
			Z = $setlist_page1_z}
		displaySprite parent = setlist_loops_menu tex = Setlist_Page3_Loop Pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		displaySprite PARENT = setlist_loops_menu tex = Setlist_Page2_Loop Pos = ($setlist_page2_pos + (0.0, 553.0)) Dims = $setlist_page2_dims Z = $setlist_page2_z
	endswitch
	create_sl_assets <tab>
	SetScreenElementProps \{Id = setlist_bg_container
		Pos = (0.0, 0.0)}
	Change \{setlist_random_images_scroll_num = 0}
	Change setlist_page2_pos = ($setlist_page2_pos + (0.0, 553.0))
	change setlist_page3_pos = ($setlist_page3_pos + (-180.0, 614.0))
	SetScreenElementProps \{id = sl_page3_head
		z_priority = $setlist_page3_z}
	SetScreenElementProps \{Id = sl_page2_head
		z_priority = $setlist_page2_z}
	SetScreenElementProps \{Id = sl_page1_head
		z_priority = $setlist_page1_z}
	if ($setlist_selection_found = 1)
		FormatText \{ChecksumName = tier_checksum
			'tier%s'
			S = $setlist_selection_tier}
		Song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
		Change target_setlist_songpreview = <Song>
	else
		Change \{target_setlist_songpreview = NONE}
	endif
	KillSpawnedScript \{Name = set_song_icon}
	SpawnScriptNow \{set_song_icon
		Params = {
			No_wait
		}}
	if ($is_network_game = 0)
		LaunchEvent \{Type = Focus
			Target = vmenu_setlist}
	else
		if ($net_current_flow_state = Song)
			LaunchEvent \{Type = Focus
				Target = vmenu_setlist}
		endif
	endif
	Change \{changing_tab = 0}
endscript

script reset_vars 
	if GotParam \{del}
		Change \{setlist_begin_text = (0.0, 0.0)}
		Change \{setlist_background_pos = (0.0, 0.0)}
		Change \{setlist_background_loop_pos = (0.0, 676.0)}
		Change \{setlist_background_loop_num = 0}
		Change \{setlist_selection_index = 0}
		destroy_menu \{menu_id = sl_overshadow}
		destroy_menu \{menu_id = sl_clipart}
		destroy_menu \{menu_id = sl_clipart_shadow}
		destroy_menu \{menu_id = sl_clip}
		destroy_menu \{menu_id = sl_bg_helper}
		destroy_menu \{menu_id = sl_highlight}
		destroy_menu \{menu_id = sl_fixed}
	endif
	Change \{setlist_page1_num = 0}
	Change \{setlist_page1_loop_pos = (157.0, 768.0)}
	Change \{setlist_line_num = 0}
	change \{setlist_page3_pos = (210.0, 86.0)}
	change \{setlist_page3_num = 0}
	Change \{setlist_page2_num = 0}
	Change \{setlist_page2_pos = (240.0, 50.0)}
	Change \{setlist_line_index = 0}
	Change \{setlist_clip_last_rot = 0}
	Change \{setlist_clip_rot_neg = 0}
endscript

script IsSongAvailable \{for_bonus = 0}
	if ($coop_dlc_active = 1)
		if (<Song> = paintitblack)
			return \{FALSE}
		endif
	endif
	if ($is_network_game)
		return \{TRUE}
	endif
	if NOT is_song_downloaded song_checksum = <song>
		return \{FALSE}
	endif
	if (<download> = 1)
		return \{TRUE}
	elseif (<for_bonus> = 1)
		GetGlobalTags <Song> Param = unlocked
	else
		GetGlobalTags <song_checksum> Param = unlocked
	endif
	if (<unlocked> = 1)
		return \{TRUE}
	endif
	return \{FALSE}
endscript
we_have_songs = FALSE

script create_sl_assets 
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = setlist_menu
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	CreateScreenElement \{Type = WindowElement
		PARENT = setlist_menu
		Id = setlist_scroll_text_window
		Pos = (400.0, 465.0)
		Dims = (430.0, 3240.0)}
	if NOT ScreenElementExists \{Id = setlist_bg_container}
		CreateScreenElement \{Type = ContainerElement
			PARENT = root_window
			Id = setlist_bg_container
			Pos = (0.0, 0.0)
			just = [
				LEFT
				Top
			]}
	endif
	displaySprite \{Id = sl_bg_head
		PARENT = setlist_menu
		tex = Setlist_BG_Head
		Pos = (0.0, 0.0)
		Dims = (1280.0, 676.0)
		Z = 3.1}
	displaySprite \{Id = sl_bg_loop
		PARENT = setlist_menu
		tex = Setlist_BG_Loop
		Pos = $setlist_background_loop_pos
		Dims = (1280.0, 1352.0)
		Z = 3.1}
	begin
	displaySprite \{PARENT = setlist_menu
		tex = Setlist_Shoeprint
		Pos = (850.0, -70.0)
		Dims = (640.0, 768.0)
		Alpha = 0.15
		Z = 3.2
		flip_v
		Rot_Angle = 10
		BlendMode = Subtract
		Z = 3.175}
	repeat 3
	displaySprite \{id = sl_page3_head
		parent = setlist_menu
		tex = Setlist_Page3_Head
		Pos = $setlist_page3_pos
		dims = (922.0, 614.0)
		z = $setlist_page3_z}
	displaySprite \{Id = sl_page2_head
		PARENT = setlist_menu
		tex = Setlist_Page2_Head
		Pos = $setlist_page2_pos
		Dims = (819.0, 553.0)
		Z = $setlist_page2_z}
	displaySprite \{flip_h
		Id = sl_page1_head
		PARENT = setlist_menu
		tex = Setlist_Page1_Head
		Pos = (160.0, 0.0)
		Dims = (922.0, 768.0)
		Z = $setlist_page1_z}
	displaySprite PARENT = setlist_menu tex = Setlist_Page1_Line_Red Pos = (320.0, 12.0) Dims = (8.0, 6400.0) Z = ($setlist_page1_z + 0.1)
	<title_pos> = (300.0, 383.0)
	displaySprite Id = sl_page1_head_lines PARENT = setlist_menu tex = Setlist_Page1_Head_Lines Pos = (176.0, 64.0) Dims = (896.0, 320.0) Z = ($setlist_page1_z + 0.1)
	<begin_line> = (176.0, 420.0)
	<solid_line_pos> = (176.0, 340.0)
	<dotted_line_pos> = (176.0, 380.0)
	<dotted_line_add> = ($setlist_solid_line_add)
	begin
	<Line> = Random (@ ($setlist_solid_lines [0]) @ ($setlist_solid_lines [1]) @ ($setlist_solid_lines [2]) )
	<solid_line_pos> = (<solid_line_pos> + $setlist_solid_line_add)
	displaySprite PARENT = setlist_menu tex = <Line> Pos = <solid_line_pos> Dims = (878.0, 16.0) Z = ($setlist_page1_z + 0.1)
	repeat 8
	begin
	<Line> = Random (@ ($setlist_dotted_lines [0]) @ ($setlist_dotted_lines [1]) @ ($setlist_dotted_lines [2]) )
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	displaySprite PARENT = setlist_menu tex = <Line> Pos = <dotted_line_pos> Dims = (878.0, 16.0) Z = ($setlist_page1_z + 0.1)
	repeat 8
	<solid_line_pos> = (<solid_line_pos> + $setlist_solid_line_add)
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	Change setlist_solid_line_pos = <solid_line_pos>
	Change setlist_dotted_line_pos = <dotted_line_pos>
	Change \{setlist_num_songs = 0}
	if English
		setlist_header_tex = Setlist_Page1_Title
	elseif French
		setlist_header_tex = Setlist_Page1_Title_fr
	elseif German
		setlist_header_tex = Setlist_Page1_Title_de
	elseif Spanish
		setlist_header_tex = Setlist_Page1_Title_sp
	elseif Italian
		setlist_header_tex = Setlist_Page1_Title_it
	endif
	if GotParam \{tab_setlist}
		CreateScreenElement {
			Type = SpriteElement
			Id = sl_page1_title
			PARENT = setlist_menu
			texture = <setlist_header_tex>
			Pos = (330.0, 220.0)
			Dims = (512.0, 128.0)
			just = [Top LEFT]
			rgba = [100 230 255 255]
			Alpha = 0.8
			z_priority = ($setlist_page1_z + 0.2)
			Rot_Angle = 0
			BLEND = Subtract
			Alpha = 0.7
		}
		GetUpperCaseString ($g_gh3_setlist.tier1.Title)
		displayText Id = sl_text_1 PARENT = setlist_menu Scale = (1.0, 1.0) Text = <UpperCaseString> rgba = (($G_menu_colors).pink) Pos = <title_pos> Z = $setlist_text_z noshadow
	endif
	if GotParam \{tab_downloads}
		displayText \{parent = setlist_menu
			id = sl_text_1
			text = $sl_custom_songs_big
			font = text_a10
			Scale = 2
			Pos = (330.0, 220.0)
			rgba = [
				50
				30
				20
				255
			]
			z = $setlist_text_z
			noshadow}
		displaySprite parent = setlist_menu tex = Setlist_Page1_Line_Red Pos = (320.0, 216.0) dims = (8.0, 6400.0) z = ($setlist_page1_z - 0.2)
	endif
	if GotParam \{tab_bonus}
		CreateScreenElement \{Type = TextElement
			PARENT = setlist_menu
			Id = sl_text_1
			Text = "The Vault"
			font = text_a10
			Scale = 2
			Pos = (330.0, 220.0)
			just = [
				LEFT
				Top
			]
			rgba = [
				50
				30
				20
				255
			]
			z_priority = $setlist_text_z}
		displaySprite PARENT = setlist_menu tex = Setlist_Page1_Line_Red Pos = (320.0, 216.0) Dims = (8.0, 6400.0) Z = ($setlist_page1_z - 0.2)
	endif
	<text_pos> = (<title_pos> + (40.0, 54.0))
	if ((GotParam tab_setlist) || (GotParam tab_bonus) || (GotParam tab_downloads))
		num_tiers = ($g_gh3_setlist.num_tiers)
		<Tier> = 0
		Change \{setlist_selection_index = 0}
		Change \{setlist_selection_tier = 1}
		Change \{setlist_selection_song = 0}
		Change \{setlist_selection_found = 0}
		begin
		<Tier> = (<Tier> + 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
		FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
		GetGlobalTags <tiername> Param = unlocked
		if (<unlocked> = 1 || $is_network_game = 1)
			if NOT (<Tier> = 1)
				<text_pos> = (<text_pos> + (-40.0, 110.0))
				GetUpperCaseString ($g_gh3_setlist.<tier_checksum>.Title)
				displayText PARENT = setlist_menu Scale = (1.0, 1.0) Text = <UpperCaseString> rgba = (($G_menu_colors).pink) Pos = <text_pos> Z = $setlist_text_z noshadow
				<text_pos> = (<text_pos> + (40.0, 50.0))
			endif
			Change \{we_have_songs = FALSE}
			GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
			num_songs = <array_Size>
			num_songs_unlocked = 0
			song_count = 0
			if (<array_Size> > 0)
				begin
				setlist_prefix = ($g_gh3_setlist.prefix)
				FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = <Tier> AddToStringLookup = TRUE
				for_bonus = 0
				if ($current_tab = tab_bonus)
					<for_bonus> = 1
				endif
				if IsSongAvailable song_checksum = <song_checksum> Song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>]) for_bonus = <for_bonus>
					if ($setlist_selection_found = 0)
						Change setlist_selection_tier = <Tier>
						Change setlist_selection_song = <song_count>
						Change \{setlist_selection_found = 1}
					endif
					get_song_title Song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_song_prefix Song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_song_artist Song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					if get_song_covered_by Song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
						FormatText TextName = Song_Title ($sl_cover_song) S = <Song_Title>
					endif
					FormatText \{ChecksumName = textid
						'id_song%i'
						I = $setlist_num_songs
						AddToStringLookup = TRUE}
					CreateScreenElement {
						Type = TextElement
						Id = <textid>
						PARENT = setlist_menu
						Scale = (0.85, 0.85)
						Text = <Song_Title>
						Pos = <text_pos>
						rgba = (($G_menu_colors).dk_violet_grey)
						z_priority = $setlist_text_z
						font = text_a5
						just = [LEFT Top]
						font_spacing = 0.5
						no_shadow
						shadow_offs = (1.0, 1.0)
						shadow_rgba = [0 0 0 255]
					}
					GetScreenElementDims Id = <Id>
					fit_text_in_rectangle Id = <Id> Dims = ((475.0, 0.0) + (<Height> * (0.0, 1.0))) start_x_scale = 0.85 start_y_scale = 0.85 only_if_larger_x = 1
					if ($game_mode = p2_quickplay)
						get_difficulty_text_nl DIFFICULTY = ($current_difficulty_coop)
					else
						get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
					endif
					get_song_prefix Song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl>
					if ($is_network_game = 0)
						GetGlobalTags <song_checksum>
						GetGlobalTags <songname>
						if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
							get_quickplay_song_stars Song = <song_prefix>
						endif
						if NOT ($game_mode = training || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
							if Progression_IsBossSong tier_global = $g_gh3_setlist Tier = <Tier> Song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
								STARS = 0
							endif
							if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
								GetGlobalTags <songname> Param = percent100
							else
								GetGlobalTags <song_checksum> Param = percent100
							endif
							if (<STARS> > 2)
								<star_space> = (25.0, 0.0)
								<star_pos> = (<text_pos> + (670.0, 10.0))
								begin
								if (<percent100> = 1)
									<Star> = Setlist_Goldstar
								else
									<Star> = Random (@ ($setlist_loop_stars [0]) @ ($setlist_loop_stars [1]) @ ($setlist_loop_stars [2]) )
								endif
								<star_pos> = (<star_pos> - <star_space>)
								CreateScreenElement {
									Type = SpriteElement
									PARENT = setlist_menu
									texture = <Star>
									just = [Center Center]
									rgba = [200 220 233 255]
									z_priority = $setlist_text_z
									Pos = <star_pos>
									Rot_Angle = (RandomRange (-20.0, 20.0))
									Scale = 0.9
								}
								repeat <STARS>
							endif
							GetGlobalTags <song_checksum> Param = Score
							if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
								get_quickplay_song_score Song = <song_prefix>
							endif
							if (<Score> > 0)
								if Progression_IsBossSong tier_global = $g_gh3_setlist Tier = <Tier> Song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
									if (<Score> = 1)
										FormatText \{TextName = score_text
											$sl_wussed_out}
									else
										FormatText \{TextName = score_text
											$sl_battle_won}
									endif
								else
									FormatText TextName = score_text "%d" D = <Score> UseCommas
								endif
								<score_pos> = (<text_pos> + (660.0, 40.0))
								CreateScreenElement {
									Type = TextElement
									PARENT = setlist_menu
									Scale = (0.75, 0.75)
									Text = <score_text>
									Pos = <score_pos>
									rgba = (($G_menu_colors).dk_violet_grey)
									z_priority = $setlist_text_z
									font = text_a5
									just = [RIGHT Top]
									noshadow
									Alpha = 0.8
								}
								GetScreenElementDims Id = <Id>
								fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((130.0, 0.0) + <Height> * (0.0, 1.0)) start_x_scale = 0.75 start_y_scale = 0.75
							endif
						endif
					endif
					<text_pos> = (<text_pos> + (60.0, 40.0))
					FormatText \{ChecksumName = artistid
						'artist_id%d'
						D = $setlist_num_songs}
					GetUpperCaseString <song_artist>
					song_artist = <UpperCaseString>
					CreateScreenElement {
						Type = TextElement
						PARENT = setlist_menu
						Id = <artistid>
						font = text_a5
						Scale = (0.6, 0.6)
						just = [Top LEFT]
						Text = <song_artist>
						rgba = (($G_menu_colors).dk_violet_grey)
						Alpha = 0.5
						Pos = <text_pos>
						z_priority = $setlist_text_z
						font_spacing = 1
					}
					GetScreenElementDims Id = <Id>
					fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((425.0, 0.0) + (<Height> * (0.0, 1.0))) start_x_scale = 0.6 start_y_scale = 0.6
					<text_pos> = (<text_pos> + (-60.0, 40.0))
					Change setlist_num_songs = ($setlist_num_songs + 1)
					num_songs_unlocked = (<num_songs_unlocked> + 1)
					Change \{we_have_songs = TRUE}
				endif
				song_count = (<song_count> + 1)
				repeat <num_songs>
				if (($current_tab = tab_bonus) && (<num_songs_unlocked> = 0))
					CreateScreenElement {
						Type = TextElement
						PARENT = setlist_menu
						Id = empty_bonus_song_title
						font = text_a5
						Scale = 1
						just = [Center Center]
						Text = ($sl_bonus_no_songs)
						rgba = (($G_menu_colors).dk_violet_grey)
						Pos = (650.0, 470.0)
						z_priority = 50
						font_spacing = 1
					}
					GetScreenElementDims Id = <Id>
					fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((500.0, 0.0) + (<Height> * (0.0, 1.0)))
				endif
			endif
			if (($game_mode = p1_career) && (GotParam tab_setlist) && $is_demo_mode = 0)
				GetGlobalTags <tiername> Param = Complete
				if (<Complete> = 0)
					GetGlobalTags <tiername> Param = boss_unlocked
					GetGlobalTags <tiername> Param = encore_unlocked
					GetGlobalTags <tiername> Param = aerosmith_unlocked
					if (<encore_unlocked> = 1)
						FormatText \{TextName = completeText
							$sl_beat_encore}
					elseif (<aerosmith_unlocked> = 1)
						GetGlobalTags <tiername> Param = num_songs_to_progress
						if (<num_songs_to_progress> = 1)
							FormatText TextName = completeText ($sl_beat_aerosmith_1) P = <num_songs_to_progress>
						else
							FormatText TextName = completeText ($sl_beat_aerosmith_2) P = <num_songs_to_progress>
						endif
					elseif (<boss_unlocked> = 1)
						FormatText \{TextName = completeText
							$sl_beat_boss}
					else
						GetGlobalTags <tiername> Param = num_intro_songs_to_progress
						if (<num_intro_songs_to_progress> = 1)
							FormatText TextName = completeText ($sl_beat_opening_act_1) P = <num_intro_songs_to_progress>
						else
							FormatText TextName = completeText ($sl_beat_opening_act_2) P = <num_intro_songs_to_progress>
						endif
					endif
					CreateScreenElement {
						Type = TextElement
						PARENT = setlist_menu
						Scale = (0.6, 0.6)
						Text = <completeText>
						font = text_a5
						Pos = (<text_pos> + (300.0, 38.0))
						just = [Center Top]
						z_priority = $setlist_text_z
						rgba = (($G_menu_colors).pink)
					}
					GetScreenElementDims Id = <Id>
					fit_text_in_rectangle Id = <Id> Dims = (<Height> * (0.0, 1.0) + (450.0, 0.0)) only_if_larger_x = 1 start_y_scale = 1.1 start_x_scale = 1.1
				endif
			endif
		endif
		repeat <num_tiers>
		setlist_footnote \{Alpha = 0}
	endif
	if NOT (($current_tab = tab_bonus) && (<num_songs_unlocked> = 1))
		if (($game_mode = p1_career) && $is_demo_mode = 0)
			get_progression_globals game_mode = ($game_mode)
			summation_career_score tier_global = <tier_global>
			FormatText TextName = total_score_text ($sl_career_score) D = <career_score> UseCommas
			displayText {
				PARENT = setlist_menu
				Scale = 0.7
				Text = <total_score_text>
				Pos = ((640.0, 120.0) + (<text_pos>.(0.0, 1.0) * (0.0, 1.0)))
				just = [Center Top]
				Z = $setlist_text_z
				rgba = (($G_menu_colors).dk_violet_grey)
				noshadow
			}
		endif
	endif
	Change \{setlist_begin_text = $setlist_menu_pos}
	if ($setlist_num_songs > 0)
		setlist_menu_focus \{Id = id_song0}
		SetScreenElementProps \{Id = id_song0
			Shadow}
	endif
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = sl_fixed
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	<clip_pos> = (160.0, 390.0)
	displaySprite Id = sl_clipart PARENT = sl_fixed Pos = <clip_pos> Dims = (160.0, 160.0) Z = ($setlist_text_z + 0.1) rgba = [200 200 200 255]
	displaySprite Id = sl_clipart_shadow PARENT = sl_fixed Pos = (<clip_pos> + (3.0, 3.0)) Dims = (160.0, 160.0) Z = ($setlist_text_z) rgba = [0 0 0 128]
	<clip_pos> = (<clip_pos> + (15.0, 50.0))
	displaySprite Id = sl_clip PARENT = sl_fixed tex = Setlist_Clip just = [-0.5 -0.9] Pos = <clip_pos> Dims = (141.0, 102.0) Z = ($setlist_text_z + 0.2)
	if ($current_tab = tab_setlist)
		hilite_dims = (737.0, 80.0)
	elseif ($current_tab = tab_downloads)
		hilite_dims = (722.0, 80.0)
	elseif ($current_tab = tab_bonus)
		hilite_dims = (710.0, 80.0)
	endif
	if GotParam \{tab_bonus}
		CreateScreenElement {
			Type = SpriteElement
			Id = sl_highlight
			PARENT = sl_fixed
			texture = White
			just = [LEFT Top]
			Pos = (326.0, 428.0)
			Dims = <hilite_dims>
			z_priority = ($setlist_text_z - 0.1)
			rgba = [200 185 95 110]
		}
	else
		CreateScreenElement {
			Type = SpriteElement
			Id = sl_highlight
			PARENT = sl_fixed
			texture = White
			just = [LEFT Top]
			Pos = (326.0, 428.0)
			Dims = <hilite_dims>
			z_priority = ($setlist_text_z - 0.1)
			rgba = [255 250 250 200]
		}
	endif
	<bg_helper_pos> = (140.0, 585.0)
	<helper_rgba> = [105 65 7 160]
	Change \{user_control_pill_gap = 100}
	if ($current_tab = tab_setlist)
		setlist_show_helperbar Pos = (<bg_helper_pos> + (64.0, 4.0))
	elseif ($current_tab = tab_bonus)
		setlist_show_helperbar {
			Pos = (<bg_helper_pos> + (64.0, 4.0))
			text_option1 = ($sl_setlist_big)
			text_option2 = ($sl_customs_tier_big)
			button_option1 = "\\b6"
			button_option2 = "\\b8"
		}
	else
		setlist_show_helperbar {
			Pos = (<bg_helper_pos> + (64.0, 4.0))
			text_option1 = ($sl_setlist_big)
			text_option2 = "THE VAULT"
			button_option1 = "\\b6"
			button_option2 = "\\b7"
		}
	endif
	displaySprite \{Id = sl_overshadow
		rgba = [
			105
			65
			7
			160
		]
		PARENT = root_window
		tex = Setlist_Overshadow
		Pos = (0.0, 0.0)
		Dims = (1280.0, 720.0)
		Z = 5.0}
endscript

script setlist_menu_focus 
	if GotParam \{Id}
		if ScreenElementExists Id = <Id>
			SetScreenElementProps Id = <Id> rgba = (($G_menu_colors).dk_violet_grey)
		endif
	else
		GetTags
		PrintStruct <...>
		SetScreenElementProps Id = <Id> rgba = (($G_menu_colors).dk_violet_grey)
	endif
endscript

script get_quickplay_song_score 
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty_coop)
	else
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
	endif
	get_formatted_songname song_prefix = <Song> difficulty_text_nl = <difficulty_text_nl>
	GetGlobalTags <songname>
	return Score = <bestscore>
endscript

script get_quickplay_song_stars 
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty_coop)
	else
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
	endif
	get_formatted_songname song_prefix = <Song> difficulty_text_nl = <difficulty_text_nl>
	GetGlobalTags <songname>
	return STARS = <beststars>
endscript

script setlist_show_helperbar \{text_option1 = "THE VAULT"
		text_option2 = $sl_customs_tier_big
		button_option1 = "\\b7"
		button_option2 = "\\b8"
		Spacing = 16}
	if ($num_user_control_helpers > 0)
		clean_up_user_control_helpers
		Change \{user_control_pill_gap = 100}
	endif
	if NOT English
		Change \{pill_helper_max_width = 65}
	endif
	text_options = [
		"UP/DOWN"
		"SELECT"
		"BACK"
	]
	SetArrayElement arrayName = text_options index = 0 newValue = ($text_button_updown)
	SetArrayElement arrayName = text_options index = 1 newValue = ($text_button_select)
	SetArrayElement arrayName = text_options index = 2 newValue = ($text_button_back)
	button_options = [
		"\\bb"
		"\\m0"
		"\\m1"
	]
	I = 0
	begin
	if (<I> > 2)
		if (<I> = 3)
			<text1> = <button_option1>
		else
			<text1> = <button_option2>
		endif
	else
		<text1> = (<button_options> [<I>])
	endif
	if (<I> > 2)
		if (<I> = 3)
			<text2> = <text_option1>
		else
			<text2> = <text_option2>
		endif
	else
		<text2> = (<text_options> [<I>])
	endif
	switch <text1>
		case "\\bb"
		<button> = Strumbar
		case "\\m0"
		<button> = Green
		case "\\m1"
		<button> = RED
		case "\\b6"
		<button> = Yellow
		case "\\b7"
		<button> = BLUE
		case "\\b8"
		<button> = orange
	endswitch
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
	if ($is_network_game = 1)
		if IsHost
			if ($host_songs_to_pick > 0)
				if NOT (($g_tie_breaker_song = 1) && (<I> = 2))
					add_user_control_helper Text = <text2> button = <button> Z = 100
				endif
			endif
		else
			if ($client_songs_to_pick > 0)
				if NOT (($g_tie_breaker_song = 1) && (<I> = 2))
					add_user_control_helper Text = <text2> button = <button> Z = 100
				endif
			elseif (<I> = 2)
				add_user_control_helper Text = <text2> button = <button> Z = 100
			endif
		endif
	else
		add_user_control_helper Text = <text2> button = <button> Z = 100
	endif
	<I> = (<I> + 1)
	repeat 5
	tabs_text = ["setlist" "the Vault" "customs"]
	SetArrayElement arrayName = tabs_text index = 0 newValue = ($sl_setlist_tab)
	SetArrayElement arrayName = tabs_text index = 2 newValue = ($sl_customs_tab)
	setlist_text_positions = [(300.0, 70.0) (624.0, 102.0) (870.0, 120.0)]
	download_text_positions = [(300.0, 70.0) (624.0, 102.0) (870.0, 160.0)]
	buttons_text = ["\\b7" "\\b6" "\\b8"]
	setlist_button_positions = [(580.0, 90.0) (260.0, 65.0) (830.0, 110.0)]
	download_button_positions = [(580.0, 90.0) (260.0, 65.0) (830.0, 150.0)]
	I = 0
	begin
	button_text_pos = (<setlist_button_positions> [<I>])
	if ($current_tab = tab_downloads)
		<button_text_pos> = (<download_button_positions> [<i>])
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = setlist_menu
		Scale = 1
		Text = (<buttons_text> [<I>])
		rgba = [128 128 128 255]
		Pos = <button_text_pos>
		z_priority = 50
		font = buttonsxenon
		just = [LEFT Top]
	}
	tab_text_pos = (<setlist_text_positions> [<I>])
	if ($current_tab = tab_downloads)
		<tab_text_pos> = (<download_text_positions> [<i>])
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = setlist_menu
		font = text_a5
		Scale = 1
		Text = (<tabs_text> [<I>])
		rgba = [0 0 0 255]
		Pos = <tab_text_pos>
		z_priority = 50
		just = [LEFT Top]
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((185.0, 0.0) + (<Height> * (0.0, 1.0))) start_x_scale = 1 start_y_scale = 1 only_if_larger_x = 1
	<I> = (<I> + 1)
	repeat 3
endscript
