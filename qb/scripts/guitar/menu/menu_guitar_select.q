guitar_select_available_guitar_array = [
]
guitar_select_available_bass_array = [
]
guitar_select_guitar_indeces = [
]
guitar_select_bass_indeces = [
]
g_old_selected_guitar_index_p1 = 0
g_old_selected_guitar_index_p2 = 0
gs_highlight_index = 0
gs_scroll_dir = DOWN
gs_finishes_size = 0
guitar_select_old_guitar_p1 = 0
guitar_select_old_guitar_p2 = 0
guitar_select_highlighted_guitar_p1 = 0
guitar_select_highlighted_guitar_p2 = 0
guitar_select_total_num_guitars = 0
gs_selected_brand_p1 = 0
gs_old_selected_brand_p1 = 0
gs_selected_brand_p2 = 0
gs_old_selected_brand_p2 = 0
gs_made_first_selection_bool_p1 = 0
gs_made_first_selection_bool_p2 = 0
gs_current_brand_is_selected_p1 = 1
gs_current_brand_is_selected_p2 = 1
gs_guitar_brand_ID_p1 = NULL
gs_guitar_finish_ID_p1 = NULL
gs_guitar_brand_ID_p2 = NULL
gs_guitar_finish_ID_p2 = NULL
gh_net_finish_id = 0
online_guitar_highlighted_id_p1 = Instrument_ES335_Red
online_guitar_highlighted_id_p2 = Instrument_ES335_Red
online_old_guitar_id_p1 = Instrument_ES335_Red
online_old_guitar_id_p2 = Instrument_ES335_Red
gs_instrument_blurb_text = "DEFAULT INSTRUMENT BLURB"
gs_select_text = "SELECT GUITAR"
gs_element_offsets = [
	(0.0, 135.0)
	(0.0, 185.0)
	(0.0, 200.0)
	(0.0, 278.0)
	(-106.0, 315.0)
	(-1.0, 579.0)
]

script create_select_bass_menu 
	create_select_guitar_menu Player = <Player> instrument_type = BASS
endscript

script create_select_guitar_menu \{Player = 1
		instrument_type = GUITAR}
	Change \{gs_current_brand_is_selected_p1 = 1}
	Change \{gs_current_brand_is_selected_p2 = 1}
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	if (<Player> = 1)
		Change \{gs_made_first_selection_bool_p1 = 0}
	else
		Change \{gs_made_first_selection_bool_p2 = 0}
	endif
	build_gs_available_guitar_array <...>
	if find_profile_by_id Id = ($<player_status>.character_id)
		get_musician_profile_struct Index = <Index>
		FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
		if GetGlobalTags <characterguitartags> noassert = 1
			if ((<instrument_type> = BASS))
				if (<current_instrument> = GUITAR)
					Change StructureName = <player_status> instrument_id = <current_selected_bass>
					SetGlobalTags <characterguitartags> Params = {current_instrument = BASS}
					FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
					Change GlobalName = <change_flag> NewValue = 1
				endif
			elseif ((<instrument_type> = GUITAR))
				if (<current_instrument> = BASS)
					Change StructureName = <player_status> instrument_id = <current_selected_guitar>
					SetGlobalTags <characterguitartags> Params = {current_instrument = GUITAR}
					FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
					Change GlobalName = <change_flag> NewValue = 1
				endif
			endif
		endif
	endif
	if (<instrument_type> = GUITAR)
		FormatText \{ChecksumName = guitar_select_available_instruments
			'guitar_select_available_guitar_array'}
	else
		FormatText \{ChecksumName = guitar_select_available_instruments
			'guitar_select_available_bass_array'}
	endif
	select_guitar_build_brand_array instrument_type = <instrument_type> gs_available_instruments = <guitar_select_available_instruments> Player = <Player>
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up gs_scroll_up_or_down Params = {
				Player = <Player>
				Dir = UP
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
		{pad_down gs_scroll_up_or_down Params = {
				Player = <Player>
				Dir = DOWN
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
		{pad_back select_guitar_go_back Params = {
				Player = <Player>
				gs_available_instruments = <guitar_select_available_instruments>
				instrument_type = <instrument_type>
			}
		}
		{pad_choose select_guitar_choose Params = {
				guitar_index = $guitar_select_highlighted_guitar_p1
				Player = <Player>
				gs_available_instruments = <guitar_select_available_instruments>
				gs_available_brands = <gs_available_brands>
				instrument_type = <instrument_type>
			}
		}
	]
	if (<Player> = 1)
		if ($current_num_players = 1)
			new_menu {
				scrollid = scrolling_select_guitar_p1
				vmenuid = vmenu_select_guitar_p1
				Menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
				no_focus = 1
			}
			vparent = vmenu_select_guitar_p1
		else
			new_menu {
				scrollid = scrolling_select_guitar_p1
				vmenuid = vmenu_select_guitar_p1
				Menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
				exclusive_device = <exclusive_dev>
				no_focus = 1
			}
			vparent = vmenu_select_guitar_p1
		endif
	else
		new_menu {
			scrollid = scrolling_select_guitar_p2
			vmenuid = vmenu_select_guitar_p2
			Menu_pos = (700.0, 120.0)
			use_backdrop = 0
			event_handlers = <event_handlers>
			exclusive_device = <exclusive_dev>
			no_focus = 1
		}
		if ($is_network_game = 1)
			vmenu_select_guitar_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				Target = vmenu_select_guitar_p2}
		endif
		vparent = vmenu_select_guitar_p2
	endif
	if ($current_num_players = 1)
		if (<instrument_type> = GUITAR)
			Change \{gs_select_text = "SELECT GUITAR"}
		elseif (<instrument_type> = BASS)
			Change \{gs_select_text = "SELECT BASS"}
		endif
		FormatText ChecksumName = player_status 'player%i_status' I = <Player>
		their_instrument_id = ($<player_status>.instrument_id)
		get_instrument_name_and_index Id = <their_instrument_id>
		select_guitar_get_available_index_from_total_index Index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
		Change guitar_select_highlighted_guitar_p1 = <Index>
		Change guitar_select_old_guitar_p1 = <Index>
		get_musician_instrument_struct Index = <instrument_index>
		Change gs_instrument_blurb_text = (<info_struct>.blurb)
		CreateScreenElement \{Type = ContainerElement
			Id = select_guitar_container
			PARENT = root_window
			Pos = (392.0, 6.0)}
		frame_dims = (280.0, 600.0)
		center_pos = (0.0, 335.0)
		create_UI_frame {
			PARENT = select_guitar_container
			frame_dims = <frame_dims>
			center_pos = <center_pos>
			frame_rgba = (($G_menu_colors).frame_rgba)
			fill_rgba = (($G_menu_colors).fill_rgba)
			z_priority = 0
		}
		header_pos = (<center_pos> - ((<frame_dims>.(0.0, 1.0)) * (0.0, 0.5) - (0.0, 80.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = select_guitar_container
			Pos = <header_pos>
			Id = gs_frame_header_01
			just = [Center Bottom]
			texture = window_header_01
			rgba = (($G_menu_colors).lt_violet_grey)
			z_priority = 1
		}
		CreateScreenElement {
			Type = SpriteElement
			PARENT = select_guitar_container
			Pos = (<center_pos> + (0.0, 175.0))
			Dims = (242.0, 128.0)
			just = [Center Top]
			texture = store_frame_bottom_bg
			z_priority = 4
			rgba = (($G_menu_colors).lt_violet_grey)
		}
		displayText {
			PARENT = select_guitar_container
			Text = $gs_select_text
			Pos = ($gs_element_offsets [0])
			Scale = (0.6, 0.55)
			font = fontgrid_title_gh3
			just = [Center Center]
			rgba = (($G_menu_colors).pink)
			Z = 1
		}
		displaySprite {
			Id = gs_brand_background
			PARENT = select_guitar_container
			tex = Char_Select_Frame_BG
			Pos = ($gs_element_offsets [2])
			Dims = (266.0, 128.0)
			just = [Center Center]
			rgba = (($G_menu_colors).lt_violet_grey)
			Z = 1
		}
		get_instrument_brand_and_finish Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
		CreateScreenElement {
			Type = TextElement
			PARENT = select_guitar_container
			Text = <instrument_brand>
			Pos = (($gs_element_offsets [2]) + (0.0, 8.0))
			Scale = 1
			font = fontgrid_title_gh3
			just = [Center Center]
			rgba = (($G_menu_colors).BLACK)
			Z = 2
			Shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = (($G_menu_colors).lt_violet_grey)
		}
		Change gs_guitar_brand_ID_p1 = <Id>
		GetScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
		if (<width> > 250)
			SetScreenElementProps \{Id = $gs_guitar_brand_ID_p1
				Scale = 1}
			fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((250.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, 8.0))
		endif
		CreateScreenElement {
			Type = TextBlockElement
			PARENT = select_guitar_container
			Text = <instrument_name2>
			Pos = ($gs_element_offsets [3])
			Scale = (0.55, 0.55)
			Dims = (440.0, 300.0)
			font = text_a4
			line_spacing = 0.9
			just = [Center Center]
			rgba = (($G_menu_colors).lt_violet_grey)
			z_priority = 2
		}
		Change gs_guitar_finish_ID_p1 = <Id>
		GetScreenElementDims Id = ($gs_guitar_finish_ID_p1)
		if (<width> > 120)
			fit_text_in_rectangle Id = ($gs_guitar_finish_ID_p1) Dims = ((120.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3]) keep_ar = 1
		endif
		get_instrument_logo Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
		displayText {
			Id = gs_guitar_logo_ID_p1
			PARENT = select_guitar_container
			Text = <instrument_logo>
			Pos = ($gs_element_offsets [5])
			Scale = 0.8
			font = fontgrid_title_gh3
			just = [Center Center]
			rgba = (($G_menu_colors).lt_violet_grey)
			Z = 5
		}
		CreateScreenElement {
			Type = WindowElement
			PARENT = select_guitar_container
			Id = gs_instrument_info_scroll_window
			Pos = ($gs_element_offsets [4])
			Dims = (388.0, 245.0)
		}
		SpawnScriptNow {
			select_guitar_scroll_instrument_info
			Params = {
				PARENT = gs_instrument_info_scroll_window
				Pos = (($gs_element_offsets [4]) + (0.0, -10.0))
			}
		}
	else
		if (<instrument_type> = GUITAR)
			Change \{gs_select_text = "SELECT GUITAR"}
		elseif (<instrument_type> = BASS)
			Change \{gs_select_text = "SELECT BASS"}
		endif
		if (<Player> = 1)
			FormatText ChecksumName = player_status 'player%i_status' I = <Player>
			if find_profile_by_id Id = ($<player_status>.character_id)
				get_musician_profile_struct Index = <Index>
				FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player> AddToStringLookup = TRUE
				if GetGlobalTags <characterguitartags> noassert = 1
					if (<instrument_type> = GUITAR)
						<their_instrument_id> = <current_selected_guitar>
					else
						<their_instrument_id> = <current_selected_bass>
					endif
					get_instrument_name_and_index Id = <their_instrument_id>
					select_guitar_get_available_index_from_total_index Index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
					Change guitar_select_highlighted_guitar_p1 = <Index>
					Change guitar_select_old_guitar_p1 = <Index>
					if NOT (<their_instrument_id> = $<player_status>.instrument_id)
						KillSpawnedScript \{Name = Store_Update_Player_Status}
						SpawnScriptNow Store_Update_Player_Status Params = {Player = <Player> instrument_id = <their_instrument_id>}
					endif
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				Id = select_guitar_container
				PARENT = root_window
				Pos = (460.0, 500.0)}
			create_UI_frame {
				frame_dims = (250.0, 185.0)
				center_pos = (0.0, 32.0)
				PARENT = select_guitar_container
				frame_rgba = [240 225 200 50]
				fill_rgba = [50 25 40 185]
				z_priority = 0
				offset_top = 32
				offset_side = 32
				min_fill_pad_width = 73
				min_fill_pad_height = 63
				tex_param = 'simple'
				suffix = <Player>
				check_side_swap = 0
			}
			displayText {
				Id = gs_select_guitar_text_p1
				PARENT = select_guitar_container
				Text = $gs_select_text
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [Center Center]
				rgba = (($G_menu_colors).md_violet_grey)
				Z = 1
			}
			displaySprite {
				Id = gs_brand_background_p1
				PARENT = select_guitar_container
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				Dims = (266.0, 128.0)
				just = [Center Center]
				rgba = (($G_menu_colors).light_brown)
				Z = 1
			}
			get_instrument_brand_and_finish Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
			displayText {
				PARENT = select_guitar_container
				Text = <instrument_brand>
				Pos = (0.0, 10.0)
				Scale = 1
				font = text_a4
				just = [Center Center]
				rgba = (($G_menu_colors).fill_rgba)
				Z = 2
				noshadow
			}
			Change gs_guitar_brand_ID_p1 = <Id>
			GetScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{Id = $gs_guitar_brand_ID_p1
					Scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			get_instrument_logo Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p1])
			displayText {
				Id = gs_guitar_logo_ID_p1
				PARENT = select_guitar_container
				Text = <instrument_logo>
				Pos = (0.0, 40.0)
				Scale = 0.6
				font = text_a4
				just = [Center Center]
				rgba = (($G_menu_colors).BLACK)
				Z = 2
				noshadow
			}
			displayText {
				PARENT = select_guitar_container
				Text = <instrument_name2>
				Pos = (2.0, 93.0)
				Scale = (1.0, 0.5)
				font = text_a4
				just = [Center Center]
				rgba = (($G_menu_colors).light_brown)
				Z = 2
				noshadow
			}
			Change gs_guitar_finish_ID_p1 = <Id>
			GetScreenElementDims \{Id = $gs_guitar_finish_ID_p1}
			fit_text_in_rectangle Id = $gs_guitar_finish_ID_p1 Dims = ((220.0, 0.0) + ((<Height>) * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = 1 start_y_scale = 0.5
		else
			FormatText ChecksumName = player_status 'player%i_status' I = <Player>
			if find_profile_by_id Id = ($<player_status>.character_id)
				get_musician_profile_struct Index = <Index>
				FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player> AddToStringLookup = TRUE
				if GetGlobalTags <characterguitartags> noassert = 1
					if (<instrument_type> = GUITAR)
						<their_instrument_id> = <current_selected_guitar>
					else
						<their_instrument_id> = <current_selected_bass>
					endif
					get_instrument_name_and_index Id = <their_instrument_id>
					select_guitar_get_available_index_from_total_index Index = <instrument_index> gs_available_instruments = <guitar_select_available_instruments>
					Change guitar_select_highlighted_guitar_p2 = <Index>
					Change guitar_select_old_guitar_p2 = <Index>
					if NOT (<their_instrument_id> = $<player_status>.instrument_id)
						KillSpawnedScript \{Name = Store_Update_Player_Status}
						SpawnScriptNow Store_Update_Player_Status Params = {Player = <Player> instrument_id = <their_instrument_id>}
					endif
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				Id = select_guitar_container_p2
				PARENT = root_window
				Pos = (810.0, 500.0)}
			create_UI_frame {
				frame_dims = (250.0, 185.0)
				center_pos = (0.0, 32.0)
				PARENT = select_guitar_container_p2
				frame_rgba = [180 150 175 75]
				fill_rgba = [50 25 40 185]
				z_priority = 0
				offset_top = 32
				offset_side = 32
				min_fill_pad_width = 73
				min_fill_pad_height = 63
				tex_param = 'simple'
				suffix = <Player>
				check_side_swap = 0
			}
			displayText {
				Id = gs_select_guitar_text_p2
				PARENT = select_guitar_container_p2
				Text = $gs_select_text
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [Center Center]
				rgba = (($G_menu_colors).md_violet_grey)
				Z = 1
			}
			displaySprite {
				Id = gs_brand_background_p2
				PARENT = select_guitar_container_p2
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				Dims = (266.0, 128.0)
				just = [Center Center]
				rgba = (($G_menu_colors).lt_violet_bar)
				Z = 1
			}
			get_instrument_brand_and_finish Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p2])
			displayText {
				PARENT = select_guitar_container_p2
				Text = <instrument_brand>
				Pos = (0.0, 10.0)
				Scale = 1
				font = text_a4
				just = [Center Center]
				rgba = (($G_menu_colors).fill_rgba)
				Z = 2
				noshadow
			}
			Change gs_guitar_brand_ID_p2 = <Id>
			GetScreenElementDims \{Id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{Id = $gs_guitar_brand_ID_p2
					Scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			get_instrument_logo Id = ($<guitar_select_available_instruments> [$guitar_select_highlighted_guitar_p2])
			displayText {
				Id = gs_guitar_logo_ID_p2
				PARENT = select_guitar_container_p2
				Text = <instrument_logo>
				Pos = (0.0, 40.0)
				Scale = 0.6
				font = text_a4
				just = [Center Center]
				rgba = (($G_menu_colors).BLACK)
				Z = 2
				noshadow
			}
			displayText {
				PARENT = select_guitar_container_p2
				Text = <instrument_name2>
				Pos = (2.0, 93.0)
				Scale = (1.0, 0.5)
				font = text_a4
				just = [Center Center]
				rgba = (($G_menu_colors).lt_violet_bar)
				Z = 2
				noshadow
			}
			Change gs_guitar_finish_ID_p2 = <Id>
			GetScreenElementDims \{Id = $gs_guitar_finish_ID_p2}
			fit_text_in_rectangle Id = $gs_guitar_finish_ID_p2 Dims = ((220.0, 0.0) + ((<Height>) * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = 1 start_y_scale = 0.5
		endif
	endif
	if (<Player> = 1)
		get_instrument_name_and_index Id = ($player1_status.instrument_id)
		Change g_old_selected_guitar_index_p1 = <instrument_index>
	else
		get_instrument_name_and_index Id = ($player2_status.instrument_id)
		Change g_old_selected_guitar_index_p2 = <instrument_index>
	endif
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	if ($current_num_players = 1)
		Change \{using_guitar_select_camera = 1}
		Change \{lock_guitar_select_camera = 1}
		char_name = ($<player_status>.band_Member)
		LaunchEvent Type = unfocus Target = <vparent>
		if ($generic_select_monitor_p1_changed = 1)
			begin
			if ($generic_select_monitor_p1_changed = 0)
				break
			endif
			Wait \{1
				GameFrame}
			repeat
		endif
		if CompositeObjectExists Name = <char_name>
			<char_name> :Ragdoll_MarkForReset
			<char_name> :handle_change_stance stance = Stance_FrontEnd_Guitar SPEED = 2.0 No_wait
		endif
		PlayIGCCam \{Id = gs_view_cam_id
			Name = gs_view_cam
			viewport = Bg_Viewport
			ControlScript = guitar_select_camera_morph
			LockTo = World
			Pos = (10.0, 5.0, 1.580106)
			Quat = (0.028251, -0.9906429, 0.13347001)
			FOV = 72.0
			Play_hold = 1
			interrupt_current
			Time = 0.5}
		begin
		if ($lock_guitar_select_camera = 0)
			break
		else
			Wait \{1
				GameFrame}
		endif
		repeat
	endif
	LaunchEvent Type = Focus Target = <vparent>
endscript
using_guitar_select_camera = 0
lock_guitar_select_camera = 0

script guitar_select_camera_morph 
	Change \{lock_guitar_select_camera = 1}
	CCam_DoMorph \{LockTo = World
		Pos = (2.503113, 1.0385579, 2.869411)
		Quat = (0.028074998, -0.999026, 0.020287)
		FOV = 78.0}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = GUITARIST
		LockToBone = BONE_GUITAR_NECK
		Pos = (0.05, 0.6, -0.4)
		Quat = (0.48735002, 0.463712, -0.514474)
		FOV = 120.0
		Time = 0.5
		Motion = smooth}
	ScreenFX_AddFXInstance \{viewport = Bg_Viewport
		Name = GSdof
		ScefName = DOF
		Time = 0.5
		Type = DOF
		ON = 1
		BackDist = 0.003
		Strength = 0.6
		BlurRadius = 6
		BlurResolution = half}
	ScreenFX_AddFXInstance \{viewport = Bg_Viewport
		Name = GSdof2
		ScefName = DoF2
		Time = 0.5
		Type = DOF
		ON = 1
		BackDist = 0.01
		Strength = 1.0
		BlurRadius = 6
		BlurResolution = half}
	CCam_WaitMorph
	CCam_Freeze
	Change \{lock_guitar_select_camera = 0}
endscript

script select_guitar_build_brand_array \{instrument_type = GUITAR
		Player = 1}
	GetArraySize <gs_available_instruments> GlobalArray
	<our_array_size> = <array_Size>
	gs_available_brands = []
	if (<instrument_type> = GUITAR)
		FormatText \{ChecksumName = gs_indeces
			'guitar_select_guitar_indeces'}
	else
		FormatText \{ChecksumName = gs_indeces
			'guitar_select_bass_indeces'}
	endif
	<I> = 0
	begin
	get_musician_instrument_struct Index = ($<gs_indeces> [<I>])
	if (($<gs_available_instruments> [<I>]) = (<info_struct>.desc_id))
		<K> = 0
		<found_group> = 0
		GetArraySize (<gs_available_brands>)
		if (<array_Size> > 0)
			begin
			if ((<gs_available_brands> [<K>]) = (<info_struct>.Group))
				<found_group> = 1
				FormatText ChecksumName = player_status 'player%i_status' I = <Player>
				if (($<player_status>.instrument_id) = (<info_struct>.desc_id))
					if (<Player> = 1)
						Change gs_selected_brand_p1 = <K>
					else
						Change gs_selected_brand_p2 = <K>
					endif
				endif
				break
			endif
			<K> = (<K> + 1)
			repeat <array_Size>
		endif
		if (<found_group> = 0)
			AddArrayElement Array = (<gs_available_brands>) Element = (<info_struct>.Group)
			<gs_available_brands> = (<Array>)
			FormatText ChecksumName = player_status 'player%i_status' I = <Player>
			if (($<player_status>.instrument_id) = (<info_struct>.desc_id))
				if (<Player> = 1)
					Change gs_selected_brand_p1 = <array_Size>
				else
					Change gs_selected_brand_p2 = <array_Size>
				endif
			endif
		endif
	else
		ScriptAssert \{"Something is wrong with your guitar arrays! [In select_guitar_build_brand_array]"}
	endif
	<I> = (<I> + 1)
	repeat <our_array_size>
	return gs_available_brands = <gs_available_brands>
endscript

script select_guitar_build_finish_array \{instrument_type = GUITAR}
	GetArraySize <gs_available_instruments> GlobalArray
	<our_array_size> = <array_Size>
	gs_available_finishes = []
	if (<instrument_type> = GUITAR)
		FormatText \{ChecksumName = gs_indeces
			'guitar_select_guitar_indeces'}
	else
		FormatText \{ChecksumName = gs_indeces
			'guitar_select_bass_indeces'}
	endif
	<I> = 0
	begin
	get_musician_instrument_struct Index = ($<gs_indeces> [<I>])
	if (($<gs_available_instruments> [<I>]) = (<info_struct>.desc_id))
		get_instrument_brand_and_finish Id = (<info_struct>.desc_id)
		if (<instrument_group> = <Group>)
			AddArrayElement Array = (<gs_available_finishes>) Element = (<info_struct>.desc_id)
			<gs_available_finishes> = (<Array>)
		endif
	else
		ScriptAssert \{"Something is wrong with your guitar arrays! [In select_guitar_build_finish_array]"}
	endif
	<I> = (<I> + 1)
	repeat <our_array_size>
	return gs_available_finishes = <gs_available_finishes>
endscript

script destroy_select_guitar_menu \{Player = 1}
	if (<Player> = 1)
		destroy_menu \{menu_id = scrolling_select_guitar_p1}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
		if ($current_num_players = 1)
			KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
		endif
		destroy_menu \{menu_id = gs_instrument_info_scroll_window}
		destroy_menu \{menu_id = select_guitar_container}
		destroy_menu \{menu_id = select_finish_container}
	else
		destroy_menu \{menu_id = scrolling_select_guitar_p2}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
		destroy_menu \{menu_id = select_guitar_container_p2}
		destroy_menu \{menu_id = select_finish_container_p2}
	endif
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	<band_Member> = ($<player_status>.band_Member)
	if CompositeObjectExists Name = <band_Member>
		if <band_Member> :Anim_AnimNodeExists Id = BodyTimer
			<band_Member> :Anim_Command Target = BodyTimer Command = Timer_SetSpeed Params = {SPEED = 1.0}
		endif
	endif
	if ($current_num_players = 1)
		KillCamAnim \{Name = gs_view_cam}
	endif
endscript
guitar_select_camera_changing = 0

script guitar_select_exit_camera_morph 
	Change \{guitar_select_camera_changing = 1}
	CCam_DoMorph \{LockTo = GUITARIST
		LockToBone = BONE_GUITAR_NECK
		Pos = (0.05, 0.618989, -0.4)
		Quat = (0.48735002, 0.463712, -0.514474)
		FOV = 120.0
		Motion = smooth}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = World
		Pos = (2.503113, 1.0385579, 2.869411)
		Quat = (0.028074998, -0.999026, 0.020287)
		FOV = 78.0
		Time = 0.5
		Motion = smooth}
	ScreenFX_UpdateFXInstanceParams \{viewport = Bg_Viewport
		Name = GSdof
		Time = 0.5
		Type = DOF
		ON = 1
		BackDist = 0.003
		Strength = 0
		BlurRadius = 6
		BlurResolution = half}
	ScreenFX_UpdateFXInstanceParams \{viewport = Bg_Viewport
		Name = GSdof2
		Time = 0.5
		Type = DOF
		ON = 1
		BackDist = 0.01
		Strength = 0
		BlurRadius = 6
		BlurResolution = half}
	CCam_WaitMorph
	ScreenFX_RemoveFXInstance \{viewport = Bg_Viewport
		Name = GSdof}
	ScreenFX_RemoveFXInstance \{viewport = Bg_Viewport
		Name = GSdof2
		Time = 2}
	Change \{guitar_select_camera_changing = 0}
endscript

script wait_for_guitar_select_exit_camera 
	Wait \{5
		GameFrames}
	begin
	if ($guitar_select_camera_changing = 0)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script gs_wait_to_load_guitar_p1 
	Wait \{0.2
		Second}
	Change \{GlobalName = generic_select_monitor_p1_changed
		NewValue = 1}
endscript

script gs_wait_to_load_guitar_p2 
	Wait \{0.2
		Second}
	Change \{GlobalName = generic_select_monitor_p2_changed
		NewValue = 1}
endscript

script gs_scroll_up_or_down \{Player = 1
		Dir = DOWN}
	generic_menu_up_or_down_sound Params = {<Dir>}
	if (<Player> = 1)
		if ($gs_made_first_selection_bool_p1 = 0)
			GetArraySize (gs_available_brands)
			<avail_size> = <array_Size>
			if (<Dir> = DOWN)
				Change gs_selected_brand_p1 = ($gs_selected_brand_p1 + 1)
				if ($gs_selected_brand_p1 = <avail_size>)
					Change \{gs_selected_brand_p1 = 0}
				endif
			endif
			if (<Dir> = UP)
				Change gs_selected_brand_p1 = ($gs_selected_brand_p1 - 1)
				if ($gs_selected_brand_p1 = -1)
					Change gs_selected_brand_p1 = (<avail_size> - 1)
				endif
			endif
			<inst_id> = 0
			select_guitar_get_first_guitar_brand_in_list {
				brand = (<gs_available_brands> [$gs_selected_brand_p1])
				instrument_type = <instrument_type>
				gs_available_instruments = <gs_available_instruments>
				Player = <Player>
			}
			<inst_id> = <instrument_id>
			Change guitar_select_highlighted_guitar_p1 = <instrument_index>
			FormatText ChecksumName = player_status 'player%i_status' I = <Player>
			if NOT (<inst_id> = $<player_status>.instrument_id)
				KillSpawnedScript \{Name = Store_Update_Player_Status}
				SpawnScriptNow Store_Update_Player_Status Params = {Player = <Player> instrument_id = <inst_id>}
				if ($current_num_players = 1)
					select_guitar_change_blurb_text inst_id = <inst_id>
				endif
			endif
			if (($is_network_game) = 1)
				Change online_guitar_highlighted_id_p1 = ($<player_status>.instrument_id)
				if (<Dir> = UP)
					dir_value = 0
				else
					dir_value = 1
				endif
				network_player_lobby_message {
					Type = guitar_select
					action = update
					Checksum = <instrument_type>
					value1 = <dir_value>
				}
			endif
			get_instrument_brand_and_finish Id = <inst_id>
			SetScreenElementProps Id = $gs_guitar_brand_ID_p1 Text = <instrument_brand>
			SetScreenElementProps Id = $gs_guitar_finish_ID_p1 Text = <instrument_name2>
			if ($current_num_players = 1)
				SetScreenElementProps \{Id = $gs_guitar_brand_ID_p1
					Scale = 1}
				GetScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
				if (<width> > 235)
					fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((235.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, 8.0))
				endif
				SetScreenElementProps \{Id = $gs_guitar_finish_ID_p1
					Scale = 1}
				GetScreenElementDims \{Id = $gs_guitar_finish_ID_p1}
				if (<width> > 220)
					fit_text_in_rectangle Id = $gs_guitar_finish_ID_p1 Dims = ((220.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (($gs_element_offsets [3]) + (1.0, 2.0)) keep_ar = 1
				endif
			else
				SetScreenElementProps \{Id = $gs_guitar_brand_ID_p1
					Scale = 1}
				GetScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
				if (<width> > 260)
					SetScreenElementProps \{Id = $gs_guitar_brand_ID_p1
						Scale = 1}
					fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
				endif
				SetScreenElementProps \{Id = $gs_guitar_finish_ID_p1
					Scale = (1.0, 0.5)}
				GetScreenElementDims \{Id = $gs_guitar_finish_ID_p1}
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p1 Dims = ((220.0, 0.0) + ((<Height>) * (0.0, 0.5))) only_if_larger_x = 1 start_x_scale = 1 start_y_scale = 1
			endif
			get_instrument_logo Id = <inst_id>
			SetScreenElementProps Id = gs_guitar_logo_ID_p1 Text = <instrument_logo>
		else
			if (<Dir> = DOWN)
				Change \{gs_scroll_dir = DOWN}
				Change gs_highlight_index = (($gs_highlight_index) + 1)
				if (($gs_highlight_index) > 4)
					Change \{gs_highlight_index = 4}
				endif
			else
				Change \{gs_scroll_dir = UP}
				Change gs_highlight_index = (($gs_highlight_index) - 1)
				if (($gs_highlight_index) < 0)
					Change \{gs_highlight_index = 0}
				endif
			endif
		endif
	else
		if ($gs_made_first_selection_bool_p2 = 0)
			GetArraySize (gs_available_brands)
			<avail_size> = <array_Size>
			if (<Dir> = DOWN)
				Change gs_selected_brand_p2 = ($gs_selected_brand_p2 + 1)
				if ($gs_selected_brand_p2 = <avail_size>)
					Change \{gs_selected_brand_p2 = 0}
				endif
			endif
			if (<Dir> = UP)
				Change gs_selected_brand_p2 = ($gs_selected_brand_p2 - 1)
				if ($gs_selected_brand_p2 = -1)
					Change gs_selected_brand_p2 = (<avail_size> - 1)
				endif
			endif
			<inst_id> = 0
			select_guitar_get_first_guitar_brand_in_list {
				brand = (<gs_available_brands> [$gs_selected_brand_p2])
				instrument_type = <instrument_type>
				gs_available_instruments = <gs_available_instruments>
				Player = <Player>
			}
			Change guitar_select_highlighted_guitar_p2 = <instrument_index>
			<inst_id> = <instrument_id>
			FormatText ChecksumName = player_status 'player%i_status' I = <Player>
			if NOT (<inst_id> = $<player_status>.instrument_id)
				KillSpawnedScript \{Name = Store_Update_Player_Status}
				SpawnScriptNow Store_Update_Player_Status Params = {Player = <Player> instrument_id = <inst_id>}
			endif
			get_instrument_brand_and_finish Id = <inst_id>
			SetScreenElementProps Id = $gs_guitar_brand_ID_p2 Text = <instrument_brand>
			SetScreenElementProps Id = $gs_guitar_finish_ID_p2 Text = <instrument_name2>
			SetScreenElementProps \{Id = $gs_guitar_brand_ID_p2
				Scale = 1}
			GetScreenElementDims \{Id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			SetScreenElementProps \{Id = $gs_guitar_finish_ID_p2
				Scale = (1.0, 0.5)}
			GetScreenElementDims \{Id = $gs_guitar_finish_ID_p2}
			fit_text_in_rectangle Id = $gs_guitar_finish_ID_p2 Dims = ((220.0, 0.0) + ((<Height>) * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = 1 start_y_scale = 0.5
			get_instrument_logo Id = <inst_id>
			SetScreenElementProps Id = gs_guitar_logo_ID_p2 Text = <instrument_logo>
		endif
	endif
endscript

script select_guitar_go_back \{Player = 1
		instrument_type = GUITAR}
	if (<Player> = 1)
		LaunchEvent \{Type = unfocus
			Target = vmenu_select_guitar_p1}
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
		Change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
		Change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
		if ($is_network_game = 1)
			get_musician_instrument_type desc_id = <instrument_id>
			if (<instrument_type> = GUITAR)
				Change player1_selected_guitar = <instrument_id>
			else
				Change player1_selected_bass = <instrument_id>
			endif
		endif
	else
		LaunchEvent \{Type = unfocus
			Target = vmenu_select_guitar_p2}
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p2)])
		Change \{guitar_select_highlighted_guitar_p2 = $guitar_select_old_guitar_p2}
		Change \{gs_selected_brand_p2 = $gs_old_selected_brand_p2}
	endif
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	if NOT (<instrument_id> = $<player_status>.instrument_id)
		Change StructureName = <player_status> instrument_id = <instrument_id>
		if NOT ($is_network_game)
			if find_profile_by_id Id = ($<player_status>.character_id)
				get_musician_profile_struct Index = <Index>
				FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
				if (<instrument_type> = GUITAR)
					SetGlobalTags <characterguitartags> Params = {current_instrument = GUITAR current_selected_guitar = <instrument_id>}
				else
					SetGlobalTags <characterguitartags> Params = {current_instrument = BASS current_selected_bass = <instrument_id>}
				endif
			endif
		endif
		FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
		Change GlobalName = <change_flag> NewValue = 1
		if ($current_num_players = 1)
			select_guitar_change_blurb_text inst_id = <instrument_id>
		endif
		generic_select_monitor_wait
	endif
	if NOT ($is_network_game)
		if find_profile_by_id Id = ($<player_status>.character_id)
			get_musician_profile_struct Index = <Index>
			FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player> AddToStringLookup = TRUE
			SetGlobalTags <characterguitartags> Params = {current_instrument = <instrument_type>}
		endif
	endif
	ui_flow_manager_respond_to_action action = go_back Player = <Player>
endscript

script select_guitar_menu_lose_focus 
	GetTags
	SetScreenElementProps Id = <Id> rgba = (($G_menu_colors).dk_violet_grey)
endscript

script select_guitar_choose \{Player = 1
		needs_net_message = 1
		includes_finish = 0}
	SoundEvent \{Event = ui_sfx_select}
	if ($current_num_players = 1)
		begin
		if ($generic_select_monitor_p1_changed = 0)
			break
		endif
		Wait \{1
			GameFrame}
		repeat
	endif
	if (<Player> = 1)
		<inst_id> = ($<gs_available_instruments> [($guitar_select_highlighted_guitar_p1)])
		Change StructureName = player1_status instrument_id = <inst_id>
		if find_profile_by_id Id = ($player1_status.character_id)
			get_musician_profile_struct Index = <Index>
			FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
			if (<instrument_type> = GUITAR)
				SetGlobalTags <characterguitartags> Params = {current_instrument = GUITAR current_selected_guitar = <inst_id>}
				Change player1_selected_guitar = <inst_id>
			else
				SetGlobalTags <characterguitartags> Params = {current_instrument = BASS current_selected_bass = <inst_id>}
				Change player1_selected_bass = <inst_id>
			endif
		endif
		Change \{guitar_select_old_guitar_p1 = $guitar_select_highlighted_guitar_p1}
		Change \{gs_old_selected_brand_p1 = $gs_selected_brand_p1}
		if ($gs_made_first_selection_bool_p1 = 0)
			select_guitar_create_finish_menu gs_available_instruments = <gs_available_instruments> Player = <Player> instrument_type = <instrument_type>
			Change \{gs_made_first_selection_bool_p1 = 1}
		else
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		endif
	else
		<inst_id> = ($<gs_available_instruments> [($guitar_select_highlighted_guitar_p2)])
		Change StructureName = player2_status instrument_id = <inst_id>
		if NOT ($is_network_game)
			if find_profile_by_id Id = ($player2_status.character_id)
				get_musician_profile_struct Index = <Index>
				FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
				if (<instrument_type> = GUITAR)
					SetGlobalTags <characterguitartags> Params = {current_instrument = GUITAR current_selected_guitar = <inst_id>}
				else
					SetGlobalTags <characterguitartags> Params = {current_instrument = BASS current_selected_bass = <inst_id>}
				endif
			endif
		endif
		Change \{guitar_select_old_guitar_p2 = $guitar_select_highlighted_guitar_p2}
		Change \{gs_old_selected_brand_p2 = $gs_selected_brand_p2}
		if ($gs_made_first_selection_bool_p2 = 0)
			select_guitar_create_finish_menu gs_available_instruments = <gs_available_instruments> Player = <Player> instrument_type = <instrument_type>
			Change \{gs_made_first_selection_bool_p2 = 1}
		else
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		endif
	endif
endscript

script get_instrument_name_and_index 
	get_musician_instrument_size
	Index = 0
	begin
	get_musician_instrument_struct Index = <Index>
	if (<Id> = (<info_struct>.desc_id))
		return instrument_name = (<info_struct>.Name) instrument_index = <Index>
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	get_instrument_name_and_index \{Id = Instrument_Explorer_White}
	return instrument_name = (<info_struct>.Name) instrument_index = <Index> FALSE
endscript

script get_player_instrument_desc_name \{Player = 1}
	if (<Player> = 1)
		instrument_id = ($player1_status.instrument_id)
	else
		instrument_id = ($player2_status.instrument_id)
	endif
	if find_instrument_index desc_id = (<instrument_id>)
		get_musician_instrument_struct Index = <Index>
		return TRUE instrument_name = (<info_struct>.desc_name)
	else
		return \{FALSE
			instrument_name = "Instrument not found"}
	endif
endscript

script get_instrument_brand_and_finish 
	get_musician_instrument_size
	Index = 0
	begin
	get_musician_instrument_struct Index = <Index>
	if (<Id> = (<info_struct>.desc_id))
		<ins_fin> = (<info_struct>.finish)
		if GotParam \{ins_fin}
			GetUpperCaseString <ins_fin>
			gitaf_instrument_finish = <UpperCaseString>
		else
			gitaf_instrument_finish = "Something Bad Happened..."
		endif
		<ins_name2> = (<info_struct>.name2)
		if GotParam \{ins_name2}
			GetUpperCaseString <ins_name2>
			gitaf_instrument_name2 = <UpperCaseString>
		else
			gitaf_instrument_name2 = "Something Bad Happened..."
		endif
		<ins_brand> = (<info_struct>.Name)
		if GotParam \{ins_brand}
			GetUpperCaseString <ins_brand>
			gitaf_instrument_brand = <UpperCaseString>
		else
			gitaf_instrument_brand = "Something Bad Happened..."
		endif
		<ins_group> = (<info_struct>.Group)
		if GotParam \{ins_group}
			gitaf_instrument_group = <ins_group>
		else
			gitaf_instrument_group = SomethingBadHappened
		endif
		return instrument_brand = <gitaf_instrument_brand> instrument_finish = <gitaf_instrument_finish> instrument_name2 = <gitaf_instrument_name2> instrument_group = <gitaf_instrument_group>
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{instrument_brand = "Brand Not Found!!!"
		instrument_finish = "Finish Not Found!!!"
		instrument_name2 = "Name2 Not Found!!!"
		instrument_group = SomethingBadHappened}
endscript

script get_instrument_logo 
	get_musician_instrument_size
	Index = 0
	begin
	get_musician_instrument_struct Index = <Index>
	if (<Id> = (<info_struct>.desc_id))
		<ins_logo> = (<info_struct>.logo)
		if GotParam \{ins_logo}
			GetUpperCaseString <ins_logo>
			gitaf_instrument_logo = <UpperCaseString>
		else
			gitaf_instrument_logo = "Something Bad Happened..."
		endif
		return instrument_logo = <gitaf_instrument_logo>
	endif
	<Index> = (<Index> + 1)
	repeat <array_Size>
	return \{instrument_logo = "Logo Not Found!!!"}
endscript

script select_guitar_change_blurb_text \{lines_in_window = 8}
	if GotParam \{inst_id}
		get_instrument_name_and_index Id = <inst_id>
		get_musician_instrument_struct Index = <instrument_index>
		Change gs_instrument_blurb_text = (<info_struct>.blurb)
	else
		Change gs_instrument_blurb_text = <Text>
	endif
	KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
	destroy_menu \{menu_id = gs_instrument_info_scroll_window}
	if ScreenElementExists \{Id = select_guitar_container}
		CreateScreenElement {
			Type = WindowElement
			PARENT = select_guitar_container
			Id = gs_instrument_info_scroll_window
			Pos = ($gs_element_offsets [4])
			Dims = (388.0, 250.0)
		}
		my_pos = (($gs_element_offsets [4]) + (0.0, -10.0))
		my_x_dims = 362
		if GotParam \{Dims}
			gs_instrument_info_scroll_window :SetProps Dims = <Dims>
		endif
		if GotParam \{x_dims}
			<my_x_dims> = <x_dims>
		endif
		if GotParam \{Pos}
			<my_pos> = <Pos>
			gs_instrument_info_scroll_window :SetProps Pos = <my_pos>
		endif
		my_z = 2
		if GotParam \{Z}
			<my_z> = <Z>
		endif
		SpawnScriptNow {
			select_guitar_scroll_instrument_info
			Params = {
				PARENT = gs_instrument_info_scroll_window
				x_dims = <my_x_dims>
				Z = <my_z>
				Pos = <my_pos>
				lines_in_window = <lines_in_window>
			}
		}
	endif
endscript

script select_guitar_scroll_instrument_info \{Z = 2
		x_dims = 362
		Color = dk_violet_grey}
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = <PARENT>
		just = [LEFT Top]
		internal_just = [Center Center]
		Pos = (0.0, 0.0)
		Scale = (0.58, 0.6)
		Text = $gs_instrument_blurb_text
		font = text_a4
		rgba = (($G_menu_colors).<Color>)
		z_priority = <Z>
		Dims = (<x_dims> * (1.0, 0.0))
		allow_expansion
		line_spacing = 1.125
	}
	<text_id> = <Id>
	SetScreenElementLock Id = <text_id> ON
	<text_id> :GetParentID
	GetScreenElementDims Id = <parent_id>
	<parent_height> = <Height>
	GetScreenElementDims Id = <text_id>
	GetScreenElementChildren Id = <text_id>
	GetArraySize (<children>)
	<line_nums> = (<array_Size> + 0.01)
	<pixels_per_line> = (<Height> / <line_nums>)
	<fade_time> = 1.5
	<idle_time> = 3.5
	<black_time> = 0.2
	begin
	<text_id> :DoMorph Alpha = 0 Pos = (0.0, 0.0)
	<text_id> :DoMorph Alpha = 1 Time = <fade_time>
	if ((<Height> + <pixels_per_line>) <= <parent_height>)
		break
	endif
	Wait <idle_time> Seconds
	<diff> = (<Height> - <parent_height> + 0.1 + <pixels_per_line>)
	<lines_to_scroll> = (<diff> / <pixels_per_line>)
	<RATE> = 1.0
	<text_id> :DoMorph Pos = (<diff> * (0.0, -1.0)) Time = (<RATE> * <lines_to_scroll>)
	Wait <idle_time> Seconds
	<text_id> :DoMorph Alpha = 0 Time = <fade_time>
	Wait <black_time> Seconds
	repeat
endscript

script select_guitar_get_first_guitar_brand_in_list \{brand = explorer}
	if (<Player> = 1)
		get_instrument_brand_and_finish Id = ($<gs_available_instruments> [$guitar_select_old_guitar_p1])
	else
		get_instrument_brand_and_finish Id = ($<gs_available_instruments> [$guitar_select_old_guitar_p2])
	endif
	<our_group> = <instrument_group>
	<I> = 0
	GetArraySize <gs_available_instruments> GlobalArray
	total_size = <array_Size>
	begin
	if (<instrument_type> = GUITAR)
		get_musician_instrument_struct Index = ($guitar_select_guitar_indeces [<I>])
	else
		get_musician_instrument_struct Index = ($guitar_select_bass_indeces [<I>])
	endif
	if ((<info_struct>.Group) = <brand>)
		if (<brand> = <our_group>)
			if (<Player> = 1)
				Change \{gs_current_brand_is_selected_p1 = 1}
			else
				Change \{gs_current_brand_is_selected_p2 = 1}
			endif
			FormatText ChecksumName = player_status 'player%x_status' X = <Player>
			if find_profile_by_id Id = ($<player_status>.character_id)
				get_musician_profile_struct Index = <Index>
				FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player> AddToStringLookup = TRUE
				if GetGlobalTags <characterguitartags> noassert = 1
					if (<instrument_type> = GUITAR)
						<inst_id> = <current_selected_guitar>
					else
						<inst_id> = <current_selected_bass>
					endif
					get_instrument_name_and_index Id = <inst_id>
					select_guitar_get_available_index_from_total_index {
						gs_available_instruments = <gs_available_instruments>
						Index = <instrument_index>
					}
					return instrument_id = <inst_id> instrument_index = <Index>
				endif
			endif
		else
			if (<Player> = 1)
				Change \{gs_current_brand_is_selected_p1 = 0}
			else
				Change \{gs_current_brand_is_selected_p2 = 0}
			endif
		endif
		return instrument_id = (<info_struct>.desc_id) instrument_index = <I>
	endif
	<I> = (<I> + 1)
	repeat <total_size>
endscript

script select_guitar_get_available_index_from_total_index \{Index = 0}
	<I> = 0
	GetArraySize <gs_available_instruments> GlobalArray
	<avail_size> = <array_Size>
	begin
	get_musician_instrument_struct Index = <Index>
	if (($<gs_available_instruments> [<I>]) = (<info_struct>.desc_id))
		return Index = <I>
	endif
	<I> = (<I> + 1)
	repeat <avail_size>
endscript

script select_guitar_create_finish_menu \{Player = 1}
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound Params = {UP}}
		{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
		{pad_back select_guitar_go_back_from_finish_menu Params = {gs_available_instruments = <gs_available_instruments> Player = <Player> instrument_type = <instrument_type>}}
		{pad_up gs_scroll_up_or_down Params = {
				Player = <Player>
				Dir = UP
			}
		}
		{pad_down gs_scroll_up_or_down Params = {
				Player = <Player>
				Dir = DOWN
			}
		}
	]
	<p1_menu_pos> = (566.0, 480.0)
	<p2_menu_pos> = (786.0, 490.0)
	<menu_offset> = (-270.0, -150.0)
	if (<Player> = 1)
		if ($current_num_players = 2)
			new_menu {
				scrollid = scrolling_guitar_finish_menu_p1
				vmenuid = vmenu_guitar_finish_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				Menu_pos = (<p1_menu_pos> + (-178.0, -210.0))
				exclusive_device = <exclusive_dev>
				internal_just = [Center Top]
			}
		else
			new_menu {
				scrollid = scrolling_guitar_finish_menu_p1
				vmenuid = vmenu_guitar_finish_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				Menu_pos = (<p1_menu_pos> + <menu_offset>)
				Dims = (200.0, 200.0)
				text_left
			}
			KillSpawnedScript \{Name = select_guitar_scroll_instrument_info}
			destroy_menu \{menu_id = gs_instrument_info_scroll_window}
		endif
		vparent = vmenu_guitar_finish_menu_p1
	else
		new_menu {
			scrollid = scrolling_guitar_finish_menu_p2
			vmenuid = vmenu_guitar_finish_menu_p2
			use_backdrop = 0
			event_handlers = <event_handlers>
			Menu_pos = <p2_menu_pos>
			exclusive_device = <exclusive_dev>
			internal_just = [Center Top]
		}
		if ($is_network_game = 1)
			vmenu_guitar_finish_menu_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				Target = vmenu_guitar_finish_menu_p2}
		endif
		vparent = vmenu_guitar_finish_menu_p2
	endif
	if (<Player> = 1)
		LaunchEvent \{Type = unfocus
			Target = scrolling_select_guitar_p1}
	else
		if NOT ($is_network_game)
			LaunchEvent \{Type = unfocus
				Target = scrolling_select_guitar_p2}
		endif
	endif
	if ($current_num_players = 1)
		Change \{gs_highlight_index = 0}
		Change \{gs_scroll_dir = DOWN}
		Change \{gs_finishes_size = 0}
		CreateScreenElement {
			Type = ContainerElement
			Id = select_finish_container
			PARENT = root_window
			Pos = (<p1_menu_pos> + <menu_offset>)
			internal_just = [Center Top]
		}
		SetScreenElementProps \{Id = gs_brand_background
			texture = Char_Select_Frame_BG2
			rgba = [
				210
				120
				155
				255
			]}
		SetScreenElementProps {
			Id = $gs_guitar_brand_ID_p1
			shadow_rgba = (($G_menu_colors).frame_rgba)
		}
		GetScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
		if (<width> > 256)
			SetScreenElementProps \{Id = $gs_guitar_brand_ID_p1
				Scale = 1}
			fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((215.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, 8.0))
		endif
		CreateScreenElement {
			Type = SpriteElement
			Id = gs_triangle_top
			PARENT = select_finish_container
			texture = guitar_select_triangle
			just = [Center Center]
			rgba = (($G_menu_colors).md_violet_grey)
			Alpha = 0.3
			Pos = (94.0, -8.0)
			Scale = 0.5
			z_priority = 4
		}
		CreateScreenElement {
			Type = SpriteElement
			Id = gs_triangle_bottom
			PARENT = select_finish_container
			texture = guitar_select_triangle
			just = [Center Center]
			rgba = (($G_menu_colors).md_violet_grey)
			Alpha = 0.3
			Pos = (94.0, 192.0)
			Scale = 0.5
			z_priority = 4
			flip_h
		}
		displaySprite {
			Id = gs_bookend1_ID
			PARENT = select_finish_container
			tex = character_hub_hilite_bookend
			Dims = (24.0, 32.0)
			just = [LEFT Top]
			rgba = (($G_menu_colors).md_violet_grey)
			Pos = (-52.0, 0.0)
			Z = 4
			flip_v
		}
		displaySprite {
			Id = gs_bookend2_ID
			PARENT = select_finish_container
			tex = character_hub_hilite_bookend
			Dims = (24.0, 32.0)
			just = [RIGHT Top]
			rgba = (($G_menu_colors).md_violet_grey)
			Pos = (248.0, 0.0)
			Z = 4
		}
		displaySprite {
			Id = gs_whiteTexHighlight_ID
			PARENT = select_finish_container
			tex = hilite_bar_01
			just = [LEFT Top]
			rgba = (($G_menu_colors).md_violet_grey)
			Dims = (264.0, 32.0)
			Pos = (-37.0, 8.0)
			Z = 2
		}
		set_focus_color \{Color = BLACK}
		set_unfocus_color \{Color = dk_violet_grey}
		get_instrument_brand_and_finish Id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p1])
		select_guitar_build_finish_array {
			Group = <instrument_group>
			gs_available_instruments = <gs_available_instruments>
		}
		GetArraySize <gs_available_finishes>
		Change gs_finishes_size = <array_Size>
		if (<array_Size> <= 5)
			SetScreenElementProps \{Id = gs_triangle_top
				Hide
				preserve_flip}
			SetScreenElementProps \{Id = gs_triangle_bottom
				Hide
				preserve_flip}
		endif
		<I> = 0
		begin
		get_instrument_brand_and_finish Id = (<gs_available_finishes> [<I>])
		FormatText ChecksumName = gs_finish_menu_item_id 'gs_finish_menu_item_%n' N = <I>
		CreateScreenElement {
			Id = <gs_finish_menu_item_id>
			Type = TextElement
			PARENT = <vparent>
			font = text_a4
			Scale = (0.7, 0.7)
			rgba = ($menu_unfocus_color)
			just = [Center Top]
			Text = <instrument_finish>
			event_handlers = [
				{Focus retail_menu_focus}
				{Focus select_guitar_finish_highlight Params = {Player = <Player>
						Id = (<gs_available_finishes> [<I>])
						Index = <I>
					}
				}
				{unfocus retail_menu_unfocus}
				{pad_choose select_guitar_finish_choose Params = {Id = (<gs_available_finishes> [<I>])
						Player = <Player>
						gs_available_instruments = <gs_available_instruments>
						instrument_type = <instrument_type>
					}
				}
			]
		}
		if ($gs_current_brand_is_selected_p1 = 1)
			if (($<gs_available_instruments> [$guitar_select_old_guitar_p1]) = (<gs_available_finishes> [<I>]))
				<selected_index> = <I>
			endif
		endif
		GetScreenElementDims Id = <Id>
		if (<width> > 180)
			fit_text_in_rectangle Id = <Id> only_if_larger_x = 1 Dims = ((180.0, 0.0) + <Height> * (0.0, 1.0)) start_x_scale = 0.7 start_y_scale = 0.7
		endif
		<I> = (<I> + 1)
		repeat <array_Size>
		if (<array_Size> = 1)
			Change \{gs_made_first_selection_bool_p1 = 1}
			select_guitar_finish_highlight {
				Player = <Player>
				Id = (<gs_available_finishes> [0])
			}
			select_guitar_finish_choose {
				Id = (<gs_available_finishes> [0])
				Player = <Player>
				gs_available_instruments = <gs_available_instruments>
				instrument_type = <instrument_type>
			}
		elseif ($gs_current_brand_is_selected_p1 = 1)
			Change \{gs_made_first_selection_bool_p1 = 1}
			if (<selected_index> > 0)
				Change \{disable_menu_sounds = 1}
				<I> = 0
				begin
				LaunchEvent Type = pad_down Target = <vparent>
				repeat <selected_index>
				Change \{disable_menu_sounds = 0}
			endif
			SetScreenElementLock \{Id = vmenu_guitar_finish_menu_p1
				ON}
			SetScreenElementLock \{Id = vmenu_guitar_finish_menu_p1
				OFF}
			SetScreenElementLock \{Id = scrolling_guitar_finish_menu_p1
				ON}
			SetScreenElementLock \{Id = scrolling_guitar_finish_menu_p1
				OFF}
		endif
	else
		if (<Player> = 1)
			LaunchEvent \{Type = unfocus
				Target = scrolling_select_guitar_p1}
			LaunchEvent Type = Focus Target = <vparent>
			SetScreenElementProps \{Id = gs_select_guitar_text_p1
				Text = "SELECT FINISH"}
			get_instrument_brand_and_finish Id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p1])
			select_guitar_build_finish_array {
				Group = <instrument_group>
				gs_available_instruments = <gs_available_instruments>
				instrument_type = <instrument_type>
			}
			get_instrument_brand_and_finish Id = (<gs_available_finishes> [0])
			SetScreenElementProps \{Id = gs_brand_background_p1
				Pos = (0.0, 58.0)}
			SetScreenElementProps \{Id = gs_guitar_logo_ID_p1
				Hide}
			SetScreenElementProps {
				Id = $gs_guitar_brand_ID_p1
				Text = <instrument_brand>
				Scale = (0.75, 0.5)
				Pos = (0.0, -13.0)
				rgba = (($G_menu_colors).light_brown)
			}
			GetScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{Id = $gs_guitar_brand_ID_p1
					Scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			SetScreenElementProps {
				Id = $gs_guitar_finish_ID_p1
				Text = <instrument_finish>
				Scale = (1.0, 0.8)
				Pos = (0.0, 48.0)
				rgba = (($G_menu_colors).fill_rgba)
			}
			fit_finish_text \{Player = 1}
			GetArraySize <gs_available_finishes>
			<I> = 0
			begin
			get_instrument_brand_and_finish Id = (<gs_available_finishes> [<I>])
			CreateScreenElement {
				Type = TextElement
				PARENT = <vparent>
				font = text_a4
				Scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [Center Top]
				Text = <instrument_finish>
				event_handlers = [
					{Focus retail_menu_focus}
					{Focus select_guitar_finish_highlight Params = {Player = <Player>
							Id = (<gs_available_finishes> [<I>])
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_guitar_finish_choose Params = {Id = (<gs_available_finishes> [<I>])
							Player = <Player>
							gs_available_instruments = <gs_available_instruments>
							instrument_type = <instrument_type>
							finish_index = <I>
						}
					}
				]
				exclusive_device = <exclusive_dev>
				Hide
			}
			if ($gs_current_brand_is_selected_p1 = 1)
				if (($<gs_available_instruments> [$guitar_select_old_guitar_p1]) = (<gs_available_finishes> [<I>]))
					<selected_index> = <I>
				endif
			endif
			GetScreenElementDims Id = <Id>
			if (<width> > 180)
				fit_text_in_rectangle Id = <Id> Dims = (0.7 * ((160.0, 0.0) + (<Height> * (0.0, 1.0)))) Pos = (<p1_menu_pos> + <menu_offset>)
			endif
			<I> = (<I> + 1)
			repeat <array_Size>
			if (<array_Size> = 1)
				Change \{gs_made_first_selection_bool_p1 = 1}
				select_guitar_finish_highlight {
					Player = <Player>
					Id = (<gs_available_finishes> [0])
				}
				select_guitar_finish_choose {
					Id = (<gs_available_finishes> [0])
					Player = <Player>
					gs_available_instruments = <gs_available_instruments>
					instrument_type = <instrument_type>
					needs_net_message = 0
				}
			elseif ($gs_current_brand_is_selected_p1 = 1)
				Change \{gs_made_first_selection_bool_p1 = 1}
				if (<selected_index> > 0)
					Change \{disable_menu_sounds = 1}
					<I> = 0
					begin
					LaunchEvent Type = pad_down Target = <vparent>
					repeat <selected_index>
					Change \{disable_menu_sounds = 0}
				endif
			endif
		else
			if ($is_network_game = 0)
				LaunchEvent \{Type = unfocus
					Target = scrolling_select_guitar_p2}
				LaunchEvent Type = Focus Target = <vparent>
			endif
			SetScreenElementProps \{Id = gs_select_guitar_text_p2
				Text = "SELECT FINISH"}
			get_instrument_brand_and_finish Id = ($<gs_available_instruments> [$guitar_select_highlighted_guitar_p2])
			select_guitar_build_finish_array {
				Group = <instrument_group>
				gs_available_instruments = <gs_available_instruments>
				instrument_type = <instrument_type>
			}
			get_instrument_brand_and_finish Id = (<gs_available_finishes> [0])
			SetScreenElementProps \{Id = gs_brand_background_p2
				Pos = (0.0, 58.0)}
			SetScreenElementProps \{Id = gs_guitar_logo_ID_p2
				Hide}
			SetScreenElementProps {
				Id = $gs_guitar_brand_ID_p2
				Text = <instrument_brand>
				Scale = (0.75, 0.5)
				Pos = (0.0, -13.0)
				rgba = (($G_menu_colors).lt_violet_bar)
			}
			GetScreenElementDims \{Id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{Id = $gs_guitar_brand_ID_p2
					Scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			SetScreenElementProps {
				Id = $gs_guitar_finish_ID_p2
				Text = <instrument_finish>
				Scale = (1.0, 0.8)
				Pos = (0.0, 48.0)
				rgba = (($G_menu_colors).fill_rgba)
			}
			fit_finish_text \{Player = 2}
			GetArraySize <gs_available_finishes>
			<I> = 0
			begin
			get_instrument_brand_and_finish Id = (<gs_available_finishes> [<I>])
			CreateScreenElement {
				Type = TextElement
				PARENT = <vparent>
				font = text_a4
				Scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [Center Top]
				Text = <instrument_finish>
				event_handlers = [
					{Focus retail_menu_focus}
					{Focus select_guitar_finish_highlight Params = {Player = <Player>
							Id = (<gs_available_finishes> [<I>])
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_guitar_finish_choose Params = {Id = (<gs_available_finishes> [<I>])
							Player = <Player>
							gs_available_instruments = <gs_available_instruments>
							instrument_type = <instrument_type>
						}
					}
				]
				exclusive_device = <exclusive_dev>
				Hide
			}
			if ($gs_current_brand_is_selected_p2 = 1)
				if (($<gs_available_instruments> [$guitar_select_old_guitar_p2]) = (<gs_available_finishes> [<I>]))
					<selected_index> = <I>
				endif
			endif
			GetScreenElementDims Id = <Id>
			if (<width> > 180)
				fit_text_in_rectangle Id = <Id> Dims = (0.7 * ((160.0, 0.0) + (<Height> * (0.0, 1.0)))) Pos = (<p1_menu_pos> + <menu_offset>)
			endif
			<I> = (<I> + 1)
			repeat <array_Size>
			if (<array_Size> = 1)
				Change \{gs_made_first_selection_bool_p2 = 1}
				select_guitar_finish_highlight {
					Player = <Player>
					Id = (<gs_available_finishes> [0])
				}
				select_guitar_finish_choose {
					Id = (<gs_available_finishes> [0])
					Player = <Player>
					gs_available_instruments = <gs_available_instruments>
					instrument_type = <instrument_type>
					needs_net_message = 0
				}
			elseif ($gs_current_brand_is_selected_p2 = 1)
				Change \{gs_made_first_selection_bool_p2 = 1}
				if (<selected_index> > 0)
					Change \{disable_menu_sounds = 1}
					<I> = 0
					begin
					LaunchEvent Type = pad_down Target = <vparent>
					repeat <selected_index>
					Change \{disable_menu_sounds = 0}
				endif
			endif
		endif
	endif
endscript

script select_guitar_go_back_from_finish_menu \{Player = 1
		instrument_type = GUITAR}
	SoundEvent \{Event = Generic_Menu_Back_SFX}
	if ($current_num_players = 1)
		LaunchEvent \{Type = Focus
			Target = scrolling_select_guitar_p1}
		LaunchEvent \{Type = unfocus
			Target = scrolling_guitar_finish_menu_p1}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
		Change \{gs_made_first_selection_bool_p1 = 0}
		destroy_menu \{menu_id = select_finish_container}
		instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
		Change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
		Change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
		if NOT (<instrument_id> = ($player1_status.instrument_id))
			Change StructureName = player1_status instrument_id = <instrument_id>
			FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
			Change GlobalName = <change_flag> NewValue = 1
		endif
		SetScreenElementProps {
			Id = gs_brand_background
			texture = Char_Select_Frame_BG
			Dims = (266.0, 128.0)
			rgba = (($G_menu_colors).lt_violet_grey)
		}
		SetScreenElementProps {
			Id = $gs_guitar_brand_ID_p1
			shadow_rgba = (($G_menu_colors).lt_violet_grey)
		}
		get_instrument_brand_and_finish Id = <instrument_id>
		SetScreenElementProps Id = $gs_guitar_brand_ID_p1 Text = <instrument_brand>
		SetScreenElementProps \{Id = $gs_guitar_brand_ID_p1
			Scale = 1}
		GetScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
		if (<width> > 256)
			SetScreenElementProps \{Id = $gs_guitar_brand_ID_p1
				Scale = 1}
			fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((250.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, 8.0))
		endif
		SetScreenElementProps Id = $gs_guitar_finish_ID_p1 Text = <instrument_name2>
		get_instrument_logo Id = <instrument_id>
		SetScreenElementProps Id = gs_guitar_logo_ID_p1 Text = <instrument_logo>
		select_guitar_change_blurb_text inst_id = <instrument_id>
	else
		if (<instrument_type> = GUITAR)
			Change \{gs_select_text = "SELECT GUITAR"}
		elseif (<instrument_type> = BASS)
			Change \{gs_select_text = "SELECT BASS"}
		endif
		if (<Player> = 1)
			SetScreenElementProps \{Id = gs_select_guitar_text_p1
				Text = $gs_select_text}
			LaunchEvent \{Type = Focus
				Target = scrolling_select_guitar_p1}
			LaunchEvent \{Type = unfocus
				Target = scrolling_guitar_finish_menu_p1}
			destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
			Change \{gs_made_first_selection_bool_p1 = 0}
			if ($is_network_game = 1)
				network_player_lobby_message {
					Type = skin_select
					action = deselect
					Checksum = <instrument_type>
				}
			endif
			instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p1)])
			Change \{guitar_select_highlighted_guitar_p1 = $guitar_select_old_guitar_p1}
			Change \{gs_selected_brand_p1 = $gs_old_selected_brand_p1}
			if NOT (<instrument_id> = ($player1_status.instrument_id))
				Change StructureName = player1_status instrument_id = <instrument_id>
				FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			get_instrument_brand_and_finish Id = <instrument_id>
			SetScreenElementProps \{Id = gs_brand_background_p1
				Pos = (0.0, 30.0)}
			SetScreenElementProps {
				Id = $gs_guitar_brand_ID_p1
				Text = <instrument_brand>
				Scale = 1
				Pos = (0.0, 10.0)
				rgba = (($G_menu_colors).fill_rgba)
			}
			GetScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
			if (<width> > 260)
				SetScreenElementProps \{Id = $gs_guitar_brand_ID_p1
					Scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			SetScreenElementProps {
				Id = $gs_guitar_finish_ID_p1
				Text = <instrument_name2>
				Scale = (0.75, 0.5)
				Pos = (2.0, 93.0)
				rgba = (($G_menu_colors).light_brown)
			}
			GetScreenElementDims \{Id = $gs_guitar_finish_ID_p1}
			if (<width> > 230)
				SetScreenElementProps \{Id = $gs_guitar_finish_ID_p1
					Scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p1 Dims = ((225.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (2.0, 93.0)
			endif
			get_instrument_logo Id = <instrument_id>
			SetScreenElementProps Id = gs_guitar_logo_ID_p1 Text = <instrument_logo>
			SetScreenElementProps \{Id = gs_guitar_logo_ID_p1
				UnHide}
		else
			SetScreenElementProps \{Id = gs_select_guitar_text_p2
				Text = $gs_select_text}
			LaunchEvent \{Type = Focus
				Target = scrolling_select_guitar_p2}
			LaunchEvent \{Type = unfocus
				Target = scrolling_guitar_finish_menu_p2}
			destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
			Change \{gs_made_first_selection_bool_p2 = 0}
			instrument_id = ($<gs_available_instruments> [($guitar_select_old_guitar_p2)])
			Change \{guitar_select_highlighted_guitar_p2 = $guitar_select_old_guitar_p2}
			Change \{gs_selected_brand_p2 = $gs_old_selected_brand_p2}
			if NOT (<instrument_id> = ($player2_status.instrument_id))
				Change StructureName = player2_status instrument_id = <instrument_id>
				FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			get_instrument_brand_and_finish Id = <instrument_id>
			SetScreenElementProps \{Id = gs_brand_background_p2
				Pos = (0.0, 30.0)}
			SetScreenElementProps {
				Id = $gs_guitar_brand_ID_p2
				Text = <instrument_brand>
				Scale = 1
				Pos = (0.0, 10.0)
				rgba = (($G_menu_colors).fill_rgba)
			}
			GetScreenElementDims \{Id = $gs_guitar_brand_ID_p2}
			if (<width> > 260)
				SetScreenElementProps \{Id = $gs_guitar_brand_ID_p2
					Scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 10.0)
			endif
			SetScreenElementProps {
				Id = $gs_guitar_finish_ID_p2
				Text = <instrument_name2>
				Scale = (0.75, 0.5)
				Pos = (2.0, 93.0)
				rgba = (($G_menu_colors).lt_violet_bar)
			}
			GetScreenElementDims \{Id = $gs_guitar_finish_ID_p2}
			if (<width> > 230)
				SetScreenElementProps \{Id = $gs_guitar_finish_ID_p2
					Scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_finish_ID_p2 Dims = ((225.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (2.0, 93.0)
			endif
			get_instrument_logo Id = <instrument_id>
			SetScreenElementProps Id = gs_guitar_logo_ID_p2 Text = <instrument_logo>
			SetScreenElementProps \{Id = gs_guitar_logo_ID_p2
				UnHide}
		endif
		if (<Player> = 1)
			destroy_menu \{menu_id = select_finish_container}
		else
			destroy_menu \{menu_id = select_finish_container_p2}
		endif
	endif
endscript

script select_guitar_finish_highlight \{Player = 1
		Index = 0}
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	if NOT (<Id> = $<player_status>.instrument_id)
		Change StructureName = <player_status> instrument_id = <Id>
		FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
		Change GlobalName = <change_flag> NewValue = 1
	endif
	get_instrument_brand_and_finish Id = <Id>
	if ($current_num_players = 1)
		SetScreenElementProps Id = $gs_guitar_brand_ID_p1 Text = <instrument_brand>
		SetScreenElementProps Id = $gs_guitar_finish_ID_p1 Text = <instrument_name2>
		get_instrument_logo Id = <Id>
		SetScreenElementProps Id = gs_guitar_logo_ID_p1 Text = <instrument_logo>
		if ((($gs_scroll_dir) = DOWN) && (<Index> = 0))
			Change \{gs_highlight_index = 0}
		elseif ((($gs_scroll_dir) = UP) && (<Index> = ($gs_finishes_size - 1)))
			if (<Index> > 4)
				Change \{gs_highlight_index = 4}
			else
				Change gs_highlight_index = <Index>
			endif
		endif
		<Offset> = (($gs_highlight_index) * (0.0, 34.0))
		<l_pos> = ((-61.0, 7.0) + <Offset>)
		<r_pos> = ((250.0, 7.0) + <Offset>)
		<hl_pos> = ((-37.0, 8.0) + <Offset>)
		if ((($gs_highlight_index) = 4) && (<Index> >= ($gs_highlight_index)))
			SetScreenElementProps \{Id = gs_triangle_bottom
				Alpha = 1.0
				preserve_flip}
		else
			SetScreenElementProps \{Id = gs_triangle_bottom
				Alpha = 0.3
				preserve_flip}
		endif
		if ((($gs_highlight_index) = 0))
			SetScreenElementProps \{Id = gs_triangle_top
				Alpha = 1.0
				preserve_flip}
		else
			SetScreenElementProps \{Id = gs_triangle_top
				Alpha = 0.3
				preserve_flip}
		endif
		SetScreenElementProps Id = gs_bookend1_ID Pos = <l_pos> preserve_flip
		SetScreenElementProps Id = gs_bookend2_ID Pos = <r_pos>
		SetScreenElementProps Id = gs_whiteTexHighlight_ID Pos = <hl_pos>
	else
		if (<Player> = 1)
			SetScreenElementProps {
				Id = $gs_guitar_finish_ID_p1
				Text = <instrument_finish>
			}
			fit_finish_text \{Player = 1}
			SetScreenElementProps {
				Id = $gs_guitar_brand_ID_p1
				Text = <instrument_brand>
			}
			GetScreenElementDims \{Id = $gs_guitar_brand_ID_p1}
			if (<width> > 235)
				SetScreenElementProps \{Id = $gs_guitar_brand_ID_p1
					Scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p1 Dims = ((230.0, 0.0) + ((<Height>) * (0.0, 1.0)))
			endif
		else
			SetScreenElementProps {
				Id = $gs_guitar_finish_ID_p2
				Text = <instrument_finish>
			}
			fit_finish_text \{Player = 2}
			SetScreenElementProps {
				Id = $gs_guitar_brand_ID_p2
				Text = <instrument_brand>
			}
			GetScreenElementDims \{Id = $gs_guitar_brand_ID_p2}
			if (<width> > 235)
				SetScreenElementProps \{Id = $gs_guitar_brand_ID_p2
					Scale = 1}
				fit_text_in_rectangle Id = $gs_guitar_brand_ID_p2 Dims = ((230.0, 0.0) + ((<Height>) * (0.0, 1.0)))
			endif
		endif
	endif
endscript

script select_guitar_finish_choose \{Player = 1
		needs_net_message = 1}
	if (<Player> = 1)
		get_instrument_name_and_index Id = <Id>
		select_guitar_get_available_index_from_total_index {
			gs_available_instruments = <gs_available_instruments>
			Index = <instrument_index>
		}
		Change guitar_select_highlighted_guitar_p1 = <Index>
		if GotParam \{finish_index}
			Change gh_net_finish_id = <finish_index>
		endif
		select_guitar_choose {
			Player = <Player>
			gs_available_instruments = <gs_available_instruments>
			instrument_type = <instrument_type>
			needs_net_message = <needs_net_message>
			includes_finish = 1
		}
	else
		get_instrument_name_and_index Id = <Id>
		select_guitar_get_available_index_from_total_index {
			gs_available_instruments = <gs_available_instruments>
			Index = <instrument_index>
		}
		Change guitar_select_highlighted_guitar_p2 = <Index>
		select_guitar_choose {
			Player = <Player>
			gs_available_instruments = <gs_available_instruments>
			instrument_type = <instrument_type>
		}
	endif
	if (<Player> = 1)
		destroy_menu \{menu_id = select_finish_container}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p1}
	else
		destroy_menu \{menu_id = select_finish_container_p2}
		destroy_menu \{menu_id = scrolling_guitar_finish_menu_p2}
	endif
endscript

script build_gs_available_guitar_array 
	if (<instrument_type> = GUITAR)
		FormatText \{ChecksumName = guitar_select_available_instruments
			'guitar_select_available_guitar_array'}
		Change \{GlobalName = guitar_select_guitar_indeces
			NewValue = [
			]}
		Change GlobalName = <guitar_select_available_instruments> NewValue = []
		<I> = 0
		get_musician_instrument_size
		total_size = <array_Size>
		begin
		get_musician_instrument_struct Index = <I>
		if StructureContains Structure = <info_struct> GUITAR
			<check> = 0
			if ISPS3
				if NOT ((<info_struct>.desc_id) = Instrument_GH3_360)
					<check> = 1
				endif
			else
				<check> = 1
			endif
			if ((<info_struct>.desc_id) = Instrument_JP_PSteel)
				<check> = 0
			endif
			if (<check> = 1)
				if GetGlobalTags (<info_struct>.desc_id) Param = unlocked noassert = 1
					if (<unlocked>)
						AddArrayElement Array = $<guitar_select_available_instruments> Element = (<info_struct>.desc_id)
						Change GlobalName = <guitar_select_available_instruments> NewValue = (<Array>)
						AddArrayElement Array = $guitar_select_guitar_indeces Element = <I>
						Change GlobalName = guitar_select_guitar_indeces NewValue = (<Array>)
					endif
				else
					AddArrayElement Array = $<guitar_select_available_instruments> Element = (<info_struct>.desc_id)
					Change GlobalName = <guitar_select_available_instruments> NewValue = (<Array>)
					AddArrayElement Array = $guitar_select_guitar_indeces Element = <I>
					Change GlobalName = guitar_select_guitar_indeces NewValue = (<Array>)
				endif
			endif
		endif
		<I> = (<I> + 1)
		repeat <total_size>
	else
		FormatText \{ChecksumName = guitar_select_available_instruments
			'guitar_select_available_bass_array'}
		Change \{GlobalName = guitar_select_bass_indeces
			NewValue = [
			]}
		Change GlobalName = <guitar_select_available_instruments> NewValue = []
		<I> = 0
		get_musician_instrument_size
		total_size = <array_Size>
		begin
		get_musician_instrument_struct Index = <I>
		if StructureContains Structure = <info_struct> BASS
			if GetGlobalTags (<info_struct>.desc_id) Param = unlocked noassert = 1
				if (<unlocked>)
					AddArrayElement Array = $<guitar_select_available_instruments> Element = (<info_struct>.desc_id)
					Change GlobalName = <guitar_select_available_instruments> NewValue = (<Array>)
					AddArrayElement Array = $guitar_select_bass_indeces Element = <I>
					Change GlobalName = guitar_select_bass_indeces NewValue = (<Array>)
				endif
			else
				AddArrayElement Array = $<guitar_select_available_instruments> Element = (<info_struct>.desc_id)
				Change GlobalName = <guitar_select_available_instruments> NewValue = (<Array>)
				AddArrayElement Array = $guitar_select_bass_indeces Element = <I>
				Change GlobalName = guitar_select_bass_indeces NewValue = (<Array>)
			endif
		endif
		<I> = (<I> + 1)
		repeat <total_size>
	endif
endscript

script get_random_available_guitar_id \{instrument_type = GUITAR}
	build_gs_available_guitar_array instrument_type = <instrument_type>
	if (<instrument_type> = GUITAR)
		FormatText \{ChecksumName = gs_indeces
			'guitar_select_guitar_indeces'}
	else
		FormatText \{ChecksumName = gs_indeces
			'guitar_select_bass_indeces'}
	endif
	GetArraySize <gs_indeces> GlobalArray
	GetRandomValue A = 0 B = (<array_Size> -1) Name = random_guitar_index Integer
	get_musician_instrument_struct Index = ($<gs_indeces> [<random_guitar_index>])
	return instrument_id = (<info_struct>.desc_id)
endscript

script fit_finish_text \{Player = 1}
	dim_width = (220.0, 0.0)
	startY = 0.8
	startx = 1
	if (<Player> = 1)
		SetScreenElementProps \{Id = $gs_guitar_finish_ID_p1
			Scale = (1.0, 0.8)}
		GetScreenElementDims \{Id = $gs_guitar_finish_ID_p1}
		fit_text_in_rectangle Id = $gs_guitar_finish_ID_p1 Dims = (<dim_width> + (<Height> * (0.0, 1.0))) start_x_scale = <startx> start_y_scale = <startY> only_if_larger_x = 1
	else
		SetScreenElementProps \{Id = $gs_guitar_finish_ID_p2
			Scale = (1.0, 0.8)}
		GetScreenElementDims \{Id = $gs_guitar_finish_ID_p2}
		fit_text_in_rectangle Id = $gs_guitar_finish_ID_p2 Dims = (<dim_width> + ((<Height>) * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = <startx> start_y_scale = <startY>
	endif
endscript
