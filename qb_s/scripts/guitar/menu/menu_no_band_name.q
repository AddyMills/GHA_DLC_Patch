last_band_name_message_index = -1
no_band_name_messages = [
	"A no ser que tu segundo nombre sea Prince, ponle un nombre a tu grupo."
	"¡¡¡INTRODUCE UN P@*$#&% NOMBRE!!!"
	"¿Te crees muy listo para ir a la escuela?  Introduce un nombre, colega."
	"Cada vez que no introduces el nombre de un grupo, a alguien le da un chungo."
	"¿Por qué no le pones un nombre al grupo? Es una buena idea."
	"¿Qué te van a gritar tus fans si no tienes un nombre?"
	"Ahí va una sugerencia: Rockvago"
	"¡Vamos!"
]

script create_no_band_menu 
	header_font = fontgrid_title_gh3
	menu_font = fontgrid_title_gh3
	warning_text_pos = (640.0, 218.0)
	quit_warning_text_dims = (580.0, 300.0)
	quit_warning_text_pos = (640.0, 375.0)
	menu_pos = (550.0, 530.0)
	z = 7
	offwhite = [223 223 223 255]
	new_menu scrollid = nb_scroll vmenuid = nb_vmenu use_backdrop = (0) menu_pos = <menu_pos>
	create_pause_menu_frame x_scale = 1.1 y_scale = 1.1 tile_sprite = 0 z = <z>
	createscreenelement \{type = containerelement
		parent = root_window
		id = no_band_container
		pos = (0.0, 0.0)}
	createscreenelement {
		type = textelement
		parent = no_band_container
		font = <header_font>
		text = "PONLE UN NOMBRE AL GRUPO"
		rgba = [130 50 50 255]
		just = [center top]
		scale = (1.25, 1.15)
		pos = <warning_text_pos>
		z_priority = (<z> + 4)
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
	getarraysize ($no_band_name_messages)
	begin
	getrandomvalue a = 0 b = (<array_size> -1) integer name = random_carp
	if NOT (<random_carp> = ($last_band_name_message_index))
		break
	endif
	repeat
	change last_band_name_message_index = (<random_carp>)
	no_band_text = ($no_band_name_messages [<random_carp>])
	printstruct <...>
	createscreenelement {
		type = textblockelement
		parent = no_band_container
		font = <menu_font>
		text = <no_band_text>
		rgba = [210 210 210 250]
		just = [center center]
		scale = (0.8, 0.7)
		font_spacing = 1
		pos = <quit_warning_text_pos>
		dims = <quit_warning_text_dims>
		z_priority = (<z> + 3)
	}
	displaysprite parent = no_band_container tex = dialog_bg pos = (480.0, 485.0) dims = (320.0, 64.0) z = (<z> + 3)
	displaysprite parent = no_band_container tex = dialog_bg flip_h pos = (480.0, 554.0) dims = (320.0, 64.0) z = (<z> + 3)
	displaysprite parent = no_band_container tex = white pos = (492.0, 541.0) scale = (75.0, 6.0) z = (<z> + 3) rgba = <offwhite>
	displaysprite parent = no_band_container tex = dialog_frame_joiner pos = (480.0, 534.0) rot_angle = 5 scale = (1.575, 1.5) z = (<z> + 3.01)
	displaysprite parent = no_band_container tex = dialog_frame_joiner pos = (750.0, 538.0) flip_v rot_angle = -5 scale = (1.575, 1.5) z = (<z> + 3.01)
	displaysprite id = hi_right parent = no_band_container tex = dialog_highlight pos = (770.0, 533.0) scale = (1.0, 1.0) z = (<z> + 3.02)
	displaysprite id = hi_left parent = no_band_container tex = dialog_highlight flip_v pos = (500.0, 533.0) scale = (1.0, 1.0) z = (<z> + 3.02)
	set_focus_color \{color = reddish_grey}
	set_unfocus_color \{color = black}
	createscreenelement {
		type = textelement
		parent = nb_vmenu
		font = <header_font>
		rgba = [130 50 50 255]
		text = "CONTINÚA"
		just = [left top]
		z_priority = (<z> + 3.01)
		font_spacing = 1
		event_handlers = [
			{focus menu_no_band_continue_highlight}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
		]
	}
endscript

script destroy_no_band_menu 
	destroy_menu \{menu_id = nb_scroll}
	destroy_menu \{menu_id = no_band_container}
	destroy_pause_menu_frame
endscript

script menu_no_band_continue_highlight 
	retail_menu_focus
	setscreenelementprops \{id = hi_left
		pos = (480.0, 530.0)
		flip_v}
	setscreenelementprops \{id = hi_right
		pos = (740.0, 530.0)}
endscript
