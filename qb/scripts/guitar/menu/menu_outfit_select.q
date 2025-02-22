os_made_first_selection_bool_p1 = 0
os_made_first_selection_bool_p2 = 0
os_selected_outfit_p1 = 1
os_selected_outfit_old_p1 = 1
os_selected_outfit_p2 = 1
os_selected_outfit_old_p2 = 1
os_selected_style_p1 = 1
os_selected_style_old_p1 = 1
os_selected_style_p2 = 1
os_selected_style_old_p2 = 1
os_frame_is_big = 1
os_menu_start_pos_p1 = (0.0, 110.0)

script get_style_index_from_profile_style \{Player = 1}
	get_character_outfits Player = <Player>
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	<curr_outfit> = ($<player_status>.outfit)
	if GotParam \{style}
		<curr_style> = <style>
	else
		<curr_style> = ($<player_status>.style)
	endif
	GetArraySize (<character_outfits> [(<curr_outfit> - 1)].reference)
	<I> = 0
	begin
	if ((<character_outfits> [(<curr_outfit> - 1)].reference [<I>]) = <curr_style>)
		return style_index = <I>
	endif
	<I> = (<I> + 1)
	repeat <array_Size>
endscript

script get_initial_outfit_reference \{Player = 1}
	if GotParam \{character_id}
		get_character_outfits Player = <Player> character_id = <character_id>
	else
		get_character_outfits Player = <Player>
	endif
	if GotParam \{no_outfits}
		return \{reference = 1}
	endif
	if GotParam \{outfit2}
		<Index> = 1
	else
		<Index> = 0
	endif
	GetArraySize <character_outfits>
	if (<array_Size> <= <Index>)
		return \{reference = 1}
	endif
	if StructureContains Structure = (<character_outfits> [<Index>]) reference
		return reference = (<character_outfits> [<Index>].reference [0])
	else
		return \{reference = 1}
	endif
endscript

script get_random_aero_outfit 
	if NOT GotParam \{character_id}
		ScriptAssert \{"You need to pass a character_id to script get_random_aero_outfit!"}
	endif
	if NOT GotParam \{character_name}
		ScriptAssert \{"You need to pass a character_name to script get_random_aero_outfit!"}
	endif
	get_character_outfits character_id = <character_id>
	if GotParam \{no_outfits}
		return \{random_outfit = 1
			random_style = 1}
	endif
	<outfit1> = 1
	<outfit2> = 1
	<style1> = 1
	<style2> = 1
	if ((<character_id> = JoeP) || (<character_id> = BradW) || (<character_id> = TomH))
		<style1> = 1
		<style2> = 6
	else
		<outfit2> = 2
		<style1> = 5
		<style2> = 7
	endif
	aero_outfits = []
	<outfit_loop> = (<outfit2> - <outfit1> + 1)
	<style_loop> = (<style2> - <style1> + 1)
	<I> = <outfit1>
	begin
	<J> = <style1>
	begin
	FormatText ChecksumName = outfit_checksum 'Guitarist_%n_Outfit%o_Style%s' N = <character_name> O = <I> S = <J>
	if GetGlobalTags <outfit_checksum> Param = unlocked noassert = 1
		if (<unlocked>)
			elmt = {outfit = <I> style = <J>}
			AddArrayElement Array = <aero_outfits> Element = <elmt>
			<aero_outfits> = <Array>
		endif
	else
		elmt = {outfit = <I> style = <J>}
		AddArrayElement Array = <aero_outfits> Element = <elmt>
		<aero_outfits> = <Array>
	endif
	<J> = (<J> + 1)
	repeat <style_loop>
	<I> = (<I> + 1)
	repeat <outfit_loop>
	GetArraySize <aero_outfits>
	GetRandomValue A = 0 B = (<array_Size> - 1) Name = random_index Integer
	<random_outfit> = (<aero_outfits> [<random_index>].outfit)
	<random_style> = (<aero_outfits> [<random_index>].style)
	return random_outfit = <random_outfit> random_style = <random_style>
endscript

script create_select_outfit_menu \{Player = 1}
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	if (<Player> = 1)
		Change \{os_made_first_selection_bool_p1 = 0}
	else
		Change \{os_made_first_selection_bool_p2 = 0}
	endif
	font = text_a4
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	if ((($is_network_game) = 1) && (<Player> = 1))
		pad_back_script = net_outfit_menu_flow_go_back
	else
		pad_back_script = menu_flow_go_back
	endif
	event_handlers = [
		{pad_up os_scroll_up_or_down Params = {
				Player = <Player>
				Dir = UP
			}
		}
		{pad_down os_scroll_up_or_down Params = {
				Player = <Player>
				Dir = DOWN
			}
		}
		{pad_back select_outfit_go_back Params = {
				Player = <Player>
			}
		}
		{pad_choose select_outfit_choose Params = {
				Player = <Player>
			}
		}
	]
	if (<Player> = 1)
		if ($current_num_players = 1)
			new_menu {
				scrollid = scrolling_select_outfit_p1
				vmenuid = vmenu_select_outfit_p1
				Menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
			}
			vparent = vmenu_select_outfit_p1
		else
			new_menu {
				scrollid = scrolling_select_outfit_p1
				vmenuid = vmenu_select_outfit_p1
				Menu_pos = (120.0, 190.0)
				use_backdrop = 0
				event_handlers = <event_handlers>
				exclusive_device = <exclusive_dev>
			}
			vparent = vmenu_select_outfit_p1
		endif
	else
		new_menu {
			scrollid = scrolling_select_outfit_p2
			vmenuid = vmenu_select_outfit_p2
			Menu_pos = (700.0, 120.0)
			use_backdrop = 0
			event_handlers = <event_handlers>
			exclusive_device = <exclusive_dev>
		}
		if ($is_network_game = 1)
			vmenu_select_outfit_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				Target = vmenu_select_outfit_p2}
		endif
		vparent = vmenu_select_outfit_p2
	endif
	if ($current_num_players = 1)
		LaunchEvent \{Type = unfocus
			Target = vmenu_select_outfit_p1}
		FormatText ChecksumName = player_status 'player%i_status' I = <Player>
		if find_profile_by_id Id = ($<player_status>.character_id)
			get_musician_profile_struct Index = <Index>
			FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
			if GetGlobalTags <characterguitartags> noassert = 1
				Change os_selected_outfit_p1 = (<current_outfit>)
				Change os_selected_outfit_old_p1 = (<current_outfit>)
				Change os_selected_style_p1 = (<current_style>)
				Change os_selected_style_old_p1 = (<current_style>)
			endif
		endif
		CreateScreenElement \{Type = ContainerElement
			Id = select_outfit_container_p1
			PARENT = root_window
			Pos = (392.0, 6.0)}
		frame_dims = (280.0, 600.0)
		center_pos = (0.0, 335.0)
		Change \{os_frame_is_big = 1}
		create_UI_frame {
			PARENT = select_outfit_container_p1
			frame_dims = <frame_dims>
			center_pos = <center_pos>
			frame_rgba = (($G_menu_colors).frame_rgba)
			fill_rgba = (($G_menu_colors).fill_rgba)
			z_priority = 0
		}
		header_pos = (<center_pos> - ((<frame_dims>.(0.0, 1.0)) * (0.0, 0.5) - (0.0, 80.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = select_outfit_container_p1
			Pos = <header_pos>
			Id = os_frame_header_01
			just = [Center Bottom]
			texture = window_header_01
			rgba = (($G_menu_colors).lt_violet_grey)
			z_priority = 1
		}
		CreateScreenElement {
			Type = TextElement
			PARENT = select_outfit_container_p1
			Text = "SELECT OUTFIT"
			Pos = ($gs_element_offsets [0])
			Scale = (0.6, 0.55)
			font = fontgrid_title_gh3
			just = [Center Center]
			rgba = (($G_menu_colors).pink)
			z_priority = 1
		}
		CreateScreenElement {
			Type = SpriteElement
			Id = os_name_background
			PARENT = select_outfit_container_p1
			texture = Char_Select_Frame_BG
			Pos = ($gs_element_offsets [2])
			Dims = (266.0, 128.0)
			just = [Center Center]
			rgba = (($G_menu_colors).lt_violet_grey)
			z_priority = 1
		}
		get_character_outfits Player = <Player>
		<curr_outfit> = $os_selected_outfit_p1
		styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
		get_style_index_from_profile_style Player = <Player>
		curr_style = (<styles> [<style_index>])
		GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
		CreateScreenElement {
			Type = TextElement
			Id = os_outfit_name_ID_p1
			PARENT = select_outfit_container_p1
			Text = <UpperCaseString>
			Pos = (($gs_element_offsets [2]) + (-1.0, 8.0))
			Scale = (1.0, 1.0)
			font = fontgrid_title_gh3
			just = [Center Center]
			rgba = (($G_menu_colors).BLACK)
			z_priority = 2
			Shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = (($G_menu_colors).lt_violet_grey)
		}
		GetScreenElementDims \{Id = os_outfit_name_ID_p1}
		fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((250.0, 0.0) + (<Height> * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = 1 start_y_scale = 1
		GetUpperCaseString <curr_style>
		CreateScreenElement {
			Id = os_outfit_style_ID_p1
			Type = TextBlockElement
			PARENT = select_outfit_container_p1
			Text = <UpperCaseString>
			Pos = ($gs_element_offsets [3])
			Scale = (0.55, 0.55)
			Dims = (440.0, 300.0)
			font = text_a4
			just = [Center Center]
			rgba = (($G_menu_colors).lt_violet_grey)
			Z = 2
		}
		GetScreenElementDims \{Id = os_outfit_style_ID_p1}
		if (<width> > 256)
			fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3]) start_x_scale = 0.55 start_y_scale = 0.55
		endif
		get_character_name \{Player = 1}
		get_initial_outfit_reference \{outfit2}
		FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' N = <character_name> R = <reference>
		if GetGlobalTags <outfit_2_checksum> Param = unlocked noassert = 1
			if NOT (<unlocked>)
				select_outfit_choose \{Player = 1}
			else
				scale_outfit_select_menu \{make_small}
				LaunchEvent \{Type = Focus
					Target = vmenu_select_outfit_p1}
			endif
		else
			select_outfit_choose \{Player = 1}
		endif
	else
		if (<Player> = 1)
			FormatText ChecksumName = player_status 'player%i_status' I = <Player>
			if find_profile_by_id Id = ($<player_status>.character_id)
				get_musician_profile_struct Index = <Index>
				FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
				if GetGlobalTags <characterguitartags> noassert = 1
					Change os_selected_outfit_p1 = (<current_outfit>)
					Change os_selected_outfit_old_p1 = (<current_outfit>)
					Change os_selected_style_p1 = (<current_style>)
					Change os_selected_style_old_p1 = (<current_style>)
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				Id = select_outfit_container_p1
				PARENT = root_window
				Pos = (460.0, 500.0)}
			create_UI_frame {
				frame_dims = (250.0, 185.0)
				center_pos = (0.0, 32.0)
				PARENT = select_outfit_container_p1
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
				Id = os_select_outfit_text_p1
				PARENT = select_outfit_container_p1
				Text = "SELECT OUTFIT"
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [Center Center]
				rgba = (($G_menu_colors).md_violet_grey)
				Z = 1
			}
			displaySprite {
				Id = os_name_background_p1
				PARENT = select_outfit_container_p1
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				Dims = (266.0, 128.0)
				just = [Center Center]
				rgba = (($G_menu_colors).light_brown)
				Z = 1
			}
			get_character_outfits Player = <Player>
			<curr_outfit> = $os_selected_outfit_p1
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style Player = <Player>
			curr_style = (<styles> [<style_index>])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			displayText {
				Id = os_outfit_name_ID_p1
				PARENT = select_outfit_container_p1
				Text = <UpperCaseString>
				Pos = (0.0, 20.0)
				Scale = (1.0, 1.0)
				font = text_a4
				just = [Center Center]
				rgba = (($G_menu_colors).BLACK)
				Z = 2
				noshadow
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p1}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			displayText {
				Id = os_outfit_style_ID_p1
				PARENT = select_outfit_container_p1
				Text = <UpperCaseString>
				Pos = (2.0, 93.0)
				Scale = (0.75, 0.5)
				font = text_a4
				just = [Center Center]
				rgba = (($G_menu_colors).light_brown)
				Z = 2
				noshadow
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p1}
			if (<width> > 230)
				fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((225.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{Player = 1}
			get_initial_outfit_reference \{outfit2}
			FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' N = <character_name> R = <reference>
			if GetGlobalTags <outfit_2_checksum> Param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_choose \{Player = 1}
				endif
			else
				select_outfit_choose \{Player = 1}
			endif
		else
			if NOT ($is_network_game)
				FormatText ChecksumName = player_status 'player%i_status' I = <Player>
				if find_profile_by_id Id = ($<player_status>.character_id)
					get_musician_profile_struct Index = <Index>
					FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
					if GetGlobalTags <characterguitartags> noassert = 1
						Change os_selected_outfit_p2 = (<current_outfit>)
						Change os_selected_outfit_old_p2 = (<current_outfit>)
						Change os_selected_style_p2 = (<current_style>)
						Change os_selected_style_old_p2 = (<current_style>)
					endif
				endif
			endif
			CreateScreenElement \{Type = ContainerElement
				Id = select_outfit_container_p2
				PARENT = root_window
				Pos = (810.0, 500.0)}
			create_UI_frame {
				frame_dims = (250.0, 185.0)
				center_pos = (0.0, 32.0)
				PARENT = select_outfit_container_p2
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
				Id = os_select_outfit_text_p2
				PARENT = select_outfit_container_p2
				Text = "SELECT OUTFIT"
				Pos = (0.0, -30.0)
				Scale = (0.5, 0.43)
				font = fontgrid_title_gh3
				just = [Center Center]
				rgba = (($G_menu_colors).md_violet_grey)
				Z = 1
			}
			displaySprite {
				Id = os_name_background_p2
				PARENT = select_outfit_container_p2
				tex = Char_Select_Frame_BG
				Pos = (0.0, 30.0)
				Dims = (266.0, 128.0)
				just = [Center Center]
				rgba = (($G_menu_colors).lt_violet_bar)
				Z = 1
			}
			get_character_outfits Player = <Player>
			<curr_outfit> = $os_selected_outfit_p2
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style Player = <Player>
			curr_style = (<styles> [<style_index>])
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			displayText {
				Id = os_outfit_name_ID_p2
				PARENT = select_outfit_container_p2
				Text = <UpperCaseString>
				Pos = (0.0, 20.0)
				Scale = 1
				font = text_a4
				just = [Center Center]
				rgba = (($G_menu_colors).BLACK)
				Z = 2
				noshadow
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_name_ID_p2 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			displayText {
				Id = os_outfit_style_ID_p2
				PARENT = select_outfit_container_p2
				Text = <UpperCaseString>
				Pos = (2.0, 93.0)
				Scale = (0.75, 0.5)
				font = text_a4
				just = [Center Center]
				rgba = (($G_menu_colors).lt_violet_bar)
				Z = 2
				noshadow
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p2}
			if (<width> > 230)
				fit_text_in_rectangle Id = os_outfit_style_ID_p2 Dims = ((225.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{Player = 2}
			get_initial_outfit_reference \{Player = 2
				outfit2}
			FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' N = <character_name> R = <reference>
			if GetGlobalTags <outfit_2_checksum> Param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_choose \{Player = 2}
				endif
			else
				select_outfit_choose \{Player = 2}
			endif
		endif
	endif
endscript

script scale_outfit_select_menu 
	<frames> = 30
	if GotParam \{make_big}
		Change \{os_frame_is_big = 1}
		SpawnScriptNow do_ui_frame_morph Params = {
			start_dims = (280.0, 330.0)
			end_dims = (280.0, 600.0)
			start_pos = (0.0, 200.0)
			end_pos = (0.0, 335.0)
			frames = <frames>
			PARENT = select_outfit_container_p1
		}
		Wait (<frames> + 2) GameFrames
		KillSpawnedScript \{Name = do_ui_frame_morph}
	elseif GotParam \{make_small}
		Change \{os_frame_is_big = 0}
		SpawnScriptNow do_ui_frame_morph Params = {
			start_dims = (280.0, 600.0)
			end_dims = (280.0, 330.0)
			start_pos = (0.0, 335.0)
			end_pos = (0.0, 200.0)
			frames = <frames>
			PARENT = select_outfit_container_p1
		}
		Wait (<frames> + 2) GameFrames
		KillSpawnedScript \{Name = do_ui_frame_morph}
	endif
endscript

script destroy_select_outfit_menu \{Player = 1}
	FormatText ChecksumName = scrolling_select_outfit 'scrolling_select_outfit_p%i' I = <Player>
	FormatText ChecksumName = select_outfit_container 'select_outfit_container_p%i' I = <Player>
	FormatText ChecksumName = scrolling_select_style 'scrolling_outfit_style_menu_p%i' I = <Player>
	FormatText ChecksumName = select_style_container 'select_style_container_p%i' I = <Player>
	destroy_menu menu_id = <scrolling_select_outfit>
	destroy_menu menu_id = <select_outfit_container>
	destroy_menu menu_id = <scrolling_select_style>
	destroy_menu menu_id = <select_style_container>
endscript

script select_outfit_go_back \{Player = 1}
	if (($is_network_game) && (<Player> = 1))
		network_player_lobby_message \{Type = outfit_select
			action = deselect}
	endif
	if ($current_num_players = 1)
		if NOT ($os_frame_is_big = 1)
			LaunchEvent \{Type = unfocus
				Target = vmenu_select_outfit_p1}
			scale_outfit_select_menu \{make_big}
		endif
	endif
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	FormatText ChecksumName = this_outfit 'os_selected_outfit_p%i' I = <Player>
	FormatText ChecksumName = old_outfit 'os_selected_outfit_old_p%i' I = <Player>
	FormatText ChecksumName = old_style 'os_selected_style_old_p%i' I = <Player>
	if NOT ($<old_outfit> = ($<player_status>.outfit) && $<old_style> = ($<player_status>.style))
		Change StructureName = <player_status> outfit = $<old_outfit>
		Change StructureName = <player_status> style = $<old_style>
		FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
		Change GlobalName = <change_flag> NewValue = 1
	endif
	if (<Player> = 1)
		Change \{os_selected_outfit_p1 = $os_selected_outfit_old_p1}
	else
		Change \{os_selected_outfit_p2 = $os_selected_outfit_old_p2}
	endif
	if (($is_network_game = 0) || (<Player> = 1))
		if find_profile_by_id Id = ($<player_status>.character_id)
			get_musician_profile_struct Index = <Index>
			FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
			SetGlobalTags <characterguitartags> Params = {current_outfit = ($<old_outfit>)}
		endif
	endif
	ui_flow_manager_respond_to_action action = go_back Player = <Player>
endscript

script os_scroll_up_or_down \{Player = 1
		Dir = DOWN}
	generic_menu_up_or_down_sound Params = {<Dir>}
	if (<Player> = 1)
		if ($os_made_first_selection_bool_p1 = 0)
			if ($os_selected_outfit_p1 = 1)
				get_character_name Player = <Player>
				get_initial_outfit_reference \{outfit2}
				FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' N = <character_name> R = <reference>
				if GetGlobalTags <outfit_2_checksum> Param = unlocked noassert = 1
					if (<unlocked>)
						Change \{os_selected_outfit_p1 = 2}
					endif
				endif
			else
				Change \{os_selected_outfit_p1 = 1}
			endif
			if ($is_network_game)
				network_player_lobby_message \{Type = outfit_select
					action = update
					value1 = $os_selected_outfit_p1}
			endif
			if NOT ($os_selected_outfit_p1 = ($player1_status.outfit))
				Change \{StructureName = player1_status
					outfit = $os_selected_outfit_p1}
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player1_status.outfit)
				if NOT ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
					<style> = (<character_outfits> [(<curr_outfit> - 1)].reference [0])
				else
					<style> = ($os_selected_style_p1)
				endif
				Change StructureName = player1_status style = <style>
				FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change GlobalName = <change_flag> NewValue = 1
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player1_status.outfit)
				styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
				if ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
					get_style_index_from_profile_style Player = <Player>
					curr_style = (<styles> [<style_index>])
				else
					curr_style = (<styles> [0])
				endif
				GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
				SetScreenElementProps Id = os_outfit_name_ID_p1 Text = <UpperCaseString>
				GetUpperCaseString <curr_style>
				SetScreenElementProps Id = os_outfit_style_ID_p1 Text = <UpperCaseString>
				if ($current_num_players = 1)
					SetScreenElementProps \{Id = os_outfit_name_ID_p1
						Scale = (1.0, 1.0)}
					GetScreenElementDims \{Id = os_outfit_name_ID_p1}
					fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (-2.0, 8.0)) only_if_larger_x = 1
					GetScreenElementDims \{Id = os_outfit_style_ID_p1}
					if (<width> > 256)
						fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((220.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = ($gs_element_offsets [3]) start_x_scale = 0.55 start_y_scale = 0.55
					endif
				else
					SetScreenElementProps \{Id = os_outfit_name_ID_p1
						Scale = (1.0, 1.0)}
					GetScreenElementDims \{Id = os_outfit_name_ID_p1}
					fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((250.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 20.0) only_if_larger_x = 1
					GetScreenElementDims \{Id = os_outfit_style_ID_p1}
					if (<width> > 230)
						fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((225.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
					endif
				endif
			endif
		endif
	else
		if ($os_made_first_selection_bool_p2 = 0)
			if ($os_selected_outfit_p2 = 1)
				get_character_name Player = <Player>
				get_initial_outfit_reference Player = <Player> outfit2
				FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' N = <character_name> R = <reference>
				if GetGlobalTags <outfit_2_checksum> Param = unlocked noassert = 1
					if (<unlocked>)
						Change \{os_selected_outfit_p2 = 2}
					endif
				endif
			else
				Change \{os_selected_outfit_p2 = 1}
			endif
			if NOT ($os_selected_outfit_p2 = $player2_status.outfit)
				Change \{StructureName = player2_status
					outfit = $os_selected_outfit_p2}
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player2_status.outfit)
				if NOT ($os_selected_outfit_p2 = $os_selected_outfit_old_p2)
					<style> = (<character_outfits> [(<curr_outfit> - 1)].reference [0])
				else
					<style> = ($os_selected_style_p2)
				endif
				Change StructureName = player2_status style = <style>
				FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change GlobalName = <change_flag> NewValue = 1
				get_character_outfits Player = <Player>
				<curr_outfit> = ($player2_status.outfit)
				styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
				if ($os_selected_outfit_p2 = $os_selected_outfit_old_p2)
					get_style_index_from_profile_style Player = <Player>
					curr_style = (<styles> [<style_index>])
				else
					curr_style = (<styles> [0])
				endif
				GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
				SetScreenElementProps Id = os_outfit_name_ID_p2 Text = <UpperCaseString>
				GetUpperCaseString <curr_style>
				SetScreenElementProps Id = os_outfit_style_ID_p2 Text = <UpperCaseString>
				GetScreenElementDims \{Id = os_outfit_name_ID_p2}
				SetScreenElementProps \{Id = os_outfit_name_ID_p2
					Scale = 1}
				if (<width> > 260)
					fit_text_in_rectangle Id = os_outfit_name_ID_p2 Dims = ((255.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (0.0, 20.0)
				endif
				GetScreenElementDims \{Id = os_outfit_style_ID_p2}
				if (<width> > 230)
					fit_text_in_rectangle Id = os_outfit_style_ID_p2 Dims = ((225.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
				endif
			endif
		endif
	endif
endscript

script select_outfit_choose \{Player = 1
		needs_net_message = 1}
	SoundEvent \{Event = ui_sfx_select}
	if (<Player> = 1)
		if ($os_made_first_selection_bool_p1 = 1)
			Change \{StructureName = player1_status
				outfit = $os_selected_outfit_p1}
			Change \{StructureName = player1_status
				style = $os_selected_style_p1}
			if find_profile_by_id Id = ($player1_status.character_id)
				get_musician_profile_struct Index = <Index>
				FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
				SetGlobalTags <characterguitartags> Params = {current_outfit = ($os_selected_outfit_p1) current_style = ($os_selected_style_p1)}
			endif
			Change \{os_selected_outfit_old_p1 = $os_selected_outfit_p1}
			Change \{os_selected_style_old_p1 = $os_selected_style_p1}
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = style_select
					action = SELECT
					value1 = $os_selected_style_p1}
			endif
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		else
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = outfit_select
					action = SELECT
					Checksum = $os_selected_outfit_p1}
			endif
			if ($current_num_players = 1)
				if NOT ($os_frame_is_big = 1)
					LaunchEvent \{Type = unfocus
						Target = vmenu_select_outfit_p1}
					scale_outfit_select_menu \{make_big}
				endif
			endif
			select_outfit_create_style_menu Player = <Player>
			Change \{os_made_first_selection_bool_p1 = 1}
		endif
	else
		if ($os_made_first_selection_bool_p2 = 1)
			Change \{StructureName = player2_status
				outfit = $os_selected_outfit_p2}
			Change \{StructureName = player2_status
				style = $os_selected_style_p2}
			if NOT ($is_network_game)
				if find_profile_by_id Id = ($player2_status.character_id)
					get_musician_profile_struct Index = <Index>
					FormatText ChecksumName = characterguitartags 'character_%c_player_%p_guitar_tags' C = (<profile_struct>.Name) P = <Player>
					SetGlobalTags <characterguitartags> Params = {current_outfit = ($os_selected_outfit_p2) current_style = ($os_selected_style_p2)}
				endif
			endif
			Change \{os_selected_outfit_old_p2 = $os_selected_outfit_p2}
			Change \{os_selected_style_old_p2 = $os_selected_style_p2}
			ui_flow_manager_respond_to_action action = select_character_hub Player = <Player> create_params = {Player = <Player>} destroy_params = {Player = <Player>}
		else
			select_outfit_create_style_menu Player = <Player>
			Change \{os_made_first_selection_bool_p2 = 1}
		endif
	endif
endscript

script select_outfit_create_style_menu \{Player = 1}
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	font = text_a4
	exclusive_dev = $player1_device
	if (($is_network_game) = 1)
		<exclusive_dev> = $primary_controller
	else
		if (<Player> = 2)
			<exclusive_dev> = $player2_device
		endif
	endif
	if ((($is_network_game) = 1) && (<Player> = 1))
		pad_back_script = net_destroy_select_style_menu
	else
		pad_back_script = destroy_select_style_menu
	endif
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound Params = {UP}}
		{pad_down generic_menu_up_or_down_sound Params = {DOWN}}
		{pad_back <pad_back_script> Params = {Player = <Player>}}
		{pad_start menu_show_gamercard}
	]
	<p1_menu_pos> = (566.0, 480.0)
	<p2_menu_pos> = (786.0, 490.0)
	<menu_offset> = (-270.0, -160.0)
	if (<Player> = 1)
		if ($current_num_players = 2)
			new_menu {
				scrollid = scrolling_outfit_style_menu_p1
				vmenuid = vmenu_outfit_style_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				Menu_pos = (<p1_menu_pos> + (-178.0, -210.0))
				exclusive_device = <exclusive_dev>
				internal_just = [Center Top]
			}
		else
			new_menu {
				scrollid = scrolling_outfit_style_menu_p1
				vmenuid = vmenu_outfit_style_menu_p1
				use_backdrop = 0
				event_handlers = <event_handlers>
				Menu_pos = (<p1_menu_pos> + <menu_offset>)
				internal_just = [Center Top]
				text_left
			}
		endif
		vparent = vmenu_outfit_style_menu_p1
	else
		new_menu {
			scrollid = scrolling_outfit_style_menu_p2
			vmenuid = vmenu_outfit_style_menu_p2
			use_backdrop = 0
			event_handlers = <event_handlers>
			Menu_pos = <p2_menu_pos>
			exclusive_device = <exclusive_dev>
			internal_just = [Center Top]
		}
		if ($is_network_game = 1)
			vmenu_outfit_style_menu_p2 :SetProps \{disable_pad_handling}
			LaunchEvent \{Type = unfocus
				Target = vmenu_outfit_style_menu_p2}
		endif
		vparent = vmenu_outfit_style_menu_p2
	endif
	if (<Player> = 1)
		LaunchEvent \{Type = unfocus
			Target = scrolling_select_outfit_p1}
		LaunchEvent \{Type = unfocus
			Target = scrolling_outfit_style_menu_p1}
	else (<Player> = 2)
		LaunchEvent \{Type = unfocus
			Target = scrolling_select_outfit_p2}
	endif
	if ($current_num_players = 1)
		CreateScreenElement {
			Type = ContainerElement
			Id = select_style_container
			PARENT = root_window
			Pos = (<p1_menu_pos> + <menu_offset>)
			internal_just = [Center Top]
		}
		SetScreenElementProps \{Id = os_name_background
			texture = Char_Select_Frame_BG2
			rgba = [
				210
				120
				155
				255
			]}
		SetScreenElementProps {
			Id = os_outfit_name_ID_p1
			shadow_rgba = (($G_menu_colors).frame_rgba)
		}
		GetScreenElementDims \{Id = os_outfit_name_ID_p1}
		GetScreenElementProps \{Id = os_outfit_name_ID_p1}
		if (<Scale> = 1)
			<x_scale> = 1.0
			<y_scale> = 1.0
		else
			<x_scale> = (<Scale>.(1.0, 0.0))
			<y_scale> = (<Scale>.(0.0, 1.0))
		endif
		fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((250.0, 0.0) + (<Height> * (0.0, 1.0))) only_if_larger_x = 1 start_x_scale = <x_scale> start_y_scale = <y_scale>
		displaySprite {
			Id = os_bookend1_ID
			PARENT = select_style_container
			tex = character_hub_hilite_bookend
			Dims = (24.0, 32.0)
			just = [LEFT Top]
			rgba = (($G_menu_colors).md_violet_grey)
			Z = 4
			flip_v
		}
		displaySprite {
			Id = os_bookend2_ID
			PARENT = select_style_container
			tex = character_hub_hilite_bookend
			Dims = (24.0, 32.0)
			just = [RIGHT Top]
			rgba = (($G_menu_colors).md_violet_grey)
			Z = 4
		}
		displaySprite {
			Id = os_whiteTexHighlight_ID
			PARENT = select_style_container
			tex = hilite_bar_01
			just = [LEFT Top]
			rgba = (($G_menu_colors).md_violet_grey)
			Dims = (264.0, 32.0)
			Pos = (-37.0, 8.0)
			Z = 2
		}
		set_focus_color \{Color = BLACK}
		set_unfocus_color \{Color = dk_violet_grey}
		get_character_outfits Player = <Player>
		outfit = ($player1_status.outfit)
		styles = (<character_outfits> [(<outfit> - 1)].styles)
		GetArraySize <styles>
		<num_in_list> = 0
		<I> = 0
		begin
		<add_style> = 1
		if NOT (<I> = 0)
			get_character_name Player = <Player>
			FormatText ChecksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' N = <character_name> O = <outfit> S = (<character_outfits> [(<outfit> - 1)].reference [<I>])
			if GetGlobalTags <outfit_style_cs> Param = unlocked noassert = 1
				if (<unlocked> = 0)
					<add_style> = 0
				endif
			else
				<add_style> = 0
			endif
		endif
		FormatText ChecksumName = os_style_menu_item_id 'os_style_menu_item_%n' N = <I>
		GetUpperCaseString (<styles> [<I>])
		if (<add_style>)
			<num_in_list> = (<num_in_list> + 1)
			CreateScreenElement {
				Id = <os_style_menu_item_id>
				Type = TextElement
				PARENT = <vparent>
				font = text_a4
				Scale = (0.7, 0.7)
				rgba = ($menu_unfocus_color)
				just = [Center Top]
				Text = <UpperCaseString>
				event_handlers = [
					{Focus retail_menu_focus}
					{Focus select_outfit_style_highlight Params = {Player = <Player>
							Index = <I>
						}
					}
					{unfocus retail_menu_unfocus}
					{pad_choose select_outfit_style_choose Params = {Player = <Player>}}
				]
			}
			GetScreenElementDims Id = <Id>
			if (<width> > 180)
				SetScreenElementProps Id = <Id> Scale = (1.0, 1.0)
				fit_text_in_rectangle Id = <Id> Dims = ((180.0, 34.0))
			endif
		else
			CreateScreenElement {
				Type = TextElement
				PARENT = <vparent>
				font = text_a4
				Scale = (0.7, 0.7)
				rgba = [128 128 128 75]
				just = [Center Top]
				Text = <UpperCaseString>
				NOT_FOCUSABLE
			}
			GetScreenElementDims Id = <Id>
			if (<width> > 180)
				SetScreenElementProps Id = <Id> Scale = (1.0, 1.0)
				fit_text_in_rectangle Id = <Id> Dims = ((180.0, 34.0))
			endif
		endif
		<I> = (<I> + 1)
		repeat <array_Size>
		if (<num_in_list> = 1)
			Change \{os_made_first_selection_bool_p1 = 1}
			select_outfit_style_highlight {
				Player = <Player>
			}
			select_outfit_style_choose {
				Player = <Player>
			}
		else
			LaunchEvent \{Type = Focus
				Target = scrolling_outfit_style_menu_p1}
			if ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
				get_style_index_from_profile_style Player = <Player>
				if (<style_index> > 0)
					Change \{disable_menu_sounds = 1}
					begin
					LaunchEvent Type = pad_down Target = <vparent>
					if ($os_selected_style_p1 = $os_selected_style_old_p1)
						break
					endif
					repeat (<style_index>)
					Change \{disable_menu_sounds = 0}
				endif
			endif
		endif
	else
		if (<Player> = 1)
			LaunchEvent \{Type = unfocus
				Target = scrolling_select_outfit_p1}
			LaunchEvent Type = Focus Target = <vparent>
			SetScreenElementProps \{Id = os_select_outfit_text_p1
				Text = "SELECT STYLE"}
			SetScreenElementProps \{Id = os_name_background_p1
				Pos = (0.0, 58.0)}
			get_character_outfits Player = <Player>
			outfit = ($player1_status.outfit)
			styles = (<character_outfits> [(<outfit> - 1)].styles)
			curr_style = (<styles> [(($player1_status.style) - 1)])
			GetUpperCaseString (<character_outfits> [(<outfit> - 1)].Name)
			SetScreenElementProps {
				Id = os_outfit_name_ID_p1
				Text = <UpperCaseString>
				Scale = (0.75, 0.5)
				Pos = (0.0, -13.0)
				rgba = (($G_menu_colors).light_brown)
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p1}
			fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((250.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, -6.0) only_if_larger_x = 1
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p1
				Text = <UpperCaseString>
				Scale = 1
				Pos = (0.0, 48.0)
				rgba = (($G_menu_colors).BLACK)
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p1}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 48.0)
			endif
			GetArraySize <styles>
			<num_in_list> = 0
			<I> = 0
			begin
			<add_style> = 1
			if NOT (<I> = 0)
				get_character_name Player = <Player>
				FormatText ChecksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' N = <character_name> O = <outfit> S = (<character_outfits> [(<outfit> - 1)].reference [<I>])
				if GetGlobalTags <outfit_style_cs> Param = unlocked noassert = 1
					if (<unlocked> = 0)
						<add_style> = 0
					endif
				else
					<add_style> = 0
				endif
			endif
			if (<add_style>)
				<num_in_list> = (<num_in_list> + 1)
				GetUpperCaseString (<styles> [<I>])
				CreateScreenElement {
					Type = TextElement
					PARENT = <vparent>
					font = text_a4
					Scale = (0.7, 0.7)
					rgba = ($menu_unfocus_color)
					just = [Center Top]
					Text = <UpperCaseString>
					event_handlers = [
						{Focus retail_menu_focus}
						{Focus select_outfit_style_highlight Params = {Player = <Player>
								Index = <I>
							}
						}
						{unfocus retail_menu_unfocus}
						{pad_choose select_outfit_style_choose Params = {
								Player = <Player>
							}
						}
					]
					exclusive_device = <exclusive_dev>
					Hide
				}
				GetScreenElementDims Id = <Id>
				if (<width> > 180)
					fit_text_in_rectangle Id = <Id> Dims = (0.7 * ((160.0, 0.0) + (<Height> * (0.0, 1.0)))) Pos = (<p1_menu_pos> + <menu_offset>)
				endif
			endif
			<I> = (<I> + 1)
			repeat <array_Size>
			if (<num_in_list> = 1)
				Change \{os_made_first_selection_bool_p1 = 1}
				select_outfit_style_highlight {
					needs_net_message = 0
					Player = <Player>
				}
				select_outfit_style_choose {
					needs_net_message = 0
					Player = <Player>
				}
			else
				if ($os_selected_outfit_p1 = $os_selected_outfit_old_p1)
					get_style_index_from_profile_style Player = <Player>
					if (<style_index> > 0)
						Change \{disable_menu_sounds = 1}
						begin
						LaunchEvent Type = pad_down Target = <vparent>
						if ($os_selected_style_p1 = $os_selected_style_old_p1)
							break
						endif
						repeat (<style_index>)
						Change \{disable_menu_sounds = 0}
					endif
				endif
			endif
		else
			LaunchEvent \{Type = unfocus
				Target = scrolling_select_outfit_p2}
			if ($is_network_game = 0)
				LaunchEvent Type = Focus Target = <vparent>
			endif
			SetScreenElementProps \{Id = os_select_outfit_text_p2
				Text = "SELECT STYLE"}
			SetScreenElementProps \{Id = os_name_background_p2
				Pos = (0.0, 58.0)}
			get_character_outfits Player = <Player>
			<outfit> = ($player2_status.outfit)
			styles = (<character_outfits> [(<outfit> - 1)].styles)
			curr_style = (<styles> [(($player2_status.style) - 1)])
			GetUpperCaseString (<character_outfits> [(<outfit> - 1)].Name)
			SetScreenElementProps {
				Id = os_outfit_name_ID_p2
				Text = <UpperCaseString>
				Scale = (0.75, 0.5)
				Pos = (0.0, -13.0)
				rgba = (($G_menu_colors).lt_violet_bar)
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_name_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, -6.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p2
				Text = <UpperCaseString>
				Scale = 1
				Pos = (0.0, 48.0)
				rgba = (($G_menu_colors).BLACK)
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_style_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 48.0)
			endif
			GetArraySize <styles>
			<num_in_list> = 0
			<I> = 0
			begin
			<add_style> = 1
			if NOT (<I> = 0)
				get_character_name Player = <Player>
				FormatText ChecksumName = outfit_style_cs 'Guitarist_%n_Outfit%o_Style%s' N = <character_name> O = <outfit> S = (<character_outfits> [(<outfit> - 1)].reference [<I>])
				if GetGlobalTags <outfit_style_cs> Param = unlocked noassert = 1
					if (<unlocked> = 0)
						<add_style> = 0
					endif
				else
					<add_style> = 0
				endif
			endif
			if (<add_style>)
				<num_in_list> = (<num_in_list> + 1)
				GetUpperCaseString (<styles> [<I>])
				CreateScreenElement {
					Type = TextElement
					PARENT = <vparent>
					font = text_a4
					Scale = (0.7, 0.7)
					rgba = ($menu_unfocus_color)
					just = [Center Top]
					Text = <UpperCaseString>
					event_handlers = [
						{Focus retail_menu_focus}
						{Focus select_outfit_style_highlight Params = {Player = <Player>
								Index = <I>
							}
						}
						{unfocus retail_menu_unfocus}
						{pad_choose select_outfit_style_choose Params = {
								Player = <Player>
							}
						}
					]
					exclusive_device = <exclusive_dev>
					Hide
				}
				GetScreenElementDims Id = <Id>
				if (<width> > 180)
					fit_text_in_rectangle Id = <Id> Dims = (0.7 * ((160.0, 0.0) + (<Height> * (0.0, 1.0)))) Pos = (<p2_menu_pos> + <menu_offset>)
				endif
			endif
			<I> = (<I> + 1)
			repeat <array_Size>
			if (<num_in_list> = 1)
				Change \{os_made_first_selection_bool_p2 = 1}
				select_outfit_style_highlight {
					Player = <Player>
				}
				select_outfit_style_choose {
					Player = <Player>
				}
			else
				if ($os_selected_outfit_p2 = $os_selected_outfit_old_p2)
					get_style_index_from_profile_style Player = <Player>
					if (<style_index> > 0)
						Change \{disable_menu_sounds = 1}
						begin
						LaunchEvent Type = pad_down Target = <vparent>
						if ($os_selected_style_p2 = $os_selected_style_old_p2)
							break
						endif
						repeat (<style_index>)
						Change \{disable_menu_sounds = 0}
					endif
				endif
			endif
		endif
	endif
endscript

script net_destroy_select_style_menu \{Player = 1}
	if ($is_network_game)
		network_player_lobby_message \{Type = style_select
			action = deselect}
	endif
	destroy_select_style_menu Player = <Player>
endscript

script destroy_select_style_menu \{Player = 1}
	SoundEvent \{Event = Generic_Menu_Back_SFX}
	if ($current_num_players = 1)
		LaunchEvent \{Type = unfocus
			Target = scrolling_outfit_style_menu_p1}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
		Change \{os_made_first_selection_bool_p1 = 0}
		destroy_menu \{menu_id = select_style_container}
		FormatText ChecksumName = old_outfit 'os_selected_outfit_old_p%i' I = <Player>
		FormatText ChecksumName = old_style 'os_selected_style_old_p%i' I = <Player>
		if NOT ($<old_outfit> = ($player1_status.outfit) && $<old_style> = ($player1_status.style))
			Change StructureName = player1_status outfit = $<old_outfit>
			Change StructureName = player1_status style = $<old_style>
			FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
			Change GlobalName = <change_flag> NewValue = 1
		endif
		Change os_selected_outfit_p1 = $<old_outfit>
		Change os_selected_style_p1 = $<old_style>
		get_character_name \{Player = 1}
		get_initial_outfit_reference \{outfit2}
		FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' N = <character_name> R = <reference>
		if GetGlobalTags <outfit_2_checksum> Param = unlocked noassert = 1
			if (<unlocked>)
				if ($os_frame_is_big = 1)
					scale_outfit_select_menu \{make_small}
				endif
			endif
		endif
		if ScreenElementExists \{Id = scrolling_select_outfit_p1}
			LaunchEvent \{Type = Focus
				Target = scrolling_select_outfit_p1}
		endif
		SetScreenElementProps {
			Id = os_name_background
			texture = Char_Select_Frame_BG
			Dims = (266.0, 128.0)
			rgba = (($G_menu_colors).lt_violet_grey)
		}
		SetScreenElementProps {
			Id = os_outfit_name_ID_p1
			shadow_rgba = (($G_menu_colors).lt_violet_grey)
		}
		get_character_outfits Player = <Player>
		<curr_outfit> = ($player1_status.outfit)
		styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
		get_style_index_from_profile_style Player = <Player>
		curr_style = (<styles> [<style_index>])
		GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
		SetScreenElementProps Id = os_outfit_name_ID_p1 Text = <UpperCaseString>
		GetUpperCaseString <curr_style>
		SetScreenElementProps Id = os_outfit_style_ID_p1 Text = <UpperCaseString>
		SetScreenElementProps \{Id = os_outfit_name_ID_p1
			Scale = (1.0, 1.0)}
		GetScreenElementDims \{Id = os_outfit_name_ID_p1}
		fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((250.0, 0.0) + (<Height> * (0.0, 1.0))) Pos = (($gs_element_offsets [2]) + (0.0, 8.0)) only_if_larger_x = 1
		get_character_name \{Player = 1}
		get_initial_outfit_reference \{outfit2}
		FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' N = <character_name> R = <reference>
		if GetGlobalTags <outfit_2_checksum> Param = unlocked noassert = 1
			if NOT (<unlocked>)
				select_outfit_go_back \{Player = 1}
			endif
		else
			select_outfit_go_back \{Player = 1}
		endif
	else
		if (<Player> = 1)
			SetScreenElementProps \{Id = os_select_outfit_text_p1
				Text = "SELECT OUTFIT"}
			LaunchEvent \{Type = Focus
				Target = scrolling_select_outfit_p1}
			LaunchEvent \{Type = unfocus
				Target = scrolling_outfit_style_menu_p1}
			destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
			Change \{os_made_first_selection_bool_p1 = 0}
			FormatText ChecksumName = old_outfit 'os_selected_outfit_old_p%i' I = <Player>
			FormatText ChecksumName = old_style 'os_selected_style_old_p%i' I = <Player>
			if NOT ($<old_outfit> = ($player1_status.outfit) && $<old_style> = ($player1_status.style))
				Change StructureName = player1_status outfit = $<old_outfit>
				Change StructureName = player1_status style = $<old_style>
				FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			Change os_selected_outfit_p1 = $<old_outfit>
			Change os_selected_style_p1 = $<old_style>
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player1_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style Player = <Player>
			curr_style = (<styles> [<style_index>])
			SetScreenElementProps \{Id = os_name_background_p1
				Pos = (0.0, 30.0)}
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				Id = os_outfit_name_ID_p1
				Text = <UpperCaseString>
				Scale = 1
				Pos = (0.0, 20.0)
				rgba = (($G_menu_colors).BLACK)
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p1}
			fit_text_in_rectangle Id = os_outfit_name_ID_p1 Dims = ((250.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 20.0) only_if_larger_x = 1
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p1
				Text = <UpperCaseString>
				Scale = (0.75, 0.5)
				Pos = (2.0, 93.0)
				rgba = (($G_menu_colors).light_brown)
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p1}
			if (<width> > 230)
				fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((225.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{Player = 1}
			get_initial_outfit_reference \{outfit2}
			FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' N = <character_name> R = <reference>
			if GetGlobalTags <outfit_2_checksum> Param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_go_back \{Player = 1}
				endif
			else
				select_outfit_go_back \{Player = 1}
			endif
		else
			SetScreenElementProps \{Id = os_select_outfit_text_p2
				Text = "SELECT OUTFIT"}
			LaunchEvent \{Type = Focus
				Target = scrolling_select_outfit_p2}
			LaunchEvent \{Type = unfocus
				Target = scrolling_outfit_style_menu_p2}
			destroy_menu \{menu_id = scrolling_outfit_style_menu_p2}
			Change \{os_made_first_selection_bool_p2 = 0}
			FormatText ChecksumName = old_outfit 'os_selected_outfit_old_p%i' I = <Player>
			FormatText ChecksumName = old_style 'os_selected_style_old_p%i' I = <Player>
			if NOT ($<old_outfit> = ($player2_status.outfit) && $<old_style> = ($player2_status.style))
				Change StructureName = player2_status outfit = $<old_outfit>
				Change StructureName = player2_status style = $<old_style>
				FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
				Change GlobalName = <change_flag> NewValue = 1
			endif
			Change os_selected_outfit_p2 = $<old_outfit>
			Change os_selected_style_p2 = $<old_style>
			get_character_outfits Player = <Player>
			<curr_outfit> = ($player2_status.outfit)
			styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
			get_style_index_from_profile_style Player = <Player>
			curr_style = (<styles> [<style_index>])
			SetScreenElementProps \{Id = os_name_background_p2
				Pos = (0.0, 30.0)}
			GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
			SetScreenElementProps {
				Id = os_outfit_name_ID_p2
				Text = <UpperCaseString>
				Scale = 1
				Pos = (0.0, 20.0)
				rgba = (($G_menu_colors).BLACK)
			}
			GetScreenElementDims \{Id = os_outfit_name_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_name_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 20.0)
			endif
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p2
				Text = <UpperCaseString>
				Scale = (0.75, 0.5)
				Pos = (2.0, 93.0)
				rgba = (($G_menu_colors).lt_violet_bar)
			}
			GetScreenElementDims \{Id = os_outfit_style_ID_p2}
			if (<width> > 230)
				fit_text_in_rectangle Id = os_outfit_style_ID_p2 Dims = ((225.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (2.0, 93.0) start_x_scale = 0.75 start_y_scale = 0.5
			endif
			get_character_name \{Player = 2}
			get_initial_outfit_reference \{Player = 2
				outfit2}
			FormatText ChecksumName = outfit_2_checksum 'Guitarist_%n_Outfit2_Style%r' N = <character_name> R = <reference>
			if GetGlobalTags <outfit_2_checksum> Param = unlocked noassert = 1
				if NOT (<unlocked>)
					select_outfit_go_back \{Player = 2}
				endif
			else
				select_outfit_go_back \{Player = 2}
			endif
		endif
	endif
	if (<Player> = 1)
		destroy_menu \{menu_id = select_style_container}
	else
		destroy_menu \{menu_id = select_style_container_p2}
	endif
endscript

script select_outfit_style_highlight \{Player = 1
		Index = 0
		needs_net_message = 1}
	get_character_outfits Player = <Player>
	if (<Player> = 1)
		<curr_outfit> = ($player1_status.outfit)
	else
		<curr_outfit> = ($player2_status.outfit)
	endif
	FormatText ChecksumName = player_status 'player%i_status' I = <Player>
	FormatText ChecksumName = selected_outfit 'os_selected_outfit_p%i' I = <Player>
	<our_style> = (<character_outfits> [(<curr_outfit> - 1)].reference [<Index>])
	if NOT ($<selected_outfit> = ($<player_status>.outfit) && <our_style> = ($<player_status>.style))
		Change StructureName = <player_status> style = <our_style>
		FormatText ChecksumName = change_flag 'generic_select_monitor_p%i_changed' I = <Player>
		Change GlobalName = <change_flag> NewValue = 1
	endif
	if (<Player> = 1)
		Change os_selected_style_p1 = <our_style>
	else
		Change os_selected_style_p2 = <our_style>
	endif
	styles = (<character_outfits> [(<curr_outfit> - 1)].styles)
	curr_style = (<styles> [(<Index>)])
	if ($current_num_players = 1)
		GetUpperCaseString (<character_outfits> [(<curr_outfit> - 1)].Name)
		SetScreenElementProps Id = os_outfit_name_ID_p1 Text = <UpperCaseString>
		GetUpperCaseString <curr_style>
		SetScreenElementProps Id = os_outfit_style_ID_p1 Text = <UpperCaseString>
		<Offset> = (<Index> * (0.0, 34.1))
		<l_pos> = ((-61.0, 7.0) + <Offset>)
		<r_pos> = ((250.0, 7.0) + <Offset>)
		<hl_pos> = ((-37.0, 8.0) + <Offset>)
		SetScreenElementProps Id = os_bookend1_ID Pos = <l_pos> preserve_flip
		SetScreenElementProps Id = os_bookend2_ID Pos = <r_pos>
		SetScreenElementProps Id = os_whiteTexHighlight_ID Pos = <hl_pos>
	else
		if (<Player> = 1)
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p1
				Text = <UpperCaseString>
			}
			SetScreenElementProps \{Id = os_outfit_style_ID_p1
				Scale = (1.0, 1.0)}
			GetScreenElementDims \{Id = os_outfit_style_ID_p1}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_style_ID_p1 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 48.0)
			endif
			if (($is_network_game) && (<needs_net_message> = 1))
				network_player_lobby_message \{Type = style_select
					action = update
					value1 = $os_selected_style_p1}
			endif
		else
			GetUpperCaseString <curr_style>
			SetScreenElementProps {
				Id = os_outfit_style_ID_p2
				Text = <UpperCaseString>
			}
			SetScreenElementProps \{Id = os_outfit_style_ID_p2
				Scale = 1}
			GetScreenElementDims \{Id = os_outfit_style_ID_p2}
			if (<width> > 260)
				fit_text_in_rectangle Id = os_outfit_style_ID_p2 Dims = ((255.0, 0.0) + ((<Height>) * (0.0, 1.0))) Pos = (0.0, 48.0)
			endif
		endif
	endif
endscript

script select_outfit_style_choose \{Player = 1
		needs_net_message = 1}
	if (<Player> = 1)
		select_outfit_choose {
			Player = <Player>
			needs_net_message = <needs_net_message>
		}
	else
		select_outfit_choose {
			Player = <Player>
		}
	endif
	if (<Player> = 1)
		destroy_menu \{menu_id = select_style_container}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p1}
	else
		destroy_menu \{menu_id = select_style_container_p2}
		destroy_menu \{menu_id = scrolling_outfit_style_menu_p2}
	endif
endscript
