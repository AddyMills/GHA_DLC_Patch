gStar_Power_Triggered = 0
jailbait_achievement = 0
subway_achievement = 0
Achievement_Atoms = [
	{
		Name = MAKE_IT
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p1_career
					DIFFICULTY = EASY
				}
			}
		]
	}
	{
		Name = MOVIN_OUT
		Type = Scr
		atom_script = Achievements_Stack_Career
		atom_params = {
			DIFFICULTY = MEDIUM
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p1_career
					DIFFICULTY = MEDIUM
				}
			}
		]
	}
	{
		Name = ROCK_IN_A_HARD_PLACE
		Type = Scr
		atom_script = Achievements_Stack_Career
		atom_params = {
			DIFFICULTY = HARD
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p1_career
					DIFFICULTY = HARD
				}
			}
		]
	}
	{
		Name = DREAM_ON
		Type = Scr
		atom_script = Achievements_Stack_Career
		atom_params = {
			DIFFICULTY = EXPERT
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p1_career
					DIFFICULTY = EXPERT
				}
			}
		]
	}
	{
		Name = AEROSMITH
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_AEROSMITH
			}
		]
	}
	{
		Name = JAILBAIT
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_Play_At_Venue
				Params = {
					Venue = load_z_Nipmuc
				}
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
			}
		]
	}
	{
		Name = SUBWAY
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_Play_At_Venue
				Params = {
					Venue = load_z_MaxsKC
				}
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
			}
		]
	}
	{
		Name = ON_THE_ROAD_AGAIN
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_Unlocked_Venue
				Params = {
					Venue = load_z_Fenway
				}
			}
		]
	}
	{
		Name = NINE_LIVES
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_Unlocked_Venue
				Params = {
					Venue = load_z_nine_lives
				}
			}
		]
	}
	{
		Name = CRITICAL_MASS
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_Unlocked_Venue
				Params = {
					Venue = load_z_JPPlay
				}
			}
		]
	}
	{
		Name = MARCH_19TH_2001
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_Unlocked_Venue
				Params = {
					Venue = load_z_hof
				}
			}
		]
	}
	{
		Name = NO_MORE_NO_MORE
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 1
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 2
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 3
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 4
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 5
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 6
				}
			}
		]
	}
	{
		Name = SAME_OLD_SONG_AND_DANCE
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p1_career
					DIFFICULTY = Any
				}
			}
			{
				Type = Scr
				Scr = Achievements_IsGameFinished
				Params = {
					game_mode = p1_career
					DIFFICULTY = Any
					Bonus
				}
			}
		]
	}
	{
		Name = SCORE_HERO
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_SCORE_HERO
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
			}
		]
	}
	{
		Name = GET_IT_UP
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_Career_Score_Threshold
				Params = {
					THRESHOLD = 1999999
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = EAT_THE_RICH
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_Career_Cash_Threshold
				Params = {
					THRESHOLD = 49999
				}
				permanent = FALSE
			}
		]
	}
	{
		Name = I_DONT_WANT_TO_MISS_A_THING
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievement_progression_difficulty_threshold
				Params = {
					DIFFICULTY = MEDIUM
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_100percent_performance
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = GEMS
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_GEMS
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = SICK_AS_A_DOG
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievement_progression_difficulty_threshold
				Params = {
					DIFFICULTY = MEDIUM
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_5StarSong
				Params = {
				}
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = AINT_THAT_A_B____H
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_100percent_performance
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = DUDE_LOOKS_LIKE_A_LADY
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_DUDE_LOOKS_LIKE_A_LADY
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = WOMAN_OF_THE_WORLD
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_WOMAN_OF_THE_WORLD
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = SPACED
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_SPACED
				permanent = FALSE
			}
			{
				Type = Scr
				Scr = Achievements_IsSongWon
				permanent = FALSE
			}
		]
	}
	{
		Name = WHAT_IT_TAKES
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_WHAT_IT_TAKES
			}
		]
	}
	{
		Name = DEUCES_ARE_WILD
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_CoopBeatenPart
				Params = {
					part = GUITAR
				}
			}
		]
	}
	{
		Name = LOVE_ME_TWO_TIMES
		Type = Scr
		atom_script = Achievements_DummyScript
		atom_params = {
			Achievement
		}
		depends_on = [
			{
				Type = Scr
				Scr = Achievements_CoopBeatenPart
				Params = {
					part = RHYTHM
				}
			}
		]
	}
]
Achievements_SongWonFlag = 0

script Achievements_IsSongWon 
	if ($Achievements_SongWonFlag = 1)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_DummyScript 
endscript

script Achievements_SongWon 
	if ($game_mode = p1_career)
		GetGlobalTags \{achievement_info}
		total_cash_in_career_mode = (<total_cash_in_career_mode> + <additional_cash>)
		total_notes_in_career_mode = (<total_notes_in_career_mode> + $player1_status.NOTES_HIT)
		total_points_in_career_mode = (<total_points_in_career_mode> + $player1_status.Score)
		SetGlobalTags achievement_info Params = {total_cash_in_career_mode = <total_cash_in_career_mode>
			total_notes_in_career_mode = <total_notes_in_career_mode>
			total_points_in_career_mode = <total_points_in_career_mode>}
		if ($current_difficulty = EASY)
			total_points_in_career_mode_easy = (<total_points_in_career_mode_easy> + $player1_status.Score)
			SetGlobalTags achievement_info Params = {total_points_in_career_mode_easy = <total_points_in_career_mode_easy>}
		endif
		if ($current_difficulty = MEDIUM)
			total_points_in_career_mode_medium = (<total_points_in_career_mode_medium> + $player1_status.Score)
			SetGlobalTags achievement_info Params = {total_points_in_career_mode_medium = <total_points_in_career_mode_medium>}
		endif
		if ($current_difficulty = HARD)
			total_points_in_career_mode_hard = (<total_points_in_career_mode_hard> + $player1_status.Score)
			SetGlobalTags achievement_info Params = {total_points_in_career_mode_hard = <total_points_in_career_mode_hard>}
		endif
		if ($current_difficulty = EXPERT)
			total_points_in_career_mode_expert = (<total_points_in_career_mode_expert> + $player1_status.Score)
			SetGlobalTags achievement_info Params = {total_points_in_career_mode_expert = <total_points_in_career_mode_expert>}
		endif
		Achievements_CheckCareerTotals
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		if ($gStar_Power_Triggered >= 3)
			WriteAchievements \{Achievement = WHEN_I_NEEDED_YOU}
		endif
		if ($game_mode = p2_quickplay)
			if (($player1_status.total_notes = $player1_status.NOTES_HIT) && ($player2_status.total_notes = $player2_status.NOTES_HIT))
				if NOT (($player1_status.total_notes = 0) && ($player2_status.total_notes = 0))
					WriteAchievements \{Achievement = LET_THE_MUSIC_DO_THE_TALKING}
				endif
			endif
		elseif ($game_mode = p2_coop)
			if ($player1_status.total_notes = $player1_status.NOTES_HIT)
				if NOT ($player1_status.total_notes = 0)
					WriteAchievements \{Achievement = LET_THE_MUSIC_DO_THE_TALKING}
				endif
			endif
		endif
		if (($player1_status.character_id = BradW) && ($player2_status.character_id = TomH))
			WriteAchievements \{Achievement = BACK_IN_THE_SADDLE}
		elseif (($player1_status.character_id = TomH) && ($player2_status.character_id = BradW))
			WriteAchievements \{Achievement = BACK_IN_THE_SADDLE}
		endif
		if (($primary_controller) = ($player1_status.controller))
			player_status = player1_status
		else
			player_status = player2_status
		endif
		if ($<player_status>.part = RHYTHM)
			SetGlobalTags ($current_song) Params = {beaten_coop_as_rhythm = 1}
		else
			SetGlobalTags ($current_song) Params = {beaten_coop_as_lead = 1}
		endif
	endif
	if ($game_mode = p1_career)
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
		FormatText ChecksumName = bandname_id 'band%i_info_%g' I = ($current_band) G = 'p1_career'
		FormatText ChecksumName = hendrix_checksum 'hendrix_achievement_%s' S = <difficulty_text_nl>
		GetGlobalTags <bandname_id> Param = <hendrix_checksum>
		GetGlobalTags \{user_options
			Params = lefty_flip_p1}
		if ((<...>.<hendrix_checksum>) = 2)
		elseif ((<...>.<hendrix_checksum>) = -1)
			AddParam Name = <hendrix_checksum> structure_name = new_params Value = <lefty_flip_p1>
			SetGlobalTags <bandname_id> Params = <new_params>
		elseif NOT ((<...>.<hendrix_checksum>) = <lefty_flip_p1>)
			AddParam Name = <hendrix_checksum> structure_name = new_params Value = 2
			SetGlobalTags <bandname_id> Params = <new_params>
		endif
	endif
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		if ($current_song = kingsandqueens && $current_difficulty = EXPERT && $boss_battle = 0 && $end_credits = 0)
			WriteAchievements \{Achievement = ONLY_THE_L33T}
		endif
	endif
endscript

script Achievements_100percent_performance 
	Printf \{"Achievements_100percent_performance"}
	if ($is_attract_mode = 0 &&
			($game_mode = p1_career ||
				$game_mode = p1_quickplay))
		if ($player1_status.NOTES_HIT = $player1_status.max_notes &&
				$player1_status.max_notes > 0)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_WhoNeedsThePower 
	Printf \{"Achievements_WhoNeedsThePower"}
	if ($game_mode = training ||
			$game_mode = PRACTICE ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if ($is_network_game = 0 &&
			($game_mode = p2_pro_faceoff ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_battle))
		return \{FALSE}
	endif
	Printf \{"star power trigged  = %d"
		D = $gStar_Power_Triggered}
	if ($player1_status.Score > 199999 &&
			$gStar_Power_Triggered = 0 &&
			$current_song = CultOfPersonality)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_TONE_DEAF 
	Printf \{"Achievements_TONE_DEAF"}
	if ($game_mode = p1_quickplay ||
			($game_mode = p1_career && $boss_battle = 0))
		GetGlobalTags \{user_options}
		if ($current_difficulty = EXPERT)
			if (<guitar_volume> = 0)
				return \{TRUE}
			endif
		endif
	endif
	return \{FALSE}
endscript

script Achievements_STAR_MANIA 
	Printf \{"Achievements_STAR_MANIA"}
	if ($game_mode = training ||
			$game_mode = PRACTICE ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if NOT ($game_mode = p1_quickplay)
		return \{FALSE}
	endif
	Printf \{"star power trigged  = %d"
		D = $gStar_Power_Triggered}
	if ($gStar_Power_Triggered > 2)
		if ($current_song = kingsandqueens && $current_difficulty = EXPERT)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_LIFE_OF_THE_PARTY 
	Printf \{"Achievements_LIFE_OF_THE_PARTY"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_consecutive_won_as_host> > 14)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_SEARCH_AND_DESTROY 
	Printf \{"Achievements_SEARCH_AND_DESTROY"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_consecutive_won_as_client> > 14)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_BUTTON_MASHER 
	Printf \{"Achievements_BUTTON_MASHER"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_matches_won_with_standard_controller> > 14)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_BIG_OL_PILE_OF_WINS 
	Printf \{"Achievements_BIG_OL_PILE_OF_WINS"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_matches_won> > 499)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_ENLIGHTENED_GUITARIST 
	array_entry = 0
	get_songlist_size
	num_gold_star_games = 0
	begin
	get_songlist_checksum Index = <array_entry>
	get_difficulty_text_nl \{DIFFICULTY = EXPERT}
	get_song_prefix Song = <song_checksum>
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
	GetGlobalTags <songname>
	if (<achievement_gold_star> = 1)
		num_gold_star_games = (<num_gold_star_games> + 1)
	endif
	array_entry = (<array_entry> + 1)
	repeat <array_Size>
	if (<num_gold_star_games> > 19)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievement_TOYS_IN_THE_ATTIC 
	Printf \{"Achievement_TOYS_IN_THE_ATTIC"}
	guitar_array = ($Bonus_Guitars)
	GetArraySize <guitar_array>
	Index = 0
	begin
	guitar_id = (<guitar_array> [<Index>].Id)
	GetGlobalTags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	guitar_array = ($Bonus_Basses)
	GetArraySize <guitar_array>
	Index = 0
	begin
	guitar_id = (<guitar_array> [<Index>].Id)
	GetGlobalTags <guitar_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{TRUE}
endscript

script Achievement_BIG_TEN_INCH_RECORD 
	GetArraySize ($Bonus_Songs_Info)
	Index = 0
	begin
	GetGlobalTags ($Bonus_Songs_Info [<Index>].item)
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{TRUE}
endscript

script Achievement_KINGS_AND_QUEENS 
	character_array = ($Secret_Characters)
	GetArraySize <character_array>
	Index = 0
	begin
	character_id = (<character_array> [<Index>].Id)
	GetGlobalTags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{TRUE}
endscript

script Achievement_WALK_THIS_WAY 
	character_array = ($Secret_Characters)
	GetArraySize <character_array>
	Index = 0
	begin
	character_id = (<character_array> [<Index>].Id)
	GetGlobalTags <character_id>
	if ((<unlocked> = 1) && (<character_array> [<Index>].info_name = DMC))
		return \{TRUE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script Achievement_BURNING_A_HOLE_IN_YOUR_POCKET 
	GetArraySize ($Bonus_Videos)
	Index = 0
	begin
	video_checksum = ($Bonus_Videos [<Index>].Id)
	GetGlobalTags <video_checksum>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	if NOT Achievement_BIG_TEN_INCH_RECORD
		return \{FALSE}
	endif
	if NOT Achievement_TOYS_IN_THE_ATTIC
		return \{FALSE}
	endif
	if NOT Achievement_KINGS_AND_QUEENS
		return \{FALSE}
	endif
	character_array = ($Bonus_Outfits)
	GetArraySize <character_array>
	Index = 0
	begin
	character_id = (<character_array> [<Index>].Id)
	GetGlobalTags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	character_array = ($Bonus_Styles)
	GetArraySize <character_array>
	Index = 0
	begin
	character_id = (<character_array> [<Index>].Id)
	GetGlobalTags <character_id>
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{TRUE}
endscript

script Achievement_CheckBuyAchievements 
	if Achievement_TOYS_IN_THE_ATTIC
		WriteAchievements \{Achievement = TOYS_IN_THE_ATTIC}
	endif
	if Achievement_BIG_TEN_INCH_RECORD
		WriteAchievements \{Achievement = BIG_TEN_INCH_RECORD}
	endif
	if Achievement_KINGS_AND_QUEENS
		WriteAchievements \{Achievement = KINGS_AND_QUEENS}
	endif
	if Achievement_WALK_THIS_WAY
		WriteAchievements \{Achievement = WALK_THIS_WAY}
	endif
	if Achievement_BURNING_A_HOLE_IN_YOUR_POCKET
		WriteAchievements \{Achievement = BURNING_A_HOLE_IN_YOUR_POCKET}
	endif
	if Achievements_WELCOME_TO_HELL
		WriteAchievements \{Achievement = WELCOME_TO_HELL}
	endif
endscript

script Achievements_IsGameFinished 
	Printf \{"Achievements_IsGameFinished"}
	if NOT GotParam \{DIFFICULTY}
		ScriptAssert \{"No difficulty"}
	endif
	if NOT GotParam \{game_mode}
		ScriptAssert \{"No game mode"}
	endif
	GetArraySize ($difficulty_list)
	array_count = 0
	begin
	get_difficulty_text_nl DIFFICULTY = ($difficulty_list [<array_count>])
	if GotParam \{Bonus}
		get_progression_globals game_mode = <game_mode> Bonus
	else
		get_progression_globals game_mode = <game_mode>
	endif
	setlist_prefix = ($<tier_global>.prefix)
	FormatText ChecksumName = gametype_checksum '%p_%s' P = <setlist_prefix> S = <difficulty_text_nl>
	GetGlobalTags <gametype_checksum>
	if (<DIFFICULTY> = Any)
		if (<Complete> = 1)
			return \{TRUE}
		endif
	endif
	if (<DIFFICULTY> = All)
		if (<Complete> = 0)
			return \{FALSE}
		endif
	endif
	if (<DIFFICULTY> = ($difficulty_list [<array_count>]))
		if (<Complete> = 1)
			return \{TRUE}
		else
			return \{FALSE}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if (<DIFFICULTY> = Any)
		return \{FALSE}
	else
		return \{TRUE}
	endif
endscript

script Achievements_SCORE_HERO 
	Printf \{"Achievements_SCORE_HERO"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if (($player1_status.Score > 325000) && ($current_song = trainkeptarollin))
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_HALF_A_MILL 
	Printf \{"Achievements_HALF_A_MILL"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.Score > 500000)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_FIRST_MILL 
	Printf \{"Achievements_FIRST_MILL"}
	if ($game_mode = p1_quickplay || $game_mode = p1_career)
		if ($player1_status.Score > 750000)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_CheckCareerTotals 
	GetGlobalTags \{achievement_info}
	if (<total_cash_in_career_mode> > 350000)
		WriteAchievements \{Achievement = NEVER_GONNA_SPEND_IT_ALL}
	endif
	if (<total_notes_in_career_mode> > 250000)
		WriteAchievements \{Achievement = NOTES_FROM_HELL}
	endif
	if (<total_points_in_career_mode> > 100000000)
		WriteAchievements \{Achievement = BILLION_GULP}
	endif
endscript

script Achievements_CoopBeatenPart 
	Printf \{"Achievements_CoopBeatenPart"}
	get_progression_globals \{game_mode = p2_quickplay}
	setlist_prefix = ($<tier_global>.prefix)
	Tier = 1
	begin
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	GetGlobalTags ($<tier_global>.<tier_checksum>.songs [<array_count>])
	if (<part> = RHYTHM)
		if (<beaten_coop_as_rhythm> = 0)
			return \{FALSE}
		endif
	else
		if (<beaten_coop_as_lead> = 0)
			return \{FALSE}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<tier_global>.num_tiers)
	return \{TRUE}
endscript

script Achievements_WELCOME_TO_HELL 
	GetGlobalTags \{achievement_info
		Param = ranked_matches_played}
	if (<ranked_matches_played> < 100)
		return \{FALSE}
	endif
	if NOT Achievement_BURNING_A_HOLE_IN_YOUR_POCKET
		return \{FALSE}
	endif
	if NOT Achievements_IsGameFinished \{game_mode = p1_career
			DIFFICULTY = All}
		return \{FALSE}
	endif
	return \{TRUE}
endscript

script Achievements_HENDRIX_REBORN 
	GetGlobalTags \{achievement_info}
	if (<hendrix_achievement_lefty_off> = 1 &&
			<hendrix_achievement_lefty_on> = 1)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_WHAMMY_MANIA 
	if ($current_song = numberofthebeast)
		if ($game_mode = p1_career || $game_mode = p1_quickplay)
			if ($whammy_mania_achievement_invalidated = 0)
				return \{TRUE}
			endif
		endif
	endif
	return \{FALSE}
endscript

script Achievements_SongFailed 
	completion = 0
	get_song_end_time Song = ($current_song)
	if (<total_end_time> > 0)
		completion = (100 * $failed_song_time / <total_end_time>)
	endif
	CastToInteger \{completion}
	if NOT ($current_song = bossjoe)
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
		get_song_prefix Song = ($current_song)
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		if ($game_mode = p2_coop || $game_mode = p2_quickplay)
			GetGlobalTags <songname> Param = coop_failedtimes
			coop_failedtimes = (<coop_failedtimes> + 1)
			SetGlobalTags <songname> Params = {coop_failedtimes = <coop_failedtimes>}
		else
			GetGlobalTags <songname> Param = failedtimes
			failedtimes = (<failedtimes> + 1)
			SetGlobalTags <songname> Params = {failedtimes = <failedtimes>}
		endif
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		GetArraySize \{$gh3_songlist}
		total_songs = <array_Size>
		GetArraySize \{$difficulty_list}
		total_diffs = <array_Size>
		total_song_failures = 0
		song_count = 0
		begin
		diffs_count = 0
		begin
		get_difficulty_text_nl DIFFICULTY = ($difficulty_list [<diffs_count>])
		get_song_prefix Song = ($gh3_songlist [<song_count>])
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		GetGlobalTags <songname> Param = coop_failedtimes
		total_song_failures = (<total_song_failures> + <coop_failedtimes>)
		if (<total_song_failures> > 4)
			WriteAchievements \{Achievement = NOBODYS_FAULT}
			break
		endif
		diffs_count = (<diffs_count> + 1)
		repeat <total_diffs>
		song_count = (<song_count> + 1)
		repeat <total_songs>
		if (<completion> > 94)
			WriteAchievements \{Achievement = FALLEN_ANGELS}
		endif
	endif
	if ($game_mode = p1_career || $game_mode = p1_quickplay)
		GetArraySize \{$difficulty_list}
		array_count = 0
		total_failedtimes = 0
		begin
		get_difficulty_text_nl DIFFICULTY = ($difficulty_list [<array_count>])
		get_song_prefix Song = ($current_song)
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
		GetGlobalTags <songname> Param = failedtimes
		total_failedtimes = (<total_failedtimes> + <failedtimes>)
		array_count = (<array_count> + 1)
		repeat <array_Size>
		if (<total_failedtimes> > 9)
			WriteAchievements \{Achievement = NIGHT_IN_THE_RUTS}
		endif
	endif
	if ($game_mode = p1_career)
		GetGlobalTags \{achievement_info}
		total_notes_in_career_mode = (<total_notes_in_career_mode> + $player1_status.NOTES_HIT)
		total_points_in_career_mode = (<total_points_in_career_mode> + $player1_status.Score)
		SetGlobalTags achievement_info Params = {total_notes_in_career_mode = <total_notes_in_career_mode>
			total_points_in_career_mode = <total_points_in_career_mode>}
		Achievements_CheckCareerTotals
	endif
endscript

script Achievements_net_game_completed 
	if NOT GotParam \{outcome}
		return
	endif
	if ($is_network_game = 1 && (NetSessionFunc func = IsRanked Obj = match))
		if (<outcome> = WIN)
			retrieve_player_net_id \{Player = 2}
			CheckAndWriteMakerAchievement player_xuid = <net_id>
			if ($game_mode = p2_pro_faceoff)
				WriteAchievements \{Achievement = MY_FIST_YOUR_FACE}
				if ((($player1_status.Score) - ($player2_status.Score)) > 9999)
					WriteAchievements \{Achievement = WALKIN_THE_DOG}
				endif
			elseif ($game_mode = p2_faceoff)
				WriteAchievements \{Achievement = DONT_GET_MAD_GET_EVEN}
			elseif ($game_mode = p2_battle)
				if (($player1_status.final_blow_powerup) = 7)
					WriteAchievements \{Achievement = SOUL_SAVER}
				endif
			endif
		elseif (<outcome> = LOSE)
			if ($game_mode = p2_pro_faceoff)
				WriteAchievements \{Achievement = YOU_SEE_ME_CRYING}
			elseif ($game_mode = p2_faceoff)
				WriteAchievements \{Achievement = FALLING_OFF}
			endif
		endif
	endif
endscript

script Achievements_WHAT_IT_TAKES 
	Printf \{"Achievements_WHAT_IT_TAKES"}
	if ($is_network_game = 1)
		GetGlobalTags \{achievement_info}
		if (<ranked_matches_played> > 19)
			return \{TRUE}
		endif
	endif
	return \{FALSE}
endscript

script Achievements_SPACED 
	Printf \{"Achievements_SPACED"}
	if ($game_mode = training ||
			$game_mode = PRACTICE ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if (($gStar_Power_Triggered = 0) && ($player1_status.star_power_amount >= 50.0))
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_WOMAN_OF_THE_WORLD 
	Printf \{"Achievements_WOMAN_OF_THE_WORLD"}
	is_aerosmith_song Song = ($current_song)
	is_joe_perry_song Song = ($current_song)
	if ((<aerosmith_song> = 1 && $is_network_game = 0) ||
			(<joe_perry_song> = 1 && $is_network_game = 0) ||
			$game_mode = training ||
			$game_mode = PRACTICE ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if (($player1_status.character_id) = CASEY ||
			($player1_status.character_id) = JUDY ||
			($player1_status.character_id) = MIDORI)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_DUDE_LOOKS_LIKE_A_LADY 
	Printf \{"Achievements_DUDE_LOOKS_LIKE_A_LADY"}
	is_aerosmith_song Song = ($current_song)
	is_joe_perry_song Song = ($current_song)
	if ((<aerosmith_song> = 1 && $is_network_game = 0) ||
			(<joe_perry_song> = 1 && $is_network_game = 0) ||
			$game_mode = PRACTICE ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1 ||
			$is_network_game = 1)
		return \{FALSE}
	endif
	if (($player1_status.character_id) = Izzy)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievement_progression_difficulty_threshold 
	Printf \{"Achievement_progression_difficulty_threshold"}
	if NOT GotParam \{DIFFICULTY}
		return \{FALSE}
	endif
	switch <DIFFICULTY>
		case EASY
		starting_index = 0
		case MEDIUM
		starting_index = 1
		case HARD
		starting_index = 2
		case EXPERT
		starting_index = 3
	endswitch
	GetArraySize \{$difficulty_list}
	Index = <starting_index>
	begin
	if Progression_CheckDiff diff = ($difficulty_list [<Index>])
		return \{TRUE}
	endif
	Index = (<Index> + 1)
	repeat (<array_Size> - <starting_index>)
	return \{FALSE}
endscript

script Achievements_Career_Score_Threshold 
	Printf \{"Achievements_Career_Score_Threshold"}
	if NOT GotParam \{THRESHOLD}
		return \{FALSE}
	endif
	get_progression_globals \{game_mode = p1_career}
	summation_career_score tier_global = <tier_global>
	if (<career_score> > <THRESHOLD>)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_Unlocked_Venue 
	Printf \{"Achievements_Unlocked_Venue"}
	if NOT GotParam \{Venue}
		return \{FALSE}
	endif
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum Index = <array_count>
	FormatText ChecksumName = venue_checksum 'venue_%s' S = ($LevelZones.<level_checksum>.Name)
	GetGlobalTags <venue_checksum> Params = {unlocked}
	if ((<Venue> = <level_checksum>) && (<unlocked> = 1))
		return \{TRUE}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script Achievements_AEROSMITH 
	Printf \{"Achievements_AEROSMITH"}
	get_progression_globals \{game_mode = p1_career}
	if ($game_mode = p1_career)
		array_count = 0
		begin
		setlist_prefix = ($<tier_global>.prefix)
		FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = (<array_count> + 1)
		GetGlobalTags <tiername> Param = aerosmith_unlocked
		if (<aerosmith_unlocked> = 1)
			return \{TRUE}
		endif
		array_count = (<array_count> + 1)
		repeat ($<tier_global>.num_tiers)
	endif
	return \{FALSE}
endscript

script Achievements_GEMS 
	Printf \{"Achievements_GEMS"}
	if ($game_mode = training ||
			$game_mode = PRACTICE ||
			$game_mode = p2_battle ||
			$game_mode = p2_faceoff ||
			$boss_battle = 1)
		return \{FALSE}
	endif
	if (($player1_status.sp_phrases_hit) = ($player1_status.sp_phrases_total))
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_5StarSong 
	Printf \{"Achievements_5StarSong"}
	if (($player1_status.STARS) >= 5)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_Stack_Career 
	Printf \{"Achievements_Stack_Career"}
	if NOT GotParam \{DIFFICULTY}
		return
	endif
	switch <DIFFICULTY>
		case MEDIUM
		WriteAchievements \{Achievement = MAKE_IT}
		case HARD
		WriteAchievements \{Achievement = MAKE_IT}
		WriteAchievements \{Achievement = MOVIN_OUT}
		case EXPERT
		WriteAchievements \{Achievement = MAKE_IT}
		WriteAchievements \{Achievement = MOVIN_OUT}
		WriteAchievements \{Achievement = ROCK_IN_A_HARD_PLACE}
	endswitch
endscript

script Achievements_Play_At_Venue 
	Printf \{"Achievements_Play_At_Venue"}
	if NOT GotParam \{Venue}
		return \{FALSE}
	endif
	if ($jailbait_achievement = 1 && <Venue> = load_z_Nipmuc)
		return \{TRUE}
	endif
	if ($subway_achievement = 1 && <Venue> = load_z_MaxsKC)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Achievements_Career_Cash_Threshold 
	if NOT GotParam \{THRESHOLD}
		return \{FALSE}
	endif
	GetGlobalTags \{achievement_info}
	if (<total_cash_in_career_mode> > <THRESHOLD>)
		return \{TRUE}
	endif
	return \{FALSE}
endscript
