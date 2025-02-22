beat_game_title = "DU HAST GUITAR HERO AEROSMITH AUF \\c0%d GEMEISTERT!\\c0"
beat_game_message = "Hast Du das Zeug dazu es Deinen Fans \\nmal so richtig zu zeigen? Dann spiel mal im \\c1%n\\c0-Modus. Wenn Du es schafft, kannst Du Dir einen Preis verdienen. Schmerz, Ruhm und Ehre erwarten Dich, junger Rocker."
beat_game_message_expert = "Wow. Du hast den \\c1Profi-Modus\\c0 gemeistert -- Nun gründe schon eine Band! Jetzt kannst du mit \\c1%n\\c0 noch einen Gang zulegen! Cheats können im Options-Menü freigeschaltet werden."

script create_beat_game_menu 
	create_menu_backdrop \{texture = beat_game_bg}
	menu_font = fontgrid_title_gh3
	get_current_band_info
	getglobaltags <band_info> param = name
	band_name = <name>
	formattext textname = band_name_text "%s" s = <band_name>
	difficulty_text = "PROFI"
	next_difficulty_text = "PRECISION-MODUS CHEAT"
	<difficulty> = ($current_difficulty)
	switch (<difficulty>)
		case easy
		<difficulty_text> = "LEICHT"
		next_difficulty = medium
		<next_difficulty_text> = "MITTEL"
		case medium
		<difficulty_text> = "MITTEL"
		next_difficulty = hard
		<next_difficulty_text> = "SCHWER"
		case hard
		<difficulty_text> = "SCHWER"
		next_difficulty = expert
		<next_difficulty_text> = "PROFI"
	endswitch
	createscreenelement \{type = containerelement
		parent = root_window
		id = beat_game_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	createscreenelement {
		type = textelement
		parent = beat_game_container
		id = bgs_band_name
		just = [center top]
		font = <menu_font>
		text = <band_name_text>
		scale = 1.38
		rgba = (($g_menu_colors).pink)
		pos = (640.0, 366.0)
	}
	getscreenelementdims \{id = bgs_band_name}
	if (<width> > 300)
		fit_text_in_rectangle \{id = bgs_band_name
			dims = (1060.0, 130.0)
			pos = (640.0, 366.0)}
	endif
	formattext textname = title_text $beat_game_title d = <difficulty_text>
	createscreenelement {
		type = textelement
		parent = beat_game_container
		id = bgs_under_title
		just = [left top]
		font = <menu_font>
		text = <title_text>
		scale = 1.0
		rgba = (($g_menu_colors).lt_violet_grey)
	}
	fit_text_in_rectangle \{id = bgs_under_title
		dims = (700.0, 65.0)
		pos = (300.0, 428.0)}
	if (<difficulty> = expert)
		formattext textname = motivation_text ($beat_game_message_expert) n = <next_difficulty_text>
	else
		formattext textname = motivation_text ($beat_game_message) n = <next_difficulty_text>
	endif
	createscreenelement {
		type = textblockelement
		parent = beat_game_container
		font = text_a4
		text = <motivation_text>
		dims = (1100.0, 700.0)
		pos = (640.0, 468.0)
		rgba = (($g_menu_colors).dk_violet_grey)
		just = [center top]
		internal_just = [center top]
		scale = 0.7
		z_priority = 3
	}
	<cheat> = "ALL DAY AND ALL OF THE NIGHT RIFF x 2"
	formattext textname = cheat_text "CHEAT-HINWEIS: %c" c = <cheat>
	if (<difficulty> = expert)
		createscreenelement {
			type = textelement
			parent = beat_game_container
			id = bgs_cheat_text
			just = [center top]
			font = <menu_font>
			text = <cheat_text>
			scale = 0.5
			pos = (640.0, 622.0)
			rgba = (($g_menu_colors).lt_violet_grey)
		}
	endif
	button_font = buttonsxenon
	displaysprite \{id = bgs_black_banner
		parent = beat_game_container
		tex = white
		pos = (0.0, -2.0)
		dims = (1240.0, 100.0)
		rgba = [
			0
			0
			0
			255
		]
		z = -2}
	createscreenelement {
		type = textelement
		parent = beat_game_container
		id = continue_text
		scale = 1.0
		pos = (40.0, 20.0)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left center]
		event_handlers = [
			{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
		]
	}
	spawnscriptnow scroll_ticker_text params = {ticker_text = <band_name_text>}
	launchevent \{type = focus
		target = continue_text}
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "WEITER"
		button = green
		z = 100}
endscript

script destroy_beat_game_menu 
	change \{check_for_unplugged_controllers = 0}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = beat_game_container}
	destroy_menu_backdrop
	killspawnedscript \{name = scroll_ticker_text}
endscript
g_num_scrolling_texts = 0

script scroll_ticker_text {
		ticker_text = "I NEED TICKER TEXT!"
		ticker_space = " "
		ticker_pos = (0.0, 34.0)
		ticker_just = [left top]
		ticker_parent = beat_game_container
		ticker_x_scale = 1
		ticker_y_scale = 1
		ticker_font = text_a5
		ticker_rgba1 = (($g_menu_colors).dk_violet_grey)
		ticker_rgba2 = (($g_menu_colors).pink)
		ticker_alpha = 1
		ticker_z_priority = -1
		time = 5
	}
	formattext \{checksumname = ticker_text_id_1
		'scrolling_ticker_text_%i_1'
		i = $g_num_scrolling_texts}
	createscreenelement {
		type = textelement
		just = <ticker_just>
		id = <ticker_text_id_1>
		parent = <ticker_parent>
		pos = <ticker_pos>
		scale = ((<ticker_x_scale> * (1.0, 0.0)) + (<ticker_y_scale> * (0.0, 1.0)))
		font = <ticker_font>
		text = <ticker_text>
		rgba = <ticker_rgba1>
		alpha = <ticker_alpha>
		z_priority = <ticker_z_priority>
	}
	getscreenelementdims id = <ticker_text_id_1>
	if (<width> > 0)
		multi = (1280 / <width>)
	else
		scriptassert \{"Can't perform this operation using a screen element with no width!"}
	endif
	ticker_text_with_space = (<ticker_text> + <ticker_space>)
	long_ticker_text = <ticker_text_with_space>
	stringlength string = <ticker_text_with_space>
	<ticker_text_with_space_length> = <str_len>
	begin
	stringlength string = <long_ticker_text>
	<long_ticker_text_length> = <str_len>
	if NOT (<long_ticker_text_length> < (127 - <ticker_text_with_space_length>))
		break
	endif
	<long_ticker_text> = (<long_ticker_text> + <ticker_text_with_space>)
	setscreenelementprops id = <ticker_text_id_1> text = <long_band_text>
	getscreenelementdims id = <ticker_text_id_1>
	if (<width> > 1280)
		break
	endif
	repeat <multi>
	setscreenelementprops id = <ticker_text_id_1> text = <long_ticker_text> pos = <ticker_pos>
	formattext \{checksumname = ticker_text_id_2
		'scrolling_ticker_text_%i_2'
		i = $g_num_scrolling_texts}
	createscreenelement {
		id = <ticker_text_id_2>
		type = textelement
		just = <ticker_just>
		parent = <ticker_parent>
		scale = ((<ticker_x_scale> * (1.0, 0.0)) + (<ticker_y_scale> * (0.0, 1.0)))
		font = <ticker_font>
		text = <long_ticker_text>
		rgba = <ticker_rgba2>
		alpha = <ticker_alpha>
		z_priority = <ticker_z_priority>
	}
	getscreenelementdims id = <ticker_text_id_1>
	setscreenelementprops id = <ticker_text_id_2> pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
	change g_num_scrolling_texts = ($g_num_scrolling_texts + 1)
	first = 1
	begin
	if (<first>)
		doscreenelementmorph id = <ticker_text_id_1> pos = (((-1.0, 0.0) * <width>) + <ticker_pos>) time = <time>
		doscreenelementmorph id = <ticker_text_id_2> pos = <ticker_pos> time = <time>
	else
		doscreenelementmorph id = <ticker_text_id_2> pos = (((-1.0, 0.0) * <width>) + <ticker_pos>) time = <time>
		doscreenelementmorph id = <ticker_text_id_1> pos = <ticker_pos> time = <time>
	endif
	wait <time> seconds
	if (<first>)
		setscreenelementprops id = <ticker_text_id_1> pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
		setscreenelementprops id = <ticker_text_id_2> pos = <ticker_pos>
		<first> = 0
	else
		setscreenelementprops id = <ticker_text_id_2> pos = (((1.0, 0.0) * <width>) + <ticker_pos>)
		setscreenelementprops id = <ticker_text_id_1> pos = <ticker_pos>
		<first> = 1
	endif
	repeat
endscript
