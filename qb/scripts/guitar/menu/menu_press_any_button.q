g_pab_need_to_pause = 0

script create_press_any_button_menu 
	ReAcquireControllers
	Change \{primary_controller_assigned = 0}
	ClearXUserSigninInfo
	Change \{main_menu_movie_first_time = 0}
	if NOT IsUserMusicPlaying
		SoundEvent \{Event = Menu_Guitar_Lick_SFX}
		SpawnScriptNow \{Menu_Music_On
			Params = {
				waitforguitarlick = 1
			}}
	else
		SpawnScriptNow \{Menu_Music_On}
	endif
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = pab_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		PARENT = pab_container
		Id = pab_menu_backdrop
		texture = boot_copyright_bg
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 360.0)
		Dims = (1280.0, 720.0)
		just = [
			Center
			Center
		]
		z_priority = 0}
	menu_press_any_button_create_obvious_text
	if ($g_pab_need_to_pause = 1)
		Wait \{0.3
			Seconds}
		Change \{g_pab_need_to_pause = 0}
	endif
	SpawnScriptNow \{check_for_any_input}
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	SpawnScriptNow \{attract_mode_spawner}
endscript

script destroy_press_any_button_menu 
	destroy_menu \{menu_id = pab_container}
	KillSpawnedScript \{Name = check_for_any_input}
	KillSpawnedScript \{Name = attract_mode_spawner}
endscript

script attract_mode_spawner 
	if NotCD
		wait_time = 5
	else
		wait_time = 110
	endif
	begin
	Printf "Wait_time for begin attract %i" I = <wait_time>
	if (<wait_time> = 0)
		break
	endif
	Wait \{1
		Second}
	wait_time = (<wait_time> - 1)
	repeat
	Change \{g_pab_need_to_pause = 1}
	if ($invalid_controller_lock = 1)
		begin
		if ($invalid_controller_lock = 0)
			break
		endif
		Wait \{1
			GameFrame}
		repeat
	endif
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		Params = {
			action = enter_attract_mode
			play_sound = 0
		}}
endscript
Attract_Mode_Info = [
	{
		Level = load_z_hof
		Song = catscratchfever
		mode = p1_quickplay
		BAND = default_band
		p1_character_id = Axel
		p2_character_id = JUDY
		p1_instrument_id = Instrument_SG_Goddess_Blue
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EXPERT
		p2_difficulty = EXPERT
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 6
		p2_style = 1
	}
	{
		Level = load_z_Fenway
		Song = sweetemotion
		mode = p1_quickplay
		BAND = aerosmith_band
		p1_character_id = JUDY
		p2_character_id = CASEY
		p1_instrument_id = Instrument_Firebird_Blue
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EXPERT
		p2_difficulty = EXPERT
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		Level = load_z_Fenway
		Song = walkthiswayrundmc
		mode = p1_quickplay
		BAND = aerosmith_band_dmc
		p1_character_id = JUDY
		p2_character_id = CASEY
		p1_instrument_id = Instrument_Firebird_Blue
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EXPERT
		p2_difficulty = EXPERT
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		Level = load_z_JPPlay
		Song = sextypething
		mode = p1_quickplay
		BAND = default_band
		p1_character_id = XAVIER
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EXPERT
		p2_difficulty = EXPERT
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 7
		p2_style = 1
	}
	{
		Level = load_z_MaxsKC
		Song = completecontrol
		mode = p1_quickplay
		BAND = default_band
		p1_character_id = JOHNNY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_White_Vee
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EXPERT
		p2_difficulty = EXPERT
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 7
		p2_style = 1
	}
	{
		Level = load_z_nine_lives
		Song = alldayandallofthenight
		mode = p1_quickplay
		BAND = default_band
		p1_character_id = CASEY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EXPERT
		p2_difficulty = EXPERT
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 6
		p2_style = 1
	}
	{
		Level = load_z_Fenway
		Song = dreamon
		mode = p1_quickplay
		BAND = aerosmith_band
		p1_character_id = JUDY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_EpiPaul01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EXPERT
		p2_difficulty = EXPERT
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		Level = load_z_hof
		Song = shesellssanctuary
		mode = p1_quickplay
		BAND = default_band
		p1_character_id = JUDY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_wylde
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EXPERT
		p2_difficulty = EXPERT
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		Level = load_z_Fenway
		Song = ihatemyselfforlovingyou
		mode = p1_quickplay
		BAND = default_band
		p1_character_id = CASEY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_ES400_Red
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EXPERT
		p2_difficulty = EXPERT
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 6
		p2_style = 1
	}
	{
		Level = load_z_JPPlay
		Song = Ragdoll
		mode = p1_quickplay
		BAND = aerosmith_band
		p1_character_id = LARS
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Silver_Vee
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EXPERT
		p2_difficulty = EXPERT
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
]
last_attract_mode = -1
is_attract_mode = 0

script create_attract_mode 
	Change \{is_attract_mode = 1}
	create_loading_screen
	SoundBussUnlock \{Guitar_Balance}
	SoundBussUnlock \{Band_Balance}
	SetSoundBussParams \{Guitar_Balance = {
			vol = -100.0
		}
		Time = 1.5}
	SetSoundBussParams \{Band_Balance = {
			vol = -100.0
		}
		Time = 1.5}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{Band_Balance}
	EnableUserMusic \{disable}
	kill_start_key_binding
	GetArraySize \{$Attract_Mode_Info}
	if (<array_Size> = 1)
		attract_mode_index = 0
	else
		if ($last_attract_mode >= 0)
			GetRandomValue Name = attract_mode_index Integer A = 0 B = (<array_Size> - 2)
			if (<attract_mode_index> >= $last_attract_mode)
				attract_mode_index = (<attract_mode_index> + 1)
			endif
		else
			GetRandomValue Name = attract_mode_index Integer A = 0 B = (<array_Size> - 1)
		endif
		Change last_attract_mode = <attract_mode_index>
	endif
	p1_outfit = 1
	p2_outfit = 1
	p1_style = 1
	p2_style = 1
	AddParams ($Attract_Mode_Info [<attract_mode_index>])
	Change \{StructureName = player1_status
		bot_play = 1}
	Change \{StructureName = player2_status
		bot_play = 1}
	Change current_level = <Level>
	Change game_mode = <mode>
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		Change \{current_num_players = 2}
	else
		Change \{current_num_players = 1}
	endif
	Change StructureName = player1_status character_id = <p1_character_id>
	Change StructureName = player2_status character_id = <p2_character_id>
	Change StructureName = player1_status instrument_id = <p1_instrument_id>
	Change StructureName = player2_status instrument_id = <p2_instrument_id>
	Change StructureName = player1_status outfit = <p1_outfit>
	Change StructureName = player2_status outfit = <p2_outfit>
	Change StructureName = player1_status style = <p1_style>
	Change StructureName = player2_status style = <p2_style>
	SoundBussUnlock \{Master}
	SetSoundBussParams \{Master = {
			vol = -11.0
		}
		Time = 0.5}
	SoundBussLock \{Master}
	mark_unsafe_for_shutdown
	UnPauseGame
	Load_Venue
	start_gem_scroller song_name = <Song> DIFFICULTY = <p1_difficulty> difficulty2 = <p2_difficulty> StartTime = 0 device_num = ($player1_status.controller)
	create_attract_mode_text
	StopRendering
	destroy_loading_screen
	Change \{is_changing_levels = 0}
	SoundBussUnlock \{Guitar_Balance}
	SoundBussUnlock \{Band_Balance}
	SetSoundBussParams {Guitar_Balance = {vol = (($Default_BussSet.Guitar_Balance.vol) - 1.5)}}
	SetSoundBussParams {Band_Balance = {vol = (($Default_BussSet.Band_Balance.vol) - 1.5)}}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{Band_Balance}
	SpawnScriptNow \{check_for_attract_mode_input}
endscript

script create_attract_mode_text 
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = am_container
		Pos = (0.0, 0.0)}
	Text = "JUST PUSH ANY BUTTON TO PLAY..."
	text_pos = (640.0, 637.0)
	CreateScreenElement {
		Type = TextElement
		Text = <Text>
		Pos = <text_pos>
		PARENT = am_container
		rgba = [220 220 220 255]
		font = fontgrid_title_gh3
		just = [Center Bottom]
		Scale = 0.9
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($G_menu_colors).violet_focus)
	}
	GetScreenElementDims Id = <Id>
	fit_text_in_rectangle Id = <Id> Dims = ((700.0, 0.0) + (<Height> * (0.0, 1.0))) start_x_scale = 0.9 start_y_scale = 0.9 only_if_larger_x = 1
	CreateScreenElement \{Type = SpriteElement
		PARENT = am_container
		texture = Main_Menu_logo
		Scale = 0.9
		Pos = (640.0, 465.0)
		just = [
			Center
			Center
		]}
endscript

script destroy_attract_mode_text 
	destroy_menu \{menu_id = am_container}
	StopAllSounds
	SoundBussUnlock \{Master}
	SetSoundBussParams {Master = {vol = ($Default_BussSet.Master.vol)}}
	SoundBussLock \{Master}
endscript

script check_for_attract_mode_input 
	begin
	GetButtonsPressed
	if NOT (<makes> = 0)
		break
	endif
	if NOT ($invite_controller = -1)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	wait_for_safe_shutdown
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		Params = {
			action = exit_attract_mode
		}}
endscript

script destroy_attract_mode 
	PauseGame
	destroy_attract_mode_text
	KillSpawnedScript \{Name = check_for_attract_mode_input}
	kill_gem_scroller
	Change \{StructureName = player1_status
		bot_play = 0}
	Change \{StructureName = player2_status
		bot_play = 0}
	UnPauseGame
	kill_start_key_binding
	Change \{is_attract_mode = 0}
	EnableUserMusic
endscript
invalid_controller_lock = 0

script check_for_any_input \{button1 = {
		}
		button2 = {
		}}
	begin
	GetButtonsPressed
	if (<makes> = 0)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	begin
	if IsStandardGuitarControllerPluggedIn
		if English
			notify_box scale1 = (0.6, 0.75) Scale2 = (0.5, 0.6) Container_pos = (0.0, 350.0) container_id = notify_invalid_device line1 = "An unsupported guitar peripheral has been detected." line2 = "Connect either a Guitar Hero guitar or" line3 = "Xbox 360 controller and press START to continue." menu_z = 510000 FormatText TextName = pakname '%s_text.pak' S = <stem>
		elseif French
			notify_box \{scale1 = (0.6, 0.75)
				Scale2 = (0.5, 0.6)
				Container_pos = (0.0, 350.0)
				container_id = notify_invalid_device
				line1 = "Une guitare non compatible a été détectée."
				line2 = "Connecter une manette guitare Guitar Hero ou"
				line3 = "une manette Xbox 360 et appuyer sur la touche START pour continuer."
				menu_z = 510000}
		elseif Italian
			notify_box \{scale1 = (0.6, 0.75)
				Scale2 = (0.5, 0.6)
				Container_pos = (0.0, 350.0)
				container_id = notify_invalid_device
				line1 = "È stata rilevata una periferica chitarra non supportata."
				line2 = "Collegare una chitarra Guitar Hero o"
				line3 = "un Controller Xbox 360 e premere START per continuare."
				menu_z = 510000}
		elseif German
			notify_box \{scale1 = (0.38000003, 0.75)
				Scale2 = (0.5, 0.6)
				Container_pos = (0.0, 350.0)
				container_id = notify_invalid_device
				line1 = "Ein nicht unterstütztes Peripheriegerät wurde gefunden."
				line2 = "Schließen Sie entweder eine Guitar Hero-Gitarre oder einen"
				line3 = "Xbox 360 Controller an und drücken Sie START, um fortzufahren."
				menu_z = 510000}
		elseif Spanish
			notify_box \{scale1 = (0.45000002, 0.75)
				Scale2 = (0.5, 0.6)
				Container_pos = (0.0, 350.0)
				container_id = notify_invalid_device
				line1 = "Se ha detectado una guitarra conectada como periférico no compatible."
				line2 = "Conecta una guitarra Guitar Hero o"
				line3 = "el mando Xbox 360 y pulsa START para continuar."
				menu_z = 510000}
		endif
		CreateScreenElement \{Type = SpriteElement
			Id = controller_fader
			PARENT = root_window
			texture = BLACK
			rgba = [
				0
				0
				0
				255
			]
			Pos = (640.0, 360.0)
			Dims = (1280.0, 720.0)
			just = [
				Center
				Center
			]
			z_priority = 509000
			Alpha = 0.7}
		Change \{invalid_controller_lock = 1}
		begin
		if NOT IsStandardGuitarControllerPluggedIn
			break
		endif
		Wait \{1
			GameFrame}
		repeat
		kill_notify_box \{container_id = notify_invalid_device}
		DestroyScreenElement \{Id = controller_fader}
		Change \{invalid_controller_lock = 0}
	endif
	if NOT ($invite_controller = -1)
		SpawnScriptNow ui_flow_manager_respond_to_action Params = {action = Continue flow_state_func_params = {device_num = ($invite_controller)}}
		break
	endif
	Continue = 0
	if GotParam \{use_primary_controller}
		if GuitarControllerMake <button1> ($primary_controller)
			<Continue> = 1
		elseif GuitarControllerMake <button2> ($primary_controller)
			<Continue> = 1
		endif
	else
		GetButtonsPressed <button1>
		if NOT (<makes> = 0)
			<Continue> = 1
		endif
	endif
	if (<Continue> = 1)
		SpawnScriptNow ui_flow_manager_respond_to_action Params = {action = Continue flow_state_func_params = {device_num = <device_num>}}
		break
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script menu_press_any_button_create_obvious_text 
	Text = "JUST PUSH ANY BUTTON TO PLAY..."
	text_pos = (665.0, 425.0)
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = pab_container
		font = text_a5
		Text = <Text>
		Dims = (500.0, 200.0)
		Pos = <text_pos>
		just = [LEFT Top]
		internal_just = [Center Top]
		rgba = [160 160 195 255]
		Scale = 0.7
		allow_expansion
	}
endscript
