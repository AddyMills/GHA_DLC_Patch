GH3_General_Coop_Progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = Progression_Coop_Init
		atom_params = {
		}
	}
	{
		Name = quickplay_coop_5star
		Type = Scr
		atom_script = Progression_Coop_5Star
		atom_params = {
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
			}
		]
	}
	{
		Name = quickplay_coop_complete_songs
		Type = Scr
		atom_script = Progression_Coop_Complete_Songs
		atom_params = {
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckAllSongsCompleted
				Params = {
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = Progression_Coop_EndOfFirstUpdate
		atom_params = {
		}
	}
]

script Progression_Coop_Init 
	Printf \{"Progression_Coop_Init"}
endscript

script Progression_Coop_EndOfFirstUpdate 
	Printf \{"Progression_Coop_EndOfFirstUpdate"}
endscript

script Progression_Coop_5Star 
	Printf \{"Progression_Coop_5Star"}
endscript

script Progression_Coop_Complete_Songs 
	Printf \{"Progression_Coop_Complete_Songs"}
endscript

script register_new_progression_atoms 
	Index = ($difficulty_list_props.($current_difficulty).Index)
	SetProgressionDifficulty DIFFICULTY = <Index>
	DeRegisterAtoms
	RegisterAtoms \{Name = Achievement
		$Achievement_Atoms}
	get_progression_globals game_mode = ($game_mode)
	if NOT (<progression_global> = NONE)
		RegisterAtoms Name = Progression $<progression_global>
		UpdateAtoms \{Name = Progression}
	endif
endscript
