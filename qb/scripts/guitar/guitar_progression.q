progression_beat_game_last_song = 0
progression_unlock_tier_last_song = 0
progression_play_completion_movie = 0
progression_completion_tier = 1
progression_unlocked_guitar = -1
progression_unlocked_guitar2 = -1
progression_unlocked_type = GUITAR
GH3_Career_Songs = {
	prefix = 'career'
	num_tiers = 6
	initial_movie = 'AO_short_1'
	tier1 = {
		Title = "1. Getting the band together"
		songs = [
			dreampolice
			alltheyoungdudes
			makeit
			unclesalty
			DrawTheLine
		]
		encorep1
		aerosmith_encore_p1
		Level = load_z_Nipmuc
		defaultunlocked = 2
		completion_movie = 'AO_short_2'
		setlist_icon = setlist_icon_01
	}
	tier2 = {
		Title = "2. First taste of success"
		songs = [
			ihatemyselfforlovingyou
			alldayandallofthenight
			nosurprize
			movinout
			sweetemotion
		]
		encorep1
		aerosmith_encore_p1
		Level = load_z_MaxsKC
		completion_movie = 'AO_short_3'
		setlist_icon = setlist_icon_02
	}
	tier3 = {
		Title = "3. The triumphant return"
		songs = [
			completecontrol
			personalitycrisis
			livinontheedge
			Ragdoll
			loveinanelevator
		]
		encorep1
		aerosmith_encore_p1
		Level = load_z_Fenway
		completion_movie = 'AO_short_4'
		setlist_icon = setlist_icon_03
	}
	tier4 = {
		Title = "4. International Superstars"
		songs = [
			shesellssanctuary
			kingofrock
			nobodysfault
			brightlightfright
			walkthiswayrundmc
		]
		encorep1
		aerosmith_encore_p1
		Level = load_z_nine_lives
		completion_movie = 'AO_short_5'
		setlist_icon = setlist_icon_04
	}
	tier5 = {
		Title = "5. The Great American Band"
		songs = [
			hardtohandle
			alwaysontherun
			BackInTheSaddle
			beyondbeautiful
			dreamon
		]
		encorep1
		aerosmith_encore_p1
		Level = load_z_JPPlay
		completion_movie = 'AO_short_6'
		setlist_icon = setlist_icon_05
	}
	tier6 = {
		Title = "6. Rock 'N Roll Legends"
		songs = [
			catscratchfever
			sextypething
			bossjoe
			mamakin
			ToysInTheAttic
			trainkeptarollin
		]
		encorep1
		aerosmith_encore_p1
		boss
		Level = load_z_hof
		completion_movie = 'singleplayer_end'
		setlist_icon = setlist_icon_06
	}
}
GH3_General_Songs = {
	prefix = 'general'
	num_tiers = 6
	tier1 = {
		Title = "1. Getting the band together"
		songs = [
			dreampolice
			alltheyoungdudes
			makeit
			unclesalty
			DrawTheLine
		]
		encorep1
		aerosmith_encore_p1
		Level = load_z_Nipmuc
		defaultunlocked = 4
		completion_movie = 'AO_short_2'
		setlist_icon = setlist_icon_01
	}
	tier2 = {
		Title = "2. First taste of success"
		songs = [
			ihatemyselfforlovingyou
			alldayandallofthenight
			nosurprize
			movinout
			sweetemotion
		]
		encorep1
		aerosmith_encore_p1
		Level = load_z_MaxsKC
		defaultunlocked = 4
		completion_movie = 'AO_short_3'
		setlist_icon = setlist_icon_02
	}
	tier3 = {
		Title = "3. The triumphant return"
		songs = [
			completecontrol
			personalitycrisis
			livinontheedge
			Ragdoll
			loveinanelevator
		]
		encorep1
		aerosmith_encore_p1
		Level = load_z_Fenway
		completion_movie = 'AO_short_4'
		setlist_icon = setlist_icon_03
	}
	tier4 = {
		Title = "4. International Superstars"
		songs = [
			shesellssanctuary
			kingofrock
			nobodysfault
			brightlightfright
			walkthiswayrundmc
		]
		encorep1
		aerosmith_encore_p1
		Level = load_z_nine_lives
		completion_movie = 'AO_short_5'
		setlist_icon = setlist_icon_04
	}
	tier5 = {
		Title = "5. The Great American Band"
		songs = [
			hardtohandle
			alwaysontherun
			BackInTheSaddle
			beyondbeautiful
			dreamon
		]
		encorep1
		aerosmith_encore_p1
		Level = load_z_JPPlay
		completion_movie = 'AO_short_6'
		setlist_icon = setlist_icon_05
	}
	tier6 = {
		Title = "6. Rock 'N Roll Legends"
		songs = [
			catscratchfever
			sextypething
			mamakin
			ToysInTheAttic
			trainkeptarollin
		]
		encorep1
		aerosmith_encore_p1
		Level = load_z_hof
		completion_movie = 'singleplayer_end'
		setlist_icon = setlist_icon_06
	}
}
GH3_Career_NumSongToProgress = {
	EASY = 3
	MEDIUM = 3
	HARD = 4
	EXPERT = 4
	Bonus = 11
}
GH3_Career_Progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = Progression_Init
		atom_params = {
		}
	}
	{
		Name = career_tier1_intro_songscomplete
		Type = Scr
		atom_script = Progression_TierAerosmithUnlock
		atom_params = {
			Tier = 1
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckIntroSongsComplete
				Params = {
					Tier = 1
				}
			}
		]
	}
	{
		Name = career_tier1_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 1
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 1
					numsongstoprogress = $GH3_Career_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier1_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 1
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier1_songscomplete
			}
			{
				Type = Scr
				Scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		Name = career_tier1_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 1
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier1_encoreunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 1
				}
			}
		]
	}
	{
		Name = career_tier1_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 1
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier1_songscomplete
			}
			{
				Type = atom
				atom = career_tier1_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_tier2_intro_songscomplete
		Type = Scr
		atom_script = Progression_TierAerosmithUnlock
		atom_params = {
			Tier = 2
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckIntroSongsComplete
				Params = {
					Tier = 2
				}
			}
		]
	}
	{
		Name = career_tier2_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 2
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier1_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 2
					numsongstoprogress = $GH3_Career_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier2_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 2
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier2_songscomplete
			}
		]
	}
	{
		Name = career_tier2_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 2
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier2_encoreunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 2
				}
			}
		]
	}
	{
		Name = career_tier2_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 2
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier2_songscomplete
			}
			{
				Type = atom
				atom = career_tier2_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_tier3_intro_songscomplete
		Type = Scr
		atom_script = Progression_TierAerosmithUnlock
		atom_params = {
			Tier = 3
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckIntroSongsComplete
				Params = {
					Tier = 3
				}
			}
		]
	}
	{
		Name = career_tier3_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 3
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier2_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 3
					numsongstoprogress = $GH3_Career_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier3_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 3
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier3_songscomplete
			}
			{
				Type = Scr
				Scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		Name = career_tier3_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 3
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier3_encoreunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 3
				}
			}
		]
	}
	{
		Name = career_tier3_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 3
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier3_songscomplete
			}
			{
				Type = atom
				atom = career_tier3_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_tier4_intro_songscomplete
		Type = Scr
		atom_script = Progression_TierAerosmithUnlock
		atom_params = {
			Tier = 4
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckIntroSongsComplete
				Params = {
					Tier = 4
				}
			}
		]
	}
	{
		Name = career_tier4_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 4
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier3_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 4
					numsongstoprogress = $GH3_Career_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier4_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 4
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier4_songscomplete
			}
			{
				Type = Scr
				Scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		Name = career_tier4_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 4
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier4_encoreunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 4
				}
			}
		]
	}
	{
		Name = career_tier4_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 4
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier4_songscomplete
			}
			{
				Type = atom
				atom = career_tier4_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_tier5_intro_songscomplete
		Type = Scr
		atom_script = Progression_TierAerosmithUnlock
		atom_params = {
			Tier = 5
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckIntroSongsComplete
				Params = {
					Tier = 5
				}
			}
		]
	}
	{
		Name = career_tier5_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 5
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier4_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 5
					numsongstoprogress = $GH3_Career_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier5_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 5
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier5_songscomplete
			}
		]
	}
	{
		Name = career_tier5_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 5
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier5_encoreunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 5
				}
			}
		]
	}
	{
		Name = career_tier5_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 5
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier5_songscomplete
			}
			{
				Type = atom
				atom = career_tier5_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_tier6_bossunlock
		Type = Scr
		atom_script = Progression_TierBossUnlock
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckIntroSongsComplete
				Params = {
					Tier = 6
				}
			}
			{
				Type = Scr
				Scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		Name = career_tier6_bosscomplete
		Type = Scr
		atom_script = Progression_TierBossComplete
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_bossunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckBossComplete
				Params = {
					Tier = 6
				}
			}
		]
	}
	{
		Name = career_tier6_intro_songscomplete
		Type = Scr
		atom_script = Progression_TierAerosmithUnlock
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_bosscomplete
			}
		]
	}
	{
		Name = career_tier6_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier5_complete
			}
			{
				Type = atom
				atom = career_tier6_bosscomplete
			}
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 6
					numsongstoprogress = $GH3_Career_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier6_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_songscomplete
			}
			{
				Type = Scr
				Scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		Name = career_tier6_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_encoreunlock
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
		Name = career_tier6_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 6
			finished_game
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_songscomplete
			}
			{
				Type = atom
				atom = career_tier6_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
			{
				Type = atom
				atom = career_tier6_bosscomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_bonus_songs_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 1
			Bonus
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 1
					numsongstoprogress = $GH3_Career_NumSongToProgress
					Bonus
				}
			}
		]
	}
	{
		Name = unlock_guitar1
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			GUITAR = 1
			for_difficulty
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EASY
					mode = p1_career
				}
			}
		]
	}
	{
		Name = unlock_guitar2
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			GUITAR = 2
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EASY
					mode = p1_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
			}
		]
	}
	{
		Name = unlock_guitar3
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			GUITAR = 3
			for_difficulty
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = MEDIUM
					mode = p1_career
				}
			}
		]
	}
	{
		Name = unlock_guitar4
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			GUITAR = 4
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = MEDIUM
					mode = p1_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
			}
		]
	}
	{
		Name = unlock_guitar5
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			GUITAR = 5
			for_difficulty
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = HARD
					mode = p1_career
				}
			}
		]
	}
	{
		Name = unlock_guitar6
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			GUITAR = 6
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = HARD
					mode = p1_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
			}
		]
	}
	{
		Name = unlock_guitar7
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			GUITAR = 7
			for_difficulty
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EXPERT
					mode = p1_career
				}
			}
		]
	}
	{
		Name = unlock_guitar8
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			GUITAR = 8
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EXPERT
					mode = p1_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = Progression_EndOfFirstUpdate
		atom_params = {
		}
	}
]
Cash_System_rules = [
	{
		diff = EASY
		newstars = 3
		oldstars = 0
		Cash = 75
	}
	{
		diff = EASY
		newstars = 4
		oldstars = 0
		Cash = 175
	}
	{
		diff = EASY
		newstars = 5
		oldstars = 0
		Cash = 300
	}
	{
		diff = EASY
		newstars = 4
		oldstars = 3
		Cash = 100
	}
	{
		diff = EASY
		newstars = 5
		oldstars = 3
		Cash = 225
	}
	{
		diff = EASY
		newstars = 5
		oldstars = 4
		Cash = 125
	}
	{
		diff = MEDIUM
		newstars = 3
		oldstars = 0
		Cash = 150
	}
	{
		diff = MEDIUM
		newstars = 4
		oldstars = 0
		Cash = 350
	}
	{
		diff = MEDIUM
		newstars = 5
		oldstars = 0
		Cash = 600
	}
	{
		diff = MEDIUM
		newstars = 4
		oldstars = 3
		Cash = 200
	}
	{
		diff = MEDIUM
		newstars = 5
		oldstars = 3
		Cash = 450
	}
	{
		diff = MEDIUM
		newstars = 5
		oldstars = 4
		Cash = 250
	}
	{
		diff = HARD
		newstars = 3
		oldstars = 0
		Cash = 300
	}
	{
		diff = HARD
		newstars = 4
		oldstars = 0
		Cash = 700
	}
	{
		diff = HARD
		newstars = 5
		oldstars = 0
		Cash = 1200
	}
	{
		diff = HARD
		newstars = 4
		oldstars = 3
		Cash = 400
	}
	{
		diff = HARD
		newstars = 5
		oldstars = 3
		Cash = 900
	}
	{
		diff = HARD
		newstars = 5
		oldstars = 4
		Cash = 500
	}
	{
		diff = EXPERT
		newstars = 3
		oldstars = 0
		Cash = 450
	}
	{
		diff = EXPERT
		newstars = 4
		oldstars = 0
		Cash = 1050
	}
	{
		diff = EXPERT
		newstars = 5
		oldstars = 0
		Cash = 1800
	}
	{
		diff = EXPERT
		newstars = 4
		oldstars = 3
		Cash = 600
	}
	{
		diff = EXPERT
		newstars = 5
		oldstars = 3
		Cash = 1350
	}
	{
		diff = EXPERT
		newstars = 5
		oldstars = 4
		Cash = 750
	}
]

script Progression_Init 
	Printf \{"Progression_Init"}
	Tier = 0
	get_progression_globals game_mode = ($game_mode)
	if ($game_mode = p1_career)
		FormatText ChecksumName = tiername 'tier%i' I = (<Tier> + 1)
		Change current_level = ($<tier_global>.<tiername>.Level)
	endif
	Change \{setlist_previous_tier = 1}
	Change \{setlist_previous_song = 0}
	Change \{setlist_previous_tab = tab_setlist}
endscript

script Progression_EndOfFirstUpdate 
	Change \{end_credits = 0}
	Change \{progression_beat_game_last_song = 0}
	Change \{progression_unlock_tier_last_song = 0}
	Change \{progression_play_completion_movie = 0}
	Change \{progression_unlocked_guitar = -1}
	Change \{progression_unlocked_guitar2 = -1}
	Change \{progression_unlocked_type = GUITAR}
endscript

script Progression_TierSongsComplete 
	Printf \{"Progression_TierSongsComplete"}
endscript

script Progression_TierAerosmithUnlock 
	Printf \{"Progression_TierAerosmithUnlock"}
	get_progression_globals game_mode = ($game_mode)
	Progression_GetAerosmithEncoreSong tier_global = <tier_global> Tier = <Tier>
	SetGlobalTags Progression Params = {aerosmith_encore_song = <Song>}
	SetGlobalTags Progression Params = {next_song_count = <song_count>}
	Change setlist_previous_song = <song_count>
	Change \{current_transition = PREAEROSMITH}
	Progression_GetNumTierSong tier_global = <tier_global> Tier = <Tier>
	song_count = 0
	current_tier_global = <tier_global>
	begin
	Progression_GetTierSong tier_global = <current_tier_global> Tier = <Tier> song_count = <song_count>
	Progression_UnlockSong tier_global = <current_tier_global> Song = <Song> AEROSMITH = 1
	get_progression_globals \{game_mode = p1_quickplay}
	Progression_UnlockSong tier_global = <tier_global> Song = <Song>
	get_progression_globals \{game_mode = p2_quickplay}
	Progression_UnlockSong tier_global = <tier_global> Song = <Song>
	song_count = (<song_count> + 1)
	repeat <tier_size>
	get_progression_globals \{game_mode = p1_quickplay}
	Progression_UnlockSong tier_global = <tier_global> Song = <Song>
	get_progression_globals \{game_mode = p2_quickplay}
	Progression_UnlockSong tier_global = <tier_global> Song = <Song>
endscript

script Progression_TierEncoreUnlock 
	Printf \{"Progression_TierEncoreUnlock"}
	get_progression_globals game_mode = ($game_mode)
	Progression_GetEncoreSong tier_global = <tier_global> Tier = <Tier>
	SetGlobalTags Progression Params = {encore_song = <Song>}
	SetGlobalTags Progression Params = {next_tier = <Tier>}
	SetGlobalTags Progression Params = {next_song_count = <song_count>}
	Change setlist_previous_tier = <Tier>
	Change setlist_previous_song = <song_count>
	Change \{current_transition = PREENCORE}
	Progression_UnlockSong tier_global = <tier_global> Song = <Song> ENCORE = 1
	get_progression_globals \{game_mode = p1_quickplay}
	Progression_UnlockSong tier_global = <tier_global> Song = <Song>
	get_progression_globals \{game_mode = p2_quickplay}
	Progression_UnlockSong tier_global = <tier_global> Song = <Song>
	update_coop_progression
endscript

script Progression_TierEncoreComplete 
	Printf \{"Progression_TierEncoreComplete"}
	Change \{progression_play_completion_movie = 1}
	Change progression_completion_tier = <Tier>
endscript

script Progression_TierBossUnlock 
	Printf \{"Progression_TierBossUnlock"}
	get_progression_globals game_mode = ($game_mode)
	Progression_GetBossSong tier_global = <tier_global> Tier = <Tier>
	SetGlobalTags Progression Params = {boss_song = <Song>}
	SetGlobalTags Progression Params = {next_tier = <Tier>}
	SetGlobalTags Progression Params = {next_song_count = <song_count>}
	Change setlist_previous_tier = <Tier>
	Change setlist_previous_song = <song_count>
	Change \{current_transition = preboss}
	Progression_UnlockSong tier_global = <tier_global> Song = <Song> boss = 1
endscript

script Progression_TierBossComplete 
	Printf \{"Progression_TierBossComplete"}
endscript

script Progression_TierComplete 
	Printf \{"Progression_TierComplete"}
	if GotParam \{Bonus}
		get_progression_globals game_mode = ($game_mode) Bonus
	else
		get_progression_globals game_mode = ($game_mode)
	endif
	setlist_prefix = ($<tier_global>.prefix)
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	SetGlobalTags <tiername> Params = {Complete = 1}
	if GotParam \{finished_game}
		Printf \{"FINISHED GAME"}
		Change \{end_credits = 0}
		if NOT ($progression_beat_game_last_song = 1)
			Change \{end_credits = 1}
			FormatText \{ChecksumName = bonus_song_checksum
				'%p_song%i_tier%s'
				P = 'bonus'
				I = 3
				S = 1}
			SetGlobalTags <bonus_song_checksum> Params = {unlocked = 1}
			SetGlobalTags ($GH3_Bonus_Songs.tier1.songs [2]) Params = {unlocked = 1}
		endif
		Change \{progression_beat_game_last_song = 1}
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
		FormatText ChecksumName = gametype_checksum '%p_%s' P = <setlist_prefix> S = <difficulty_text_nl>
		SetGlobalTags <gametype_checksum> Params = {Complete = 1}
		if ($game_mode = p1_career)
			FormatText ChecksumName = bandname_id 'band%i_info_%g' I = ($current_band) G = 'p1_career'
			FormatText ChecksumName = hendrix_checksum 'hendrix_achievement_%s' S = <difficulty_text_nl>
			GetGlobalTags <bandname_id> Param = <hendrix_checksum>
			if ((<...>.<hendrix_checksum>) = 0)
				SetGlobalTags \{achievement_info
					Params = {
						hendrix_achievement_lefty_off = 1
					}}
			elseif ((<...>.<hendrix_checksum>) = 1)
				SetGlobalTags \{achievement_info
					Params = {
						hendrix_achievement_lefty_on = 1
					}}
			endif
			if ($current_difficulty = HARD || $current_difficulty = EXPERT)
				if NOT IsGuitarController controller = ($player1_status.controller)
					WriteAchievements \{Achievement = BUY_A_GUITAR_ALREADY}
				endif
			endif
		endif
	elseif GotParam \{Bonus}
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
		FormatText ChecksumName = gametype_checksum '%p_%s' P = <setlist_prefix> S = <difficulty_text_nl>
		SetGlobalTags <gametype_checksum> Params = {Complete = 1}
	else
		Tier = (<Tier> + 1)
		Progression_UnlockTier Tier = <Tier>
		FormatText ChecksumName = tiername 'tier%i' I = <Tier>
		Progression_UnlockVenue level_checksum = ($<tier_global>.<tiername>.Level)
	endif
	update_coop_progression
endscript

script Progression_UnlockVenue 
	get_current_band_checksum
	final_checksum = <band_checksum>
	ExtendCRC <final_checksum> ($LevelZones.<level_checksum>.Name) out = final_checksum
	SetGlobalTags <final_checksum> Params = {unlocked = 1}
	FormatText ChecksumName = venue_checksum 'venue_%s' S = ($LevelZones.<level_checksum>.Name)
	SetGlobalTags <venue_checksum> Params = {unlocked = 1}
endscript

script Progression_UnlockTier 
	get_progression_globals game_mode = ($game_mode)
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	Change \{progression_unlock_tier_last_song = 1}
	Change current_level = ($<tier_global>.<tier_checksum>.Level)
	Change setlist_previous_tier = <Tier>
	Change \{setlist_previous_song = 0}
	FormatText ChecksumName = old_tier_checksum 'tier%s' S = (<Tier> - 1)
	Change previous_level = ($<tier_global>.<old_tier_checksum>.Level)
	Progression_GetNumTierSong tier_global = <tier_global> Tier = <Tier>
	song_count = 0
	current_tier_global = <tier_global>
	begin
	Progression_GetTierSong tier_global = <current_tier_global> Tier = <Tier> song_count = <song_count>
	Progression_UnlockSong tier_global = <current_tier_global> Song = <Song>
	get_progression_globals \{game_mode = p1_quickplay}
	Progression_UnlockSong tier_global = <tier_global> Song = <Song>
	get_progression_globals \{game_mode = p2_quickplay}
	Progression_UnlockSong tier_global = <tier_global> Song = <Song>
	song_count = (<song_count> + 1)
	repeat 2
	if GotParam \{Complete}
		get_progression_globals game_mode = ($game_mode)
		setlist_prefix = ($<tier_global>.prefix)
		FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
		SetGlobalTags <tiername> Params = {Complete = 1}
	endif
endscript

script Progression_CheckIntroSongsComplete 
	Printf \{"Progression_CheckIntroSongsComplete"}
	get_progression_globals game_mode = ($game_mode)
	SongList = <tier_global>
	setlist_prefix = (<SongList>.prefix)
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	GetArraySize (<SongList>.<tier_checksum>.songs)
	<songs_required> = 2
	array_count = 0
	begin
	FormatText {
		ChecksumName = song_checksum
		'%p_song%i_tier%s'
		P = <setlist_prefix>
		I = (<array_count> + 1)
		S = <Tier>
		AddToStringLookup = TRUE
	}
	GetGlobalTags <song_checksum> Param = STARS
	if (<STARS> > 2)
		songs_required = (<songs_required> - 1)
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	SetGlobalTags <tiername> Params = {num_intro_songs_to_progress = <songs_required>}
	if (<songs_required> > 0)
		return \{FALSE}
	else
		return \{TRUE}
	endif
endscript

script Progression_CheckSongComplete 
	Printf \{"Progression_CheckSongComplete"}
	if GotParam \{Bonus}
		get_progression_globals game_mode = ($game_mode) Bonus
	else
		get_progression_globals game_mode = ($game_mode)
	endif
	SongList = <tier_global>
	Progression_GetDifficulty
	Progression_GetNumTierSong Tier = <Tier> tier_global = <tier_global>
	<songs_required> = <tier_size>
	setlist_prefix = (<SongList>.prefix)
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	GetArraySize (<SongList>.<tier_checksum>.songs)
	array_count = 0
	begin
	FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<array_count> + 1) S = <Tier> AddToStringLookup = TRUE
	GetGlobalTags <song_checksum> Param = STARS
	RemoveParameter \{boss}
	if (<Tier> = 6)
		GetGlobalTags <song_checksum> Param = boss noassert = 1
	endif
	if NOT GotParam \{boss}
		if (<STARS> > 2)
			songs_required = (<songs_required> - 1)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	SetGlobalTags <tiername> Params = {num_songs_to_progress = <songs_required>}
	if (<songs_required> > 0)
		return \{FALSE}
	else
		return \{TRUE}
	endif
endscript

script Progression_CheckEncoreComplete 
	Printf \{"Progression_CheckEncoreComplete"}
	get_progression_globals game_mode = ($game_mode)
	Progression_GetEncoreSong tier_global = <tier_global> Tier = <Tier>
	GetGlobalTags <song_checksum> Param = STARS
	if (<STARS> > 2)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Progression_CheckBossComplete 
	Printf \{"Progression_CheckBossComplete"}
	get_progression_globals game_mode = ($game_mode)
	Progression_GetBossSong tier_global = <tier_global> Tier = <Tier>
	GetGlobalTags <song_checksum> Param = STARS
	if (<STARS> > 2)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Progression_CheckSong5Star 
	Printf \{"Progression_CheckSong5Star"}
	get_progression_globals game_mode = ($game_mode)
	SongList = <tier_global>
	Tier = 1
	begin
	setlist_prefix = (<SongList>.prefix)
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	GetArraySize (<SongList>.<tier_checksum>.songs)
	GetGlobalTags <tiername> Param = unlocked
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	array_count = 0
	begin
	FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<array_count> + 1) S = <Tier> AddToStringLookup = TRUE
	GetGlobalTags <song_checksum> Param = unlocked
	GetGlobalTags <song_checksum> Param = STARS
	if NOT Progression_IsBossSong tier_global = <tier_global> Tier = <Tier> Song = (<SongList>.<tier_checksum>.songs [<array_count>])
		if NOT (<STARS> = 5)
			return \{FALSE}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat (<SongList>.num_tiers)
	return \{TRUE}
endscript

script Progression_CheckAllSongsCompleted 
	Printf \{"Progression_CheckAllSongsCompleted"}
	get_progression_globals game_mode = ($game_mode)
	SongList = <tier_global>
	Tier = 1
	begin
	setlist_prefix = (<SongList>.prefix)
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	GetArraySize (<SongList>.<tier_checksum>.songs)
	GetGlobalTags <tiername> Param = unlocked
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	array_count = 0
	begin
	FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<array_count> + 1) S = <Tier> AddToStringLookup = TRUE
	GetGlobalTags <song_checksum> Param = unlocked
	GetGlobalTags <song_checksum> Param = STARS
	if NOT (<STARS> > 2)
		return \{FALSE}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat (<SongList>.num_tiers)
	return \{TRUE}
endscript

script Progression_AlwaysBlock 
	Printf \{"Progression_AlwaysBlock"}
	return \{FALSE}
endscript

script Progression_CheckDiff 
	Printf \{"Progression_CheckDiff"}
	Progression_GetDifficulty
	if NOT (<diff> = <DIFFICULTY>)
		return \{FALSE}
	endif
	if GotParam \{mode}
		if NOT ($game_mode = <mode>)
			return \{FALSE}
		endif
	endif
	return \{TRUE}
endscript

script Progression_UnlockGuitar 
	Printf \{"Progression_UnlockGuitar"}
	if GotParam \{GUITAR}
		SetGlobalTags ($Secret_Guitars [(<GUITAR> - 1)].Id) Params = {unlocked_for_purchase = 1}
		if ($progression_unlocked_guitar = -1)
			Change progression_unlocked_guitar = ($Secret_Guitars [(<GUITAR> - 1)].Id)
		else
			Change progression_unlocked_guitar2 = ($Secret_Guitars [(<GUITAR> - 1)].Id)
		endif
		Change \{progression_unlocked_type = GUITAR}
	else
		Script_Assert \{"tried to unlock a bass"}
	endif
endscript

script Progression_SongFailed 
	Printf \{"Progression_SongFailed"}
	if ($coop_dlc_active = 1)
		return
	endif
	if ($game_mode = p1_career)
		UpdateAtoms \{Name = Progression}
	endif
	Change \{Achievements_SongWonFlag = 0}
	UpdateAtoms \{Name = Achievement}
endscript

script Progression_SongWon 
	Printf \{"Progression_SongWon"}
	additional_cash = 0
	Change \{progression_beat_game_last_song = 0}
	Change \{progression_unlock_tier_last_song = 0}
	Change \{progression_play_completion_movie = 0}
	Player = 1
	begin
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	new_stars = 3
	if ($<player_status>.Score >= $<player_status>.base_score * 2.8)
		new_stars = 5
	elseif ($<player_status>.Score >= $<player_status>.base_score * 2)
		new_stars = 4
	endif
	Change StructureName = <player_status> STARS = <new_stars>
	Player = (<Player> + 1)
	repeat $current_num_players
	if ($coop_dlc_active = 1)
		if ($player1_status.total_notes = $player1_status.NOTES_HIT)
			if NOT ($player1_status.total_notes = 0)
				WriteAchievements \{Achievement = LEADERS_OF_THE_PACK}
			endif
		endif
		return
	endif
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty_coop)
	else
		get_difficulty_text_nl DIFFICULTY = ($current_difficulty)
	endif
	get_song_prefix Song = ($current_song)
	get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl>
	if ($player1_status.total_notes > 0)
		p1_percent_complete = (100 * $player1_status.NOTES_HIT / $player1_status.total_notes)
		if (<p1_percent_complete> = 100)
			if ($game_mode = p1_quickplay)
				SetGlobalTags <songname> Params = {percent100 = 1}
			elseif ($game_mode = p2_quickplay)
				p2_percent_complete = (100 * $player2_status.NOTES_HIT / $player2_status.total_notes)
				if (<p2_percent_complete> = 100)
					SetGlobalTags <songname> Params = {percent100 = 1}
				endif
			endif
			if ($game_mode = p1_quickplay ||
					$game_mode = p1_career)
				SetGlobalTags <songname> Params = {achievement_gold_star = 1}
			endif
		endif
	endif
	if ($game_mode = p1_career)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		SongList = <tier_global>
		get_band_game_mode_name
		FormatText ChecksumName = bandname_id 'band%i_info_%g' I = ($current_band) G = <game_mode_name>
		SetGlobalTags <bandname_id> Params = {first_play = 0}
		GetGlobalTags \{Progression
			Params = current_tier}
		GetGlobalTags \{Progression
			Params = current_song_count}
		song_count = <current_song_count>
		if GotParam \{current_tier}
			setlist_prefix = ($<SongList>.prefix)
			FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = <current_tier> AddToStringLookup = TRUE
			FormatText ChecksumName = tier_checksum 'tier%s' S = <current_tier>
			if Progression_IsBossSong tier_global = <tier_global> Tier = <current_tier> Song = (<tier_global>.<tier_checksum>.songs [<song_count>])
				Change \{StructureName = player1_status
					STARS = 5}
			endif
			GetGlobalTags <song_checksum> Param = STARS
			GetGlobalTags <song_checksum> Param = Score
			if NOT ($end_credits = 1)
				if ($game_mode = p1_career)
					new_score = ($player1_status.Score)
					new_stars = ($player1_status.STARS)
				endif
				if ($player1_status.total_notes > 0)
					p1_percent_complete = (100 * $player1_status.NOTES_HIT / $player1_status.total_notes)
					if (<p1_percent_complete> = 100)
						SetGlobalTags <song_checksum> Params = {percent100 = 1}
						SetGlobalTags <songname> Params = {percent100 = 1}
					endif
				endif
				if (<new_stars> > <STARS>)
					SetGlobalTags <song_checksum> Params = {STARS = <new_stars>}
					if ($current_tab = tab_setlist)
						if NOT StructureContains Structure = (<tier_global>.<tier_checksum>) nocash
							Progression_AwardCash old_stars = <STARS> new_stars = <new_stars>
						endif
					endif
				endif
				if (<new_score> > <Score>)
					CastToInteger \{new_score}
					SetGlobalTags <song_checksum> Params = {Score = <new_score>}
				endif
			endif
			Progression_CalcSetlistNextSong tier_global = <tier_global>
		endif
	endif
	Achievements_SongWon additional_cash = <additional_cash>
	if ($game_mode = p1_career)
		UpdateAtoms \{Name = Progression}
	endif
	Change \{Achievements_SongWonFlag = 1}
	UpdateAtoms \{Name = Achievement}
endscript
end_credits = 0
boss_devil_score = 0

script Progression_EndCredits 
	Printf \{"CREDITS BEGIN"}
	Change boss_devil_score = ($player1_status.Score)
	Change \{current_level = load_z_Credits}
	ui_flow_manager_respond_to_action \{action = select_retry}
	Change \{current_song = kingsandqueenscredits}
	create_loading_screen
	Load_Venue
	restart_gem_scroller song_name = ($current_song) DIFFICULTY = ($current_difficulty) difficulty2 = ($current_difficulty2) StartTime = 0 end_credits_restart = 1
	destroy_loading_screen
	start_flow_manager \{flow_state = career_play_song_fs}
	SpawnScriptNow \{scrolling_list_begin}
endscript

script Progression_EndCredits_Done 
	if ($end_credits = 1)
		Change \{boss_devil_score = 0}
	endif
	destroy_credits_menu
endscript

script PlayMovie_EndCredits 
	KillAllMovies
	PreLoadMovie \{movie = 'Fret_Flames'
		TextureSlot = 1
		TexturePri = -2
		no_loop
		no_hold}
	begin
	if (isMoviePreLoaded TextureSlot = 1)
		StartPreLoadedMovie \{TextureSlot = 1}
		return
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script Progression_CalcSetlistNextSong 
	if ($current_tab = tab_setlist)
		setlist_prefix = ($<tier_global>.prefix)
		num_tiers = ($<tier_global>.num_tiers)
		Tier = 1
		begin
		FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
		GetGlobalTags <tiername> Param = unlocked
		if (<unlocked> = 0)
			Tier = (<Tier> - 1)
			break
		endif
		Tier = (<Tier> + 1)
		repeat <num_tiers>
		if (<Tier> > <num_tiers>)
			Tier = <num_tiers>
		endif
		found = 0
		Progression_GetBossSong tier_global = <tier_global> Tier = <Tier>
		if (<song_count> = -1 && found = 0)
			FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = <Tier> AddToStringLookup = TRUE
			GetGlobalTags <song_checksum> Param = unlocked
			if (<unlocked> = 1)
				found = 1
			endif
		endif
		Progression_GetEncoreSong tier_global = <tier_global> Tier = <Tier>
		if (<song_count> = -1 && found = 0)
			FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = <Tier> AddToStringLookup = TRUE
			GetGlobalTags <song_checksum> Param = unlocked
			if (<unlocked> = 1)
				found = 1
			endif
		endif
		if (<found> = 0)
			FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
			GetArraySize (<tier_global>.<tier_checksum>.songs)
			song_count = 0
			begin
			FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = <Tier> AddToStringLookup = TRUE
			GetGlobalTags <song_checksum> Param = STARS
			GetGlobalTags <song_checksum> Param = unlocked
			if (<STARS> < 3 && <unlocked> = 1)
				found = 1
				break
			endif
			song_count = (<song_count> + 1)
			repeat <array_Size>
		endif
		if (<found> = 1)
			Change setlist_previous_tier = <Tier>
			Change setlist_previous_song = <song_count>
		endif
	endif
endscript

script Progression_AwardCash 
	Printf \{"Progression_AwardCash"}
	Cash = -1
	if ($end_credits = 1)
		return \{additional_cash = 0}
	endif
	GetArraySize \{$Cash_System_rules}
	array_count = 0
	begin
	Progression_GetDifficulty
	if (<DIFFICULTY> = $Cash_System_rules [<array_count>].diff)
		if (<new_stars> = $Cash_System_rules [<array_count>].newstars)
			if (<old_stars> = $Cash_System_rules [<array_count>].oldstars)
				Cash = ($Cash_System_rules [<array_count>].Cash)
			endif
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if (<new_stars> = <old_stars>)
		Cash = 0
	endif
	if (<Cash> = -1)
		PrintStruct <...>
		ScriptAssert \{"Cash Rules not found"}
	endif
	Change StructureName = player1_status new_cash = (<Cash> + $player1_status.new_cash)
	additional_cash = <Cash>
	get_current_band_info
	GetGlobalTags <band_info>
	<Cash> = (<Cash> + <additional_cash>)
	SetGlobalTags <band_info> Params = {Cash = <Cash>}
	Printf "cash = %d" D = <Cash>
	return additional_cash = <additional_cash>
endscript

script Progression_CountCompletedSongsInCurrentTier 
	completed_songs = 0
	get_progression_globals game_mode = ($game_mode)
	if NOT (<tier_global> = 0 || $setlist_selection_tier = 0)
		Progression_GetNumTierSong tier_global = <tier_global> Tier = ($setlist_selection_tier) All
		song_count = 0
		begin
		Progression_GetTierSong tier_global = <tier_global> Tier = ($setlist_selection_tier) song_count = <song_count>
		GetGlobalTags <song_checksum> Param = STARS
		RemoveParameter \{boss}
		if ($setlist_selection_tier = 6)
			GetGlobalTags <song_checksum> Param = boss noassert = 1
		endif
		if NOT GotParam \{boss}
			if NOT (<STARS> = 0)
				completed_songs = (<completed_songs> + 1)
			endif
		endif
		song_count = (<song_count> + 1)
		repeat <tier_size>
	endif
	return {completed_songs = <completed_songs>}
endscript

script Progression_GetNumTierSong 
	Printf \{"Progression_GetNumTierSong"}
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	if GotParam \{All}
		return tier_size = <array_Size>
	endif
	if StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep1
		array_Size = (<array_Size> - 1)
	endif
	if StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep2
		array_Size = (<array_Size> - 1)
	endif
	if StructureContains Structure = ($<tier_global>.<tier_checksum>) boss
	endif
	return tier_size = <array_Size>
endscript

script Progression_GetTierSong 
	Printf \{"Progression_GetTierSong"}
	setlist_prefix = ($<tier_global>.prefix)
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_count> + 1) S = <Tier>
	Song = ($<tier_global>.<tier_checksum>.songs [<song_count>])
	return Song = <Song> song_checksum = <song_checksum>
endscript

script Progression_GetBossSong 
	Printf \{"Progression_GetBossSong"}
	setlist_prefix = ($<tier_global>.prefix)
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	if StructureContains Structure = ($<tier_global>.<tier_checksum>) boss
		FormatText ChecksumName = song_checksum '%p_song3_tier%s' P = <setlist_prefix> S = <Tier>
		return song_count = 2 Song = bossjoe song_checksum = <song_checksum>
	else
		return \{song_count = -1
			Song = NONE
			song_checksum = NONE}
	endif
endscript

script Progression_GetEncoreSong \{Type = Any}
	Printf \{"Progression_GetEncoreSong"}
	setlist_prefix = ($<tier_global>.prefix)
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	if (<Type> = Any)
		if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep1
			if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep2
				return \{song_count = -1
					Song = NONE
					song_checksum = NONE}
			endif
		endif
	endif
	if (<Type> = P1)
		if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep1
			return \{song_count = -1
				Song = NONE
				song_checksum = NONE}
		endif
	endif
	if (<Type> = P2)
		if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep2
			return \{song_count = -1
				Song = NONE
				song_checksum = NONE}
		endif
	endif
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = (<array_Size> - 1)
	if (<Type> = P1)
		if StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep2
			array_count = (<array_count> - 1)
		endif
	endif
	FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<array_count> + 1) S = <Tier>
	Song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
	return song_count = <array_count> Song = <Song> song_checksum = <song_checksum>
endscript

script Progression_GetAerosmithEncoreSong \{Type = Any}
	Printf \{"Progression_GetAerosmithEncoreSong"}
	setlist_prefix = ($<tier_global>.prefix)
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	if (<Type> = Any)
		if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p1
			if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p2
				return \{song_count = -1
					Song = NONE
					song_checksum = NONE}
			endif
		endif
	endif
	if (<Type> = P1)
		if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p1
			return \{song_count = -1
				Song = NONE
				song_checksum = NONE}
		endif
	endif
	if (<Type> = P2)
		if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p2
			return \{song_count = -1
				Song = NONE
				song_checksum = NONE}
		endif
	endif
	if (<Tier> = 6)
		<song_num> = 3
	else
		<song_num> = 2
	endif
	FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<song_num> + 1) S = <Tier>
	Song = ($<tier_global>.<tier_checksum>.songs [<song_num>])
	return song_count = <song_num> Song = <Song> song_checksum = <song_checksum>
endscript

script Progression_IsBossSong 
	if NOT GotParam \{Tier}
		return \{FALSE}
	endif
	query_song = <Song>
	Progression_GetBossSong <...>
	if (<Song> = <query_song>)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Progression_IsEncoreSong 
	query_song = <Song>
	Progression_GetEncoreSong <...> Type = P1
	PrintStruct <...>
	if (<Song> = <query_song>)
		return \{TRUE}
	endif
	Progression_GetEncoreSong <...> Type = P2
	PrintStruct <...>
	if (<Song> = <query_song>)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Progression_IsFirstAerosmithSong 
	Printf \{"Progression_IsFirstAerosmithSong"}
	get_progression_globals game_mode = ($game_mode)
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	<Index> = 0
	begin
	if (($<tier_global>.<tier_checksum>.songs [<Index>]) = <Song>)
		break
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	if (<Index> = 2)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script Progression_UnlockSong \{ENCORE = 0
		boss = 0
		unlocked = 0
		AEROSMITH = 0}
	Printf \{"Progression_UnlockSong"}
	setlist_prefix = ($<tier_global>.prefix)
	Tier = 1
	begin
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	if ($<tier_global>.<tier_checksum>.songs [<array_count>] = <Song>)
		FormatText ChecksumName = song_checksum '%p_song%i_tier%s' P = <setlist_prefix> I = (<array_count> + 1) S = <Tier>
		SetGlobalTags <song_checksum> Params = {unlocked = 1}
		if ($current_song = bossjoe)
			FormatText \{ChecksumName = bonus_song_checksum
				'%p_song%i_tier%s'
				P = 'bonus'
				I = 11
				S = 1}
			SetGlobalTags <bonus_song_checksum> Params = {unlocked = 1}
			SetGlobalTags ($GH3_Bonus_Songs.tier1.songs [10]) Params = {unlocked = 1}
		endif
		if (<ENCORE> = 1)
			SetGlobalTags <tiername> Params = {encore_unlocked = 1}
		elseif (<boss> = 1)
			SetGlobalTags <tiername> Params = {boss_unlocked = 1}
		elseif (<AEROSMITH> = 1)
			SetGlobalTags <tiername> Params = {aerosmith_unlocked = 1}
		endif
		SetGlobalTags <tiername> Params = {unlocked = 1}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<tier_global>.num_tiers)
endscript

script Progression_GetDifficulty 
	DIFFICULTY = ($current_difficulty)
	return DIFFICULTY = <DIFFICULTY>
endscript

script Progression_SetProgressionNodeFlags 
	if ($coop_dlc_active = 1)
		Change \{game_mode = p2_career}
	endif
	ChangeNodeFlag \{LS_ALWAYS
		1}
	if GotParam \{perry_mic_stand}
		Printf "=== LS_PERRY_MIC: %d" D = <perry_mic_stand>
		ChangeNodeFlag LS_PERRY_MIC <perry_mic_stand>
	endif
	ls_encore = 0
	ls_3_5 = 0
	get_progression_globals game_mode = ($game_mode)
	Tier = ($setlist_selection_tier)
	if ($game_mode = p1_career)
		if Progression_IsEncoreSong tier_global = <tier_global> Tier = <Tier> Song = ($current_song)
			ls_encore = 1
		endif
	endif
	get_song_struct Song = ($current_song)
	if StructureContains Structure = <song_struct> Name = guitarist_checksum
		if (<song_struct>.guitarist_checksum = AEROSMITH)
			ls_3_5 = 1
		endif
	endif
	Printf "Progression_SetProgressionNodeFlags encore = %d 3_5 = %i" D = <ls_encore> I = <ls_3_5>
	if (<ls_encore> = 1)
		ChangeNodeFlag \{LS_3_5_PRE
			0}
		ChangeNodeFlag \{LS_3_5_POST
			1}
		ChangeNodeFlag \{LS_ENCORE_PRE
			0}
		ChangeNodeFlag \{LS_ENCORE_POST
			1}
	elseif (<ls_3_5> = 1)
		ChangeNodeFlag \{LS_3_5_PRE
			0}
		ChangeNodeFlag \{LS_3_5_POST
			1}
		ChangeNodeFlag \{LS_ENCORE_PRE
			1}
		ChangeNodeFlag \{LS_ENCORE_POST
			0}
	else
		ChangeNodeFlag \{LS_3_5_PRE
			1}
		ChangeNodeFlag \{LS_3_5_POST
			0}
		ChangeNodeFlag \{LS_ENCORE_PRE
			1}
		ChangeNodeFlag \{LS_ENCORE_POST
			0}
	endif
	GetPakManCurrentName \{map = Zones}
	if GotParam \{pakname}
		FormatText ChecksumName = zone_setup '%s_SetupNodeflags' S = <pakname>
		if ScriptExists <zone_setup>
			SpawnScriptNow <zone_setup>
		endif
	endif
endscript
P1_career_progression = {
	tier_global = GH3_Career_Songs
	progression_global = GH3_Career_Progression
}
Bonus_progression = {
	tier_global = GH3_Bonus_Songs
	progression_global = NONE
}
Download_progression = {
	tier_global = GH3_Download_Songs
	progression_global = NONE
}
General_progression = {
	tier_global = GH3_General_Songs
	progression_global = NONE
}
Demo_progression_Career = {
	tier_global = GH3_Demo_Songs_Career
	progression_global = NONE
}
Demo_progression_Coop = {
	tier_global = GH3_Demo_Songs_Coop
	progression_global = NONE
}
Demo_progression_Multiplayer = {
	tier_global = GH3_Demo_Songs_Multiplayer
	progression_global = NONE
}
Demo_progression_Quickplay = {
	tier_global = GH3_Demo_Songs_Quickplay
	progression_global = NONE
}

script get_progression_globals game_mode = <game_mode> use_current_tab = 0
	if (<use_current_tab> = 1)
		if ($current_tab = tab_bonus)
			Bonus = 1
		elseif ($current_tab = tab_downloads)
			Download = 1
		endif
	endif
	if ($is_demo_mode = 1)
		if GotParam \{Bonus}
			AddParams ($Bonus_progression)
		elseif GotParam \{Download}
			AddParams ($Download_progression)
		elseif (<game_mode> = p1_career)
			AddParams ($Demo_progression_Career)
		elseif (<game_mode> = p1_quickplay)
			AddParams ($Demo_progression_Quickplay)
		elseif (<game_mode> = p2_quickplay)
			AddParams ($Demo_progression_Coop)
		else
			AddParams ($Demo_progression_Multiplayer)
		endif
		return tier_global = <tier_global> progression_global = <progression_global>
	endif
	if GotParam \{Bonus}
		AddParams ($Bonus_progression)
	elseif GotParam \{Download}
		AddParams ($Download_progression)
	elseif (<game_mode> = p1_career)
		AddParams ($P1_career_progression)
	elseif (<game_mode> = p1_quickplay)
		AddParams ($General_progression)
	elseif (<game_mode> = p2_quickplay)
		AddParams ($General_progression)
	elseif (<game_mode> = p2_coop)
		AddParams ($General_progression)
	else
		AddParams ($General_progression)
	endif
	return tier_global = <tier_global> progression_global = <progression_global>
endscript

script update_coop_progression 
	Printf \{"update_coop_progression"}
	<Tier> = 1
	begin
	get_progression_globals \{game_mode = p2_quickplay}
	SongList = <tier_global>
	setlist_prefix = (<SongList>.prefix)
	FormatText ChecksumName = tiername '%ptier%i' P = <setlist_prefix> I = <Tier>
	FormatText ChecksumName = tier_checksum 'tier%s' S = <Tier>
	<songs_required> = 4
	array_count = 0
	begin
	get_song_prefix Song = ((<tier_global>.<tier_checksum>).songs [<array_count>])
	get_quickplay_song_stars Song = <song_prefix>
	if (<STARS> > 2)
		songs_required = (<songs_required> - 1)
	endif
	array_count = (<array_count> + 1)
	repeat 4
	if (<songs_required> <= 0)
		Progression_GetEncoreSong tier_global = <tier_global> Tier = <Tier>
		get_progression_globals \{game_mode = p2_quickplay}
		Progression_UnlockSong tier_global = <tier_global> Song = <Song>
	endif
	get_song_prefix Song = ((<tier_global>).<tier_checksum>.songs [4])
	get_quickplay_song_stars Song = <song_prefix>
	if (<STARS> > 2)
		if (<Tier> < 6)
			<next_tier> = (<Tier> + 1)
			Progression_GetNumTierSong tier_global = <tier_global> Tier = <next_tier>
			<song_count> = 0
			<current_tier_global> = <tier_global>
			FormatText ChecksumName = next_tier_checksum 'tier%s' S = <next_tier>
			<next_level_checksum> = ($<tier_global>.<next_tier_checksum>.Level)
			FormatText ChecksumName = next_venue_checksum 'venue_%s' S = ($LevelZones.<next_level_checksum>.Name)
			GetGlobalTags <next_venue_checksum> Param = unlocked
			if (<unlocked> = 0)
				SetGlobalTags <next_venue_checksum> Params = {unlocked = 1}
				if ($game_mode = p2_quickplay)
					Change current_level = <next_level_checksum>
					Change g_last_venue_selected = <next_level_checksum>
				endif
			endif
			begin
			Progression_GetTierSong {
				tier_global = <current_tier_global>
				Tier = <next_tier>
				song_count = <song_count>
			}
			get_progression_globals \{game_mode = p2_quickplay}
			Progression_UnlockSong tier_global = <tier_global> Song = <Song>
			<song_count> = (<song_count> + 1)
			repeat 4
		endif
	endif
	<Tier> = (<Tier> + 1)
	repeat 6
	UpdateAtoms \{Name = Achievement}
endscript
