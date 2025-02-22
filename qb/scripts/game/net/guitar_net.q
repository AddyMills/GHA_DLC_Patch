num_players_info = [
	{
		Name = "2 Players"
		Checksum = num_2
		num = 2
	}
]
num_private_slots = [
	{
		Name = "0 Players"
		Checksum = num_0
		num = 0
	}
	{
		Name = "1 Players"
		Checksum = num_1
		num = 1
	}
	{
		Name = "2 Players"
		Checksum = num_2
		num = 2
	}
]
FilterTypes = {
	diff = {
		values = [
			"ANY"
			"EASY"
			"MEDIUM"
			"HARD"
			"EXPERT"
		]
		Checksum = [
			dont_care
			EASY
			MEDIUM
			HARD
			EXPERT
		]
	}
	mode = {
		values = [
			"ANY"
			"FACE-OFF"
			"PRO FACE-OFF"
			"BATTLE"
			"CO-OP"
		]
		Checksum = [
			dont_care
			p2_faceoff
			p2_pro_faceoff
			p2_battle
			p2_coop
		]
	}
	Type = {
		values = [
			"PLAYER"
			"RANKED"
		]
		Checksum = [
			Player
			Ranked
		]
	}
	num_songs = {
		values = [
			"ANY"
			"1"
			"Best of 3"
			"Best of 5"
			"Best of 7"
		]
		values_coop = [
			"ANY"
			"1"
			"3"
			"5"
			"7"
		]
		Checksum = [
			dont_care
			num_1
			num_3
			num_5
			num_7
		]
	}
	tie = {
		values = [
			"ANY"
			"HOST"
			"CLIENT"
			"RANDOM"
		]
		Checksum = [
			dont_care
			HOST
			CLIENT
			song_rand
		]
	}
	search = {
		values = [
			"ALL TIME"
			"MY RANK"
			"MY FRIENDS"
		]
	}
	song_type = {
		values = [
			"NORMAL SONGS"
			"CO-OP SONGS"
		]
	}
	vport = {
		values = [
			"DOUBLE"
			"SINGLE"
		]
	}
	lb_diff = {
		values = [
			"EASY"
			"MEDIUM"
			"HARD"
			"EXPERT"
		]
	}
}
Leaderboard_Difficulty_Lookup_Table = {
	EASY = 'easy'
	MEDIUM = 'medium'
	HARD = 'hard'
	EXPERT = 'expert'
}
online_light_purple = [
	190
	180
	205
	250
]
online_dark_purple = [
	70
	40
	70
	250
]
online_light_blue = [
	180
	230
	250
	250
]
online_medium_blue = [
	35
	130
	175
	250
]
online_dark_blue = [
	0
	70
	100
	250
]
online_score_bars = [
	60
	50
	70
	128
]
online_trans_grey = [
	0
	0
	0
	200
]
online_grey = [
	75
	75
	75
	250
]
online_light_grey = [
	75
	75
	75
	150
]
online_red = [
	255
	0
	0
	255
]
online_yellow = [
	210
	210
	0
	255
]
online_orange = [
	255
	165
	0
	255
]
online_green = [
	0
	150
	0
	255
]
online_general_menu_pos = (640.0, 75.0)
online_general_menu_hi_lite_ypos = [
	0.0
	0.0
	0.0
	0.0
]
net_current_flow_state = NONE
net_can_send_approval = 1
net_safe_to_enter_net_play = 1
player1_song_selections = [
	NULL
	NULL
	NULL
]
player2_song_selections = [
	NULL
	NULL
	NULL
]
tie_breaker_song = bullsonparade
match_type = Player
opponent_gamertag = NULL
online_song_count = 0
player2_present = 0
player1_max_song_selections = 0
player1_current_song_selections = 0
player2_max_song_selections = 0
player2_current_song_selections = 0
player1_selected_guitar = Instrument_Les_Paul_Black
player1_selected_bass = Instrument_LP_VBRST
player2_selected_guitar = Instrument_Les_Paul_Black
player2_selected_bass = Instrument_LP_VBRST
retrieved_message_of_the_day = 0
message_of_the_day = ""
OptionsGameModeValue = 0
OptionsDifficultyValue = 0
OptionsNumSongsValue = 0
OptionsTieBreakerValue = 0
OptionsHighwayValue = 0
OptionsGameModeRanked = 0
OptionsDifficultyRanked = 0
OptionsNumSongsRanked = 0
LeaderboardSearchValue = 0
LeaderboardSongTypeValue = 0
LeaderboardDiffValue = 3
CopyOfGlobal = 0
SearchMatchTypeValue = 0
SearchGameModeValue = 0
SearchDifficultyValue = 0
SearchNumSongsValue = 0
SearchTieBreakerValue = 0
TempGameModeValue = 0
TempDifficultyValue = 0
TempNumSongsValue = 0
TempTieBreakerValue = 0
TempHighwayValue = 0
TempGameModeRanked = 0
TempDifficultyRanked = 0
TempNumSongsRanked = 0
gt_player1_pos = (270.0, 95.0)
gt_player2_pos = (1010.0, 95.0)
hack_ignore_streak_counter = 0

script set_streak_ignore 
	Change \{hack_ignore_streak_counter = 5}
endscript
net_game_type_info = [
	{
		Name = "PRO FACEOFF"
		description = "Play a song with the same notes."
		Checksum = p2_pro_faceoff
	}
	{
		Name = "FACEOFF"
		description = "Dueling sections on lead guitar."
		Checksum = p2_faceoff
	}
	{
		Name = "BATTLE"
		description = "Battle mode."
		Checksum = p2_battle
	}
	{
		Name = "CO-OP"
		description = "Mix lead guitar with bass/rhythm guitar."
		Checksum = p2_coop
	}
]
xenon_invite_confirm_title = "GAME INVITE"
xenon_invite_confirm_dialog = "Accepting this invite will lose progress in any currently active goals. Do you want to continue?"
xenon_invite_confirm_yes = "YES"
xenon_invite_confirm_no = "NO"
xenon_session_confirm_title = "JOIN SESSION"
xenon_session_confirm_dialog = "Joining this session will lose progress in any currently active goals. Do you want to continue?"
xenon_session_confirm_yes = "YES"
xenon_session_confirm_no = "NO"
xenon_invite_confirm_inactive_title = "GAME INVITE"
xenon_invite_confirm_inactive_dialog = "You have been invited to play an online game. This title doesn't support inactive controllers joining an online game, so the invite has been rejected."
xenon_invite_confirm_inactive_ok = "OK"
xenon_session_confirm_inactive_title = "JOIN SESSION"
xenon_session_confirm_inactive_dialog = "This title doesn't support inactive controllers joining an online game, so you cannot join this session."
xenon_session_confirm_inactive_ok = "OK"
NO_NET_MODE = 0
LAN_MODE = 1
INTERNET_MODE = 2
new_net_logic = 0

script quit_network_game 
	Printf \{"------ quitting network game"}
	LeaveServer
	RemoveTimeSyncTask
	NetSessionFunc \{Obj = session
		func = unpost_game}
	EndGameNetScriptPump
	Change \{battle_sudden_death = 0}
	if ($game_mode = p2_battle)
		Change \{save_current_powerups_p1 = [
				0
				0
				0
			]}
		Change \{save_current_powerups_p2 = [
				0
				0
				0
			]}
		Change \{StructureName = player1_status
			save_num_powerups = 0}
		Change \{StructureName = player2_status
			save_num_powerups = 0}
		Change \{StructureName = player1_status
			save_health = 0.0}
		Change \{StructureName = player2_status
			save_health = 0.0}
	endif
	SetNetworkPreference {Field = 'private_slots' String = ($num_private_slots [0].Name) Checksum = ($num_private_slots [0].Checksum) num = 0}
	SetNetworkPreference \{Field = 'ranked'
		String = "player"
		Checksum = Player
		num = 1}
	Change \{match_type = Player}
	Change \{net_ready_to_start = 0}
	Change \{current_num_players = 1}
	Change \{player2_present = 0}
	Change \{g_tie_breaker_song = 0}
	Change \{net_can_send_approval = 1}
	Change \{net_current_flow_state = NONE}
	reset_setlist
	reset_net_stats_menu
	Change \{net_song_num = 0}
	Change \{StructureName = player2_status
		is_local_client = 1}
	Change \{StructureName = player2_status
		net_id_first = 0}
	Change \{StructureName = player2_status
		net_id_second = 0}
	if NOT ($game_mode = p2_coop)
		Change \{StructureName = player1_status
			part = GUITAR}
		Change \{StructureName = player2_status
			part = GUITAR}
	endif
endscript

script shut_down_net_play 
	Change \{is_network_game = 0}
	Change \{new_net_logic = 0}
	SetNetworkMode
	NetSessionFunc \{Obj = match
		func = stop_server_list}
	NetSessionFunc \{Obj = match
		func = free_server_list}
	NetSessionFunc \{func = match_uninit}
	NetSessionFunc \{func = voice_uninit}
	NetSessionFunc \{func = stats_uninit}
	destroy_gamertags
	destroy_net_popup
	cleanup_sessionfuncs
	Change \{StructureName = player1_status
		highway_layout = default_highway}
	Change \{StructureName = player2_status
		highway_layout = default_highway}
endscript

script select_quit_network_game 
	if ScreenElementExists \{Id = YouRock_text}
		DestroyScreenElement \{Id = YouRock_text}
	endif
	if ScreenElementExists \{Id = yourock_text_2}
		DestroyScreenElement \{Id = yourock_text_2}
	endif
	if IsXENON
		if (NetSessionFunc func = IsRanked Obj = match)
			online_set_win_losses_streak \{out_come = LOSE}
		endif
	else
		online_set_win_losses_streak \{out_come = LOSE}
	endif
	quit_network_game_early
endscript

script quit_network_game_early 
	Change \{disable_attacks = 1}
	if NOT ($is_network_game)
		return
	endif
	if ($playing_song)
		send_fail_song_message \{wait_frames = 10
			quit_early = 1}
	endif
	PauseGame
	quit_network_game
	if GotParam \{signin_change}
		shut_down_net_play
	else
		kill_gem_scroller
	endif
endscript

script cancel_join_server 
	Printf \{"---cancel_join_server"}
	LeaveServer
	NetSessionFunc \{Obj = session
		func = unpost_game}
	NetSessionFunc \{Obj = match
		func = free_server_list}
	NetSessionFunc \{Obj = match
		func = cancel_join_server}
endscript

script post_network_game 
	if (NetSessionFunc Obj = match func = get_gamertag)
		SetNetworkPreference Field = 'network_id' String = <Name>
		SetNetworkPreference Field = 'server_name' String = <Name>
	endif
	NetSessionFunc \{Obj = session
		func = post_game}
	SetServerMode
	StartServer
	SetJoinMode \{$JOIN_MODE_PLAY}
	JoinServer
endscript

script set_match_values 
	return {
		DIFFICULTY = ($current_difficulty)
		gamemode = ($game_mode)
		num_songs = ($num_songs)
	}
endscript

script set_network_preferences 
	if (($match_type) = Player)
		Printf \{"set_network_preferences - setting 'player' match"}
		SetNetworkPreference \{Field = 'ranked'
			String = "player"
			Checksum = Player
			num = 1}
	else
		Printf \{"set_network_preferences - setting 'ranked' match"}
		SetNetworkPreference \{Field = 'ranked'
			String = "ranked"
			Checksum = Ranked
			num = 0}
	endif
endscript

script send_game_info_to_client 
	prepare_lobby_message
	SendNetMessage {
		Type = lobby_setup
		game_mode_index = <game_mode_index>
		Venue = ($current_level)
		difficulty_index = <difficulty_index>
		number_of_songs_index = <number_of_songs_index>
		tie_breaker_index = <tie_breaker_index>
		Character = ($player1_status.character_id)
		outfit = ($player1_status.outfit)
		style = ($player1_status.style)
		GUITAR = ($player1_status.instrument_id)
		flow_state_index = <flow_state>
	}
	Change \{StructureName = player2_status
		character_id = Axel}
	Change \{StructureName = player2_status
		outfit = 1}
	Change \{StructureName = player2_status
		style = 1}
	Change \{StructureName = player2_status
		instrument_id = Instrument_Les_Paul_Black}
	Change \{net_match_send_available_items_dirty = 1}
	Change \{character_select_highlighted_character_p2_dirty = 1}
	net_match_send_available_items
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :UnHide
		BASSIST :Ragdoll_MarkForReset
	endif
endscript

script client_lobby_setup 
	Printf \{"--- client_lobby_setup"}
	if ($current_num_players = 2)
		KillSpawnedScript \{Name = coop_fail_song}
		KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
		set_character_hub_dirty
		Change current_level = <Venue>
		translate_lobby_message {
			game_mode_index = <game_mode_index>
			difficulty_index = <difficulty_index>
			number_of_songs_index = <number_of_songs_index>
			tie_breaker_index = <tie_breaker_index>
			p2_flow_state = <flow_state_index>
		}
		Change StructureName = player2_status character_id = <Character>
		Change StructureName = player2_status outfit = <outfit>
		Change StructureName = player2_status style = <style>
		Change StructureName = player2_status instrument_id = <GUITAR>
		Change \{StructureName = player1_status
			character_id = Axel}
		Change \{StructureName = player1_status
			outfit = 1}
		Change \{StructureName = player1_status
			style = 1}
		Change \{StructureName = player1_status
			instrument_id = Instrument_Les_Paul_Black}
		Change \{net_match_send_available_items_dirty = 1}
		Change \{character_select_highlighted_character_p2_dirty = 1}
		Change \{generic_select_monitor_p1_changed = 1}
		Change \{generic_select_monitor_p2_changed = 1}
		net_match_send_available_items
		ui_flow_manager_respond_to_action \{action = join_server}
		resolve_current_flow_state p2_current_flow_state = <p2_flow_state>
	endif
endscript

script prepare_lobby_message 
	switch ($game_mode)
		case p2_faceoff
		<game_mode_index> = 1
		case p2_pro_faceoff
		<game_mode_index> = 2
		case p2_battle
		<game_mode_index> = 3
		case p2_coop
		<game_mode_index> = 4
	endswitch
	switch ($current_difficulty)
		case EASY
		<difficulty_index> = 1
		case MEDIUM
		<difficulty_index> = 2
		case HARD
		<difficulty_index> = 3
		case EXPERT
		<difficulty_index> = 4
	endswitch
	switch ($num_songs)
		case num_1
		<number_of_songs_index> = 1
		case num_3
		<number_of_songs_index> = 3
		case num_5
		<number_of_songs_index> = 5
		case num_7
		<number_of_songs_index> = 7
	endswitch
	switch ($tie_breaker)
		case HOST
		<tie_breaker_index> = 1
		case CLIENT
		<tie_breaker_index> = 2
	endswitch
	switch ($ui_flow_manager_state [0])
		case online_character_select_fs
		<flow_state> = 1
		case online_character_hub_fs
		<flow_state> = 2
		case online_select_outfit_fs
		<flow_state> = 3
		case online_select_style_fs
		<flow_state> = 4
		case online_select_guitar_fs
		<flow_state> = 5
		case online_select_guitar_finish_fs
		<flow_state> = 6
		case online_select_bass_fs
		<flow_state> = 7
	endswitch
	return {
		game_mode_index = <game_mode_index>
		difficulty_index = <difficulty_index>
		number_of_songs_index = <number_of_songs_index>
		tie_breaker_index = <tie_breaker_index>
		flow_state = <flow_state>
	}
endscript

script translate_lobby_message 
	switch (<game_mode_index>)
		case 1
		Change \{game_mode = p2_faceoff}
		case 2
		Change \{game_mode = p2_pro_faceoff}
		case 3
		Change \{game_mode = p2_battle}
		case 4
		Change \{game_mode = p2_coop}
	endswitch
	switch (<difficulty_index>)
		case 1
		Change \{current_difficulty = EASY}
		Change \{current_difficulty2 = EASY}
		case 2
		Change \{current_difficulty = MEDIUM}
		Change \{current_difficulty2 = MEDIUM}
		case 3
		Change \{current_difficulty = HARD}
		Change \{current_difficulty2 = HARD}
		case 4
		Change \{current_difficulty = EXPERT}
		Change \{current_difficulty2 = EXPERT}
	endswitch
	switch (<number_of_songs_index>)
		case 1
		Change \{num_songs = num_1}
		case 3
		Change \{num_songs = num_3}
		case 5
		Change \{num_songs = num_5}
		case 7
		Change \{num_songs = num_7}
	endswitch
	switch (<tie_breaker_index>)
		case 1
		Change \{tie_breaker = HOST}
		case 2
		Change \{tie_breaker = CLIENT}
	endswitch
	switch (<p2_flow_state>)
		case 1
		<p2_flow_state> = online_character_select_fs
		case 2
		<p2_flow_state> = online_character_hub_fs
		case 3
		<p2_flow_state> = online_select_outfit_fs
		case 4
		<p2_flow_state> = online_select_style_fs
		case 5
		<p2_flow_state> = online_select_guitar_fs
		case 6
		<p2_flow_state> = online_select_guitar_finish_fs
		case 7
		<p2_flow_state> = online_select_bass_fs
	endswitch
	return p2_flow_state = <p2_flow_state>
endscript

script resolve_current_flow_state 
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :UnHide
		BASSIST :Ragdoll_MarkForReset
	endif
	set_other_player_present
	network_player_lobby_message \{Type = open_comm
		action = update}
endscript

script choose_selected_server 
	NetSessionFunc Obj = match func = choose_server Params = <...>
endscript

script cleanup_sessionfuncs 
	Printf \{"---cleanup sessionfuncs"}
	NetSessionFunc \{func = match_uninit}
	NetSessionFunc \{func = stats_uninit}
	NetSessionFunc \{func = voice_uninit}
	NetSessionFunc \{func = motd_uninit}
endscript

script setup_sessionfuncs 
	Printf \{"---setup_sessionfuncs"}
	NetSessionFunc \{func = match_init}
	NetSessionFunc \{func = stats_init}
	NetSessionFunc \{func = voice_init}
	NetSessionFunc \{func = motd_init}
	NetSessionFunc \{Obj = voice
		func = Enable}
	if NetSessionFunc \{Obj = match
			func = get_gamertag}
		SetNetworkPreference Field = 'network_id' String = <Name>
		SetNetworkPreference Field = 'server_name' String = <Name>
	endif
endscript

script get_current_level_name 
	return level_name = ($LevelZones.($current_level).Title) Level = 1
endscript

script GetCurrentAreaStringAndChecksum 
	<area_string> = 'z_online_venue'
	<area_checksum> = dummy_value
endscript

script dispatch_player_state 
	if ($<player_status>.Player = 1)
		<other_player_status> = player2_status
	else
		<other_player_status> = player1_status
	endif
	if ($<other_player_status>.highway_layout = solo_highway)
		begin
		FormatText \{ChecksumName = Type
			'%s'
			S = 'player_state_light'}
		SendNetMessage {
			Type = <Type>
			Score = ($<player_status>.Score)
			current_run = ($<player_status>.current_run)
			star_power_amount = ($<player_status>.star_power_amount)
			current_health = ($<player_status>.current_health)
		}
		Wait \{0.1
			Seconds}
		repeat
	else
		begin
		GetHeldPattern controller = ($<player_status>.controller) player_status = <player_status>
		FormatText \{ChecksumName = Type
			'%s'
			S = 'player_state'}
		SendNetMessage {
			Type = <Type>
			guitar_volume = ($<player_status>.guitar_volume)
			star_power_toggle = ($<player_status>.star_power_used)
			Score = ($<player_status>.Score)
			current_run = ($<player_status>.current_run)
			star_power_amount = ($<player_status>.star_power_amount)
			hold_pattern = <hold_pattern>
			whammy_length = ($<player_status>.net_whammy)
			current_health = ($<player_status>.current_health)
		}
		Wait \{0.1
			Seconds}
		repeat
	endif
endscript

script load_and_sync_timing \{start_delay = 4000}
	if ($<player_status>.highway_layout = solo_highway)
		Change \{current_num_players = 1}
	else
		Change \{current_num_players = 2}
	endif
	EndGameNetScriptPump
	set_rich_presence_game_mode \{ONLINE = 1}
	Change \{StructureName = player2_status
		is_local_client = 0}
	Load_Venue
	Printf \{"Starting Song %s with Zone = %i\\n"
		S = $current_song
		I = $current_level}
	Change \{net_ready_to_start = 0}
	Change \{current_transition = INTRO}
	if NOT ($current_song = NULL)
		SpawnScriptLater restart_gem_scroller Params = {
			song_name = ($current_song)
			DIFFICULTY = ($current_difficulty)
			difficulty2 = ($current_difficulty2)
			StartTime = 0
			endtime = 999999999
			device_num = ($player1_status.controller)
		}
	endif
endscript

script launch_network_game 
	Change \{net_ready_to_start = 1}
endscript

script ranked_quit_fix_scores 
	get_number_of_songs
	song_index = 0
	begin
	if ($game_mode = p2_battle)
		SetArrayElement ArrayName = g_p1_scores GlobalArray Index = <song_index> NewValue = 8
		SetArrayElement ArrayName = g_p2_scores GlobalArray Index = <song_index> NewValue = -1
	else
		SetArrayElement ArrayName = g_p2_scores GlobalArray Index = <song_index> NewValue = 0
	endif
	<song_index> = (<song_index> + 1)
	repeat <num_songs>
endscript

script network_player_update 
	if ((GameIsOver) || ($playing_song = 0))
		return
	endif
	Change StructureName = <player_status> Score = <Score>
	Change StructureName = <player_status> current_health = <current_health>
	old_star_power = ($<player_status>.star_power_amount)
	Change StructureName = <player_status> star_power_amount = <star_power_amount>
	if ((<old_star_power> < 50.0) && (<star_power_amount> >= 50.0) && ($<player_status>.star_power_used = 0))
		SpawnScriptNow show_star_power_ready Params = {player_status = <player_status>}
	endif
	if (($game_mode = p2_coop) && ($hack_ignore_streak_counter > 0))
		Change hack_ignore_streak_counter = ($hack_ignore_streak_counter - 1)
	else
		Change StructureName = <player_status> current_run = <current_run>
	endif
	if NOT ($player1_status.highway_layout = solo_highway)
		if NOT (($<player_status>.guitar_volume) = <Volume>)
			Change StructureName = <player_status> guitar_volume = <Volume>
			UpdateGuitarVolume
		endif
		BroadCastEvent Type = net_button_check_p2 Data = {hold_pattern = <hold_pattern> player_status = <player_status> whammy_len = <whammy_length>}
		if ($game_mode = p2_coop)
			return
		endif
		if NOT ($<player_status>.star_power_used = <Star_Power>)
			if (<Star_Power>)
				SpawnScriptNow star_power_activate_and_drain Params = {
					player_status = <player_status>
					player_Text = ($<player_status>.Text)
					Player = ($<player_status>.Player)}
			endif
		endif
	endif
endscript

script net_check_buttons 
	get_song_prefix Song = <song_name>
	FormatText ChecksumName = Guitar_Stream '%s_guitar' S = <song_prefix> AddToStringLookup
	GuitarInputLogicInit player_status = <player_status> Guitar_Stream = <Guitar_Stream> time_offset = <time_offset>
	ExtendCRC button_up_pixel_array ($<player_status>.Text) out = pixel_array
	<player_Text> = ($<player_status>.Text)
	GetArraySize \{$gem_colors}
	begin
	array_count = 0
	begin
	Color = ($gem_colors [<array_count>])
	pixels = ($<pixel_array> [<array_count>])
	button_lip_name = ($button_up_models.<Color>.Name)
	ExtendCRC <button_lip_name> '_lip' out = button_lip_name
	ExtendCRC <button_lip_name> <player_Text> out = button_lip_name
	button_mid_name = ($button_up_models.<Color>.Name)
	ExtendCRC <button_mid_name> '_mid' out = button_mid_name
	ExtendCRC <button_mid_name> <player_Text> out = button_mid_name
	button_neck_name = ($button_up_models.<Color>.Name)
	ExtendCRC <button_neck_name> '_neck' out = button_neck_name
	ExtendCRC <button_neck_name> <player_Text> out = button_neck_name
	button_head_name = ($button_up_models.<Color>.Name)
	ExtendCRC <button_head_name> '_head' out = button_head_name
	ExtendCRC <button_head_name> <player_Text> out = button_head_name
	now_scale = (($nowbar_scale_x * (1.0, 0.0)) + ($nowbar_scale_y * (0.0, 1.0)))
	if ($<player_status>.lefthanded_button_ups = 1)
		<pos2d> = ($button_up_models.<Color>.left_pos_2d)
	else
		<pos2d> = ($button_up_models.<Color>.pos_2d)
	endif
	if ($<player_status>.lefthanded_button_ups = 1)
		<playline_scale> = (((0 - <now_scale>.(1.0, 0.0)) * (1.0, 0.0)) + (<now_scale>.(0.0, 1.0) * (0.0, 1.0)))
	else
		<playline_scale> = <now_scale>
	endif
	<y_scale> = ((<pixels> + $neck_lip_add) / $neck_sprite_size)
	<neck_scale> = (((<playline_scale>.(1.0, 0.0)) * (1.0, 0.0)) + (<y_scale> * (0.0, 1.0)))
	<head_pos> = (<pos2d> - (<pixels> * (0.0, 1.0)))
	if ScreenElementExists Id = <button_lip_name>
		SetScreenElementProps Id = <button_lip_name> z_priority = 4.9
	endif
	if ScreenElementExists Id = <button_mid_name>
		SetScreenElementProps Id = <button_mid_name> z_priority = 4.6
	endif
	if ScreenElementExists Id = <button_neck_name>
		SetScreenElementProps Id = <button_neck_name> z_priority = 4.7 Scale = <neck_scale>
	endif
	if ScreenElementExists Id = <button_head_name>
		SetScreenElementProps Id = <button_head_name> z_priority = 4.8 Pos = <head_pos>
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	array_count = 0
	GetDeltaTime
	sub_amount = (($button_up_pixels * <delta_time>) / $button_sink_time)
	begin
	pixels = ($<pixel_array> [<array_count>])
	pixels = (<pixels> - <sub_amount>)
	if (<pixels> < 0.0)
		<pixels> = 0.0
	endif
	SetArrayElement ArrayName = <pixel_array> GlobalArray Index = <array_count> NewValue = <pixels>
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Wait \{1
		GameFrame}
	repeat
endscript

script network_events 
	SetEventHandler \{Response = call_script
		Event = net_button_check_p2
		Scr = network_player_buttons}
	Block
endscript

script network_player_buttons 
	GetArraySize \{$gem_colors}
	check_button = 65536
	<mask> = ($player2_status.broken_string_mask)
	array_count = 0
	begin
	if NOT (<mask> && <check_button>)
		Color = ($gem_colors [<array_count>])
		button_head_name = ($button_up_models.<Color>.Name)
		ExtendCRC <button_head_name> '_head' out = button_head_name
		ExtendCRC <button_head_name> ($<player_status>.Text) out = button_head_name
		if ScreenElementExists Id = <button_head_name>
			if (<hold_pattern> && <check_button>)
				SetScreenElementProps Id = <button_head_name> Material = ($button_up_models.<Color>.material_down)
			else
				SetScreenElementProps Id = <button_head_name> Material = ($button_up_models.<Color>.material_head)
			endif
		endif
	endif
	<check_button> = (<check_button> / 16)
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if ($display_debug_input = 1)
		input_debug <...>
	endif
endscript

script net_check_note_hold 
	CheckNoteHoldInit Player = <Player> player_status = <player_status> array_entry = <array_entry> Time = <Time> Guitar_Stream = <Guitar_Stream> Song = <Song> pattern = <pattern>
	begin
	if NOT CheckNoteHoldWait Player = <Player>
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	CheckNoteHoldStart Player = <Player>
	SpawnScriptLater net_control_whammy_pitch_loop Params = {Song = <Song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> Time = <Time>}
	begin
	if NOT CheckNoteHoldPerFrame Player = <Player>
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	KillSpawnedScript \{Name = net_whammy_pitch_shift}
	KillSpawnedScript \{Name = net_control_whammy_pitch_loop}
	CheckNoteHoldEnd Player = <Player>
endscript

script net_control_whammy_pitch_loop 
	Change \{pitch_dirty = 1}
	begin
	GetSongTime
	start_time = <songtime>
	Block \{Type = net_button_check_p2}
	GetSongTime
	delta_time = (<songtime> - <start_time>)
	<Time> = (<Time> - (<delta_time> * 1000))
	KillSpawnedScript \{Name = net_whammy_pitch_shift}
	SpawnScriptNow net_whammy_pitch_shift Params = {Song = <Song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> net_whammy_length = (<event_data>.whammy_len) Time = <Time>}
	repeat
	KillSpawnedScript \{Name = net_whammy_pitch_shift}
endscript
pitch_dirty = 1
prev_len = 0

script net_whammy_pitch_shift 
	whammy_star_on = 0
	whammy_star_off = 0
	if ($pitch_dirty = 1)
		Change \{pitch_dirty = 0}
		Change prev_len = <net_whammy_length>
		begin
		control_whammy_pitchshift Song = <Song> array_entry = <array_entry> pattern = <pattern> player_status = <player_status> net_whammy_length = <net_whammy_length> Time = <Time>
		Wait \{1
			GameFrame}
		repeat
	else
		<len_delta> = (<net_whammy_length> - $prev_len)
		<len_base> = ($prev_len)
		Change prev_len = <net_whammy_length>
		<frames> = 5
		<Scale> = (1.0 / <frames>)
		<scale_step> = <Scale>
		begin
		<len> = (<len_base> + (<len_delta> * <Scale>))
		set_whammy_pitchshift control = <len> player_status = <player_status>
		<whammy_scale> = (((<len> * 0.5) + 0.5) * 2.0)
		SetNewWhammyValue Value = <whammy_scale> time_remaining = <Time> player_status = <player_status> Player = (<player_status>.Player)
		<Scale> = (<Scale> + <scale_step>)
		Wait \{1
			GameFrame}
		repeat <frames>
		begin
		set_whammy_pitchshift control = <net_whammy_length> player_status = <player_status>
		<whammy_scale> = (((<net_whammy_length> * 0.5) + 0.5) * 2.0)
		SetNewWhammyValue Value = <whammy_scale> time_remaining = <Time> player_status = <player_status> Player = (<player_status>.Player)
		IsStarEntry array_entry = <array_entry> Player = ($<player_status>.Player)
		if (<is_star>)
			if (<len_delta> = 0)
				<whammy_star_on> = 0
				<whammy_star_off> = (<whammy_star_off> + 1)
				if (<whammy_star_off> = 3)
					GetArraySize \{$gem_colors}
					gem_count = 0
					begin
					if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
						FormatText ChecksumName = whammy_id '%c_%i_whammybar_p%p' C = ($gem_colors_text [<gem_count>]) I = <array_entry> P = ($<player_status>.Player) AddToStringLookup = TRUE
						if ScreenElementExists Id = <whammy_id>
							bar_name = (<whammy_id> + 1)
							MakeNormalWhammy Name = <bar_name> Player = ($<player_status>.Player)
						endif
					endif
					gem_count = (<gem_count> + 1)
					repeat <array_Size>
				endif
			elseif (<len> > 0.3)
				<whammy_star_off> = 0
				<whammy_star_on> = (<whammy_star_on> + 1)
				if (<whammy_star_on> = 2)
					GetArraySize \{$gem_colors}
					gem_count = 0
					begin
					if ((<pattern> && $button_values [<gem_count>]) = $button_values [<gem_count>])
						FormatText ChecksumName = whammy_id '%c_%i_whammybar_p%p' C = ($gem_colors_text [<gem_count>]) I = <array_entry> P = ($<player_status>.Player) AddToStringLookup = TRUE
						if ScreenElementExists Id = <whammy_id>
							bar_name = (<whammy_id> + 1)
							MakeStarWhammy Name = <bar_name> Player = ($<player_status>.Player)
						endif
					endif
					gem_count = (<gem_count> + 1)
					repeat <array_Size>
				endif
			endif
		endif
		Wait \{1
			GameFrame}
		repeat
	endif
endscript

script set_net_client_highway 
	Change StructureName = <player_status> highway_layout = <layout>
endscript

script set_net_client_lefty 
	Change StructureName = player2_status lefthanded_gems = <lefty_flip_p2>
	Change StructureName = player2_status lefthanded_button_ups = <lefty_flip_p2>
endscript

script finalize_connection_to_peer 
	Printf \{"---finalize_connection_to_peer"}
	Change opponent_gamertag = <opponent_gamertag>
	Change \{current_num_players = 2}
	Change StructureName = player1_status net_id_first = <p1_net_id_first>
	Change StructureName = player1_status net_id_second = <p1_net_id_second>
	Change StructureName = player2_status net_id_first = <p2_net_id_first>
	Change StructureName = player2_status net_id_second = <p2_net_id_second>
	FormatText \{ChecksumName = player_status
		'player1_status'}
	GetGlobalTags \{user_options}
	SendNetMessage {
		Type = lefty_update
		lefty_flag = (<lefty_flip_p1>)
	}
	if IsHost
		ResetLobbyReady
		send_game_info_to_client
	endif
	StartGameNetScriptPump
endscript

script net_copy_intial_params 
	Change GlobalName = <copy_to> NewValue = $<copy_from>
endscript

script net_commit_or_reset_params 
	if GotParam \{commit}
		Change GlobalName = <copy_to> NewValue = $<copy_from>
	else
		if (<Type> = loc)
			<Text> :SetProps Text = ($LevelZones.($LevelZoneArray [$<Global>]).Title)
		else
			<Text> :SetProps Text = ($FilterTypes.<Type>.values [$<Global>])
		endif
	endif
	change_coop_value_if_ranked
endscript

script net_custom_up_down \{direction = UP
		player_match = 0}
	if (<Type> = loc)
		GetArraySize ($LevelZoneArray)
	elseif (<Type> = num_songs)
		if ($OptionsGameModeValue = 4 && <player_match> = 1)
			GetArraySize ($FilterTypes.<Type>.values_coop)
		else
			GetArraySize ($FilterTypes.<Type>.values)
		endif
	else
		GetArraySize ($FilterTypes.<Type>.values)
	endif
	if (<direction> = UP)
		if ((<array_Size> -1) = $<Global>)
			Change GlobalName = <Global> NewValue = 0
		else
			Change GlobalName = <Global> NewValue = ($<Global> + 1)
		endif
	elseif (<direction> = DOWN)
		if (0 = $<Global>)
			Change GlobalName = <Global> NewValue = (<array_Size> -1)
		else
			Change GlobalName = <Global> NewValue = (<Global> - 1)
		endif
	endif
	if (<Type> = loc)
		<Text> :SetProps Text = ($LevelZones.($LevelZoneArray [$<Global>]).Title) Scale = 1.0
		fit_text_into_menu_item Id = <Text> max_width = 375
	elseif (<Type> = num_songs && <player_match> = 1)
		if ($OptionsGameModeValue = 4)
			<Text> :SetProps Text = ($FilterTypes.<Type>.values_coop [$<Global>]) Scale = 1.0
		else
			<Text> :SetProps Text = ($FilterTypes.<Type>.values [$<Global>]) Scale = 1.0
		endif
		fit_text_into_menu_item Id = <Text> max_width = 375
	elseif (<Type> = mode && <player_match> = 1)
		<Text> :SetProps Text = ($FilterTypes.<Type>.values [$<Global>]) Scale = 1.0
		fit_text_into_menu_item Id = <Text> max_width = 375
		if ($<Global> = 4)
			number_of_songs_selection_text :SetProps Text = ($FilterTypes.num_songs.values_coop [($OptionsNumSongsValue)]) Scale = 1.0
		else
			number_of_songs_selection_text :SetProps Text = ($FilterTypes.num_songs.values [($OptionsNumSongsValue)]) Scale = 1.0
		endif
		fit_text_into_menu_item \{Id = number_of_songs_selection_text
			max_width = 375}
	else
		<Text> :SetProps Text = ($FilterTypes.<Type>.values [$<Global>]) Scale = 1.0
		fit_text_into_menu_item Id = <Text> max_width = 375
	endif
	if (($match_type = Ranked) && (<Type> = mode) && ($<Global> = 4) && ($ui_flow_manager_state [0] = quickmatch_ranked_options_fs))
		net_custom_up_down <...>
	endif
	if (($<Global> = 2) && (<Type> = search))
		if NOT IsXENON
			net_custom_up_down <...>
		endif
	endif
endscript

script change_coop_value_if_ranked 
	if (($SearchMatchTypeValue = 1) && ($SearchGameModeValue = 4))
		net_custom_up_down \{direction = UP
			Type = mode
			Global = SearchGameModeValue
			Text = game_mode_selection_text}
	endif
endscript

script block_unblock_difficulty_actions \{diff_focus = OFF
		Menu = search}
	if GotParam \{diff_focus}
		<change_color> = ($online_light_blue)
	else
		<change_color> = ($online_dark_purple)
	endif
	if (<Menu> = search)
		<gamemode> = ($SearchGameModeValue)
		<new_text> = ($FilterTypes.diff.values [($SearchDifficultyValue)])
	else
		if ($match_type = Ranked)
			<gamemode> = ($OptionsGameModeRanked)
			<new_text> = ($FilterTypes.diff.values [($OptionsDifficultyRanked)])
		else
			<gamemode> = ($OptionsGameModeValue)
			<new_text> = ($FilterTypes.diff.values [($OptionsDifficultyValue)])
		endif
	endif
	if ((<gamemode> = 0) || (<gamemode> = 2))
		if ScreenElementExists \{Id = DIFFICULTY}
			DIFFICULTY :SetProps rgba = <change_color> unblock_events
		endif
		if ScreenElementExists \{Id = difficulty_selection_text}
			difficulty_selection_text :SetProps rgba = <change_color> Text = <new_text> unblock_events
		endif
	else
		if ScreenElementExists \{Id = DIFFICULTY}
			DIFFICULTY :SetProps rgba = ($online_grey) block_events
		endif
		if ScreenElementExists \{Id = difficulty_selection_text}
			difficulty_selection_text :SetProps rgba = ($online_grey) Text = "N/A" block_events
		endif
	endif
endscript

script online_menu_init 
	Printf \{"--- online_menu_init"}
	Change player1_device = ($primary_controller)
	setup_online_player_settings
	Change \{is_network_game = 1}
	Change \{new_net_logic = 1}
	Change \{current_num_players = 1}
	Change \{player2_present = 0}
	Change \{StructureName = player1_status
		part = GUITAR}
	Change \{StructureName = player2_status
		part = GUITAR}
	create_guitarist \{Name = GUITARIST
		UseOldPos
		no_strum
		animpak = 0}
	create_guitarist \{Name = BASSIST
		UseOldPos
		no_strum
		animpak = 0}
	SetNetworkMode \{$INTERNET_MODE}
	cleanup_sessionfuncs
	setup_sessionfuncs
	NetSessionFunc \{func = GetNumPlayers}
	create_menu_backdrop \{texture = Online_Background}
	begin
	if ($DEMONWARE_IS_READY = 1)
		break
	endif
	Wait \{1
		Frame}
	repeat
endscript

script setup_online_player_settings 
	GetGlobalTags \{user_options}
	switch (<online_highway>)
		case 0
		Change \{StructureName = player1_status
			highway_layout = default_highway}
		case 1
		Change \{StructureName = player1_status
			highway_layout = solo_highway}
	endswitch
endscript

script get_random_song 
	first_song_index = (-1)
	last_song_index = (-1)
	array_entry = 0
	GetArraySize \{$gh3_songlist}
	begin
	song_checksum = ($gh3_songlist [<array_entry>])
	get_song_struct Song = <song_checksum>
	if ((<song_struct>.version) = gh3)
		if (<first_song_index> = (-1))
			<first_song_index> = <array_entry>
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	<last_song_index> = (<array_entry> - 1)
	GetRandomValue Name = random_value Integer A = <first_song_index> B = <last_song_index>
	return random_song = ($gh3_songlist [<random_value>])
endscript

script start_network_game 
	if IsHost
		StartNetworkGame
	endif
endscript

script check_for_final_song_selection 
	if (($tie_breaker) = song_rand)
		return \{can_select_final_song = FALSE}
	elseif (($tie_breaker) = HOST)
		if IsHost
			return \{can_select_final_song = TRUE}
		else
			return \{can_select_final_song = FALSE}
		endif
	elseif (($tie_breaker) = CLIENT)
		if IsHost
			return \{can_select_final_song = FALSE}
		else
			return \{can_select_final_song = TRUE}
		endif
	endif
endscript

script online_fail_song 
	Printf \{"---online fail song"}
	Change \{disable_attacks = 1}
	if (GameIsOver)
		Change \{current_num_players = 2}
		return
	endif
	if (IsHost)
		loser = 0
	else
		loser = 1
	endif
	SendNetMessage {
		Type = fail_song
		note_streak = ($player1_status.best_run)
		NOTES_HIT = ($player1_status.NOTES_HIT)
		total_notes = ($player1_status.total_notes)
		quit_early_flag = 0
		loser = <loser>
	}
endscript

script online_win_song 
	if ($ui_flow_manager_state [0] = online_pause_fs)
		net_unpausegh3
	endif
	disable_pause
	Printf \{"---online_win_song"}
	Change \{disable_attacks = 1}
	Change StructureName = <player_status> best_run = <note_streak>
	Change StructureName = <player_status> total_notes = <total_notes>
	Change StructureName = <player_status> NOTES_HIT = <NOTES_HIT>
	if (<quit_early>)
		Change \{player2_present = 0}
		FormatText TextName = notification_text "%n\\n has quit" N = ($opponent_gamertag)
		if ($match_type = Ranked)
			ranked_quit_fix_scores
		endif
		if ($game_mode = p2_battle)
			Change \{StructureName = player1_status
				current_health = 1.0}
			Change \{StructureName = player2_status
				current_health = 0.0}
		else
			Change \{StructureName = player2_status
				Score = 0.0}
		endif
		create_net_popup popup_text = <notification_text>
		Wait \{3
			Seconds}
		destroy_net_popup
	endif
	player_Text = (<player_status>.Text)
	Change \{current_num_players = 2}
	if ($game_mode = p2_battle)
		if (<losing_player> = 1)
			Change \{StructureName = player1_status
				current_health = 0.0}
			Change \{StructureName = player2_status
				current_health = 1.0}
		else
			Change \{StructureName = player1_status
				current_health = 1.0}
			Change \{StructureName = player2_status
				current_health = 0.0}
		endif
		GuitarEvent_SongWon \{battle_win = 1}
	else
		ExtendCRC song_won <player_Text> out = Type
		BroadCastEvent Type = <Type>
	endif
endscript

script broadcast_received_winner_stats 
	Change StructureName = <player_status> best_run = <note_streak>
	Change StructureName = <player_status> total_notes = <total_notes>
	Change StructureName = <player_status> NOTES_HIT = <NOTES_HIT>
	if ($game_mode = p2_battle)
		record_net_statistics
	endif
endscript

script setup_searching 
	Change \{rich_presence_context = presence_online_searching}
	setup_options_globals
endscript

script set_rich_presence_game_mode \{ONLINE = 0}
	if (<ONLINE>)
		Change \{rich_presence_context = presence_online_game_mode}
	else
		switch ($game_mode)
			case p1_career
			Change \{rich_presence_context = presence_career}
			case p1_quickplay
			Change \{rich_presence_context = presence_quick_play}
			case p2_quickplay
			Change \{rich_presence_context = presence_coop_career}
			case p2_pro_faceoff
			Change \{rich_presence_context = presence_2player}
			case p2_faceoff
			Change \{rich_presence_context = presence_2player}
			case p2_battle
			Change \{rich_presence_context = presence_battle}
			case training
			Change \{rich_presence_context = presence_practice}
		endswitch
	endif
endscript

script get_custom_match_search_params 
	GetPreferenceChecksum \{Ranked}
	Ranked = <Checksum>
	GetPreferenceValue \{Ranked}
	ranked_value = <Value>
	if (($SearchGameModeValue = 0) || ($SearchGameModeValue = 2))
		difficulty_checksum = ($FilterTypes.diff.Checksum [($SearchDifficultyValue)])
	else
		difficulty_checksum = dont_care
	endif
	return {
		DIFFICULTY = <difficulty_checksum>
		gamemode = ($FilterTypes.mode.Checksum [($SearchGameModeValue)])
		num_songs = ($FilterTypes.num_songs.Checksum [($SearchNumSongsValue)])
		tie_breaker = dont_care
		Ranked = <Ranked>
		ranked_value = <ranked_value>
	}
endscript

script get_quick_match_search_params 
	GetGlobalTags \{user_options}
	GetPreferenceChecksum \{Ranked}
	Ranked = <Checksum>
	GetPreferenceValue \{Ranked}
	ranked_value = <Value>
	if ($match_type = Ranked)
		game_mode_checksum = ($FilterTypes.mode.Checksum [<online_game_mode_ranked>])
		difficulty_checksum = ($FilterTypes.diff.Checksum [<online_difficulty_ranked>])
		num_songs_chcecksum = ($FilterTypes.num_songs.Checksum [<online_num_songs_ranked>])
	else
		game_mode_checksum = ($FilterTypes.mode.Checksum [<online_game_mode>])
		difficulty_checksum = dont_care
		num_songs_chcecksum = ($FilterTypes.num_songs.Checksum [<online_num_songs>])
	endif
	return {
		DIFFICULTY = <difficulty_checksum>
		gamemode = <game_mode_checksum>
		num_songs = <num_songs_chcecksum>
		tie_breaker = dont_care
		Ranked = <Ranked>
		ranked_value = <ranked_value>
	}
endscript
bPS3SingleSignOnCheckComplete = 0

script xenon_singleplayer_session_init \{ps3_signin_callback = xenon_singleplayer_session_init}
	Printf \{"--- xenon_singleplayer_session_init ---"}
	if CheckForSignIn
		NetSessionFunc \{func = stats_uninit}
		NetSessionFunc \{func = stats_init}
		NetSessionFunc \{func = motd_uninit}
		NetSessionFunc \{func = motd_init}
		if IsXENON
			NetSessionFunc \{func = start_singleplayer_session
				Obj = session}
		endif
	else
		if NOT IsXENON
			if ($is_attract_mode = 0)
				if NOT GotParam \{from_callback}
					if (0 = $bPS3SingleSignOnCheckComplete)
						NetSessionFunc func = OnlineSignIn Params = {callback = <ps3_signin_callback>}
						Change \{bPS3SingleSignOnCheckComplete = 1}
					endif
				else
					Printf \{"PS3: unable to signin in to the network platform"}
				endif
			endif
		endif
	endif
endscript

script begin_singleplayer_game 
	Printf \{"--- begin_singleplayer_game ---"}
	if NetSessionFunc \{Obj = session
			func = has_active_session}
		NetSessionFunc \{Obj = session
			func = begin_singleplayer_game}
	endif
endscript

script xenon_singleplayer_session_begin_uninit 
	Printf \{"--- xenon_singleplayer_session_begin_uninit ---"}
	if IsXENON
		NetSessionFunc \{func = stop_singleplayer_session
			Obj = session}
	endif
endscript

script xenon_singleplayer_session_complete_uninit 
	Printf \{"--- xenon_singleplayer_session_complete_uninit ---"}
	Change \{net_safe_to_enter_net_play = 0}
	if NOT GotParam \{song_failed}
		Wait \{3
			Seconds}
	endif
	NetSessionFunc \{Obj = session
		func = unpost_game}
	NetSessionFunc \{func = stats_uninit}
	NetSessionFunc \{func = match_uninit}
	NetSessionFunc \{func = motd_uninit}
	Change \{net_safe_to_enter_net_play = 1}
endscript

script send_leader_board_message 
	player1_xuid = [0 0]
	player2_xuid = [0 0]
	switch (<diff>)
		case EASY
		<rating> = 1
		<easy_score> = <Score>
		<medium_score> = 0
		<hard_score> = 0
		<expert_score> = 0
		case MEDIUM
		<rating> = 2
		<easy_score> = 0
		<medium_score> = <Score>
		<hard_score> = 0
		<expert_score> = 0
		case HARD
		<rating> = 3
		<easy_score> = 0
		<medium_score> = 0
		<hard_score> = <Score>
		<expert_score> = 0
		case EXPERT
		<rating> = 4
		<easy_score> = 0
		<medium_score> = 0
		<hard_score> = 0
		<expert_score> = <Score>
	endswitch
	if ($game_mode = p1_career)
		controller = ($primary_controller)
		GetNetID Player = <controller>
		SetArrayElement ArrayName = player1_xuid Index = 0 NewValue = <net_id_first>
		SetArrayElement ArrayName = player1_xuid Index = 1 NewValue = <net_id_second>
		switch (<diff>)
			case EASY
			<career_leaderboard_id> = lb_career_easy
			<campaign_leaderboard_id> = lb_campaign_easy
			case MEDIUM
			<career_leaderboard_id> = lb_career_medium
			<campaign_leaderboard_id> = lb_campaign_medium
			case HARD
			<career_leaderboard_id> = lb_career_hard
			<campaign_leaderboard_id> = lb_campaign_hard
			case EXPERT
			<career_leaderboard_id> = lb_career_expert
			<campaign_leaderboard_id> = lb_campaign_expert
		endswitch
		get_progression_globals game_mode = ($game_mode)
		summation_career_score tier_global = <tier_global>
		Player_list = [
			{
				player_xuid = <player1_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <leaderboard_Id>
						rating = <rating>
						Score = <Score>
						write_type = MAX
						columns = [
							{Score = <easy_score>}
							{Score = <medium_score>}
							{Score = <hard_score>}
							{Score = <expert_score>}
						]
					}
					{
						leaderboard_Id = <career_leaderboard_id>
						rating = 0
						Score = <career_score>
						write_type = MAX
						columns = [
							{Score = <career_score>}
							{Score = <career_score>}
							{Score = <career_score>}
						]
					}
					{
						leaderboard_Id = <campaign_leaderboard_id>
						rating = 0
						Score = <Score>
						write_type = ACCUMULATE
						columns = [
							{Score = <Score>}
							{Score = <Score>}
							{Score = <Score>}
						]
					}
					{
						leaderboard_Id = lb_campaign
						rating = 0
						Score = <Score>
						write_type = ACCUMULATE
						columns = [
							{Score = <Score>}
							{Score = <Score>}
							{Score = <Score>}
						]
					}
				]
			}
		]
	else
		controller = ($primary_controller)
		GetNetID Player = <controller>
		SetArrayElement ArrayName = player1_xuid Index = 0 NewValue = <net_id_first>
		SetArrayElement ArrayName = player1_xuid Index = 1 NewValue = <net_id_second>
		Player_list = [
			{
				player_xuid = <player1_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <leaderboard_Id>
						rating = <rating>
						Score = <Score>
						write_type = MAX
						columns = [
							{Score = <easy_score>}
							{Score = <medium_score>}
							{Score = <hard_score>}
							{Score = <expert_score>}
						]
					}
				]
			}
		]
	endif
	NetSessionFunc func = stats_write_multiplayer Obj = stats Params = {Player_list = <Player_list>}
endscript

script net_write_single_player_stats 
	net_retrieve_primary_controller_score
	primary_player_score = <primary_score>
	secondary_player_score = <secondary_score>
	if (<primary_player_score> > 0)
		get_song_struct Song = ($current_song)
		if NOT (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = PRACTICE) || $Cheat_NoFail = 1 || $Cheat_EasyExpert = 1 || (StructureContains Structure = <song_struct> boss))
			if ($game_mode = p2_quickplay)
				primary_player_score = (<primary_player_score> + <secondary_player_score>)
				CastToInteger \{primary_player_score}
				get_song_struct Song = ($current_song)
				FormatText ChecksumName = coop_song_checksum 'lb_coop_%s' S = (<song_struct>.Name)
				send_leader_board_message Score = <primary_player_score> leaderboard_Id = <coop_song_checksum> diff = ($current_difficulty)
			else
				CastToInteger \{primary_player_score}
				send_leader_board_message Score = <primary_player_score> leaderboard_Id = ($current_song) diff = ($current_difficulty)
			endif
		else
			xenon_singleplayer_session_begin_uninit
		endif
	else
		xenon_singleplayer_session_begin_uninit
	endif
endscript

script online_song_end_write_stats 
	if ($game_mode = p2_coop)
		Score = (($player1_status.Score) + ($player2_status.Score))
		net_get_coop_difficulty \{coop_difficulty_type = highest}
		<song_difficulty> = <coop_diff>
		get_song_struct Song = ($net_setlist_songs [($net_song_num)])
		FormatText ChecksumName = leaderboard_Id 'lb_coop_%s' S = (<song_struct>.Name)
	else
		Score = ($player1_status.Score)
		<song_difficulty> = ($current_difficulty)
		leaderboard_Id = ($net_setlist_songs [($net_song_num)])
	endif
	CastToInteger \{Score}
	if (<Score> > 0)
		player1_xuid = [0 0]
		SetArrayElement ArrayName = player1_xuid Index = 0 NewValue = ($player1_status.net_id_first)
		SetArrayElement ArrayName = player1_xuid Index = 1 NewValue = ($player1_status.net_id_second)
		switch <song_difficulty>
			case EASY
			<rating> = 1
			<easy_score> = <Score>
			<medium_score> = 0
			<hard_score> = 0
			<expert_score> = 0
			case MEDIUM
			<rating> = 2
			<easy_score> = 0
			<medium_score> = <Score>
			<hard_score> = 0
			<expert_score> = 0
			case HARD
			<rating> = 3
			<easy_score> = 0
			<medium_score> = 0
			<hard_score> = <Score>
			<expert_score> = 0
			case EXPERT
			<rating> = 4
			<easy_score> = 0
			<medium_score> = 0
			<hard_score> = 0
			<expert_score> = <Score>
		endswitch
		Player_list = [
			{
				player_xuid = <player1_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <leaderboard_Id>
						rating = <rating>
						Score = <Score>
						write_type = MAX
						columns = [
							{Score = <easy_score>}
							{Score = <medium_score>}
							{Score = <hard_score>}
							{Score = <expert_score>}
						]
					}
				]
			}
		]
	endif
	if GotParam \{Player_list}
		NetSessionFunc func = stats_write_multiplayer Obj = stats Params = {Player_list = <Player_list> DontEndSessionAfterWrite}
	endif
endscript

script online_match_end_write_stats 
	Printf \{"--- online_match_end_write_stats ---"}
	write_stats = 0
	if IsXENON
		if (NetSessionFunc func = IsRanked Obj = match)
			write_stats = 1
		endif
	else
		if ($game_mode = p2_coop)
			write_stats = 0
		else
			write_stats = 1
		endif
	endif
	if (<write_stats> = 1)
		GetGlobalTags \{net}
		net_get_game_mode_leaderboard_id
		switch ($game_mode)
			case p2_faceoff
			<total_wins_leaderboard_id> = lb_faceoff_wins
			<streak_leaderboard_id> = lb_faceoff_win_streak
			<streak_score> = <face_off_streak>
			<wins> = <faceoff_wins>
			<loses> = <faceoff_loses>
			case p2_pro_faceoff
			<total_wins_leaderboard_id> = lb_pro_faceoff_wins
			<streak_leaderboard_id> = lb_pro_faceoff_win_streak
			<streak_score> = <pro_face_off_streak>
			<wins> = <pro_faceoff_wins>
			<loses> = <pro_faceoff_loses>
			case p2_battle
			<total_wins_leaderboard_id> = lb_battle_wins
			<streak_leaderboard_id> = lb_battle_win_streak
			<streak_score> = <battle_streak>
			<wins> = <battle_wins>
			<loses> = <battle_loses>
		endswitch
		prepare_player_list_array {
			p1_leaderboard_id = <p1_leaderboard_id>
			p2_leaderboard_id = <p2_leaderboard_id>
			total_wins_leaderboard_id = <total_wins_leaderboard_id>
			streak_leaderboard_id = <streak_leaderboard_id>
			streak_score = <streak_score>
			wins = <wins>
			loses = <loses>
		}
		if GotParam \{Player_list}
			NetSessionFunc func = stats_write_multiplayer Obj = stats Params = {Player_list = <Player_list> DontEndSessionAfterWrite}
		endif
	endif
	Wait \{3
		Seconds}
	NetSessionFunc \{Obj = stats
		func = end_write_stats}
endscript

script prepare_player_list_array 
	net_stats_calculate_wins
	player1_xuid = [0 0]
	player2_xuid = [0 0]
	SetArrayElement ArrayName = player1_xuid Index = 0 NewValue = ($player1_status.net_id_first)
	SetArrayElement ArrayName = player1_xuid Index = 1 NewValue = ($player1_status.net_id_second)
	SetArrayElement ArrayName = player2_xuid Index = 0 NewValue = ($player2_status.net_id_first)
	SetArrayElement ArrayName = player2_xuid Index = 1 NewValue = ($player2_status.net_id_second)
	if (<p1_wins> = <p2_wins>)
		return
	elseif (<p1_wins> > <p2_wins>)
		get_match_type_leaderboard_info \{p1_wins_value = 1
			p2_wins_value = 0}
		create_player_leaderboard_array <...>
		Player_list = [
			{
				player_xuid = <player1_xuid>
				team = 0
				LEADERBOARDS = <player_leaderboard_array>
			}
			{
				player_xuid = <player2_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <p2_leaderboard_id>
						rating = 0
						Score = <score2>
						write_type = <write_type>
						columns =
						[
							{Score = <attrib_acum2>}
							{Score = <attrib_score2>}
							{Score = <attrib_tot2>}
						]
					}
				]
			}
		]
	elseif (<p1_wins> < <p2_wins>)
		get_match_type_leaderboard_info \{p1_wins_value = 0
			p2_wins_value = 1}
		create_player_leaderboard_array <...>
		Player_list = [
			{
				player_xuid = <player2_xuid>
				team = 0
				LEADERBOARDS = [
					{
						leaderboard_Id = <p2_leaderboard_id>
						rating = 0
						Score = <score2>
						write_type = <write_type>
						columns = [
							{Score = <attrib_acum2>}
							{Score = <attrib_score2>}
							{Score = <attrib_tot2>}
						]
					}
				]
			}
			{
				player_xuid = <player1_xuid>
				team = 0
				LEADERBOARDS = <player_leaderboard_array>
			}
		]
	endif
	PrintStruct <...>
	return Player_list = <Player_list>
endscript

script net_retrieve_primary_controller_score 
	if (($player1_status.controller) = ($primary_controller))
		return primary_score = ($player1_status.Score) secondary_score = ($player2_status.Score)
	elseif (($player2_status.controller) = ($primary_controller))
		return primary_score = ($player2_status.Score) secondary_score = ($player1_status.Score)
	else
		return \{primary_score = 0
			secondary_score = 0}
	endif
endscript

script get_match_type_leaderboard_info 
	if NOT ($game_mode = p2_battle)
		net_stats_calculate_total_scores
		player1_score = <p1_score>
		CastToInteger \{player1_score}
		player2_score = <p2_score>
		CastToInteger \{player2_score}
		return {
			write_type = MAX
			score1 = <player1_score>
			attrib_acum1 = <player1_score>
			attrib_score1 = <player1_score>
			attrib_tot1 = <player1_score>
			score2 = <player2_score>
			attrib_acum2 = <player2_score>
			attrib_score2 = <player2_score>
			attrib_tot2 = <player2_score>
		}
	else
		return {
			write_type = ACCUMULATE
			score1 = <p1_wins_value>
			attrib_acum1 = <p1_wins_value>
			attrib_score1 = <p1_wins_value>
			attrib_tot1 = <p1_wins_value>
			score2 = <p2_wins_value>
			attrib_acum2 = <p2_wins_value>
			attrib_score2 = <p2_wins_value>
			attrib_tot2 = <p2_wins_value>
		}
	endif
endscript

script create_player_leaderboard_array 
	Printf \{"create_player_leaderboard_array"}
	if (<p1_wins> > <p2_wins>)
		streak_score = (<streak_score> + 1)
		GetLeaderboardWinLoseValue WIN = (<wins> + 1) LOSE = <loses>
		online_set_win_losses_streak \{out_come = WIN}
	else
		streak_score = 0
		GetLeaderboardWinLoseValue WIN = <wins> LOSE = (<loses> + 1)
		online_set_win_losses_streak \{out_come = LOSE}
	endif
	if ($game_mode = p2_battle)
		player_leaderboard_array = [
			{
				leaderboard_Id = <p1_leaderboard_id>
				rating = 0
				Score = <score1>
				write_type = <write_type>
				columns = [
					{Score = <attrib_acum1>}
					{Score = <attrib_score1>}
					{Score = <attrib_tot1>}
				]
			}
			{
				leaderboard_Id = <streak_leaderboard_id>
				rating = 0
				Score = <streak_score>
				write_type = LAST
				columns = [
					{Score = <streak_score>}
					{Score = <streak_score>}
					{Score = <streak_score>}
				]
			}
		]
	else
		player_leaderboard_array = [
			{
				leaderboard_Id = <p1_leaderboard_id>
				rating = 0
				Score = <score1>
				write_type = <write_type>
				columns = [
					{Score = <attrib_acum1>}
					{Score = <attrib_score1>}
					{Score = <attrib_tot1>}
				]
			}
			{
				leaderboard_Id = <streak_leaderboard_id>
				rating = 0
				Score = <streak_score>
				write_type = LAST
				columns = [
					{Score = <streak_score>}
					{Score = <streak_score>}
					{Score = <streak_score>}
				]
			}
			{
				leaderboard_Id = <total_wins_leaderboard_id>
				rating = 0
				Score = <winlosevalue>
				write_type = LAST
				columns = [
					{Score = <winlosevalue>}
					{Score = <winlosevalue>}
					{Score = <winlosevalue>}
				]
			}
		]
	endif
	return player_leaderboard_array = <player_leaderboard_array>
endscript

script summation_career_score 
	setlist_prefix = ($<tier_global>.prefix)
	career_score = 0
	Tier = 1
	begin
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<array_count> + 1) S = <Tier>
	if NOT Progression_IsBossSong tier_global = <tier_global> Tier = <Tier> Song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
		GetGlobalTags <song_checksum> Param = Score
		<career_score> = (<career_score> + <Score>)
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<tier_global>.num_tiers)
	return career_score = <career_score>
endscript

script online_set_win_losses_streak \{out_come = LOSE}
	GetGlobalTags \{net}
	switch ($game_mode)
		case p2_battle
		if (<out_come> = WIN)
			SetGlobalTags net Params = {battle_streak = (<battle_streak> + 1) battle_wins = (<battle_wins> + 1)}
		else
			SetGlobalTags net Params = {battle_streak = 0 battle_loses = (<battle_loses> + 1)}
		endif
		case p2_faceoff
		if (<out_come> = WIN)
			SetGlobalTags net Params = {face_off_streak = (<face_off_streak> + 1) faceoff_wins = (<faceoff_wins> + 1)}
		else
			SetGlobalTags net Params = {face_off_streak = 0 faceoff_loses = (<faceoff_loses> + 1)}
		endif
		case p2_pro_faceoff
		if (<out_come> = WIN)
			SetGlobalTags net Params = {pro_face_off_streak = (<pro_face_off_streak> + 1) pro_faceoff_wins = (<pro_faceoff_wins> + 1)}
		else
			SetGlobalTags net Params = {pro_face_off_streak = 0 pro_faceoff_loses = (<pro_faceoff_loses> + 1)}
		endif
	endswitch
endscript

script net_get_coop_difficulty \{coop_difficulty_type = lowest}
	if (<coop_difficulty_type> = lowest)
		if (($current_difficulty = EASY) || ($current_difficulty2 = EASY))
			return \{coop_diff = EASY}
		endif
		if (($current_difficulty = MEDIUM) || ($current_difficulty2 = MEDIUM))
			return \{coop_diff = MEDIUM}
		endif
		if (($current_difficulty = HARD) || ($current_difficulty2 = HARD))
			return \{coop_diff = HARD}
		endif
		return \{coop_diff = EXPERT}
	elseif (<coop_difficulty_type> = highest)
		if (($current_difficulty = EXPERT) || ($current_difficulty2 = EXPERT))
			return \{coop_diff = EXPERT}
		endif
		if (($current_difficulty = HARD) || ($current_difficulty2 = HARD))
			return \{coop_diff = HARD}
		endif
		if (($current_difficulty = MEDIUM) || ($current_difficulty2 = MEDIUM))
			return \{coop_diff = MEDIUM}
		endif
		return \{coop_diff = EASY}
	endif
endscript

script net_get_game_mode_leaderboard_id 
	switch ($game_mode)
		case p2_faceoff
		FormatText ChecksumName = leaderboard_id_p1 'lb_faceoff_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty))
		FormatText ChecksumName = leaderboard_id_p2 'lb_faceoff_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty2))
		case p2_pro_faceoff
		FormatText ChecksumName = leaderboard_id_p1 'lb_pro_faceoff_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty))
		FormatText ChecksumName = leaderboard_id_p2 'lb_pro_faceoff_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty2))
		case p2_battle
		FormatText ChecksumName = leaderboard_id_p1 'lb_battle_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty))
		FormatText ChecksumName = leaderboard_id_p2 'lb_battle_%s' S = ($Leaderboard_Difficulty_Lookup_Table.($current_difficulty2))
	endswitch
	return {p1_leaderboard_id = <leaderboard_id_p1> p2_leaderboard_id = <leaderboard_id_p2>}
endscript

script network_player_lobby_message 
	if NOT ((<Type> = open_comm) || (<Type> = ready_up))
		return
	endif
	switch <Type>
		case character_select
		<selection_type> = 0
		case character_hub_select
		<selection_type> = 1
		case outfit_select
		<selection_type> = 2
		case style_select
		<selection_type> = 3
		case guitar_select
		<selection_type> = 4
		case skin_select
		<selection_type> = 5
		case song_select
		<selection_type> = 6
		case ready_up
		<selection_type> = 7
		case open_comm
		<selection_type> = 8
	endswitch
	switch <action>
		case update
		<selection_action> = 0
		case deselect
		<selection_action> = 1
		case SELECT
		<selection_action> = 2
	endswitch
	if GotParam \{value1}
		<selection_index1> = <value1>
	else
		<selection_index1> = 0
	endif
	if GotParam \{value2}
		<selection_index2> = <value2>
	else
		<selection_index2> = 0
	endif
	if GotParam \{Checksum}
		<checksum_value> = <Checksum>
	else
		<checksum_value> = NULL
	endif
	SendNetMessage {
		Type = lobby_selection
		selection_type = <selection_type>
		selection_action = <selection_action>
		selection_index1 = <selection_index1>
		selection_index2 = <selection_index2>
		net_checksum = <checksum_value>
	}
endscript

script net_request_play_show 
	if (($p1_ready = 1) && ($p2_ready = 1))
		return
	endif
	if (<action> = 1)
		if ($p1_ready = 0)
			if ScreenElementExists \{Id = vmenu_character_hub_p1}
				LaunchEvent \{Type = unfocus
					Target = vmenu_character_hub_p1}
			endif
			SendNetMessage {
				Type = lobby_ready
				ready_status = <action>
			}
		endif
	else
		if ($p1_ready = 1)
			if ScreenElementExists \{Id = vmenu_character_hub_p1}
				LaunchEvent \{Type = unfocus
					Target = vmenu_character_hub_p1}
			endif
			SendNetMessage {
				Type = lobby_ready
				ready_status = <action>
			}
		else
			character_hub_go_back \{Player = 1}
		endif
	endif
endscript

script net_request_play_show_ack 
	if (($p1_ready = 1) && ($p2_ready = 1))
		return
	endif
	if GotParam \{action}
		if (<action> = 0)
			if (<Player> = 1)
				character_hub_go_back Player = <Player>
			else
				character_hub_net_ready_back
			endif
		else
			if (<Player> = 1)
				character_hub_select_play_show Player = <Player>
				if ScreenElementExists \{Id = vmenu_character_hub_p1}
					LaunchEvent \{Type = Focus
						Target = vmenu_character_hub_p1}
				endif
			else
				character_hub_net_ready
			endif
		endif
	endif
endscript

script network_player_lobby_update 
	if NOT (($player2_present) || (<selection_type> = 8))
		Printf "The other player is not connected.  Ignoring this message type=%s" S = <selection_type>
		return
	endif
	switch <selection_type>
		case 0
		switch <selection_action>
			get_musician_profile_struct Index = <checksum_value>
			case 0
			if (<selection_index1> = 0)
				cs_scroll_up_or_down \{Player = 2
					Dir = UP}
			else
				cs_scroll_up_or_down \{Player = 2
					Dir = DOWN}
			endif
			case 1
			net_cs_go_back \{Player = 2}
			case 2
			if (<selection_index1> = ($character_select_highlighted_character_p2))
				character_select_choose \{Player = 2}
			endif
		endswitch
		case 1
		switch <selection_action>
			case 1
			character_hub_go_back \{Player = 2}
			case 2
			switch <selection_index1>
				case 1
				character_hub_select_change_outfit \{Player = 2}
				case 2
				character_hub_select_change_guitar \{Player = 2}
				case 3
				character_hub_select_change_guitar \{Player = 2
					BASS}
			endswitch
		endswitch
		case 2
		switch <selection_action>
			case 0
			os_scroll_up_or_down \{Player = 2}
			case 1
			select_outfit_go_back \{Player = 2}
			case 2
			select_outfit_choose \{Player = 2}
		endswitch
		case 3
		switch <selection_action>
			case 0
			select_outfit_style_highlight Player = 2 Index = <selection_index1>
			case 1
			destroy_select_style_menu \{Player = 2}
			case 2
			select_outfit_style_choose \{Player = 2}
		endswitch
		case 4
		switch <selection_action>
			case 0
			net_gs_scroll_up_or_down Player = 2 dir_value = <selection_index1> instrument_type = <checksum_value>
			case 1
			SpawnScriptNow \{select_guitar_go_back
				Params = {
					Player = 2
				}}
			case 2
			net_select_guitar Player = 2 Index = <selection_index1> instrument_type = <checksum_value>
		endswitch
		case 5
		switch <selection_action>
			case 0
			case 1
			net_select_guitar_go_back_from_finish_menu Player = 2 instrument_type = <checksum_value>
			case 2
			net_select_guitar_finish_choose Player = 2 Index = <selection_index1> finish_index = <selection_index2> instrument_type = <checksum_value>
		endswitch
		case 6
		switch <selection_action>
			case 1
			online_song_deselect \{Player = 2}
			case 2
			online_song_select Song = <checksum_value> Player = 2
		endswitch
		case 7
		switch <selection_action>
			case 1
			if (<checksum_value> = Final)
				online_song_deselect \{Player = 2}
				return
			endif
			character_hub_net_ready_back
			case 2
			if (<checksum_value> = Final)
				online_song_select \{Player = 2}
				return
			endif
			character_hub_net_ready
		endswitch
		case 8
		set_other_player_present
	endswitch
endscript

script net_lobby_state_message 
	switch <current_state>
		case NONE
		selection_type = 1
		case character_hub
		selection_type = 1
		case Instrument
		selection_type = 2
		case DIFFICULTY
		selection_type = 3
		case Song
		selection_type = 4
	endswitch
	switch <action>
		case request
		selection_action = 0
		case approval
		selection_action = 1
	endswitch
	if GotParam \{request_state}
		switch <request_state>
			case leaving_lobby
			Value = 0
			case character_hub
			Value = 1
			case Instrument
			Value = 2
			case DIFFICULTY
			Value = 3
			case Song
			Value = 4
		endswitch
	else
		Value = 1
	endif
	SendNetMessage {
		Type = lobby_state
		selection_type = <selection_type>
		selection_action = <selection_action>
		selection_index = <Value>
	}
endscript

script net_lobby_state_update 
	switch <selection_type>
		case 1
		Change \{net_current_flow_state = character_hub}
		Change \{net_can_send_approval = 1}
		case 2
		Change \{StructureName = player1_status
			part = GUITAR}
		Change \{StructureName = player2_status
			part = GUITAR}
		create_guitarist \{Name = GUITARIST
			UseOldPos
			no_strum
			animpak = 0}
		create_guitarist \{Name = BASSIST
			UseOldPos
			no_strum
			animpak = 0}
		if IsHost
			ResetLobbyReady
		endif
		LaunchEvent \{Type = Focus
			Target = si_vmenu_p1}
		Change \{net_current_flow_state = Instrument}
		Change \{net_can_send_approval = 1}
		case 3
		if IsHost
			ResetLobbyReady
		endif
		LaunchEvent \{Type = Focus
			Target = vmenu_select_difficulty}
		Change \{net_current_flow_state = DIFFICULTY}
		Change \{net_can_send_approval = 1}
		case 4
		if (IsHost)
			ResetLobbyReady
			if ($host_songs_to_pick = 0)
				LaunchEvent \{Type = Focus
					Target = ready_container_p1}
			else
				LaunchEvent \{Type = Focus
					Target = vmenu_setlist}
			endif
		else
			if ($client_songs_to_pick = 0)
				LaunchEvent \{Type = Focus
					Target = ready_container_p1}
			else
				LaunchEvent \{Type = Focus
					Target = vmenu_setlist}
			endif
		endif
		Change \{net_current_flow_state = Song}
		Change \{net_can_send_approval = 1}
	endswitch
endscript

script net_pausegh3 
	BroadCastEvent \{Type = event_pause_game}
	ui_flow_manager_respond_to_action \{action = pause_game}
	Wait \{1
		GameFrame}
endscript

script net_unpausegh3 
	ui_flow_manager_respond_to_action \{action = select_resume}
endscript

script gameinvite_server_unavailable 
	CreateJoinRefusedDialog \{reason = net_status_join_timeout}
endscript

script destroy_join_refuse_dialog_and_cancel_join_server 
	destroy_popup_warning_menu
	ui_flow_manager_respond_to_action \{action = go_back}
	cancel_join_server
	destroy_connection_dialog_scroller
endscript

script CreateJoinRefusedDialog 
	Printf \{"--CreateJoinRefusedDialog"}
	destroy_net_popup
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	switch (<reason>)
		case net_reason_banned
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_status_join_timeout
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_full_observers
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_wrong_password
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_default
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_rank_limit_low
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_rank_limit_high
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_default
		<connection_msg> = "SESSION IS NO LONGER AVAILABLE"
		case net_reason_full
		<connection_msg> = "THIS SERVER IS NOW FULL"
	endswitch
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = net_popup_container
		just = [
			Center
			Center
		]
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = VScrollingMenu
		PARENT = net_popup_container
		Id = connection_dialog_scroller
		just = [
			Center
			Top
		]
		Dims = (400.0, 480.0)
		Pos = (640.0, 400.0)
		z_priority = 1.0}
	CreateScreenElement {
		Type = VMenu
		PARENT = connection_dialog_scroller
		Id = connection_dialog_vmenu
		Pos = (0.0, 0.0)
		just = [LEFT Top]
		internal_just = [Center Top]
		Dims = (400.0, 480.0)
		event_handlers = [
			{pad_choose destroy_join_refuse_dialog_and_cancel_join_server}
		]
		exclusive_device = ($primary_controller)
	}
	add_searching_menu_item \{vmenu_id = connection_dialog_vmenu
		choose_script = empty_script
		Z = 200.1
		Text = "CONTINUE"}
	displaySprite Id = connect_message_top PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 200.0) Dims = (448.0, 64.0) just = [Center Top] Z = 200
	displaySprite \{Id = connect_message_top_fill
		PARENT = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 200.0)
		Dims = (448.0, 64.0)
		just = [
			Center
			Top
		]
		Z = 200}
	displaySprite Id = connect_message_body PARENT = net_popup_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (640.0, 264.0) Dims = (448.0, 128.0) just = [Center Top] Z = 200 flip_h
	displaySprite \{Id = connect_message_body_fill
		PARENT = net_popup_container
		tex = window_fill_body_large
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 264.0)
		Dims = (448.0, 128.0)
		just = [
			Center
			Top
		]
		Z = 200
		flip_h}
	displaySprite Id = connect_message_bottom PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 392.0) Dims = (448.0, 64.0) just = [Center Top] Z = 200 flip_h
	displaySprite \{Id = connect_message_bottom_fill
		PARENT = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 392.0)
		Dims = (448.0, 64.0)
		just = [
			Center
			Top
		]
		Z = 200
		flip_h}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = net_popup_container
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		Text = <connection_msg>
		Pos = (640.0, 300.0)
		Dims = (375.0, 200.0)
		z_priority = 200.0
		just = [Center Center]
	}
	LaunchEvent \{Type = Focus
		Target = connection_dialog_vmenu}
endscript

script create_connection_lost_dialog 
	Printf \{"---create_connection_lost_dialog"}
	Change \{player2_present = 0}
	KillSpawnedScript \{Name = net_hub_stream}
	if ($ui_flow_manager_state [0] = online_loading_fs)
		if ((ScriptIsRunning restart_gem_scroller) || (ScriptIsRunning load_and_sync_timing))
			RemoveTimeSyncTask
			Change \{net_ready_to_start = 1}
		else
			load_and_sync_timing \{player_status = player1_status}
		endif
	endif
	wait_for_safe_shutdown
	if (GotParam from_invite)
		FormatText \{TextName = gt_lost_connection_text
			"The invite server has been filled."
			DontAssertForChecksums}
	elseif (GotParam player_quit)
		if ($opponent_gamertag = NULL)
			FormatText \{TextName = gt_lost_connection_text
				"Your opponent has quit"
				DontAssertForChecksums}
		else
			FormatText TextName = gt_lost_connection_text "%n\\n has quit" N = ($opponent_gamertag) DontAssertForChecksums
		endif
	else
		if ($opponent_gamertag = NULL)
			FormatText \{TextName = gt_lost_connection_text
				"LOST CONNECTION TO YOUR OPPONENT"
				DontAssertForChecksums}
		else
			FormatText TextName = gt_lost_connection_text "LOST CONNECTION TO\\n%g" G = ($opponent_gamertag) DontAssertForChecksums
		endif
	endif
	destroy_pause_menu
	create_net_popup popup_text = <gt_lost_connection_text>
	if ($playing_song = 1)
		Wait \{2
			Seconds}
		if ($ui_flow_manager_state [0] = online_play_song_fs)
			connection_lost_end_song
		elseif ($ui_flow_manager_state [0] = online_pause_fs)
			ui_flow_manager_respond_to_action \{action = select_resume}
			connection_lost_end_song
		endif
		Wait \{2
			Seconds}
	else
		if (($ui_flow_manager_state [0] = online_fail_song_fs) || ($ui_flow_manager_state [0] = online_win_song_fs))
			cleanup_newspaper_other_player_quit
			Wait \{4
				Seconds}
		elseif ($ui_flow_manager_state [0] = online_loading_fs)
		else
			Wait \{4
				Seconds}
			if ($in_signin_changed_menu = 1)
				destroy_net_popup
				return
			endif
			lobby_connection_lost
		endif
	endif
	destroy_net_popup
endscript

script create_net_popup \{PARENT = root_window
		Pos = (640.0, 325.0)}
	destroy_net_popup
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Id = net_popup_container
		just = [Center Center]
		Pos = (0.0, 0.0)
	}
	create_UI_frame {
		frame_dims = (400.0, 100.0)
		center_pos = <Pos>
		PARENT = net_popup_container
		frame_rgba = [110 100 120 100]
		fill_rgba = [70 0 20 200]
		z_priority = 199
		offset_top = 32
		offset_side = 32
		min_fill_pad_width = 73
		min_fill_pad_height = 63
		tex_param = 'simple'
		suffix = 5
		check_side_swap = 0
	}
	CreateScreenElement {
		Type = TextBlockElement
		Id = net_popup_text
		PARENT = net_popup_container
		font = fontgrid_title_gh3
		Scale = 0.65000004
		rgba = ($online_light_blue)
		Text = <popup_text>
		Pos = (<Pos> + (0.0, 5.0))
		Dims = (425.0, 200.0)
		z_priority = 200.1
		just = [Center Center]
	}
	if GotParam \{add_waiting_dots}
		RunScriptOnScreenElement Id = net_popup_text append_animating_dots Params = {Id = net_popup_text Text = <popup_text>}
	endif
endscript

script append_animating_dots 
	Printf \{"---append_animating_dots"}
	num_dots = 0
	if ScreenElementExists Id = <Id>
		begin
		FormatText TextName = new_text "%a\\n%b" A = <Text> B = ($dots_array [<num_dots>])
		<Id> :SetProps Text = <new_text>
		if (<num_dots> = 3)
			<num_dots> = 0
		else
			<num_dots> = (<num_dots> + 1)
		endif
		Wait \{0.5
			Second}
		repeat
	endif
endscript

script destroy_net_popup 
	if ScreenElementExists \{Id = net_popup_container}
		DestroyScreenElement \{Id = net_popup_container}
	endif
endscript

script ShowJoinTimeoutNotice 
	cancel_join_server
	setup_sessionfuncs
	SpawnScriptNow \{timeout_connection_attempt}
endscript

script timeout_connection_attempt 
	create_timeout_dialog
	ui_flow_manager_respond_to_action \{action = timeout}
	net_repeat_last_search
endscript

script FailedToCreateGame 
	cancel_join_server
	setup_sessionfuncs
	create_failed_connection_dialog
endscript

script destroy_connection_dialog_scroller 
	if ScreenElementExists \{Id = connection_dialog_scroller}
		DestroyScreenElement \{Id = connection_dialog_scroller}
	endif
	destroy_net_popup
endscript

script create_timeout_dialog 
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	CreateScreenElement \{Type = VScrollingMenu
		PARENT = root_window
		Id = connection_dialog_scroller
		just = [
			Center
			Top
		]
		Dims = (400.0, 480.0)
		Pos = (640.0, 400.0)
		z_priority = 1.0}
	CreateScreenElement {
		Type = VMenu
		PARENT = connection_dialog_scroller
		Id = connection_dialog_vmenu
		Pos = (0.0, 0.0)
		just = [LEFT Top]
		internal_just = [Center Top]
		Dims = (400.0, 480.0)
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action Params = {action = go_back}}
			{pad_choose destroy_connection_dialog_scroller}
		]
		exclusive_device = ($primary_controller)
	}
	add_searching_menu_item \{vmenu_id = connection_dialog_vmenu
		choose_script = empty_script
		Z = 200.1
		Text = "CONTINUE"}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = net_popup_container
		just = [
			Center
			Center
		]
		Pos = (0.0, 0.0)}
	displaySprite Id = connect_message_top PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 200.0) Dims = (448.0, 64.0) just = [Center Top] Z = 200
	displaySprite \{Id = connect_message_top_fill
		PARENT = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 200.0)
		Dims = (448.0, 64.0)
		just = [
			Center
			Top
		]
		Z = 200}
	displaySprite Id = connect_message_body PARENT = net_popup_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (640.0, 264.0) Dims = (448.0, 128.0) just = [Center Top] Z = 200 flip_h
	displaySprite \{Id = connect_message_body_fill
		PARENT = net_popup_container
		tex = window_fill_body_large
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 264.0)
		Dims = (448.0, 128.0)
		just = [
			Center
			Top
		]
		Z = 200
		flip_h}
	displaySprite Id = connect_message_bottom PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 392.0) Dims = (448.0, 64.0) just = [Center Top] Z = 200 flip_h
	displaySprite \{Id = connect_message_bottom_fill
		PARENT = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 392.0)
		Dims = (448.0, 64.0)
		just = [
			Center
			Top
		]
		Z = 200
		flip_h}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = net_popup_container
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		Text = "CONNECTION TIMED OUT"
		Pos = (640.0, 300.0)
		Dims = (375.0, 200.0)
		z_priority = 200.0
		just = [Center Center]
	}
	LaunchEvent \{Type = Focus
		Target = connection_dialog_vmenu}
endscript

script continue_from_failed_conn 
	ui_flow_manager_respond_to_action \{action = go_back}
	cancel_join_server
	destroy_connection_dialog_scroller
endscript

script create_failed_connection_dialog 
	destroy_pause_menu_frame
	destroy_menu \{menu_id = pu_warning_scroll}
	destroy_menu \{menu_id = popup_warning_container}
	CreateScreenElement \{Type = VScrollingMenu
		PARENT = root_window
		Id = connection_dialog_scroller
		just = [
			Center
			Top
		]
		Dims = (400.0, 480.0)
		Pos = (640.0, 400.0)
		z_priority = 1.0}
	CreateScreenElement {
		Type = VMenu
		PARENT = connection_dialog_scroller
		Id = connection_dialog_vmenu
		Pos = (0.0, 0.0)
		just = [LEFT Top]
		internal_just = [Center Top]
		Dims = (400.0, 480.0)
		event_handlers = [
		]
		exclusive_device = ($primary_controller)
	}
	add_searching_menu_item \{vmenu_id = connection_dialog_vmenu
		choose_script = continue_from_failed_conn
		Z = 200.1
		Text = "CONTINUE"}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = net_popup_container
		just = [
			Center
			Center
		]
		Pos = (0.0, 0.0)}
	displaySprite Id = connect_message_top PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 200.0) Dims = (448.0, 64.0) just = [Center Top] Z = 200
	displaySprite \{Id = connect_message_top_fill
		PARENT = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 200.0)
		Dims = (448.0, 64.0)
		just = [
			Center
			Top
		]
		Z = 200}
	displaySprite Id = connect_message_body PARENT = net_popup_container tex = window_frame_body_tall rgba = ($online_medium_blue) Pos = (640.0, 264.0) Dims = (448.0, 128.0) just = [Center Top] Z = 200 flip_h
	displaySprite \{Id = connect_message_body_fill
		PARENT = net_popup_container
		tex = window_fill_body_large
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 264.0)
		Dims = (448.0, 128.0)
		just = [
			Center
			Top
		]
		Z = 200
		flip_h}
	displaySprite Id = connect_message_bottom PARENT = net_popup_container tex = window_frame_cap rgba = ($online_medium_blue) Pos = (640.0, 392.0) Dims = (448.0, 64.0) just = [Center Top] Z = 200 flip_h
	displaySprite \{Id = connect_message_bottom_fill
		PARENT = net_popup_container
		tex = window_fill_cap
		rgba = [
			0
			0
			0
			255
		]
		Pos = (640.0, 392.0)
		Dims = (448.0, 64.0)
		just = [
			Center
			Top
		]
		Z = 200
		flip_h}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = net_popup_container
		font = fontgrid_title_gh3
		Scale = 1.0
		rgba = ($online_light_blue)
		Text = "FAILED TO CONNECT TO GAME"
		Pos = (640.0, 315.0)
		Dims = (375.0, 200.0)
		z_priority = 200.0
		just = [Center Center]
	}
	LaunchEvent \{Type = Focus
		Target = connection_dialog_vmenu}
endscript

script net_repeat_last_search 
	Wait \{1
		GameFrame}
	ui_flow_manager_respond_to_action \{action = select_done}
endscript

script check_if_selecting_tie_breaker \{Player = 1}
	if IsHost
		if (($tie_breaker = HOST) && (<Player> = 1))
			return \{selecting_tiebreaker = 1}
		endif
		if (($tie_breaker = CLIENT) && (<Player> = 2))
			return \{selecting_tiebreaker = 1}
		endif
	else
		if (($tie_breaker = HOST) && (<Player> = 2))
			return \{selecting_tiebreaker = 1}
		endif
		if (($tie_breaker = CLIENT) && (<Player> = 1))
			return \{selecting_tiebreaker = 1}
		endif
	endif
	return \{selecting_tiebreaker = 0}
endscript

script get_num_players_by_gamemode 
	if (($game_mode = p1_career) || ($game_mode = p1_quickplay))
		return \{num_players = 1}
	else
		return \{num_players = 2}
	endif
endscript

script connection_lost_end_song 
	Printf \{"connection_lost_end_song"}
	Change \{current_num_players = 2}
	if ($playing_song = 0)
		return
	endif
	if ($game_mode = p2_battle)
		Change \{StructureName = player1_status
			current_health = 1.0}
		Change \{StructureName = player2_status
			current_health = 0.0}
		GuitarEvent_SongWon \{battle_win = 1}
	else
		ExtendCRC \{song_won
			'p1'
			out = Type}
		BroadCastEvent Type = <Type>
	endif
endscript

script test_events \{passed_in_value = 'test value'}
	Printf \{"test_events"}
	PrintStruct <...>
	NetSessionFunc \{Obj = stats
		func = write_key_value
		Params = {
			wtf_value = 'test value'
			key = 'test key'
		}}
endscript

script net_failed_signin 
	Printf \{"--- net_failed_signin"}
	if ($respond_to_signin_changed = 0)
		return
	endif
	if (($ui_flow_manager_state [0]) = online_signin_fs)
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script xbox360_live_not_allowed 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_popup_warning_menu
	create_menu_backdrop \{texture = Online_Background}
	if IsXENON
		sign_in_text = "The current gamer profile is not enabled for Xbox LIVE multiplayer game play."
	else
		if GotParam \{age_restricted}
			sign_in_text = "Online service is disabled on your PLAYSTATION®Network account due to parental control restrictions."
		else
			sign_in_text = "You must be signed in to enter the lobby."
		endif
	endif
	create_popup_warning_menu {
		textblock = {
			Text = <sign_in_text>
			Dims = (700.0, 320.0)
			Scale = 0.6
		}
		no_background
		Menu_pos = (640.0, 465.0)
		dialog_dims = (600.0, 80.0)
		options = [
			{
				func = xbox360_live_not_allowed_continue_script
				Text = "CONTINUE"
			}
		]
	}
endscript

script xbox360_live_not_allowed_continue_script 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script xenon_auto_load_progress 
	Printf \{"--- xenon_auto_load_progress"}
	if (($ui_flow_manager_state [0]) = online_signin_fs)
		if ($online_signin_autoload_required = 1)
			Change \{online_signin_autoload_required = 0}
			Change \{respond_to_signin_changed = 0}
			FadeToBlack \{ON
				Time = 0
				Alpha = 1.0
				z_priority = 20000
				Id = invite_screenfader}
			Wait \{1
				GameFrame}
			StopRendering
			shutdown_game_for_signin_change \{signin_change = 1}
			LaunchEvent \{Type = unfocus
				Target = root_window}
			StartRendering
			Wait \{1
				GameFrame}
			FadeToBlack \{OFF
				Time = 0
				Id = invite_screenfader}
			Wait \{1
				GameFrame}
			Change invite_controller = ($primary_controller)
			start_flow_manager \{flow_state = bootup_press_any_button_fs}
		else
			ui_flow_manager_respond_to_action \{action = online_enabled}
		endif
	endif
endscript

script scale_element_to_size \{Time = 0}
	if NOT GotParam \{Id}
		Printf \{'Did not pass in id to scale_element_to_size! Returning'}
		return
	endif
	GetScreenElementDims Id = <Id>
	orig_height = <Height>
	orig_width = <width>
	if NOT GotParam \{target_width}
		target_width = <orig_width>
	endif
	if NOT GotParam \{target_height}
		target_height = <orig_height>
	endif
	xScale = (<target_width> / (<orig_width> * 1.0))
	yScale = (<target_height> / (<orig_height> * 1.0))
	<Id> :DoMorph Scale = (<xScale> * (1.0, 0.0) + <yScale> * (0.0, 1.0)) Time = <Time>
endscript

script translate_screen_element \{Time = 0}
	if NOT GotParam \{Id}
		Printf \{'Did not pass in id to translate_screen_element! Returning'}
		return
	endif
	if NOT GotParam \{Pos}
		GetScreenElementPosition Id = <Id>
		new_position = <ScreenELementPos>
	else
		new_position = <Pos>
	endif
	<Id> :DoMorph Pos = <new_position> Time = <Time>
endscript

script get_my_highway_layout 
	Player = 1
	begin
	FormatText ChecksumName = player_status 'player%p_status' P = <Player>
	if ($<player_status>.is_local_client)
		return my_highway = ($<player_status>.highway_layout)
	endif
	<Player> = (<Player> + 1)
	repeat 2
endscript

script agora_update 
	if ($coop_dlc_active = 1)
		return
	endif
	get_game_mode_name
	get_current_band_info
	GetGlobalTags <band_info>
	band_id = <band_unique_id>
	FormatText TextName = band_name '%s' S = <Name>
	if NOT GotParam \{new_band}
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
		career_difficulty = <difficulty_text_nl>
		get_diff_completion_percentage
		career_percent_complete_easy = (<diff_completion_percentage> [0])
		career_score_overall_easy = (<diff_completion_score> [0])
		career_percent_complete_medium = (<diff_completion_percentage> [1])
		career_score_overall_medium = (<diff_completion_score> [1])
		career_percent_complete_hard = (<diff_completion_percentage> [2])
		career_score_overall_hard = (<diff_completion_score> [2])
		career_percent_complete_expert = (<diff_completion_percentage> [3])
		career_score_overall_expert = (<diff_completion_score> [3])
	endif
	GetGlobalTags \{achievement_info}
	PrintStruct <...>
	CastToInteger \{total_points_in_career_mode_easy}
	campaign_score_easy = <total_points_in_career_mode_easy>
	CastToInteger \{total_points_in_career_mode_medium}
	campaign_score_medium = <total_points_in_career_mode_medium>
	CastToInteger \{total_points_in_career_mode_hard}
	campaign_score_hard = <total_points_in_career_mode_hard>
	CastToInteger \{total_points_in_career_mode_expert}
	campaign_score_expert = <total_points_in_career_mode_expert>
	campaign_score_overall = (<total_points_in_career_mode_expert> + <total_points_in_career_mode_hard> + <total_points_in_career_mode_medium> + <total_points_in_career_mode_easy>)
	ACHIEVEMENTS = 'what achievements?'
	purchases = 'test purchases'
	WriteUpdate <...>
endscript

script agora_write_stats 
	Printf \{"agora_write_stats %s"
		S = $game_mode}
	if ($coop_dlc_active = 1)
		QUICKPLAY = 1
	endif
	if ($game_mode = p1_quickplay)
		QUICKPLAY = 1
	endif
	if ($boss_battle = 1)
		return
	endif
	player_id = ($player1_status.controller)
	get_num_players_by_gamemode
	GetGlobalTags \{user_options
		Param = lefty_flip_p1}
	get_current_band_info
	GetGlobalTags <band_info>
	band_id = <band_unique_id>
	if ($is_network_game)
		if (NetSessionFunc Obj = match func = get_gamertag)
			FormatText TextName = gamertag1 '%s' S = <Name>
		endif
		FormatText TextName = gamertag2 '%s' S = ($opponent_gamertag)
		p1_name = <gamertag1>
		p2_name = <gamertag2>
		retrieve_player_net_id \{Player = 2}
		player_id2 = <net_id>
	else
		player_id2 = ($player2_status.controller)
		if (($game_mode = p1_career) || ($game_mode = p2_career))
			menu_ebn_get_band_name_text
			StringRemoveTrailingWhitespace String = <band_name_text_string>
			FormatText TextName = band_text '%s' S = <band_name_text_string>
			<p1_name> = <band_text>
			<p2_name> = <band_text>
		else
		endif
		if ($coop_dlc_active = 0)
			if (($game_mode = p1_career) || ($game_mode = p2_career))
				menu_ebn_get_band_name_text
				StringRemoveTrailingWhitespace String = <band_name_text_string>
				FormatText TextName = band_text '%s' S = <band_name_text_string>
				<p1_name> = <band_text>
				<p2_name> = <band_text>
			else
			endif
		endif
	endif
	Venue = (($LevelZones.$current_level).Name)
	get_game_mode_name
	switch <game_mode_name>
		case 'p2_battle'
		mode = 'battle'
		case 'p2_faceoff'
		mode = 'face_off'
		case 'p2_pro_faceoff'
		mode = 'pro_face_off'
		case 'p2_coop'
		mode = 'online_coop'
	endswitch
	get_song_prefix Song = ($current_song)
	Title = <song_prefix>
	if ($player1_status.part = GUITAR)
		part = 'guitar'
	elseif ($player1_status.part = BASS)
		part = 'bass'
	else
		part = 'rhythm'
	endif
	get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
	DIFFICULTY = <difficulty_text_nl>
	Score = ($player1_status.Score)
	CastToInteger \{Score}
	STARS = ($player1_status.STARS)
	NOTES_HIT = ($player1_status.NOTES_HIT)
	notes_missed = (($player1_status.total_notes) - ($player1_status.NOTES_HIT))
	best_streak = ($player1_status.best_run)
	star_power_achieved = ($player1_status.sp_phrases_hit)
	star_power_available = ($player1_status.sp_phrases_total)
	if (<lefty_flip_p1>)
		Lefty = TRUE
	else
		Lefty = FALSE
	endif
	get_character_name \{Player = 1}
	p1_character_name = <character_name>
	get_character_outfit_name \{Player = 1}
	outfit = <outfit_name>
	character_color = ($player1_status.style)
	get_player_instrument_desc_name \{Player = 1}
	GUITAR = <instrument_name>
	Skin = <instrument_name>
	if (<num_players> = 2)
		if ($player1_status.Score > $player2_status.Score)
			winner = 'participant_1'
		else
			winner = 'participant_2'
		endif
		if ($player2_status.part = GUITAR)
			part2 = 'guitar'
		elseif ($player2_status.part = BASS)
			part2 = 'bass'
		else
			part2 = 'rhythm'
		endif
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty2)
		difficulty2 = <difficulty_text_nl>
		score2 = ($player2_status.Score)
		CastToInteger \{score2}
		stars2 = ($player2_status.STARS)
		notes_hit2 = ($player2_status.NOTES_HIT)
		notes_missed2 = (($player2_status.total_notes) - ($player2_status.NOTES_HIT))
		best_streak2 = ($player2_status.best_run)
		star_power_received2 = ($player2_status.sp_phrases_hit)
		if ($player2_status.lefthanded_button_ups = 1)
			lefty2 = TRUE
		else
			lefty2 = FALSE
		endif
		get_character_name \{Player = 2}
		character_name2 = <character_name>
		get_character_outfit_name \{Player = 2}
		outfit2 = <outfit_name>
		character_color2 = ($player2_status.style)
		get_player_instrument_desc_name \{Player = 2}
		Guitar2 = <instrument_name>
		skin2 = <instrument_name>
		character_name = <p1_character_name>
		WriteMultiPerformance <...>
	else
		winner = <p1_name>
		WritePerformance <...>
	endif
endscript

script WritePerformance \{band_id = default_band_id
		Venue = 'test venue'
		mode = 'test mode'
		submode = 'test submode'
		cheats = 'all cheats'
		Title = 'killing me softly'
		DIFFICULTY = 'test'
		SPEED = 'test'
		star_power_available = 0
		player_id = 0
		part = 'guitar'
		Score = 1
		STARS = 0
		NOTES_HIT = 2
		notes_missed = 0
		best_streak = 5
		star_power_achieved = 1
		Lefty = TRUE
		character_name = 'test'
		character_color = 1
		GUITAR = 'test'
		Skin = 'test'
		outfit = 'test'}
	if ($Cheat_AirGuitar = 1)
		air_guitar_active = air_guitar_active
	endif
	if ($Cheat_PerformanceMode = 1)
		performance_mode = performance_mode
	endif
	if ($Cheat_HyperSpeed > 0)
		hyper_speed = hyper_speed
	endif
	if ($Cheat_NoFail = 1)
		no_fail = no_fail
	endif
	if ($Cheat_PrecisionMode = 1)
		precision_mode = precision_mode
	endif
	Printf \{"WritePerformance"}
	NetSessionFunc Obj = stats func = write_performance Params = {<...>}
endscript

script WriteMultiPerformance \{winner = 'participant_1'
		Venue = 'test venue'
		mode = 'test mode'
		cheats = 'all cheats'
		Title = 'killing me softly'
		DIFFICULTY = 'test'
		SPEED = 'test'
		star_power_available = 0
		player_id = 0
		part = 'guitar'
		Score = 1
		STARS = 0
		NOTES_HIT = 2
		notes_missed = 0
		best_streak = 5
		star_power_achieved = 0
		Lefty = TRUE
		character_name = 'test'
		character_color = 1
		GUITAR = 'test'
		Skin = 'test'
		outfit = 'test'
		player_id2 = 1
		part2 = 'bass'
		score2 = 1
		stars2 = 0
		notes_hit2 = 2
		notes_missed2 = 0
		best_streak2 = 5
		star_power_achieved2 = 1
		lefty2 = TRUE
		character_name2 = 'test'
		character_color2 = 'test'
		Guitar2 = 'test'
		skin2 = 'test'
		outfit2 = 'test'}
	NetSessionFunc Obj = stats func = write_multi_match Params = {<...>}
endscript

script WriteUpdate \{band_id = 0
		band_name = 'test name'
		Cash = 100
		campaign_score_easy = 0
		campaign_score_medium = 0
		campaign_score_hard = 0
		campaign_score_expert = 0
		campaign_score_overall = 0
		ACHIEVEMENTS = 'temp achievement string'}
	NetSessionFunc Obj = stats func = write_update Params = {<...>}
endscript

script invite_accepted 
	sysnotify_handle_unpause
	if ($primary_controller_assigned = 0)
		Change invite_controller = <controllerid>
		return
	elseif ($primary_controller != <controllerid>)
		Change invite_controller = <controllerid>
	endif
	if ((($is_network_game = 0) && ($playing_song)) &&
			(($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff)))
		if (GameIsPaused)
			destroy_pause_menu
		endif
		create_popup_warning_menu {
			textblock = {
				Text = "Are you sure you want to leave this game session? Only the player who accepted the game invite will go to Xbox LIVE."
				Pos = (640.0, 380.0)
			}
			player_device = <controllerid>
			Menu_pos = (640.0, 465.0)
			dialog_dims = (275.0, 64.0)
			options = [
				{
					func = accepted_invite_agree
					Text = "YES"
				}
				{
					func = accepted_invite_disagree
					Text = "NO"
				}
			]
			no_background
		}
	else
		do_join_invite_stuff <...> accepted_invite
	endif
endscript

script accepted_invite_agree 
	if (GameIsPaused)
		unpausegh3
	endif
	do_join_invite_stuff <...> accepted_invite
endscript

script accepted_invite_disagree 
	destroy_popup_warning_menu
	if (GameIsPaused)
		create_pause_menu
	else
		PauseGh3
	endif
endscript

script send_fail_song_message \{wait_frames = 30
		quit_early = 0}
	if (IsHost)
		loser = 0
	else
		loser = 1
	endif
	SendNetMessage {
		Type = fail_song
		note_streak = ($player1_status.best_run)
		NOTES_HIT = ($player1_status.NOTES_HIT)
		total_notes = ($player1_status.total_notes)
		quit_early_flag = <quit_early>
		loser = <loser>
	}
	Wait <wait_frames> GameFrames
endscript

script do_join_invite_stuff 
	Printf \{"--- do_join_invite_stuff"}
	if GotParam \{accepted_invite}
		Printf \{"accepted invite"}
		if ($is_network_game)
			quit_network_game
		endif
		xenon_singleplayer_session_complete_uninit \{song_failed}
		Change \{online_signin_autoload_required = 0}
		wait_for_safe_shutdown
		Printf \{"do_join_invite_stuff started"}
		disable_pause
		Change \{match_type = Player}
		set_network_preferences
		if ($primary_controller_assigned = 1 && $primary_controller != $invite_controller && $invite_controller != -1)
			FadeToBlack \{ON
				Time = 0
				Alpha = 1.0
				z_priority = 20000
				Id = invite_screenfader}
			Wait \{1
				GameFrame}
			StopRendering
			shutdown_game_for_signin_change \{signin_change = 1}
			LaunchEvent \{Type = unfocus
				Target = root_window}
			StartRendering
			Wait \{1
				GameFrame}
			FadeToBlack \{OFF
				Time = 0
				Id = invite_screenfader}
			Wait \{1
				GameFrame}
			start_flow_manager \{flow_state = bootup_press_any_button_fs}
		else
			StopRendering
			shutdown_game_for_signin_change \{unloadcontent = 0}
			Change \{invite_controller = -1}
			LaunchEvent \{Type = unfocus
				Target = root_window}
			online_menu_init
			start_flow_manager \{flow_state = invite_joining_game_fs}
			StartRendering
			if NOT ($primary_controller = $player1_status.controller)
				Change StructureName = player1_status controller = ($primary_controller)
				GetGlobalTags \{user_options}
				Change StructureName = player1_status lefthanded_gems = <lefty_flip_p2>
				Change StructureName = player1_status lefthanded_button_ups = <lefty_flip_p2>
			endif
			JoinInviteServer
		endif
	else
		Printf \{"didn't get an invite"}
		if (($ui_flow_manager_state [0]) = online_signin_fs)
			ui_flow_manager_respond_to_action \{action = online_enabled}
		endif
	endif
endscript

script ui_print_gamertags \{pos1 = $gt_player1_pos
		pos2 = $gt_player2_pos
		just1 = [
			LEFT
			Top
		]
		just2 = [
			RIGHT
			Top
		]
		offscreen = 0}
	if (NetSessionFunc Obj = match func = get_gamertag)
		ui_print_gamertag Name = <Name> start_pos = <pos1> Color = ($player1_color) Player = 1 just = <just1> Dims = <Dims> offscreen = <offscreen>
	endif
	ui_print_gamertag Name = ($opponent_gamertag) start_pos = <pos2> Color = ($player2_color) Player = 2 just = <just2> Dims = <Dims> offscreen = <offscreen>
endscript

script ui_print_gamertag start_pos = $gt_player1_pos Color = ($player1_color) Player = 1 Dims = (450.0, 35.0) Z = 60 offscreen = 0
	if NOT GotParam \{Name}
		get_character_name Player = <Player>
		Name = <display_name>
	endif
	if NOT ScreenElementExists \{Id = gamertag_container}
		if (<offscreen> = 1)
			CreateScreenElement {
				Type = ContainerElement
				Id = gamertag_container
				PARENT = root_window
				Pos = (0.0, -400.0)
				just = [Center Center]
				z_priority = <Z>
			}
		else
			CreateScreenElement {
				Type = ContainerElement
				Id = gamertag_container
				PARENT = root_window
				Pos = (0.0, 0.0)
				just = [Center Center]
				z_priority = <Z>
			}
		endif
	endif
	FormatText ChecksumName = gamertag_text_px 'gamertag_text_p%d' D = <Player>
	FormatText ChecksumName = debug_gamertag_container_px 'debug_gamertag_container_p%d' D = <Player>
	FormatText ChecksumName = gt_frame_top 'gt_frame_top_p%d' D = <Player>
	FormatText ChecksumName = gt_frame_top_fill 'gt_frame_top_fill_p%d' D = <Player>
	FormatText ChecksumName = gt_frame_bottom 'gt_frame_bottom_p%d' D = <Player>
	FormatText ChecksumName = gt_frame_bottom_fill 'gt_frame_bottom_fill_p%d' D = <Player>
	if (ScreenElementExists Id = <gamertag_text_px>)
		if ScreenElementExists \{Id = gamertag_icon_container}
			SetScreenElementProps \{Id = gamertag_icon_container
				Alpha = 1}
		endif
		return
	endif
	CreateScreenElement {
		Type = TextElement
		PARENT = gamertag_container
		font = fontgrid_title_gh3
		rgba = <Color>
		Text = <Name>
		Id = <gamertag_text_px>
		Pos = (<start_pos> + (0.0, 3.0))
		just = <just>
		Scale = 0.6
		z_priority = (<Z> + 1)
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 200]
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((250.0, 0.0) + (<Height> * (0.0, 1.0))) start_x_scale = 0.6 start_y_scale = 0.6 only_if_larger_x = 1
	GetScreenElementDims Id = <Id>
	create_gamertag_frame PARENT = gamertag_container text_width = <width> text_height = <Height> Pos = <start_pos> Z = (<Z> - 1) Player = <Player>
	GetPlatform
	if (<Player> = 2 && <Platform> = XENON)
		GetScreenElementDims Id = <Id>
		tag_width = 0
		if ((<just> [0]) = -1)
			<tag_width> = <width>
		elseif ((<just> [0]) = 0)
			<tag_width> = (<width> * 0.5)
		endif
		GetScreenElementProps Id = <Id>
		CreateScreenElement {
			Type = ContainerElement
			PARENT = gamertag_container
			Id = gamertag_icon_container
			Pos = (<Pos> + (<Height> * (0.0, 1.0)) + (<tag_width> * (1.0, 0.0)) + (6.0, -75.0))
		}
		displayText {
			PARENT = gamertag_icon_container
			Text = "GAMER CARD"
			just = [RIGHT Top]
			rgba = [0 0 0 255]
			noshadow
			Pos = (0.0, 5.0)
			Scale = 0.5
			font = ($user_control_text_font)
			Z = (<Z> + 200)
		}
		GetScreenElementDims Id = <Id>
		text_end = (<width> * (1.0, 0.0) + (20.0, 0.0))
		text_begin = ((-30.0, 0.0) - (<width> * (1.0, 0.0)))
		displayText {
			PARENT = gamertag_icon_container
			Text = "\\ba"
			Pos = (<text_begin> + (23.0, -1.0))
			just = [RIGHT Top]
			font = ($gh3_button_font)
			Scale = 0.5
			Z = (<Z> + 200)
		}
		displaySprite {
			PARENT = gamertag_icon_container
			tex = Control_pill_end
			Pos = (11.0, 15.0)
			just = [RIGHT Center]
			Dims = (16.0, 32.0)
			rgba = [180 180 180 255]
			Z = (<Z> + 100)
		}
		displaySprite {
			PARENT = gamertag_icon_container
			tex = Control_pill_body
			Pos = (0.0, 15.0)
			just = [RIGHT Center]
			Dims = ((32.0, 32.0) + <width> * (1.0, 0.0))
			rgba = [180 180 180 255]
			Z = (<Z> + 100)
		}
		displaySprite {
			PARENT = gamertag_icon_container
			tex = Control_pill_end
			Pos = ((0.0, -1.0) - <width> * (1.0, 0.0) - (32.0, 0.0))
			just = [RIGHT Top]
			Dims = (16.0, 32.0)
			rgba = [180 180 180 255]
			Z = (<Z> + 100)
			flip_v
		}
	endif
endscript

script destroy_gamertags 
	if ScreenElementExists \{Id = gamertag_container}
		DestroyScreenElement \{Id = gamertag_container}
	endif
	if ScreenElementExists \{Id = gamertag_container_p1}
		DestroyScreenElement \{Id = gamertag_container_p1}
	endif
	if ScreenElementExists \{Id = gamertag_container_p2}
		DestroyScreenElement \{Id = gamertag_container_p2}
	endif
	if ScreenElementExists \{Id = debug_gamertag_container_p1}
		DestroyScreenElement \{Id = debug_gamertag_container_p1}
	endif
	if ScreenElementExists \{Id = debug_gamertag_container_p2}
		DestroyScreenElement \{Id = debug_gamertag_container_p2}
	endif
endscript

script destroy_gamertag_container \{Player = 1}
	FormatText ChecksumName = gamertag_container 'gamertag_container_p%d' D = <Player>
	if ScreenElementExists Id = <gamertag_container>
		DestroyScreenElement Id = <gamertag_container>
	endif
endscript

script morph_gamertags 
	if ScreenElementExists \{Id = gamertag_container}
		move_gamertag_pos = ((1.0 - <delta>) * (($g_hud_2d_struct_used).offscreen_gamertag_pos) + (<delta> * ((($g_hud_2d_struct_used).final_gamertag_pos) + <off_set>)))
		DoScreenElementMorph Id = gamertag_container Pos = <move_gamertag_pos> Time = <time_to_move>
		if ScreenElementExists \{Id = gamertag_icon_container}
			SetScreenElementProps \{Id = gamertag_icon_container
				Alpha = 0}
		endif
	endif
endscript
net_star_power_pending = 0

script coop_attempt_star_power 
	if ($net_star_power_pending)
		return
	endif
	Change \{net_star_power_pending = 1}
	SendNetMessage \{Type = coop_star_power_notify}
	Wait \{30
		frames}
	Change \{net_star_power_pending = 0}
endscript

script test_write_leaderboards 
	Printf \{"test_write_leaderboards"}
	begin_singleplayer_game
	Wait \{0.3
		Seconds
		IgnoreSlomo}
	if NOT should_update_stats_leader_board
		return
	endif
	NetSessionFunc Obj = stats func = write_stats Params = {leaderboard_Id = anarchy_in_the_uk Score = 10000 rating = <rating_val>}
endscript

script test_read_leaderboards 
	NetSessionFunc \{Obj = stats
		func = get_stats
		Params = {
			leaderboard_Id = m_test_gh3
			callback = test_callback
			num_rows = 10
			listType = rating
			rating_val = 5
			columns = 0
		}}
endscript

script menu_show_gamercard 
	if NOT (($is_network_game) && (IsXENON))
		return
	endif
	retrieve_player_net_id \{Player = 2}
	NetSessionFunc func = ShowGamerCard Params = {player_xuid = <net_id>}
endscript

script menu_show_gamercard_from_netid 
	if NOT ($is_network_game = 1)
		return
	endif
	if GotParam \{net_id}
		NetSessionFunc func = ShowGamerCard Params = {player_xuid = <net_id>}
	endif
endscript

script new_net_logic_init 
	Change boss_controller = ($player2_status.controller)
	Change \{boss_pattern = 0}
	Change \{boss_strum = 0}
	Change \{boss_lastwhammytime = 0}
	Change \{boss_lastbrokenstringtime = 0}
	Change \{boss_hammer_count = 0}
endscript

script new_net_logic_deinit 
	if ($is_network_game)
		Change StructureName = player2_status controller = ($boss_oldcontroller)
		Change \{boss_pattern = 0}
		Change \{boss_strum = 0}
		Change \{boss_lastwhammytime = 0}
		Change \{boss_lastbrokenstringtime = 0}
		Change \{boss_hammer_count = 0}
	endif
endscript

script win_now 
	ExtendCRC \{song_won
		'p1'
		out = Type}
	BroadCastEvent Type = <Type>
endscript
new_message_of_the_day = 0

script splash_callback 
	Printf \{"splash_callback"}
	PrintStruct <...>
	if GotParam \{motd_text}
		Change \{new_message_of_the_day = 1}
	else
		Change \{new_message_of_the_day = 0}
	endif
endscript

script test_send 
	test1 = 'does this get sent?'
	test2 = DoesThisGetSent
	Test3 = DoesThisGetSent2
	PrintStruct <...>
	SendStructure callback = test_callback data_to_send = <...>
endscript

script test_callback 
	Printf \{"test_callback"}
	PrintStruct <...>
endscript

script cleanup_online_lobby_select 
	Printf \{"cleanup_online_lobby_select"}
	shut_down_character_hub
	if ScreenElementExists \{Id = ready_container_p1}
		DestroyScreenElement \{Id = ready_container_p1}
	endif
	if ScreenElementExists \{Id = ready_container_p2}
		DestroyScreenElement \{Id = ready_container_p2}
	endif
	destroy_popup_warning_menu
	destroy_pause_menu_frame
	destroy_gamertags
	shut_down_flow_manager \{Player = 2}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = scrolling_character_hub_p1}
	destroy_menu \{menu_id = character_hub_p1_container}
	destroy_menu \{menu_id = scrolling_character_hub_p2}
	destroy_menu \{menu_id = character_hub_p2_container}
	KillCamAnim \{Name = gs_view_cam}
	<Player> = 1
	begin
	FormatText ChecksumName = scrolling_select_outfit 'scrolling_select_outfit_p%i' I = <Player>
	FormatText ChecksumName = s_container 's_container_p%i' I = <Player>
	destroy_menu menu_id = <scrolling_select_outfit>
	destroy_menu menu_id = <s_container>
	<Player> = (<Player> + 1)
	repeat 2
	<Player> = 1
	begin
	FormatText ChecksumName = scrolling_select_style 'scrolling_select_style_p%i' I = <Player>
	FormatText ChecksumName = s_container 's_container_p%i' I = <Player>
	destroy_menu menu_id = <scrolling_select_style>
	destroy_menu menu_id = <s_container>
	<Player> = (<Player> + 1)
	repeat 2
	destroy_menu \{menu_id = scrolling_select_guitar_p1}
	destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	destroy_menu \{menu_id = select_guitar_container}
	destroy_menu \{menu_id = select_finish_container}
	destroy_menu \{menu_id = scrolling_select_guitar_p2}
	destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
	destroy_menu \{menu_id = select_guitar_container_p2}
	destroy_menu \{menu_id = select_finish_container_p2}
	<Player> = 1
	begin
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	<band_Member> = ($<player_status>.band_Member)
	if CompositeObjectExists Name = <band_Member>
		if <band_Member> :Anim_AnimNodeExists Id = BodyTimer
			<band_Member> :Anim_Command Target = BodyTimer Command = Timer_SetSpeed Params = {SPEED = 1.0}
		endif
	endif
	<Player> = (<Player> + 1)
	repeat 2
	<Player> = 1
	begin
	FormatText ChecksumName = scrolling_select_finish 'scrolling_select_finish_p%i' I = <Player>
	destroy_menu menu_id = <scrolling_select_finish>
	<Player> = (<Player> + 1)
	repeat 2
	ui_flow_manager_respond_to_action \{action = Continue}
endscript

script create_link_unplugged_dialog 
	destroy_popup_warning_menu
	if ScreenElementExists \{Id = leaderboard_loading_text_id}
		DestroyScreenElement \{Id = leaderboard_loading_text_id}
	endif
	create_popup_warning_menu \{Title = "CONNECTION LOST"
		title_props = {
			Scale = 1.0
		}
		textblock = {
			Text = "Your network connection has been disconnected. Returning to the main menu."
			Pos = (640.0, 380.0)
		}
		Menu_pos = (600.0, 475.0)
		helper_pills = [
			SELECT
		]
		options = [
			{
				func = connection_lost_resume_play
				Text = "CONTINUE"
				Scale = (1.0, 1.0)
			}
		]}
endscript

script connection_lost_resume_play 
	Printf \{"---connection_lost_resume_play"}
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	if ISPS3
		start_flow_manager \{flow_state = main_menu_fs}
	else
		start_flow_manager \{flow_state = bootup_press_any_button_fs}
	endif
endscript

script RemoveObserverBG 
endscript

script coop_fail_song 
	if ($ui_flow_manager_state [0] = online_pause_fs)
		net_unpausegh3
	endif
	disable_pause
	if (<quit_early>)
		Change \{player2_present = 0}
		FormatText TextName = notification_text "%n\\n has quit" N = ($opponent_gamertag)
		create_net_popup popup_text = <notification_text>
		Wait \{3
			Seconds}
		destroy_net_popup
	endif
	Change StructureName = <player_status> STARS = 3
	Change StructureName = <player_status> best_run = <note_streak>
	Change StructureName = <player_status> total_notes = <total_notes>
	Change StructureName = <player_status> NOTES_HIT = <NOTES_HIT>
	player_Text = (<player_status>.Text)
	KillSpawnedScript \{Name = GuitarEvent_SongWon_Spawned}
	SpawnScriptNow \{GuitarEvent_SongFailed_Spawned}
endscript

script add_searching_menu_item \{Z = 2.1}
	if GotParam \{vmenu_id}
		CreateScreenElement {
			Type = ContainerElement
			PARENT = <vmenu_id>
			Dims = (210.0, 35.0)
			Pos = (0.0, 0.0)
			just = [Center Top]
			internal_just = [Center Top]
		}
		<container_element> = <Id>
		<Id> :SetProps {
			event_handlers = [
				{Focus searching_menu_focus Params = {PARENT = <Id>}}
				{unfocus searching_menu_unfocus Params = {PARENT = <Id>}}
				{pad_choose <choose_script>}
			]
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = <container_element>
			local_id = text_string
			font = fontgrid_title_gh3
			Scale = 0.65000004
			rgba = ($online_light_blue)
			Text = <Text>
			just = [Center Top]
			Pos = (105.0, 0.0)
			z_priority = <Z>
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_element>
			local_id = Highlight_Bar
			texture = hilite_bar_01
			Dims = (250.0, 35.0)
			rgba = ($online_light_blue)
			Pos = (106.0, -3.0)
			just = [Center Top]
			z_priority = <Z>
			Alpha = 0.0
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_element>
			local_id = left_bookend
			texture = character_hub_hilite_bookend
			Dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			Pos = (-36.0, -3.0)
			just = [Center Top]
			z_priority = <Z>
			Alpha = 0.0
			flip_v
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <container_element>
			local_id = right_bookend
			texture = character_hub_hilite_bookend
			Dims = (35.0, 35.0)
			rgba = ($online_light_blue)
			Pos = (248.0, -3.0)
			just = [Center Top]
			z_priority = <Z>
			Alpha = 0.0
		}
	endif
endscript

script start_final_song 
	Change current_song = ($net_setlist_songs [($net_song_num)])
	SpawnScriptLater \{load_and_sync_timing
		Params = {
			start_delay = 3000
			player_status = player1_status
		}}
endscript

script server_disconnection_cleanup 
	Printf \{"---server_disconnection_cleanup"}
	determine_if_game_over
	Change \{player2_present = 0}
	if ($ui_flow_manager_state [0] = online_loading_fs)
	elseif ($playing_song = 0)
		if (($ui_flow_manager_state [0] = online_win_song_fs) || ($ui_flow_manager_state [0] = online_fail_song_fs) || ($ui_flow_manager_state [0] = online_match_stats_fs))
			if NOT ScreenElementExists \{net_popup_container}
				get_number_of_songs
				if NOT (<game_over>)
					create_connection_lost_dialog \{player_quit}
				endif
			endif
		else
			create_connection_lost_dialog \{player_quit}
		endif
	else
		create_connection_lost_dialog \{player_quit}
	endif
endscript

script searching_menu_focus 
	Obj_GetID
	if ScreenElementExists Id = {<ObjID> child = text_string}
		DoScreenElementMorph Id = {<ObjID> child = text_string} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists Id = {<ObjID> child = Highlight_Bar}
		DoScreenElementMorph Id = {<ObjID> child = Highlight_Bar} Alpha = 1.0
	endif
	if ScreenElementExists Id = {<ObjID> child = left_bookend}
		DoScreenElementMorph Id = {<ObjID> child = left_bookend} Alpha = 1.0
	endif
	if ScreenElementExists Id = {<ObjID> child = right_bookend}
		DoScreenElementMorph Id = {<ObjID> child = right_bookend} Alpha = 1.0
	endif
endscript

script searching_menu_unfocus 
	Obj_GetID
	if ScreenElementExists Id = {<ObjID> child = text_string}
		DoScreenElementMorph Id = {<ObjID> child = text_string} rgba = ($online_light_blue)
	endif
	if ScreenElementExists Id = {<ObjID> child = Highlight_Bar}
		DoScreenElementMorph Id = {<ObjID> child = Highlight_Bar} Alpha = 0.0
	endif
	if ScreenElementExists Id = {<ObjID> child = left_bookend}
		DoScreenElementMorph Id = {<ObjID> child = left_bookend} Alpha = 0.0
	endif
	if ScreenElementExists Id = {<ObjID> child = right_bookend}
		DoScreenElementMorph Id = {<ObjID> child = right_bookend} Alpha = 0.0
	endif
endscript

script set_other_player_present 
	Printf \{"set_other_player_present"}
	if ($current_num_players = 2)
		if NOT ($player2_present)
			Change \{player2_present = 1}
			SpawnScriptNow \{net_hub_stream}
		endif
		if ScreenElementExists \{Id = character_hub_p1_continue}
			character_hub_p1_continue :SetProps rgba = (($G_menu_colors).dk_violet_grey) unblock_events
		endif
		ui_print_gamertag Name = ($opponent_gamertag) start_pos = $gt_player2_pos Color = ($player2_color) Player = 2 just = [RIGHT Top] Dims = (450.0, 35.0)
	endif
endscript

script test_multi_leaderboards 
	Player_list = [
		{
			LEADERBOARDS = [
				{
					write_type = MAX
					leaderboard_Id = anarchyintheuk
					rating = 4
					Score = 100
					columns = [
						{
							Score = 100
						}
						{
							Score = 200
						}
						{
							Score = 300
						}
					]
				}
				{
					write_type = MAX
					leaderboard_Id = avalancha
					rating = 3
					Score = 100
					columns = [
						{
							Score = 100
						}
						{
							Score = 200
						}
						{
							Score = 300
						}
					]
				}
			]
		}
	]
	NetSessionFunc Obj = stats func = stats_write_multiplayer Params = {DontEndSessionAfterWrite <...>}
endscript

script retrieve_player_net_id 
	net_id = [0 0]
	if GotParam \{Player}
		FormatText ChecksumName = player_status 'player%i_status' I = <Player>
		SetArrayElement ArrayName = net_id Index = 0 NewValue = ($<player_status>.net_id_first)
		SetArrayElement ArrayName = net_id Index = 1 NewValue = ($<player_status>.net_id_second)
	else
		SetArrayElement ArrayName = net_id Index = 0 NewValue = ($player1_status.net_id_first)
		SetArrayElement ArrayName = net_id Index = 1 NewValue = ($player1_status.net_id_second)
	endif
	Printf \{"retrieve_player_net_id"}
	PrintStruct <...>
	return net_id = <net_id>
endscript

script host_handle_dropped_client 
	Printf \{"---host_handle_dropped_client"}
	determine_if_game_over
	Change \{player2_present = 0}
	KillSpawnedScript \{Name = net_hub_stream}
	EndGameNetScriptPump
	Change \{net_can_send_approval = 1}
	Change \{p2_ready = 0}
	Change \{p1_ready = 0}
	if ($ui_flow_manager_state [0] = online_character_select_fs)
		drop_client_from_character_select
		net_lobby_state_message \{current_state = character_hub
			action = request
			request_state = leaving_lobby}
		ResetLobbyReady
		LaunchEvent \{Type = Focus
			Target = vmenu_character_select_p1}
	elseif ($ui_flow_manager_state [0] = online_loading_fs)
	elseif (($ui_flow_manager_state [0] = online_fail_song_fs) || ($ui_flow_manager_state [0] = online_win_song_fs) || ($ui_flow_manager_state [0] = online_match_stats_fs))
		if NOT ScreenElementExists \{net_popup_container}
			get_number_of_songs
			if NOT (<game_over>)
				create_connection_lost_dialog \{player_quit}
			endif
		endif
	else
		if ($game_mode = p2_coop)
			Change \{StructureName = player1_status
				part = GUITAR}
			Change \{StructureName = player2_status
				part = GUITAR}
			create_guitarist \{Name = GUITARIST
				UseOldPos
				no_strum
				animpak = 0}
			create_guitarist \{Name = BASSIST
				UseOldPos
				no_strum
				animpak = 0}
		endif
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = leaving_lobby
		}
		Wait \{2
			Frame}
		if ($playing_song = 0)
			destroy_gamertags
			if (NetSessionFunc Obj = match func = get_gamertag)
				ui_print_gamertag Name = <Name> start_pos = $gt_player1_pos Color = ($player1_color) Player = 1 just = [LEFT Top] Dims = (450.0, 35.0)
			endif
		endif
		ResetLobbyReady
		ui_flow_manager_respond_to_action \{action = handle_dropped_client}
	endif
	if ($playing_song = 0)
		if CompositeObjectExists \{Name = BASSIST}
			BASSIST :Hide
		endif
	endif
endscript

script drop_client_from_character_select 
	destroy_gamertags
	if (NetSessionFunc Obj = match func = get_gamertag)
		ui_print_gamertag Name = <Name> start_pos = $gt_player1_pos Color = ($player1_color) Player = 1 just = [LEFT Top] Dims = (450.0, 35.0)
	endif
	KillSpawnedScript \{Name = cs_rotate_hilites_p2}
	Change \{g_cs_scroll_ready_p2 = 1}
	Change \{g_cs_choose_ready_p2 = 0}
	destroy_menu \{menu_id = char_select_character_container_p2}
	destroy_menu \{menu_id = char_select_container_p2}
	destroy_menu \{menu_id = char_select_hilite_container_p2}
	destroy_menu \{menu_id = scrolling_character_select_p2}
	Change \{player2_present = 0}
	destroy_menu \{menu_id = ready_container_p2}
	if CompositeObjectExists \{Name = BASSIST}
		BASSIST :Hide
	endif
endscript

script host_wait_for_client 
	if NOT (IsHost)
		return
	endif
	create_net_popup \{popup_text = "Waiting for other player to join"
		add_waiting_dots
		Pos = (640.0, 275.0)}
	begin
	if ($player2_present = 1)
		break
	endif
	Wait \{30
		GameFrames}
	repeat
	destroy_net_popup
	cs_event_handlers = [
		{pad_up cs_scroll_up_or_down Params = {Player = 1 Dir = UP}}
		{pad_down cs_scroll_up_or_down Params = {Player = 1 Dir = DOWN}}
		{pad_back net_cs_go_back Params = {Player = 1}}
		{pad_choose character_select_choose Params = {Player = 1}}
		{pad_start menu_show_gamercard}
	]
	SetScreenElementProps Id = vmenu_character_select_p1 event_handlers = <cs_event_handlers> Replace_Handlers
endscript

script net_battle_select_icon 
	begin
	if ScreenElementExists Id = <icon_id>
		<icon_id> :SetProps texture = <icon_texture>
		return
	endif
	Wait \{1
		GameFrame}
	repeat 600
	Printf "Couldn't find battle icon id=%i" I = <icon_id>
endscript

script net_hub_stream 
	player_status = player1_status
	begin
	char_data = {
		char_id = ($player1_status.character_id)
		outfit = ($player1_status.outfit)
		style = ($player1_status.style)
		instrument_id = ($player1_status.instrument_id)
	}
	SendStructure callback = update_net_character data_to_send = {char_data = <char_data>}
	Wait \{1
		Second}
	repeat
endscript

script update_net_character 
	player_status = player2_status
	change_made = 0
	char_id = (<char_data>.char_id)
	outfit = (<char_data>.outfit)
	style = (<char_data>.style)
	instrument_id = (<char_data>.instrument_id)
	valid = 0
	if find_profile_by_id Id = <char_id>
		if is_musician_profile_downloaded Index = <Index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		Printf \{"Invalid Character found - changing to axel"}
		char_id = Axel
		outfit = 1
		style = 1
	endif
	valid = 0
	if find_instrument_index desc_id = <instrument_id>
		if is_musician_instrument_downloaded Index = <Index>
			valid = 1
		endif
	endif
	if (<valid> = 0)
		Printf \{"Invalid Instrument found - changing to les paul black"}
		instrument_id = Instrument_Les_Paul_Black
	endif
	if NOT ($<player_status>.character_id = <char_id>)
		Change StructureName = <player_status> character_id = <char_id>
		<change_made> = 1
	endif
	if NOT ($<player_status>.outfit = <outfit>)
		Change StructureName = <player_status> outfit = <outfit>
		<change_made> = 1
	endif
	if NOT ($<player_status>.style = <style>)
		Change StructureName = <player_status> style = <style>
		<change_made> = 1
	endif
	if NOT ($<player_status>.instrument_id = <instrument_id>)
		get_musician_instrument_type desc_id = <instrument_id>
		if GotParam (instrument_type)
			if (<instrument_type> = GUITAR)
				if NOT (<instrument_id> = ($player2_selected_guitar))
					Change player2_selected_guitar = <instrument_id>
				endif
			else
				if NOT (<instrument_id> = ($player2_selected_guitar))
					Change player2_selected_bass = <instrument_id>
				endif
			endif
			Change StructureName = <player_status> instrument_id = <instrument_id>
			<change_made> = 1
		endif
	endif
	if (<change_made> = 1)
		Change \{generic_select_monitor_p2_changed = 1}
	endif
endscript

script character_hub_net_ready 
	if NOT (ScreenElementExists Id = ready_container_p2)
		create_ready_icons \{pos2 = (825.0, 450.0)
			parent2 = root_window}
	endif
	if ($p2_ready = 0)
		Change \{p2_ready = 1}
		if ScreenElementExists \{Id = ready_container_p2}
			ready_container_p2 :Obj_SpawnScriptLater \{drop_in_ready_sign
				Params = {
					Player = 2
				}}
		endif
	endif
	if (($p1_ready = 1) && ($p2_ready = 1))
		if ScreenElementExists \{Id = vmenu_character_hub_p1}
			LaunchEvent \{Type = unfocus
				Target = vmenu_character_hub_p1}
		endif
		Wait \{0.4
			Seconds}
		clean_up_user_control_helpers
		shut_down_flow_manager \{Player = 2}
		shut_down_character_hub
		destroy_ready_icons
		Change \{p1_ready = 0}
		Change \{p2_ready = 0}
		KillSpawnedScript \{Name = net_hub_stream}
		ui_flow_manager_respond_to_action \{action = select_ready
			Player = 1
			create_params = {
				Player = 1
			}}
	endif
endscript

script character_hub_net_ready_back 
	Change \{p2_ready = 0}
	if NOT (ScreenElementExists Id = ready_container_p2)
		create_ready_icons \{pos2 = (825.0, 450.0)
			parent2 = root_window}
	endif
	drop_out_ready_sign \{Player = 2}
endscript

script debug_print_coop_stats \{identifier = ""}
	Printf "TMR ---------------------------- %s -------------------------" S = <identifier>
	p1_score = ($player1_status.Score)
	p2_score = ($player2_status.Score)
	p1_stars = ($player1_status.STARS)
	p2_stars = ($player2_status.STARS)
	p1_health = ($player1_status.current_health)
	p2_health = ($player2_status.current_health)
	p1_note_streak = ($player1_status.best_run)
	p2_note_streak = ($player2_status.best_run)
	p1_total_notes = ($player1_status.total_notes)
	p2_total_notes = ($player2_status.total_notes)
	if ($player1_status.total_notes > 0)
		<p1_percent_complete> = (100 * $player1_status.NOTES_HIT / $player1_status.total_notes)
	endif
	if ($player2_status.total_notes > 0)
		<p2_percent_complete> = (100 * $player2_status.NOTES_HIT / $player2_status.total_notes)
	endif
	PrintStruct <...>
endscript

script get_musician_instrument_type 
	get_musician_instrument_size
	Index = 0
	begin
	get_musician_instrument_struct Index = <Index>
	if (<desc_id> = <info_struct>.desc_id)
		return instrument_type = (<info_struct>.Type)
	endif
	Index = (<Index> + 1)
	repeat <array_Size>
endscript

script scale_element_width_to_size \{max_text_width = 400}
	if NOT GotParam \{Id}
		return
	endif
	GetScreenElementDims Id = <Id>
	if (<width> > <max_text_width>)
		SetScreenElementProps {
			Id = <Id>
			Scale = ((1.0, 0.0) + (0.0, 1.0) * (<text_scale>.(0.0, 1.0)))
		}
		scale_element_to_size {
			Id = <Id>
			target_width = <max_text_width>
		}
	endif
endscript

script net_dl_content_compatabilty_warning_fade_out 
	Wait \{10
		Seconds}
	if ScreenElementExists Id = <Id>
		<Id> :DoMorph Alpha = 0.0 Time = 1.0
	endif
	Wait \{1
		Frame}
	if ScreenElementExists \{Id = dl_content_warning}
		DestroyScreenElement \{Id = dl_content_warning}
	endif
endscript

script net_dl_content_compatabilty_warning \{Z = 100
		Pos = (0.0, 0.0)}
	if NOT GotParam \{PARENT}
		return
	endif
	if ScreenElementExists \{Id = dl_content_warning}
		DestroyScreenElement \{Id = dl_content_warning}
	endif
	CreateScreenElement {
		Type = ContainerElement
		Id = dl_content_warning
		PARENT = <PARENT>
		Pos = <Pos>
	}
	menu_anchor = <Id>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <menu_anchor>
		texture = window_frame_cap
		Dims = (128.0, 64.0)
		rgba = ($online_medium_blue)
		Pos = (0.0, 0.0)
		just = [Center Top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <menu_anchor>
		texture = window_fill_cap
		Dims = (128.0, 64.0)
		rgba = ($online_trans_grey)
		Pos = (0.0, 0.0)
		just = [Center Top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <menu_anchor>
		texture = window_frame_body_tall
		Dims = (128.0, 512.0)
		rgba = ($online_medium_blue)
		Pos = (64.0, 0.0)
		just = [Center Top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <menu_anchor>
		texture = window_fill_body_large
		Dims = (128.0, 512.0)
		rgba = ($online_trans_grey)
		Pos = (64.0, 0.0)
		just = [Center Top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <menu_anchor>
		texture = window_frame_cap
		Dims = (128.0, 64.0)
		rgba = ($online_medium_blue)
		Pos = (576.0, 0.0)
		just = [Center Top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <menu_anchor>
		texture = window_fill_cap
		Dims = (128.0, 64.0)
		rgba = ($online_trans_grey)
		Pos = (576.0, 0.0)
		just = [Center Top]
		z_priority = <Z>
		Rot_Angle = -90
		Alpha = 1.0
		flip_h
	}
	if IsXENON
		Text = "Both players need to have the same Downloaded Songs in order to use them in Xbox LIVE multiplayer games."
	else
		Text = "Both players need to have the same Downloaded Songs in order to use them in PLAYSTATION®Network multiplayer games."
	endif
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = <menu_anchor>
		font = text_a4
		Scale = (0.7, 0.55)
		rgba = ($online_light_blue)
		Text = <Text>
		just = [Center Top]
		z_priority = (<Z> + 0.1)
		Pos = (320.0, -55.0)
		Dims = (830.0, 185.0)
		allow_expansion
	}
	<menu_anchor> :Obj_SpawnScriptLater net_dl_content_compatabilty_warning_fade_out Params = {Id = <menu_anchor>}
endscript

script fit_text_into_menu_item 
	if ScreenElementExists Id = <Id>
		GetScreenElementDims Id = <Id>
		if (<width> > <max_width>)
			SetScreenElementProps {
				Id = <Id>
				Scale = 1.0
			}
			scale_element_to_size {
				Id = <Id>
				target_width = <max_width>
				target_height = <Height>
			}
		endif
	endif
endscript

script net_coop_init_star_power 
	Printf \{"Co-op init star power"}
	if NOT (($player1_status.star_power_used = 1) || ($player2_status.star_power_used = 1))
		SpawnScriptNow \{star_power_activate_and_drain
			Params = {
				player_status = player1_status
				Player = 1
				player_Text = 'p1'
			}}
		SpawnScriptNow \{star_power_activate_and_drain
			Params = {
				player_status = player2_status
				Player = 2
				player_Text = 'p2'
			}}
	endif
endscript
DEMONWARE_IS_READY = 1

script set_ready_for_input 
	Change \{DEMONWARE_IS_READY = 1}
endscript

script set_demonware_failed 
	Change \{DEMONWARE_IS_READY = 1}
endscript

script set_disable_demonware_input 
	Change \{DEMONWARE_IS_READY = 0}
endscript

script online_end_song 
	Printf \{"---online_end_song"}
	if GameIsOver
		Printf \{"Game is over already, no song win event"}
		return
	endif
	if ($game_mode = p2_battle)
		if (IsHost)
			Printf \{"Host sending end_song to client"}
			SendEndSong
			client_handle_end_song
		endif
	else
		client_handle_end_song
	endif
endscript

script net_stream_star_whammy 
	begin
	SendStructure callback = net_update_star_whammy data_to_send = {star_power_amount = ($player1_status.star_power_amount)}
	Wait \{0.1
		Seconds}
	repeat
endscript

script net_update_star_whammy \{Player = 2}
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	if ((($player1_status.star_power_amount) < <star_power_amount>) && ($player1_status.star_power_used = 0))
		Change StructureName = player1_status star_power_amount = <star_power_amount>
	endif
endscript

script client_handle_end_song 
	Printf \{"client_handle_end_song - Broadcasting song won event."}
	ExtendCRC \{song_won
		'p1'
		out = Type}
	BroadCastEvent Type = <Type>
endscript

script HackToCreateGameQuickmatchDialog 
	destroy_popup_warning_menu
	create_menu_backdrop \{texture = Online_Background}
	NetSessionFunc \{func = match_uninit}
	NetSessionFunc \{func = match_init}
	if ScreenElementExists \{Id = joining_screen_container}
		DestroyScreenElement \{Id = joining_screen_container}
	endif
	if ScreenElementExists \{search_results_container}
		DestroyScreenElement \{search_results_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = search_results_container
		Pos = (0.0, 0.0)}
	frame_dims = (665.0, 588.0)
	center_pos = ((640.0, 380.0))
	create_UI_frame {
		PARENT = search_results_container
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = ($online_medium_blue)
		fill_rgba = (($G_menu_colors).online_fill_rgba)
		z_priority = 2
	}
	displaySprite \{Id = Online_Frame_Crown
		PARENT = search_results_container
		tex = Online_Frame_Crown
		Pos = (640.0, 42.0)
		Dims = (256.0, 105.0)
		Z = 2.1
		just = [
			Center
			Top
		]}
	CreateScreenElement \{Type = VScrollingMenu
		PARENT = search_results_container
		Id = server_list_create_match_dialog_menu
		just = [
			LEFT
			Top
		]
		Pos = (328.0, 450.0)
		Dims = (625.0, 300.0)
		z_priority = 2.1}
	CreateScreenElement \{Type = VMenu
		PARENT = server_list_create_match_dialog_menu
		Id = server_list_create_match_dialog_vmenu
		just = [
			LEFT
			Top
		]
		Dims = (625.0, 300.0)
		Pos = (0.0, 0.0)
		internal_just = [
			Center
			Top
		]
		event_handlers = [
			{
				pad_back
				HACK_CREATE_MATCH_DIALOG_CANCEL
			}
			{
				pad_up
				generic_menu_up_or_down_sound
				Params = {
					UP
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				Params = {
					DOWN
				}
			}
		]}
	CreateScreenElement \{Type = ContainerElement
		PARENT = search_results_container
		Id = create_match_dialog_container
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = create_match_dialog_container
		font = fontgrid_title_gh3
		Scale = (0.65000004, 0.65000004)
		rgba = ($online_light_blue)
		Text = "No sessions are available.\\nWould you like to\\ncreate a match?"
		just = [Center Top]
		internal_just = [Center Top]
		z_priority = 2.1
		Pos = (640.0, 275.0)
		Dims = (600.0, 370.0)
	}
	if ($num_user_control_helpers = 0)
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
	endif
	add_searching_menu_item \{vmenu_id = server_list_create_match_dialog_vmenu
		choose_script = HACK_CREATE_MATCH_DIALOG_CREATE
		Text = "CREATE MATCH"}
	add_searching_menu_item \{vmenu_id = server_list_create_match_dialog_vmenu
		choose_script = HACK_CREATE_MATCH_DIALOG_CANCEL
		Text = "CANCEL"}
	LaunchEvent \{Type = Focus
		Target = server_list_create_match_dialog_vmenu}
endscript

script HACK_CREATE_MATCH_DIALOG_CREATE 
	if ScreenElementExists \{Id = search_results_container}
		DestroyScreenElement \{Id = search_results_container}
	endif
	create_match_dialog_select_create
endscript

script HACK_CREATE_MATCH_DIALOG_CANCEL 
	if ScreenElementExists \{Id = search_results_container}
		DestroyScreenElement \{Id = search_results_container}
	endif
	create_match_dialog_select_cancel
endscript

script debug_print_script_info_onscreen 
	begin
	if NOT ScreenElementExists \{Id = script_info_container}
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = script_info_container
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]
		event_handlers = [
			{
				pad_R1
				destroy_script_info_text
			}
		]
		z_priority = 1000}
	CreateScreenElement \{Type = SpriteElement
		Id = dbg_bg_tex
		PARENT = script_info_container
		texture = BLACK
		rgba = [
			0
			0
			0
			155
		]
		Pos = (0.0, 0.0)
		Dims = (1280.0, 960.0)
		just = [
			LEFT
			Top
		]}
	Scale = 0.5
	Pos = (250.0, 50.0)
	Dims = ((800.0, 600.0) / (<Scale>))
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = script_info_container
		Id = script_info_text
		font = text_a4
		Text = <Text>
		just = [LEFT Top]
		internal_just = [LEFT Top]
		Pos = <Pos>
		Dims = <Dims>
		Scale = <Scale>
		rgba = [255 255 255 255]
	}
	LaunchEvent \{Type = Focus
		Target = script_info_container}
endscript

script destroy_script_info_text 
	Printf \{"---destroy_script_info_text"}
	if ScreenElementExists \{Id = script_info_container}
		DestroyScreenElement \{Id = script_info_container}
	endif
endscript

script get_current_band_cash 
	get_current_band_info
	GetGlobalTags <band_info>
	return Cash = <Cash>
endscript
