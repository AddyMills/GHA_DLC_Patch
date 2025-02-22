
script PlaySubtitledMovie 
	if NOT GotParam \{SubbedMovie}
		Printf \{"PlaySubtitledMovie: Requires the SubbedMovie param, see movie_text.q for an example of the structure."
			Channel = UI}
		return
	endif
	if ScreenElementExists \{Id = play_subtitled_movie_container}
		Printf \{"PlaySubtitledMovie: Script is already running, call KillSubtitledMovie first."
			Channel = UI}
		return
	endif
	if NOT (StructureContains Structure = SubbedMovie Name = movie_params)
		Printf \{"PlaySubtitledMovie: Script Requires the SubbedMovie param to contain a movie_params."
			Channel = UI}
		return
	endif
	if NOT (StructureContains Structure = SubbedMovie Name = events)
		Printf \{"PlaySubtitledMovie: Script Requires the SubbedMovie param to contain an array of event."
			Channel = UI}
		return
	endif
	<container_params> = {}
	<helper_params> = {}
	<skip_helper_params> = {}
	<exit_param> = {}
	if (StructureContains Structure = SubbedMovie Name = container_params)
		<container_params> = (<SubbedMovie>.container_params)
	endif
	if (StructureContains Structure = SubbedMovie Name = helper_params)
		<helper_params> = (<SubbedMovie>.helper_params)
	endif
	if (StructureContains Structure = SubbedMovie Name = skip_helper_params)
		<skip_helper_params> = (<SubbedMovie>.skip_helper_params)
	endif
	if (StructureContains Structure = SubbedMovie Name = exit_Script)
		<exit_params> = {exit_Script = (<SubbedMovie>.exit_Script)}
		if (StructureContains Structure = SubbedMovie Name = exit_script_params)
			<exit_params> = {<exit_params> exit_script_params = (<SubbedMovie>.exit_script_params)}
		endif
	endif
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = play_subtitled_movie_main_container
		Dims = (1280.0, 702.0)
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]}
	if NOT (StructureContains Structure = SubbedMovie Name = no_skip)
		SetScreenElementProps {
			Id = play_subtitled_movie_main_container
			event_handlers = [
				{pad_back NullScript}
				{pad_choose KillSubtitledMovie Params = {<exit_params>}}
			]
		}
		CreateScreenElement {
			rgba = [128 128 128 255]
			Text = "skip movie \\m0"
			just = [RIGHT Center]
			Pos = (1150.0, 620.0)
			Alpha = 1.0
			Scale = (0.8, 0.8)
			<skip_helper_params>
			Type = TextElement
			PARENT = play_subtitled_movie_main_container
			Id = play_subtitled_skip_helper
			font = text_A1
			z_priority = 1010
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
		}
	endif
	LaunchEvent \{Type = Focus
		Target = play_subtitled_movie_main_container}
	CreateScreenElement {
		<container_params>
		Type = ContainerElement
		PARENT = play_subtitled_movie_main_container
		Id = play_subtitled_movie_container
	}
	Printf \{"PlaySubtitledMovie: Container Element has been created."
		Channel = UI}
	CreateScreenElement {
		Text = "press \\m1 to continue"
		just = [Center Center]
		Alpha = 0.0
		Scale = (0.8, 0.8)
		<helper_params>
		Type = TextElement
		PARENT = play_subtitled_movie_container
		Id = play_subtitled_movie_helper
		font = text_A1
		z_priority = 1010
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	Printf \{"PlaySubtitledMovie: Helper Text Element has been created."
		Channel = UI}
	<default_create_element> = {}
	<default_fade_in_params> = {}
	<default_fade_out_params> = {}
	if (StructureContains Structure = SubbedMovie Name = default_create_element)
		<default_create_element> = (<SubbedMovie>.default_create_element)
	endif
	if (StructureContains Structure = SubbedMovie Name = default_fade_in_params)
		<default_fade_in_params> = (<SubbedMovie>.default_fade_in_params)
	endif
	if (StructureContains Structure = SubbedMovie Name = default_fade_out_params)
		<default_fade_out_params> = (<SubbedMovie>.default_fade_out_params)
	endif
	PushSoundBussParams
	if (StructureContains Structure = SubbedMovie Name = no_music)
		EnableUserMusic \{disable}
		SetSoundBussParams \{$No_Music_At_All_BussSet
			Time = 0.3}
	endif
	Printf \{"PlaySubtitledMovie: Launching SubtitleMovie..."
		Channel = UI}
	RunScriptOnScreenElement Id = play_subtitled_movie_container SubtitleMovie Params = {
		movie_params = (<SubbedMovie>.movie_params)
		events = (<SubbedMovie>.events)
		default_create_element = <default_create_element>
		default_fade_in_params = <default_fade_in_params>
		default_fade_out_params = <default_fade_out_params>
		exit_params = <exit_params>
	}
endscript

script KillSubtitledMovie \{exit_Script = NullScript
		exit_params = {
		}}
	SpawnScriptNow <exit_Script> Params = <exit_params>
	if ScreenElementExists \{Id = play_subtitled_movie_main_container}
		EnableUserMusic
		PopSoundBussParams
		DestroyScreenElement \{Id = play_subtitled_movie_main_container}
		LaunchEvent \{Broadcast
			Type = subtitled_movie_killed}
		Printf \{"KillSubtitledMovie: Subtitled movie has been destroyed."
			Channel = UI}
	else
		Printf \{"KillSubtitledMovie: There is no subtitled movie playing."
			Channel = UI}
	endif
endscript

script SubtitleMovie_PressToContinue 
	SetSpawnInstanceLimits \{MAX = 1
		management = ignore_spawn_request}
	LaunchEvent \{Broadcast
		Type = movie_text_press_to_continue}
endscript

script SubtitleMovie 
	SetSpawnInstanceLimits \{MAX = 1
		management = ignore_spawn_request}
	Printf \{"SubtitleMovie: Script has spawned."
		Channel = UI}
	KillAllMovies \{blocking}
	<movie> = (<movie_params>.movie)
	if (StructureContains Structure = movie_params Name = movie_ps3)
		if ISPS3
			<movie> = (<movie_params>.movie_ps3)
			if (StructureContains Structure = movie_params Name = movie_ps3x)
				GetEnterButtonAssignment
				if (<assignment> = CIRCLE)
					<movie> = (<movie_params>.movie_ps3x)
				endif
			endif
		endif
	endif
	CreateScreenElement {
		Scale = (1280.0, 720.0)
		<movie_params>
		movie = <movie>
		Type = MovieElement
		PARENT = play_subtitled_movie_container
		Id = play_subtitled_movie
		TextureSlot = 0
		z_priority = 1000
		start_frame = (<movie_params>.start_frame)
		loop_start = (<movie_params>.start_frame)
		loop_end = (<movie_params>.end_frame)
	}
	RemoveParameter \{movie}
	RemoveParameter \{movie_params}
	Wait \{1
		GameFrames}
	begin
	if (IsMoviePlaying TextureSlot = 0)
		Printf \{"SubtitleMovie: Movie element has started playing."
			Channel = UI}
		break
	endif
	Wait \{1
		GameFrames}
	repeat
	GetNextArrayElement <events>
	begin
	if NOT GotParam \{Element}
		Printf \{"SubtitleMovie: All events have completed, breaking out of loop."
			Channel = UI}
		break
	endif
	if NOT IsMoviePlaying \{TextureSlot = 0}
		Printf \{"SubtitleMovie: WARNING: Move unexpectedly ended, breaking out."
			Channel = UI}
		KillSubtitledMovie <exit_params>
		return
	endif
	GetMovieFrame \{TextureSlot = 0}
	Printf "SubtitleMovie: Current Movie Element Frame: %f" F = <Frame> Channel = UI
	if (<Frame> >= (<Element>.Frame))
		Printf "SubtitleMovie: Current Event Frame: %f" F = (<Element>.Frame) Channel = UI
		if (StructureContains Structure = Element Name = destroy_element)
			if GotParam \{curr_element}
				<fade_out_params> = {}
				if (StructureContains Structure = Element Name = fade_out_params)
					<fade_out_params> = (<Element>.fade_out_params)
				endif
				RunScriptOnScreenElement Id = <curr_element> DestroySubtitledMovieElement Params = {
					default_fade_out_params = <default_fade_out_params>
					fade_out_params = <fade_out_params>
				}
				RemoveParameter \{curr_element}
			endif
		endif
		if (StructureContains Structure = Element Name = create_element)
			if GotParam \{curr_element}
				RunScriptOnScreenElement Id = <curr_element> DestroySubtitledMovieElement
			endif
			<create_element> = (<Element>.create_element)
			if (StructureContains Structure = Element Name = create_element_ps3)
				if ISPS3
					<create_element> = (<Element>.create_element_ps3)
				endif
			endif
			CreateScreenElement {
				<default_create_element>
				<create_element>
				PARENT = play_subtitled_movie_container
				z_priority = 1005
			}
			RemoveParameter \{create_element}
			Printf \{"SubtitleMovie: Element has been created."
				Channel = UI}
			<curr_element> = <Id>
			if (StructureContains Structure = Element Name = fade_in_params)
				DoScreenElementMorph {
					<default_fade_in_params>
					(<Element>.fade_in_params)
					Id = <curr_element>
				}
			endif
		endif
		if (StructureContains Structure = Element Name = event_script)
			event_script_params = {}
			if (StructureContains Structure = Element Name = event_script_params)
				event_script_params = (<Element>.event_script_params)
			endif
			RunScriptOnScreenElement Id = play_subtitled_movie_container (<Element>.event_script) Params = <event_script_params>
		endif
		if (StructureContains Structure = Element Name = wait_for_input)
			PauseMovie \{TextureSlot = 0}
			Printf \{"SubtitleMovie: Movie element has paused playback."
				Channel = UI}
			DoScreenElementMorph \{Id = play_subtitled_movie_helper
				Alpha = 1.0
				Time = 0.5}
			SetScreenElementProps \{Id = play_subtitled_movie_main_container
				event_handlers = [
					{
						pad_back
						SubtitleMovie_PressToContinue
					}
				]
				Replace_Handlers}
			Block \{Type = movie_text_press_to_continue}
			Printf \{"SubtitleMovie: Input has been recieved."
				Channel = UI}
			DoScreenElementMorph \{Id = play_subtitled_movie_helper
				Alpha = 0.0
				Time = 0.5}
			SetScreenElementProps \{Id = play_subtitled_movie_main_container
				event_handlers = [
					{
						pad_back
						NullScript
					}
				]
				Replace_Handlers}
			ResumeMovie \{TextureSlot = 0}
			Printf \{"SubtitleMovie: Movie element has resumed playback."
				Channel = UI}
		endif
		if (StructureContains Structure = Element Name = wait_time)
			PauseMovie \{TextureSlot = 0}
			Printf \{"SubtitleMovie: Movie element has paused playback."
				Channel = UI}
			Wait (<Element>.wait_time) Seconds IgnoreSlomo
			Printf "SubtitleMovie: Movie element has waited %s seconds." S = (<Element>.wait_time) Channel = UI
			ResumeMovie \{TextureSlot = 0}
			Printf \{"SubtitleMovie: Movie element has resumed playback."
				Channel = UI}
		endif
		RemoveParameter \{Element}
		GetNextArrayElement <events>
	endif
	Wait \{1
		GameFrame}
	repeat
	WaitForMovieLoop \{TextureSlot = 0}
	Printf \{"SubtitleMovie: Movie element has finished playing."
		Channel = UI}
	PauseMovie \{TextureSlot = 0}
	Printf \{"SubtitleMovie: Movie element has paused playback."
		Channel = UI}
	KillSubtitledMovie <exit_params>
endscript

script DestroySubtitledMovieElement \{fade_out_params = {
		}}
	DoMorph {
		<default_fade_out_params>
		<fade_out_params>
	}
	DIE
	Printf \{"SubtitleMovie: Element has been destroyed."
		Channel = UI}
endscript
