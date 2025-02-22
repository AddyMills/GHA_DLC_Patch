
script create_bonus_videos_menu \{came_from_movie = 0}
	kill_start_key_binding
	if (<came_from_movie> = 1)
		SpawnScriptNow \{Menu_Music_On}
	endif
	Change \{bv_id_index = 0}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = bv_container
		Pos = (0.0, 0.0)}
	displaySprite \{PARENT = bv_container
		tex = options_videos_poster
		just = [
			Center
			Center
		]
		Pos = (640.0, 320.0)
		Dims = (850.0, 850.0)
		Rot_Angle = 3
		Z = 51}
	displaySprite \{PARENT = bv_container
		tex = White
		rgba = [
			220
			100
			100
			255
		]
		just = [
			Center
			Center
		]
		Pos = (640.0, 360.0)
		Dims = (700.0, 700.0)
		Rot_Angle = 3}
	displaySprite {
		PARENT = bv_container
		Id = bv_hilite
		tex = White
		rgba = [105 130 85 255]
		just = [Center Top]
		Pos = ($bv_hilite_array [0])
		Dims = (700.0, 40.0)
		Rot_Angle = 4
		Z = 49
	}
	displaySprite \{PARENT = bv_container
		tex = Toprockers_Tape_1
		Pos = (250.0, 130.0)
		Rot_Angle = 75
		Dims = (192.0, 96.0)
		Z = 100}
	displaySprite \{PARENT = bv_container
		tex = Toprockers_Tape_1
		rgba = [
			0
			0
			0
			128
		]
		Pos = (255.0, 135.0)
		Rot_Angle = 75
		Dims = (192.0, 96.0)
		Z = 99}
	displaySprite \{PARENT = bv_container
		tex = Toprockers_Tape_2
		Pos = (1070.0, 270.0)
		Rot_Angle = 75
		Dims = (192.0, 96.0)
		Z = 100
		flip_v}
	displaySprite \{PARENT = bv_container
		tex = Toprockers_Tape_1
		rgba = [
			0
			0
			0
			128
		]
		Pos = (1075.0, 275.0)
		Rot_Angle = 75
		Dims = (192.0, 96.0)
		Z = 99
		flip_v}
	CreateScreenElement \{Type = SpriteElement
		PARENT = bv_container
		texture = controller_2p_arrow
		Pos = (640.0, 450.0)
		just = [
			Center
			Center
		]
		Dims = (32.0, 64.0)
		Id = venue_down_arrow
		z_priority = 99
		Alpha = 1
		flip_h
		flip_v}
	CreateScreenElement \{Type = SpriteElement
		PARENT = bv_container
		texture = controller_2p_arrow
		Pos = (640.0, 450.0)
		just = [
			Center
			Center
		]
		Dims = (40.0, 72.0)
		Id = venue_down_arrow2
		z_priority = 99
		rgba = [
			0
			0
			0
			255
		]
		Alpha = 1
		flip_h
		flip_v}
	CreateScreenElement \{Type = SpriteElement
		PARENT = bv_container
		texture = controller_2p_arrow
		Pos = (640.0, 170.0)
		just = [
			Center
			Center
		]
		Dims = (32.0, 64.0)
		Id = venue_up_arrow
		z_priority = 99
		Alpha = 0}
	CreateScreenElement \{Type = SpriteElement
		PARENT = bv_container
		texture = controller_2p_arrow
		Pos = (640.0, 170.0)
		just = [
			Center
			Center
		]
		Dims = (40.0, 72.0)
		Id = venue_up_arrow2
		z_priority = 99
		rgba = [
			0
			0
			0
			255
		]
		Alpha = 0}
	Pos = ($bv_hilite_pos)
	I = 0
	begin
	FormatText ChecksumName = text_id 'bv_text_%d' D = <I>
	displayText {
		PARENT = bv_container
		Id = <text_id>
		font = text_a3
		Text = ($bv_text_array [<I>].Text)
		rgba = [255 245 225 255]
		Z = 50
		rot = 4
		just = [LEFT Top]
		Pos = <Pos>
		Scale = 1.2
		noshadow
	}
	GetScreenElementDims Id = <text_id>
	SetScreenElementProps Id = <text_id> Scale = 1.25
	fit_text_in_rectangle Id = <text_id> only_if_larger_x = 1 Dims = ((270.0, 0.0) + <Height> * (0.0, 1.25)) start_x_scale = 1.2
	<Pos> = (<Pos> + (-2.0, 40.0))
	if (<I> >= 1)
		if bv_should_gray_out_selection Text = ($bv_text_array [<I>].Text)
			SetScreenElementProps Id = <text_id> rgba = [140 55 60 255]
		else
			SetScreenElementProps Id = <text_id> rgba = [255 245 225 255]
		endif
	endif
	<I> = (<I> + 1)
	repeat 5
	event_handlers = [
		{pad_up bonus_videos_scroll_up}
		{pad_down bonus_videos_scroll_down}
		{pad_back bonus_videos_go_back}
	]
	new_menu {
		scrollid = mbv_scroll
		vmenuid = mbv_vmenu
		Menu_pos = (480.0, 130.0)
		text_left
		Spacing = -12
		Rot_Angle = 1
		no_wrap
		event_handlers = <event_handlers>
		no_focus = 1
	}
	text_params = {PARENT = mbv_vmenu Type = TextElement font = text_a3 rgba = [255 245 225 255] z_priority = -50 Rot_Angle = 3 Scale = 1.2}
	CreateScreenElement {
		<text_params>
		Id = video_option_id_0
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action Params = {Text = ($bv_text_array [0].Text) action = select_credits}}
		]
	}
	GetArraySize ($bv_text_array)
	Change bv_max_videos = <array_Size>
	I = 1
	begin
	FormatText ChecksumName = video_option_id 'video_option_id_%i' I = <I>
	CreateScreenElement {
		<text_params>
		Id = <video_option_id>
		event_handlers = [
			{pad_choose menu_bonus_videos_play_video Params = {Text = ($bv_text_array [<I>].Text) movie = ($bv_text_array [<I>].movie)}}
		]
	}
	<I> = (<I> + 1)
	repeat (<array_Size> - 1)
	LaunchEvent \{Type = Focus
		Target = mbv_vmenu}
	scroll_count = ($bv_index)
	Change \{bv_index = 0}
	I = 0
	if (<scroll_count> > 0)
		begin
		LaunchEvent \{Type = pad_down
			Target = mbv_vmenu}
		<I> = (<I> + 1)
		repeat <scroll_count>
	endif
	add_user_control_helper \{Text = "SELECT"
		button = Green
		Z = 100}
	add_user_control_helper \{Text = "BACK"
		button = RED
		Z = 100}
	add_user_control_helper \{Text = "UP/DOWN"
		button = Strumbar
		Z = 100}
endscript

script replace_video_option_handlers 
	GetArraySize ($bv_text_array)
	I = 0
	begin
	FormatText ChecksumName = video_option_id 'video_option_id_%i' I = <I>
	SetScreenElementProps Id = <video_option_id> event_handlers = [] Replace_Handlers
	<I> = (<I> + 1)
	repeat (<array_Size>)
endscript

script destroy_bonus_videos_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = bv_container}
	destroy_menu_backdrop
	destroy_menu \{menu_id = mbv_scroll}
endscript

script bonus_videos_go_back 
	if ($transitions_locked = 0)
		LaunchEvent \{Type = unfocus
			Target = mbv_vmenu}
	endif
	menu_flow_go_back
endscript
bv_text_array = [
	{
		Text = "CREDITS"
	}
	{
		Text = "GETTING TOGETHER"
		Id = AO_Long_1
		movie = 'AO_long_1'
	}
	{
		Text = "FIRST TASTE"
		Id = AO_long_2
		movie = 'AO_long_2'
	}
	{
		Text = "THE RETURN"
		Id = AO_long_3
		movie = 'AO_long_3'
	}
	{
		Text = "SUPERSTARS"
		Id = AO_long_4
		movie = 'AO_long_4'
	}
	{
		Text = "AMERICAN BAND"
		Id = AO_Long_5
		movie = 'AO_long_5'
	}
	{
		Text = "LEGENDS"
		Id = AO_long_6
		movie = 'AO_long_6'
	}
	{
		Text = "WHAT'S NEXT?"
		Id = AO_long_7
		movie = 'AO_long_7'
	}
	{
		Text = "CAREER 1"
		Id = AO_short_1
		movie = 'AO_short_1'
	}
	{
		Text = "CAREER 2"
		Id = AO_short_2
		movie = 'AO_short_2'
	}
	{
		Text = "CAREER 3"
		Id = AO_short_3
		movie = 'AO_short_3'
	}
	{
		Text = "CAREER 4"
		Id = AO_short_4
		movie = 'AO_short_4'
	}
	{
		Text = "CAREER 5"
		Id = AO_short_5
		movie = 'AO_short_5'
	}
	{
		Text = "CAREER 6"
		Id = AO_short_6
		movie = 'AO_short_6'
	}
	{
		Text = "CAREER END"
		Id = singleplayer_end
		movie = 'singleplayer_end'
	}
	{
		Text = "ACTIVISION"
		Id = atvi
		movie = 'atvi'
	}
	{
		Text = "RED OCTANE"
		Id = ro_logo
		movie = 'ro_logo'
	}
	{
		Text = "NEVERSOFT"
		Id = ns_logo
		movie = 'ns_logo'
	}
	{
		Text = "INTRO"
		Id = INTRO
		movie = 'intro'
	}
]
bv_hilite_array = [
	(640.0, 207.0)
	(640.0, 247.0)
	(640.0, 287.0)
	(640.0, 327.0)
	(640.0, 367.0)
]
bv_index = 0
bv_id_index = 0
bv_hilite_pos = (455.0, 190.0)
bv_max_videos = 6

script bv_unlock_intro_videos 
	SetGlobalTags ($bv_text_array [15].Id) Params = {unlocked = 1}
	SetGlobalTags ($bv_text_array [16].Id) Params = {unlocked = 1}
	SetGlobalTags ($bv_text_array [17].Id) Params = {unlocked = 1}
	SetGlobalTags ($bv_text_array [18].Id) Params = {unlocked = 1}
endscript

script bv_find_first_career_movie_index 
	GetArraySize \{$bv_text_array}
	<I> = 0
	begin
	if ($bv_text_array [<I>].Text = "CAREER 1")
		return Index = <I>
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
	ScriptAssert \{"Index not found in bv_find_first_career_movie_index"}
endscript

script bv_should_gray_out_selection 
	GetPlatform
	if NOT English
		if (<Platform> = PS2 || <Platform> = PS3)
			return \{FALSE}
		endif
	endif
	GetArraySize ($Bonus_Videos)
	bonus_size = <array_Size>
	GetArraySize ($bv_text_array)
	I = 1
	begin
	if GotParam \{Text}
		if (<Text> = ($bv_text_array [<I>].Text))
			GetGlobalTags ($bv_text_array [<I>].Id)
			if (<unlocked> = 0)
				return \{TRUE}
			else
				return \{FALSE}
			endif
		endif
	elseif GotParam \{movie}
		if (<movie> = ($bv_text_array [<I>].movie))
			GetGlobalTags ($bv_text_array [<I>].Id)
			if (<unlocked> = 0)
				return \{TRUE}
			else
				return \{FALSE}
			endif
		endif
	endif
	<I> = (<I> + 1)
	repeat (<array_Size> - 1)
	return \{FALSE}
endscript

script get_movie_id_by_name 
	GetArraySize ($bv_text_array)
	I = 5
	begin
	if (($bv_text_array [<I>].movie) = <movie>)
		return Id = ($bv_text_array [<I>].Id)
	endif
	<I> = (<I> + 1)
	repeat (<array_Size> - 5)
	PrintStruct <...>
	ScriptAssert \{"Movie not found in get_movie_id_by_name!"}
endscript

script bonus_videos_scroll_down \{quick = 0}
	FormatText ChecksumName = video_text_id 'bv_text_%d' D = ($bv_id_index)
	make_sound = 1
	if ($bv_id_index < 4)
		Change bv_id_index = ($bv_id_index + 1)
		SetScreenElementProps Id = bv_hilite Pos = ($bv_hilite_array [$bv_id_index])
		Change bv_index = ($bv_index + 1)
	else
		SetScreenElementProps \{Id = venue_up_arrow
			Alpha = 1}
		SetScreenElementProps \{Id = venue_up_arrow2
			Alpha = 1}
		if ($bv_index < ($bv_max_videos - 1))
			Change bv_index = ($bv_index + 1)
			if ($bv_index = ($bv_max_videos - 1))
				SetScreenElementProps \{Id = venue_down_arrow
					Alpha = 0
					flip_h}
				SetScreenElementProps \{Id = venue_down_arrow2
					Alpha = 0
					flip_h}
			endif
			I = 0
			begin
			GetUpperCaseString ($bv_text_array [($bv_index - <I>)].Text)
			FormatText ChecksumName = video_text_id 'bv_text_%d' D = (4 - <I>)
			SetScreenElementProps Id = <video_text_id> Text = <UpperCaseString>
			GetScreenElementDims Id = <video_text_id>
			SetScreenElementProps Id = <video_text_id> Scale = 1.25
			fit_text_in_rectangle Id = <video_text_id> only_if_larger_x = 1 Dims = ((270.0, 0.0) + <Height> * (0.0, 1.25)) start_x_scale = 1.25
			if bv_should_gray_out_selection Text = <UpperCaseString>
				SetScreenElementProps Id = <video_text_id> rgba = [140 55 60 255]
			else
				SetScreenElementProps Id = <video_text_id> rgba = [255 245 225 255]
			endif
			<I> = (<I> + 1)
			repeat 5
		else
			<make_sound> = 0
		endif
	endif
	if (<make_sound> = 1)
		if (<quick> = 0)
			generic_menu_up_or_down_sound \{DOWN}
		endif
	endif
endscript

script bonus_videos_scroll_up 
	make_sound = 1
	FormatText ChecksumName = video_text_id 'bv_text_%d' D = ($bv_id_index)
	if ($bv_id_index > 0)
		Change bv_id_index = ($bv_id_index -1)
		SetScreenElementProps Id = bv_hilite Pos = ($bv_hilite_array [$bv_id_index])
		Change bv_index = ($bv_index -1)
	else
		SetScreenElementProps \{Id = venue_down_arrow
			Alpha = 1
			flip_h
			flip_v}
		SetScreenElementProps \{Id = venue_down_arrow2
			Alpha = 1
			flip_h
			flip_v}
		if ($bv_index > 0)
			Change bv_index = ($bv_index -1)
			if ($bv_index = 0)
				SetScreenElementProps \{Id = venue_up_arrow
					Alpha = 0}
				SetScreenElementProps \{Id = venue_up_arrow2
					Alpha = 0}
			endif
			I = 0
			begin
			GetUpperCaseString ($bv_text_array [($bv_index + <I>)].Text)
			FormatText ChecksumName = video_text_id 'bv_text_%d' D = <I>
			SetScreenElementProps Id = <video_text_id> Text = <UpperCaseString>
			GetScreenElementDims Id = <video_text_id>
			SetScreenElementProps Id = <video_text_id> Scale = 1.25
			fit_text_in_rectangle Id = <video_text_id> only_if_larger_x = 1 Dims = ((270.0, 0.0) + <Height> * (0.0, 1.25)) start_x_scale = 1.25
			if bv_should_gray_out_selection Text = <UpperCaseString>
				SetScreenElementProps Id = <video_text_id> rgba = [140 55 60 255]
			else
				SetScreenElementProps Id = <video_text_id> rgba = [255 245 225 255]
			endif
			<I> = (<I> + 1)
			repeat 5
		else
			<make_sound> = 0
		endif
	endif
	if (<make_sound> = 1)
		generic_menu_up_or_down_sound \{UP}
	endif
endscript

script bv_morph_hilite \{Time = 0.01}
	bv_hilite :DoMorph Pos = (<Pos> - (0.0, 20.0)) Scale = (1.0, 0.25) Time = <Time> relative_scale
	bv_hilite :DoMorph Pos = (<Pos>) Scale = 1 Time = <Time> relative_scale
endscript

script menu_bonus_videos_play_video \{movie = 'atvi'}
	if bv_should_gray_out_selection Text = <Text>
	else
		LaunchEvent \{Type = unfocus
			Target = mbv_vmenu}
		Menu_Music_Off
		PlayMovieAndWait movie = <movie>
		SpawnScriptNow \{Menu_Music_On}
		LaunchEvent \{Type = Focus
			Target = mbv_vmenu}
	endif
endscript

script shutdown_options_video_monitor 
	KillSpawnedScript \{Name = options_video_monitor}
	KillSpawnedScript \{Name = PlayMovieAndWait}
	KillMovie \{TextureSlot = 0}
	KillMovie \{TextureSlot = 1}
	FadeToBlack \{OFF
		Time = 0}
endscript
