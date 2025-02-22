
script Strum_iterator \{song_name = "test"
		DIFFICULTY = "easy"
		array_type = "song"
		part = ''}
	if NOT GotParam \{Target}
		Printf \{"Strum_iterator called without target!"}
		return
	endif
	get_song_prefix Song = <song_name>
	FormatText ChecksumName = Song '%s_song_%pexpert' S = <song_prefix> P = <part> AddToStringLookup
	array_entry = 0
	GetArraySize $<Song>
	if (<array_Size> = 0)
		return
	endif
	song_array_size = (<array_Size> / $num_song_columns)
	GetSongTimeMS time_offset = <time_offset>
	if NOT (<song_array_size> = 0)
		begin
		if ((<Time> - <skipleadin>) < ($<Song> [<array_entry>]))
			break
		endif
		<array_entry> = (<array_entry> + $num_song_columns)
		repeat <song_array_size>
		song_array_size = (<song_array_size> - (<array_entry> / $num_song_columns))
	endif
	ExtendCRC <Target> '_Info' out = info_struct
	begin
	if (<song_array_size> = 0)
		break
	endif
	TimeMarkerReached_SetParams time_offset = <time_offset> Array = <Song> array_entry = <array_entry>
	begin
	if TimeMarkerReached
		GetSongTimeMS time_offset = <time_offset>
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	TimeMarkerReached_ClearParams
	if (($<info_struct>.playing) = TRUE)
		note_length = ($<Song> [(<array_entry> + 1)])
		if (<note_length> > 0)
			LaunchEvent Type = strum_guitar Target = <Target> Data = {note_length = <note_length>}
		endif
	endif
	<array_entry> = (<array_entry> + $num_song_columns)
	repeat <song_array_size>
endscript

script FretPos_iterator 
	if NOT GotParam \{Target}
		Printf \{"FretPos_iterator called without target!"}
		return
	endif
	if ($disable_band = 1)
		return
	endif
	get_song_prefix Song = <song_name>
	FormatText ChecksumName = event_array '%s_anim_notes' S = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = Array
		Printf \{"FRETPOS ANIMS DISABLED: No midi events found for this song"}
		return
	endif
	ExtendCRC <Target> '_Info' out = info_struct
	array_entry = 0
	GetArraySize $<event_array>
	GetSongTimeMS time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<Time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if (<array_Size> = 0)
			return
		endif
		if (<part> = GUITAR)
			min_note = 118
			max_note = 127
		elseif (<part> = RHYTHM)
			min_note = 84
			max_note = 93
		else
			min_note = 101
			max_note = 110
		endif
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> Array = <event_array> array_entry = <array_entry> ArrayOfArrays
		begin
		if TimeMarkerReached
			GetSongTimeMS time_offset = <time_offset>
			break
		endif
		Wait \{1
			GameFrame}
		repeat
		TimeMarkerReached_ClearParams
		if (($<info_struct>.playing) = TRUE)
			note = ($<event_array> [<array_entry>] [1])
			Length = ($<event_array> [<array_entry>] [2])
			if ((<note> >= <min_note>) && (<note> <= <max_note>))
				if CompositeObjectExists Name = <Target>
					LaunchEvent Type = pose_fret Target = <Target> Data = {note = <note> note_length = <note_length>}
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
	endif
endscript

script FretFingers_iterator \{part = ''}
	FretFingers_iterator_CFunc_Setup
	begin
	if FretFingers_iterator_CFunc
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	FretFingers_iterator_CFunc_Cleanup
endscript

script WatchForStartPlaying_iterator 
	get_song_prefix Song = <song_name>
	FormatText ChecksumName = event_array '%s_song_expert' S = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = Array
		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	song_array_size = (<array_Size> / $num_song_columns)
	GetSongTimeMS time_offset = <time_offset>
	if NOT (<song_array_size> = 0)
		begin
		if ((<Time> - <skipleadin>) < $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + $num_song_columns)
		repeat <song_array_size>
		song_array_size = (<song_array_size> - (<array_entry> / $num_song_columns))
		if (<song_array_size> = 0)
			return
		endif
		TimeMarkerReached_SetParams time_offset = <time_offset> Array = <event_array> array_entry = <array_entry>
		begin
		if TimeMarkerReached
			GetSongTimeMS time_offset = <time_offset>
			break
		endif
		Wait \{1
			GameFrame}
		repeat
		TimeMarkerReached_ClearParams
		BroadCastEvent \{Type = start_playing}
	endif
endscript

script Faceoff_Anim_iterator \{song_name = "test"
		DIFFICULTY = "easy"
		array_type = "song"
		part = ''}
	Printf Channel = faceoff "Faceoff_Anim_iterator for player %a " A = <Player>
	if NOT GotParam \{Player}
		Printf \{"Faceoff_Anim_iterator called without param 'player'!"}
		return
	endif
	get_song_prefix Song = <song_name>
	FormatText ChecksumName = event_array '%s_faceoff%p' S = <song_prefix> P = <player_Text> AddToStringLookup
	array_entry = 0
	GetArraySize $<event_array>
	if (<array_Size> = 0)
		return
	endif
	GetSongTimeMS time_offset = <time_offset>
	begin
	if ((<Time> - <skipleadin>) < ($<event_array> [<array_entry>]) [0])
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	array_Size = (<array_Size> - <array_entry>)
	if (<array_Size> = 0)
		return
	endif
	begin
	begin
	GetSongTimeMS time_offset = <time_offset>
	if (<Time> >= $<event_array> [<array_entry>] [0])
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	Target = (<player_status>.band_Member)
	ExtendCRC <Target> '_Info' out = info_struct
	Change StructureName = <info_struct> playing = TRUE
	play_time = ($<event_array> [<array_entry>] [1])
	stop_playing_time = (($<event_array> [<array_entry>] [0]) + ($<event_array> [<array_entry>] [1]))
	begin
	GetSongTimeMS time_offset = <time_offset>
	if (<Time> >= <stop_playing_time>)
		break
	endif
	Wait \{1
		GameFrame}
	Printf Channel = faceoff "%a is playing" A = <Player>
	repeat
	Change StructureName = <info_struct> playing = FALSE
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
endscript

script Drum_iterator 
	Drum_iterator_CFunc_Setup
	begin
	if Drum_iterator_CFunc
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	Drum_iterator_CFunc_Cleanup
endscript

script Drum_cymbal_iterator 
	get_song_prefix Song = <song_name>
	FormatText ChecksumName = event_array '%s_drums_notes' S = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = Array
		Printf \{"FRETPOS ANIMS DISABLED: No midi events found for this song"}
		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	cymbal_anims = ($drummer_info.cymbal_anims)
	GetSongTimeMS time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<Time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if (<array_Size> = 0)
			return
		endif
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> Array = <event_array> array_entry = <array_entry> ArrayOfArrays
		begin
		if TimeMarkerReached
			GetSongTimeMS time_offset = <time_offset>
			break
		endif
		Wait \{1
			GameFrame}
		repeat
		TimeMarkerReached_ClearParams
		if CompositeObjectExists \{Name = DRUMMER}
			if ($drummer_info.playing_special_anim = FALSE)
				note = ($<event_array> [<array_entry>] [1])
				Length = ($<event_array> [<array_entry>] [2])
				if ((<note> >= 37) && (<note> <= 45))
					switch (<note>)
						case 44
						DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal1 timerId = CymbalTimer1 Anim = ($<cymbal_anims> [0]) BlendDuration = $cymbal_blend_time
						case 45
						DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal2 timerId = CymbalTimer2 Anim = ($<cymbal_anims> [1]) BlendDuration = $cymbal_blend_time
						case 43
						DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal3 timerId = CymbalTimer3 Anim = ($<cymbal_anims> [2]) BlendDuration = $cymbal_blend_time
						case 41
						DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal4 timerId = CymbalTimer4 Anim = ($<cymbal_anims> [3]) BlendDuration = $cymbal_blend_time
						case 42
						DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal4 timerId = CymbalTimer4 Anim = ($<cymbal_anims> [3]) BlendDuration = $cymbal_blend_time
					endswitch
				elseif ((<note> >= 49) && (<note> <= 57))
					switch (<note>)
						case 56
						DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal1 timerId = CymbalTimer1 Anim = ($<cymbal_anims> [0]) BlendDuration = $cymbal_blend_time
						case 57
						DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal2 timerId = CymbalTimer2 Anim = ($<cymbal_anims> [1]) BlendDuration = $cymbal_blend_time
						case 55
						DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal3 timerId = CymbalTimer3 Anim = ($<cymbal_anims> [2]) BlendDuration = $cymbal_blend_time
						case 53
						DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal4 timerId = CymbalTimer4 Anim = ($<cymbal_anims> [3]) BlendDuration = $cymbal_blend_time
						case 54
						DRUMMER :hero_play_anim Tree = $hero_drumming_branch Target = cymbal4 timerId = CymbalTimer4 Anim = ($<cymbal_anims> [3]) BlendDuration = $cymbal_blend_time
					endswitch
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
	endif
endscript
first_countoff_note = TRUE

script Drum_countoff_iterator 
	get_song_struct Song = <song_name>
	if StructureContains Structure = <song_struct> Name = countoff
		if ((<song_struct>.countoff) = 'hihat01' || (<song_struct>.countoff) = 'hihat02')
			return
		endif
	endif
	get_song_prefix Song = <song_name>
	FormatText ChecksumName = event_array '%s_drums_notes' S = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = Array
		Printf \{"FRETPOS ANIMS DISABLED: No midi events found for this song"}
		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	Change \{first_countoff_note = TRUE}
	GetSongTimeMS time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<Time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if (<array_Size> = 0)
			return
		endif
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> Array = <event_array> array_entry = <array_entry> ArrayOfArrays
		begin
		if TimeMarkerReached
			GetSongTimeMS time_offset = <time_offset>
			break
		endif
		Wait \{1
			GameFrame}
		repeat
		TimeMarkerReached_ClearParams
		if CompositeObjectExists \{Name = DRUMMER}
			note = ($<event_array> [<array_entry>] [1])
			Length = ($<event_array> [<array_entry>] [2])
			if (<note> = 70)
				next_note = ($<event_array> [(<array_entry> + 1)] [1])
				if (<next_note> = 70)
					DRUMMER :OBJ_SpawnScript \{play_countoff_anim}
				else
					DRUMMER :OBJ_SpawnScript \{play_countoff_anim
						Params = {
							last_countoff
						}}
					return
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
	endif
endscript

script play_countoff_anim 
	arm_anims = ($drummer_info.arm_anims)
	blend_time = 0.2
	if ($first_countoff_note = TRUE)
		Band_PlaySimpleAnim Name = DRUMMER Anim = ($<arm_anims>.sticktap_into_l)
		Change \{first_countoff_note = FALSE}
		if CompositeObjectExists \{Name = DRUMMER}
			DRUMMER :hero_wait_until_anim_finished
		endif
		blend_time = 0.0
	else
		Delay = (12.0 / 30.0)
		Wait <Delay> Seconds
	endif
	Band_PlaySimpleAnim Name = DRUMMER Anim = ($<arm_anims>.sticktap_l) BlendDuration = <blend_time>
endscript

script delay_drumkick_broadcast 
	Wait <Delay> Seconds
	BroadCastEvent Type = <Type>
endscript

script play_delayed_right_foot_anim 
	Wait <Delay> Seconds
	hero_play_anim Tree = $hero_drumming_branch Target = rightfoot timerId = rightfoot_timer Anim = <anim_name> BlendDuration = $drum_blend_time_kick
endscript

script handle_strum_event 
	Obj_KillSpawnedScript \{Name = hero_strum_guitar}
	Obj_SpawnScriptNow hero_strum_guitar Params = {note_length = <note_length>}
endscript

script handle_missed_strum_event 
	Obj_KillSpawnedScript \{Name = hero_strum_guitar}
	Obj_SpawnScriptNow hero_strum_guitar Params = {note_length = <note_length>}
endscript

script handle_start_playing 
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	if (<info_struct>.stance = INTRO || <info_struct>.stance = Intro_SmStg)
		handle_change_stance \{stance = Stance_A}
	endif
endscript

script handle_fret_event 
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	FormatText ChecksumName = track 'track_%n' N = <note>
	fret_anims = ($<info_struct>.fret_anims)
	if NOT StructureContains Structure = $<fret_anims> Name = <track>
		return
	endif
	Anim = (<fret_anims>.<track>)
	Obj_KillSpawnedScript \{Name = hero_play_fret_anim}
	Obj_SpawnScriptNow hero_play_fret_anim Params = {Anim = <Anim>}
endscript

script handle_finger_event 
	Obj_KillSpawnedScript \{Name = hero_play_chord}
	Obj_SpawnScriptNow hero_play_chord Params = {Chord = <Chord>}
endscript

script handle_missed_note 
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	if ($<info_struct>.playing_missed_note = FALSE)
		Change StructureName = <info_struct> playing_missed_note = TRUE
		strum_anims = $Bad_Strums
		anim_length = ($<info_struct>.last_strum_length)
		strum_anim = (<strum_anims>.<anim_length> [0])
		hero_play_strum_anim Anim = <strum_anim> BlendDuration = 0.1
	endif
endscript

script handle_hit_note 
	Obj_GetID
	handle_hit_note_CFunc
endscript

script handle_change_stance \{SPEED = 1.0}
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	display_debug_info = FALSE
	if (should_display_debug_info)
		display_debug_info = TRUE
	endif
	if GotParam \{No_wait}
		anim_set = ($<info_struct>.anim_set)
		old_stance = ($<info_struct>.stance)
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <old_stance> new_stance = <stance>
			hero_play_anim Anim = <anim_to_run> SPEED = <SPEED>
			Ragdoll_MarkForReset
			hero_wait_until_anim_finished
		else
			Ragdoll_MarkForReset
		endif
		Change StructureName = <info_struct> stance = <stance>
		Change StructureName = <info_struct> next_stance = <stance>
		if (<display_debug_info> = TRUE)
			Printf Channel = AnimInfo "%a stance is immediately changing to %b ...." A = <ObjID> B = <stance>
		endif
		if (<ObjID> = GUITARIST || <ObjID> = BASSIST || <ObjID> = RHYTHM)
			if (<stance> = INTRO || <stance> = Intro_SmStg || <stance> = Stance_FrontEnd || <stance> = Stance_FrontEnd_Guitar)
				Change StructureName = <info_struct> disable_arms = 2
				Change StructureName = <info_struct> next_anim_disable_arms = 2
			else
				Change StructureName = <info_struct> disable_arms = 0
				Change StructureName = <info_struct> next_anim_disable_arms = 0
			endif
			Obj_SwitchScript \{guitarist_idle}
		else
			Obj_SwitchScript \{BandMember_Idle}
		endif
	else
		if (<display_debug_info> = TRUE)
			Printf Channel = AnimInfo "%a is queuing stance change to %b............." A = <ObjID> B = <stance>
		endif
		Change StructureName = <info_struct> next_stance = <stance>
		if (<ObjID> = GUITARIST || <ObjID> = BASSIST || <ObjID> = RHYTHM)
			if (<stance> = INTRO || <stance> = Intro_SmStg || <stance> = Stance_FrontEnd || <stance> = Stance_FrontEnd_Guitar)
				Change StructureName = <info_struct> next_anim_disable_arms = 2
			else
				Change StructureName = <info_struct> next_anim_disable_arms = 0
			endif
		endif
	endif
	return
endscript

script queue_change_stance 
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	Change StructureName = <info_struct> next_stance = <stance>
endscript

script handle_play_anim 
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	display_debug_info = FALSE
	if (should_display_debug_info)
		display_debug_info = TRUE
	endif
	if GotParam \{No_wait}
		if (<display_debug_info> = TRUE)
			Printf Channel = AnimInfo "%a will immediately start the %b anim........" A = <ObjID> B = <Anim>
		endif
		Change StructureName = <info_struct> current_anim = <Anim>
		Change StructureName = <info_struct> next_anim = NONE
		if GotParam \{repeat_count}
			Change StructureName = <info_struct> anim_repeat_count = <repeat_count>
		else
			Change StructureName = <info_struct> anim_repeat_count = 1
		endif
		if GotParam \{CYCLE}
			Change StructureName = <info_struct> cycle_anim = TRUE
		else
			Change StructureName = <info_struct> cycle_anim = FALSE
		endif
		if (<Name> = GUITARIST || <Name> = BASSIST || <ObjID> = RHYTHM)
			if GotParam \{Disable_auto_arms}
				Change StructureName = <info_struct> disable_arms = 2
			elseif GotParam \{disable_auto_strum}
				Change StructureName = <info_struct> disable_arms = 1
			else
				Change StructureName = <info_struct> disable_arms = 0
			endif
		endif
		Ragdoll_MarkForReset
		Obj_KillSpawnedScript \{Name = hero_play_adjusting_random_anims}
		Obj_SpawnScriptNow hero_play_adjusting_random_anims Params = {Anim = <Anim>}
	else
		if (<display_debug_info> = TRUE)
			if (<info_struct>.next_anim != NONE)
				Printf Channel = AnimInfo "******* %a is replacing queued anim %b with %c ******* " A = <ObjID> B = (<info_struct>.next_anim) C = <Anim>
			else
				Printf Channel = AnimInfo "%a is queueing the %b anim........" A = <ObjID> B = <Anim>
			endif
		endif
		Change StructureName = <info_struct> next_anim = <Anim>
		if GotParam \{repeat_count}
			Change StructureName = <info_struct> next_anim_repeat_count = <repeat_count>
		else
			Change StructureName = <info_struct> next_anim_repeat_count = 1
		endif
		if GotParam \{CYCLE}
			Change StructureName = <info_struct> cycle_next_anim = TRUE
		else
			Change StructureName = <info_struct> cycle_next_anim = FALSE
		endif
		if (<Name> = GUITARIST || <Name> = BASSIST || <ObjID> = RHYTHM)
			if GotParam \{Disable_auto_arms}
				Change StructureName = <info_struct> next_anim_disable_arms = 2
			elseif GotParam \{disable_auto_strum}
				Change StructureName = <info_struct> next_anim_disable_arms = 1
			else
				Change StructureName = <info_struct> next_anim_disable_arms = 0
			endif
		endif
	endif
endscript

script handle_walking 
	Obj_GetID
	if (<ObjID> != <Name>)
		return
	endif
	ExtendCRC <ObjID> '_Info' out = info_struct
	if ($<info_struct>.allow_movement != TRUE)
		return
	endif
	if NOT ($<info_struct>.stance = Stance_A)
		anim_set = ($<info_struct>.anim_set)
		old_stance = ($<info_struct>.stance)
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <old_stance> new_stance = Stance_A
			hero_play_anim Anim = <anim_to_run>
			hero_wait_until_anim_finished
		endif
		Change StructureName = <info_struct> stance = Stance_A
	endif
	Change StructureName = <info_struct> disable_arms = 0
	Obj_SwitchScript guitarist_walking Params = {<...>}
endscript

script play_drum_anim \{Arm = LEFT
		BlendDuration = $drum_blend_time}
	if NOT GotParam \{Anim}
		return
	endif
	if (<Arm> = LEFT)
		Obj_KillSpawnedScript \{Name = play_drummer_left_arm_anim}
		Obj_SpawnScriptNow play_drummer_left_arm_anim Params = {Anim = <Anim> note = <note> BlendDuration = <BlendDuration>}
	else
		Obj_KillSpawnedScript \{Name = play_drummer_right_arm_anim}
		Obj_SpawnScriptNow play_drummer_right_arm_anim Params = {Anim = <Anim> note = <note> BlendDuration = <BlendDuration>}
	endif
endscript

script delay_play_drummer_left_arm_anim 
	if ($display_drummer_anim_info = TRUE)
	endif
	Wait <Delay> Seconds
	Obj_KillSpawnedScript \{Name = play_drummer_left_arm_anim}
	Obj_SpawnScriptNow play_drummer_left_arm_anim Params = {Anim = <Anim> note = <note> BlendDuration = <BlendDuration>}
endscript

script play_drummer_left_arm_anim 
	if GotParam \{note}
		Change StructureName = drummer_info last_left_arm_note = <note>
	endif
	hero_play_anim Tree = $hero_drumming_branch timerId = leftarm_timer Target = DrummerLeftArm Anim = <Anim> BlendDuration = <BlendDuration>
	hero_wait_until_anim_finished \{Timer = leftarm_timer}
	Wait \{$drummer_arm_blend_out_delay
		Seconds}
	anim_set = ($drummer_info.arm_anims)
	hero_play_anim Tree = $hero_drumming_branch timerId = leftarm_timer Target = DrummerLeftArm Anim = ($<anim_set>.stickdown_l) BlendDuration = $drum_blend_out_time CYCLE
	Wait \{$drummer_clear_arm_twist_value_delay
		Seconds}
	Change \{StructureName = drummer_info
		last_left_arm_note = 0}
endscript

script delay_play_drummer_right_arm_anim 
	if ($display_drummer_anim_info = TRUE)
		Printf Channel = DRUMMER "delaying drum right by %a seconds" A = <Delay>
	endif
	Wait <Delay> Seconds
	Obj_KillSpawnedScript \{Name = play_drummer_right_arm_anim}
	Obj_SpawnScriptNow play_drummer_right_arm_anim Params = {Anim = <Anim> note = <note> BlendDuration = <BlendDuration>}
endscript

script play_drummer_right_arm_anim 
	if GotParam \{note}
		Change StructureName = drummer_info last_right_arm_note = <note>
	endif
	hero_play_anim Tree = $hero_drumming_branch timerId = rightarm_timer Target = DrummerRightArm Anim = <Anim> BlendDuration = <BlendDuration>
	hero_wait_until_anim_finished \{Timer = rightarm_timer}
	Wait \{$drummer_arm_blend_out_delay
		Seconds}
	anim_set = ($drummer_info.arm_anims)
	hero_play_anim Tree = $hero_drumming_branch timerId = rightarm_timer Target = DrummerRightArm Anim = ($<anim_set>.stickdown_r) BlendDuration = $drum_blend_out_time CYCLE
	Wait \{$drummer_clear_arm_twist_value_delay
		Seconds}
	Change \{StructureName = drummer_info
		last_right_arm_note = 0}
endscript
