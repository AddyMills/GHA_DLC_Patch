boss_hammer_try_strum = 4
Boss_TomMorello_Props = {
	GainPerNote = {
		EASY = 0.8
		MEDIUM = 0.7
		HARD = 0.55
		EXPERT = 0.4
	}
	LossPerNote = {
		EASY = 5.25
		MEDIUM = 3.0
		HARD = 2.75
		EXPERT = 2.25
	}
	PowerUpMissedNote = {
		EASY = 55.0
		MEDIUM = 50.0
		HARD = 45.0
		EXPERT = 40.0
	}
	WhammySpeed = {
		EASY = 1100
		MEDIUM = 800
		HARD = 500
		EXPERT = 350
	}
	BrokenStringSpeed = {
		EASY = 1200
		MEDIUM = 950
		HARD = 700
		EXPERT = 450
	}
	BrokenStringMissedNote = {
		EASY = 25.0
		MEDIUM = 20.0
		HARD = 20.0
		EXPERT = 15.0
	}
	PowerUps = [
		Lightning
		DifficultyUp
		DoubleNotes
		WhammyAttack
	]
	character_profile = Morello
	character_name = "Tom Morello"
}
Boss_Joe_Props = {
	GainPerNote = {
		EASY = 0.75
		MEDIUM = 0.6
		HARD = 0.5
		EXPERT = 0.35000002
	}
	LossPerNote = {
		EASY = 5.1
		MEDIUM = 3.0
		HARD = 2.75
		EXPERT = 2.25
	}
	PowerUpMissedNote = {
		EASY = 52.0
		MEDIUM = 48.0
		HARD = 42.0
		EXPERT = 37.0
	}
	WhammySpeed = {
		EASY = 1125
		MEDIUM = 875
		HARD = 550
		EXPERT = 375
	}
	BrokenStringSpeed = {
		EASY = 1175
		MEDIUM = 900
		HARD = 670
		EXPERT = 425
	}
	BrokenStringMissedNote = {
		EASY = 24.5
		MEDIUM = 18.5
		HARD = 16.5
		EXPERT = 13.5
	}
	PowerUps = [
		Lightning
		DifficultyUp
		DoubleNotes
		BrokenString
		WhammyAttack
	]
	character_profile = JoeP
	character_name = "Joe Perry"
}
Boss_Devil_Props = {
	GainPerNote = {
		EASY = 0.75
		MEDIUM = 0.65000004
		HARD = 0.35000002
		EXPERT = 0.35000002
	}
	LossPerNote = {
		EASY = 5.0
		MEDIUM = 3.0
		HARD = 2.25
		EXPERT = 2.0
	}
	PowerUpMissedNote = {
		EASY = 45.0
		MEDIUM = 42.5
		HARD = 30.0
		EXPERT = 30.0
	}
	WhammySpeed = {
		EASY = 1050
		MEDIUM = 800
		HARD = 500
		EXPERT = 350
	}
	BrokenStringSpeed = {
		EASY = 1100
		MEDIUM = 950
		HARD = 600
		EXPERT = 350
	}
	BrokenStringMissedNote = {
		EASY = 22.5
		MEDIUM = 20.0
		HARD = 12.5
		EXPERT = 10.0
	}
	PowerUps = [
		Lightning
		DifficultyUp
		DoubleNotes
		LeftyNotes
		BrokenString
		WhammyAttack
	]
	character_profile = SATAN
	character_name = "Lou"
}
save_lefty_flip_p2 = 0

script bossbattle_init 
	if ($game_mode = p2_battle)
		ScriptAssert \{"Cannot choose p2_battle and bossbattle"}
	endif
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = battlemode_container
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	Player = 1
	begin
	FormatText ChecksumName = player_status 'player%i_status' I = <Player> AddToStringLookup
	Change StructureName = <player_status> battlemode_creation_selection = -1
	Change StructureName = <player_status> current_num_powerups = 0
	Change StructureName = <player_status> shake_notes = -1
	Change StructureName = <player_status> double_notes = -1
	Change StructureName = <player_status> diffup_notes = -1
	Change StructureName = <player_status> lefty_notes = -1
	Change StructureName = <player_status> stealing_powerup = -1
	Change StructureName = <player_status> death_lick_attack = -1
	Change StructureName = <player_status> last_hit_note = NONE
	Change StructureName = <player_status> last_selected_attack = -1
	Change StructureName = <player_status> broken_string_mask = 0
	Change StructureName = <player_status> broken_string_green = 0
	Change StructureName = <player_status> broken_string_red = 0
	Change StructureName = <player_status> broken_string_yellow = 0
	Change StructureName = <player_status> broken_string_blue = 0
	Change StructureName = <player_status> broken_string_orange = 0
	Change StructureName = <player_status> final_blow_powerup = -1
	Change StructureName = <player_status> battle_num_attacks = 0
	Change StructureName = <player_status> hold_difficulty_up = 0.0
	Player = (<Player> + 1)
	repeat 2
	Change \{StructureName = player2_status
		part = RHYTHM}
	Change boss_controller = ($player2_status.controller)
	Change \{boss_pattern = 0}
	Change \{boss_strum = 0}
	Change \{boss_lastwhammytime = 0}
	Change \{boss_lastbrokenstringtime = 0}
	Change \{boss_hammer_count = 0}
	GetGlobalTags \{user_options}
	if (<lefty_flip_p2> = 1)
		Change \{save_lefty_flip_p2 = 1}
		SetGlobalTags \{user_options
			Params = {
				lefty_flip_p2 = 0
			}}
	else
		Change \{save_lefty_flip_p2 = 0}
	endif
endscript

script bossbattle_deinit 
	if ($boss_battle = 1)
		Change \{boss_battle = 0}
		Change \{current_num_players = 1}
		Change StructureName = player2_status controller = ($boss_oldcontroller)
		KillSpawnedScript \{Id = battlemode}
		Change StructureName = <player_status> battlemode_creation_selection = -1
		Change StructureName = <player_status> current_num_powerups = 0
		Change StructureName = <player_status> shake_notes = -1
		Change StructureName = <player_status> double_notes = -1
		Change StructureName = <player_status> diffup_notes = -1
		Change StructureName = <player_status> lefty_notes = -1
		Change StructureName = <player_status> stealing_powerup = -1
		Change StructureName = <player_status> death_lick_attack = -1
		Change StructureName = <player_status> last_hit_note = NONE
		Change StructureName = <player_status> last_selected_attack = -1
		Change StructureName = <player_status> broken_string_mask = 0
		Change StructureName = <player_status> broken_string_green = 0
		Change StructureName = <player_status> broken_string_red = 0
		Change StructureName = <player_status> broken_string_yellow = 0
		Change StructureName = <player_status> broken_string_blue = 0
		Change StructureName = <player_status> broken_string_orange = 0
		Change StructureName = <player_status> hold_difficulty_up = 0.0
		if ScreenElementExists \{Id = battlemode_container}
			DestroyScreenElement \{Id = battlemode_container}
		endif
		KillSpawnedScript \{Name = boss_battle_begin_deathlick}
		KillSpawnedScript \{Name = animate_death_icon}
		KillSpawnedScript \{Name = update_battle_death_meter}
		KillSpawnedScript \{Name = update_battle_death_meter_wings}
		KillSpawnedScript \{Name = stop_pattern_hold_boss}
		battlemode_killspawnedscripts
		GH_BattleMode_Stop_Heartbeat_P1
		GH_BattleMode_Stop_Heartbeat_P2
		Change \{boss_hammer_count = 0}
		if ($save_lefty_flip_p2 = 1)
			SetGlobalTags \{user_options
				Params = {
					lefty_flip_p2 = $save_lefty_flip_p2
				}}
		endif
	endif
endscript

script bossbattle_select \{player_status = player1_status}
	Printf \{"bossbattle_select"}
	if ($game_mode = Tutorial)
		Change StructureName = <player_status> battlemode_creation_selection = 0
		return
	endif
	Change StructureName = <player_status> battlemode_creation_selection = -1
	total_weight = 0
	if ($<player_status>.Player = 1)
		other_player_difficulty = $current_difficulty2
	else
		other_player_difficulty = $current_difficulty
	endif
	next_attack = -1
	if ($<player_status>.current_num_powerups > 0)
		if ($<player_status>.Player = 1)
			<next_attack> = ($current_powerups_p1 [($<player_status>.current_num_powerups - 1)])
		else
			<next_attack> = ($current_powerups_p2 [($<player_status>.current_num_powerups - 1)])
		endif
	endif
	GetArraySize ($current_boss.PowerUps)
	powerups_size = <array_Size>
	GetArraySize \{$battlemode_powerups}
	array_count = 0
	begin
	powerup_enabled = 0
	powerup_count = 0
	begin
	if ($current_boss.PowerUps [<powerup_count>] = $battlemode_powerups [<array_count>].Name)
		powerup_enabled = 1
		break
	endif
	powerup_count = (<powerup_count> + 1)
	repeat <powerups_size>
	if (<powerup_enabled> = 1)
		if NOT ((<other_player_difficulty> = EXPERT) && ($battlemode_powerups [<array_count>].Name = DifficultyUp))
			if ($<player_status>.last_selected_attack = <array_count> || <next_attack> = <array_count>)
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].weight_low)
			else
				total_weight = (<total_weight> + $battlemode_powerups [<array_count>].Weight)
			endif
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	GetRandomValue Name = select_weight A = 0 B = (<total_weight> - 1) Integer
	array_count = 0
	begin
	powerup_enabled = 0
	powerup_count = 0
	begin
	if ($current_boss.PowerUps [<powerup_count>] = $battlemode_powerups [<array_count>].Name)
		powerup_enabled = 1
		break
	endif
	powerup_count = (<powerup_count> + 1)
	repeat <powerups_size>
	if (<powerup_enabled> = 1)
		if NOT ((<other_player_difficulty> = EXPERT) && ($battlemode_powerups [<array_count>].Name = DifficultyUp))
			if ($<player_status>.last_selected_attack = <array_count> || <next_attack> = <array_count>)
				select_weight = (<select_weight> - $battlemode_powerups [<array_count>].weight_low)
			else
				select_weight = (<select_weight> - $battlemode_powerups [<array_count>].Weight)
			endif
		endif
		if (<select_weight> < 0)
			Change StructureName = <player_status> battlemode_creation_selection = <array_count>
			Change StructureName = <player_status> last_selected_attack = <array_count>
			break
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if ($<player_status>.battlemode_creation_selection = -1)
		PrintStruct <...>
		ScriptAssert \{"Battlemode selection not found"}
	endif
endscript

script bossbattle_ready \{battle_gem = 0
		player_status = player1_status}
	Printf \{"bossbattle_ready"}
	if ($<player_status>.Player = 1)
		SoundEvent \{Event = Battle_Power_Awarded_SFX_P1}
	else
		SoundEvent \{Event = Battle_Power_Awarded_SFX_P2}
	endif
	current_num_powerups = ($<player_status>.current_num_powerups)
	if (<current_num_powerups> >= $max_num_powerups)
		FormatText ChecksumName = card_checksum 'battlecard_%i_%s' I = ($<player_status>.current_num_powerups - 1) S = ($<player_status>.Player)
		if ScreenElementExists Id = <card_checksum>
			DestroyScreenElement Id = <card_checksum>
		endif
		Change StructureName = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
		update_battlecards_remove player_status = <player_status>
	endif
	current_num_powerups = ($<player_status>.current_num_powerups)
	SELECT = <battle_gem>
	if ($<player_status>.Player = 1)
		SetArrayElement ArrayName = current_powerups_p1 GlobalArray Index = <current_num_powerups> NewValue = <SELECT>
		card_pos = (($battle_hud_2d_elements.rock_pos_p1) + ($battle_hud_2d_elements.card_1_off_p1))
	else
		SetArrayElement ArrayName = current_powerups_p2 GlobalArray Index = <current_num_powerups> NewValue = <SELECT>
		card_pos = (($battle_hud_2d_elements.rock_pos_p2) + ($battle_hud_2d_elements.card_1_off_p2))
	endif
	Change StructureName = <player_status> current_num_powerups = ($<player_status>.current_num_powerups + 1)
	Color = ($<player_status>.last_hit_note)
	if (<Color> = NONE)
		<Color> = Green
	endif
	if ($<player_status>.lefthanded_button_ups = 1)
		begin_pos = (($button_up_models.<Color>.left_pos_2d) - (0.0, 90.0))
	else
		begin_pos = (($button_up_models.<Color>.pos_2d) - (0.0, 90.0))
	endif
	if ($<player_status>.Player = 1)
		<begin_pos> = (<begin_pos> - (225.0, 0.0))
	else
		<begin_pos> = (<begin_pos> + (225.0, 0.0))
	endif
	card_alpha = 1
	if NOT ($show_battle_text = 1)
		<card_alpha> = 0
	endif
	FormatText ChecksumName = card_checksum 'battlecard_%i_%s' I = <current_num_powerups> S = ($<player_status>.Player)
	CreateScreenElement {
		Type = SpriteElement
		Id = <card_checksum>
		PARENT = battlemode_container
		texture = ($battlemode_powerups [<SELECT>].card_texture)
		rgba = [255 255 255 255]
		Pos = <begin_pos>
		Dims = (64.0, 64.0)
		Alpha = <card_alpha>
		just = [Center Center]
		z_priority = (($battle_hud_2d_elements.Z) + 19)
	}
	if ($game_mode = Tutorial)
		card_pos = (<card_pos> + (0.0, 50.0))
	endif
	DoScreenElementMorph {
		Id = <card_checksum>
		Pos = <card_pos>
		Time = 0.3
	}
	update_battlecards_add current_num_powerups = <current_num_powerups> player_status = <player_status>
	if ($show_battle_text = 1 && $game_mode != Tutorial)
		SpawnScriptNow attack_ready_text Params = {current_num_powerups = <current_num_powerups> SELECT = <SELECT> player_status = <player_status>}
	endif
endscript

script bossbattle_trigger_on \{Player = 1
		player_Text = 'p1'
		player_status = player1_status}
	Printf \{"bossbattle_trigger_on"}
	if ($<player_status>.current_num_powerups = 0)
		return
	endif
	if ($<player_status>.Player = 1)
		<other_player> = 2
		<other_player_text> = 'p2'
		<other_difficulty> = $current_difficulty2
		<other_player_status> = player2_status
		SELECT = ($current_powerups_p1 [($<player_status>.current_num_powerups - 1)])
		GH3_Battle_Play_Crowd_Reaction_SFX receiving_player = 2 receiving_player_current_crowd_level = ($<other_player_status>.current_health)
		if ($is_network_game)
			SendNetMessage {
				Type = bossbattle_trigger_on
				SELECT = <SELECT>
			}
		endif
	else
		<other_player> = 1
		<other_player_text> = 'p1'
		<other_difficulty> = $current_difficulty
		<other_player_status> = player1_status
		SELECT = ($current_powerups_p2 [($<player_status>.current_num_powerups - 1)])
		GH3_Battle_Play_Crowd_Reaction_SFX receiving_player = 1 receiving_player_current_crowd_level = ($<other_player_status>.current_health)
	endif
	FormatText ChecksumName = card_checksum 'battlecard_%i_%s' I = ($<player_status>.current_num_powerups - 1) S = ($<player_status>.Player)
	if ScreenElementExists Id = <card_checksum>
		DestroyScreenElement Id = <card_checksum>
	endif
	Change StructureName = <player_status> current_num_powerups = ($<player_status>.current_num_powerups - 1)
	update_battlecards_remove player_status = <player_status>
	drain_time = ($battlemode_powerups [<SELECT>].drain_time)
	if ($<player_status>.Player = 1)
		SpawnScript bossbattle_ai_damage Params = {drain_time = <drain_time> player_status = <other_player_status> player_Text = <other_player_text> SELECT = <SELECT>}
	endif
	Change StructureName = <player_status> final_blow_powerup = <SELECT>
	SpawnScriptNow ($battlemode_powerups [<SELECT>].Scr) Id = battlemode Params = {drain_time = <drain_time>
		Player = <other_player>
		player_Text = <other_player_text>
		other_player_status = <other_player_status>
		player_status = <player_status>
		DIFFICULTY = <other_difficulty>
		($battlemode_powerups [<SELECT>].Params)}
	Change StructureName = <player_status> battle_num_attacks = ($<player_status>.battle_num_attacks + 1)
	Band_PlayAttackAnim Name = ($<player_status>.band_Member) Type = <SELECT>
	Band_PlayResponseAnim Name = ($<other_player_status>.band_Member) Type = <SELECT>
	SpawnScriptNow hammer_highway Params = {other_player_text = <other_player_text>}
	if ($battlemode_powerups [<SELECT>].fire_bolt = 1)
		SpawnScriptNow attack_bolt Params = {player_status = <player_status> other_player_status = <other_player_status>}
	endif
endscript
boss_powerup_delay = 0
bossbattle_missingnotefraction = 0.0

script bossbattle_ai_damage \{player_status = player2_status
		drain_time = 15000
		player_Text = 'p2'}
	if StructureContains Structure = ($battlemode_powerups [<SELECT>]) no_ai_damage
		return
	endif
	gem_fraction = 0.0
	FormatText ChecksumName = input_array 'bossresponse_array%p' P = <player_Text>
	FormatText ChecksumName = input_array_entry 'bossresponse_array%p_entry' P = <player_Text>
	GetSongTimeMS
	if StructureContains Structure = ($battlemode_powerups [<SELECT>]) IMMEDIATE
		start_creation_time = <Time>
		end_creation_time = (<start_creation_time> + <drain_time>)
		start_creation_index = ($last_bossresponse_array_entry)
	else
		start_creation_time = (<Time> + ($<player_status>.scroll_time - $destroy_time) * 1000.0 + 1000)
		end_creation_time = (<start_creation_time> + <drain_time>)
		start_creation_index = ($<input_array_entry>)
	endif
	missed_note_percentage = ($current_boss.PowerUpMissedNote.($current_difficulty))
	if ($battlemode_powerups [<SELECT>].Name = BrokenString)
		<end_creation_time> = (<start_creation_time> + 60000)
		<missed_note_percentage> = ($current_boss.BrokenStringMissedNote.($current_difficulty))
	endif
	begin
	begin
	GetSongTimeMS
	if (<Time> > <start_creation_time> - 200)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	if ($battlemode_powerups [<SELECT>].Name = BrokenString)
		if ($<player_status>.broken_string_green < 3 &&
				$<player_status>.broken_string_red < 3 &&
				$<player_status>.broken_string_yellow < 3 &&
				$<player_status>.broken_string_blue < 3 &&
				$<player_status>.broken_string_orange < 3)
			break
		endif
	endif
	ApplyBossBattleGemMisses {miss_percent = <missed_note_percentage>
		start_creation_index = <start_creation_index>
		start_creation_time = <start_creation_time>
		end_creation_time = <end_creation_time>
		gem_fraction = <gem_fraction>}
	GetSongTimeMS
	start_creation_time = (<Time> + ($<player_status>.scroll_time - $destroy_time) * 1000.0 + 1000)
	if NOT ($battlemode_powerups [<SELECT>].Name = BrokenString)
		if (<start_creation_time> >= <end_creation_time>)
			break
		endif
	endif
	repeat
endscript
boss_hammer_count = 0

script check_buttons_boss 
	CheckButtonsBoss Player = <Player> array_entry = <array_entry>
endscript

script bossbattle_fill 
	bossbattle_ready \{battle_gem = 4
		player_status = player1_status}
	bossbattle_ready \{battle_gem = 4
		player_status = player1_status}
	bossbattle_ready \{battle_gem = 4
		player_status = player1_status}
endscript

script boss_battle_begin_deathlick 
	battle_death_lick \{death_speed = 0.1
		player_status = player2_status
		other_player_status = player1_status
		drain_time = 5000}
endscript

script boss_battle_death_icon 
	boss_pos = (900.0, 150.0)
	player_pos = (300.0, 183.0)
	displaySprite PARENT = root_window tex = icon_attack_deth Pos = <boss_pos> just = [Center Center] Z = 500
	DoScreenElementMorph Id = <Id> Pos = <player_pos> Scale = 3.1 relative_scale Time = 1.0
	Wait \{2.0
		Seconds}
	DoScreenElementMorph Id = <Id> Alpha = 0 Time = 2.0
	Wait \{2.0
		Seconds}
	destroy_menu menu_id = <Id>
endscript

script create_battle_death_meter 
	KillSpawnedScript \{Name = update_battle_death_meter}
	KillSpawnedScript \{Name = update_battle_death_meter_wings}
	FormatText \{ChecksumName = death_meter
		'battle_death_meter'
		AddToStringLookup = TRUE}
	FormatText \{ChecksumName = death_meter_marker
		'battle_death_meter_marker'
		AddToStringLookup = TRUE}
	FormatText \{ChecksumName = death_meter_text
		'battle_death_meter_text'
		AddToStringLookup = TRUE}
	FormatText \{ChecksumName = battle_death_meter_wing_r
		'battle_death_meter_wing_r'
		AddToStringLookup = TRUE}
	FormatText \{ChecksumName = battle_death_meter_wing_l
		'battle_death_meter_wing_l'
		AddToStringLookup = TRUE}
	if ScreenElementExists Id = <death_meter>
		DestroyScreenElement Id = <death_meter>
	endif
	if ScreenElementExists Id = <death_meter_marker>
		DestroyScreenElement Id = <death_meter_marker>
	endif
	if ScreenElementExists Id = <death_meter_text>
		DestroyScreenElement Id = <death_meter_text>
	endif
	if ScreenElementExists Id = <battle_death_meter_wing_r>
		DestroyScreenElement Id = <battle_death_meter_wing_r>
	endif
	if ScreenElementExists Id = <battle_death_meter_wing_l>
		DestroyScreenElement Id = <battle_death_meter_wing_l>
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = <death_meter>
		PARENT = battlemode_container
		texture = battle_death_meter
		rgba = [255 255 255 255]
		Pos = (648.0, 900.0)
		Scale = 1
		Alpha = 1
		just = [Center Center]
		z_priority = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = <death_meter_marker>
		PARENT = <death_meter>
		texture = battle_death_meter_marker
		rgba = [255 255 255 255]
		Pos = (29.0, 200.0)
		Scale = 0.9
		Alpha = 1
		just = [Center Center]
		z_priority = 1
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = <battle_death_meter_wing_r>
		PARENT = <death_meter>
		texture = battle_alert_death_wing
		rgba = [255 255 255 255]
		Pos = (13.0, 7.0)
		Scale = 0.5
		Rot_Angle = 15
		just = [LEFT Top]
		z_priority = 0
	}
	CreateScreenElement {
		Type = SpriteElement
		Id = <battle_death_meter_wing_l>
		PARENT = <death_meter>
		texture = battle_alert_death_wing
		rgba = [255 255 255 255]
		Pos = (39.0, 7.0)
		Scale = (-0.5, 0.5)
		Rot_Angle = -15
		just = [RIGHT Top]
		z_priority = 0
	}
	DoScreenElementMorph \{Id = battle_death_meter
		Pos = (648.0, 500.0)
		Time = 0.3}
	Wait \{0.3
		Seconds}
	SpawnScriptNow update_battle_death_meter Params = {death_meter_marker = <death_meter_marker>}
	SpawnScriptNow update_battle_death_meter_wings Params = {wing_R = <battle_death_meter_wing_r> wing_L = <battle_death_meter_wing_l>}
endscript

script update_battle_death_meter 
	GetSongTimeMS
	StartTime = <Time>
	if ($current_song = bossdevil)
		endtime = 321466
	elseif ($current_song = bossslash)
		endtime = 226504
	elseif ($current_song = bosstom)
		endtime = 197733
	elseif ($current_song = bossjoe)
		endtime = 236950
	else
		return
	endif
	if (<StartTime> > <endtime>)
		<StartTime> = 0
	endif
	meterTime = ((<endtime> - <StartTime>) / 1000)
	meterDistance = 150
	meterStep = (<meterTime> / <meterDistance>)
	pos_update = 0
	color_update = 0
	begin
	<pos_update> = (<pos_update> + 1)
	if ScreenElementExists Id = <death_meter_marker>
		if (<color_update> = 0)
			DoScreenElementMorph Id = <death_meter_marker> rgba = [0 255 100 255] Time = 1
			<color_update> = 1
		else
			DoScreenElementMorph Id = <death_meter_marker> rgba = [255 255 255 255] Time = 1
			<color_update> = 0
		endif
		if (<meterStep> > 0)
			DoScreenElementMorph Id = <death_meter_marker> Pos = ((29.0, 200.0) - ((0.0, 1.0) * <pos_update>)) Time = <meterStep>
		endif
	else
		break
	endif
	Wait <meterStep> Second
	repeat
endscript

script update_battle_death_meter_wings 
	GetSongTimeMS
	StartTime = <Time>
	if ($current_song = bossdevil)
		endtime = 321466
	elseif ($current_song = bossslash)
		endtime = 226504
	elseif ($current_song = bosstom)
		endtime = 197733
	elseif ($current_song = bossjoe)
		endtime = 236950
	else
		return
	endif
	if (<StartTime> > <endtime>)
		<StartTime> = 0
	endif
	meterTime = ((<endtime> - <StartTime>) / 1000)
	meterDistance = 40
	meterStep = (<meterTime> / <meterDistance>)
	rot_update = 0
	begin
	<rot_update> = (<rot_update> + 1)
	if ScreenElementExists Id = <wing_R>
		if (<meterTime> > 0)
			DoScreenElementMorph Id = <wing_R> Rot_Angle = (15 - <rot_update>) Time = <meterStep>
		endif
	else
		break
	endif
	if ScreenElementExists Id = <wing_L>
		if (<meterTime> > 0)
			DoScreenElementMorph Id = <wing_L> Rot_Angle = (-15 + <rot_update>) Time = <meterStep>
		endif
	else
		break
	endif
	Wait <meterStep> Seconds
	repeat
endscript
