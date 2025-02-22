
script create_UI_frame \{frame_dims = (300.0, 500.0)
		check_side_swap = 1
		center_pos = (640.0, 360.0)
		PARENT = root_window
		frame_rgba = [
			255
			255
			255
			255
		]
		fill_rgba = [
			0
			0
			0
			255
		]
		z_priority = 100
		offset_top = 63
		offset_side = 91
		min_fill_pad_width = 73
		min_fill_pad_height = 129
		tex_param = 'aero'
		suffix = 0}
	FormatText ChecksumName = cont_id 'frame_container_%i' I = <suffix>
	if ScreenElementExists Id = <cont_id>
		DestroyScreenElement Id = <cont_id>
	endif
	FormatText ChecksumName = ui_frame_corner_TL 'frame_%t_corner_TL' T = <tex_param>
	FormatText ChecksumName = ui_frame_corner_TL_fill 'frame_%t_corner_TL_fill' T = <tex_param>
	FormatText ChecksumName = ui_frame_side_T 'frame_%t_side_T' T = <tex_param>
	FormatText ChecksumName = ui_frame_side_T_fill 'frame_%t_side_T_fill' T = <tex_param>
	FormatText ChecksumName = ui_frame_side_L 'frame_%t_side_L' T = <tex_param>
	FormatText ChecksumName = ui_frame_side_L_fill 'frame_%t_side_L_fill' T = <tex_param>
	FormatText ChecksumName = frame_corner_TL 'frame_corner_TL_%s' S = <suffix>
	FormatText ChecksumName = frame_corner_TR 'frame_corner_TR_%s' S = <suffix>
	FormatText ChecksumName = frame_corner_BL 'frame_corner_BL_%s' S = <suffix>
	FormatText ChecksumName = frame_corner_BR 'frame_corner_BR_%s' S = <suffix>
	FormatText ChecksumName = frame_corner_TL_fill 'frame_corner_TL_fill_%s' S = <suffix>
	FormatText ChecksumName = frame_corner_TR_fill 'frame_corner_TR_fill_%s' S = <suffix>
	FormatText ChecksumName = frame_corner_BL_fill 'frame_corner_BL_fill_%s' S = <suffix>
	FormatText ChecksumName = frame_corner_BR_fill 'frame_corner_BR_fill_%s' S = <suffix>
	FormatText ChecksumName = frame_fill_center 'frame_fill_center_%s' S = <suffix>
	<need_swap> = 0
	if (<check_side_swap> = 1)
		if ((<frame_dims>.(1.0, 0.0) / <frame_dims>.(0.0, 1.0)) > 2.0)
			<frame_dims> = (((<frame_dims>.(0.0, 1.0)) * (1.0, 0.0)) + ((<frame_dims>.(1.0, 0.0)) * (0.0, 1.0)))
			<need_swap> = 1
		endif
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Id = <cont_id>
		just = [Center Center]
		Pos = <center_pos>
		z_priority = <z_priority>
		child_anchor = [Center Center]
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <cont_id>
		texture = <ui_frame_corner_TL>
		Id = <frame_corner_TL>
		just = [RIGHT Bottom]
		Pos = (0.0, 0.0)
		rgba = <frame_rgba>
		z_priority = <z_priority>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <cont_id>
		texture = <ui_frame_corner_TL_fill>
		Id = <frame_corner_TL_fill>
		just = [RIGHT Bottom]
		Pos = (0.0, 0.0)
		rgba = <fill_rgba>
		z_priority = (<z_priority> - 1)
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <cont_id>
		texture = <ui_frame_corner_TL>
		Id = <frame_corner_TR>
		just = [LEFT Bottom]
		Pos = (0.0, 0.0)
		rgba = <frame_rgba>
		z_priority = <z_priority>
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <cont_id>
		texture = <ui_frame_corner_TL_fill>
		Id = <frame_corner_TR_fill>
		just = [LEFT Bottom]
		Pos = (0.0, 0.0)
		rgba = <fill_rgba>
		z_priority = (<z_priority> - 1)
		flip_v
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <cont_id>
		texture = <ui_frame_corner_TL>
		Id = <frame_corner_BL>
		just = [RIGHT Top]
		Pos = (0.0, 0.0)
		rgba = <frame_rgba>
		z_priority = <z_priority>
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <cont_id>
		texture = <ui_frame_corner_TL_fill>
		Id = <frame_corner_BL_fill>
		just = [RIGHT Top]
		Pos = (0.0, 0.0)
		rgba = <fill_rgba>
		z_priority = (<z_priority> - 1)
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <cont_id>
		texture = <ui_frame_corner_TL>
		Id = <frame_corner_BR>
		just = [LEFT Top]
		Pos = (0.0, 0.0)
		rgba = <frame_rgba>
		z_priority = <z_priority>
		flip_v
		flip_h
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <cont_id>
		texture = <ui_frame_corner_TL_fill>
		Id = <frame_corner_BR_fill>
		just = [LEFT Top]
		Pos = (0.0, 0.0)
		rgba = <fill_rgba>
		z_priority = (<z_priority> - 1)
		flip_v
		flip_h
	}
	GetScreenElementDims Id = <Id>
	min_width = (<width> * 2.0)
	min_height = (<Height> * 2.0)
	frame_width = (<frame_dims>.(1.0, 0.0))
	frame_height = (<frame_dims>.(0.0, 1.0))
	if (<frame_width> < <min_width>)
		<frame_width> = <min_width>
	endif
	if (<frame_height> < <min_height>)
		<frame_height> = <min_height>
	endif
	CastToInteger \{frame_width}
	Mod A = <frame_width> B = 2
	if NOT (<Mod> = 0)
		<frame_width> = (<frame_width> + 1)
	endif
	CastToInteger \{frame_height}
	Mod A = <frame_height> B = 2
	if NOT (<Mod> = 0)
		<frame_height> = (<frame_height> + 1)
	endif
	pos_top = (<offset_top> * (0.0, -1.0))
	pos_bottom = (<offset_top> * (0.0, 1.0))
	width_tops = ((<frame_width> / 2.0) - (<min_width> / 2.0))
	pos_left = (<offset_side> * (-1.0, 0.0))
	pos_right = (<offset_side> * (1.0, 0.0))
	height_side = ((<frame_height> / 2.0) - (<min_height> / 2.0))
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <cont_id>
		Id = <frame_fill_center>
		texture = White
		just = [Center Center]
		Pos = (0.0, 0.0)
		rgba = <fill_rgba>
		z_priority = (<z_priority> - 1)
	}
	if ((<frame_dims>.(1.0, 0.0)) > (<min_width>))
		<frame_corner_TL> :DoMorph Pos = (<width_tops> * (-1.0, 0.0))
		<frame_corner_TR> :DoMorph Pos = (<width_tops> * (1.0, 0.0))
		<frame_corner_BL> :DoMorph Pos = (<width_tops> * (-1.0, 0.0))
		<frame_corner_BR> :DoMorph Pos = (<width_tops> * (1.0, 0.0))
		if ISPS3
			<frame_corner_TL_fill> :DoMorph Pos = ((<width_tops> * (-1.0, 0.0)) + (0.0, -0.5))
			<frame_corner_TR_fill> :DoMorph Pos = ((<width_tops> * (1.0, 0.0)) + (-0.5, -0.5))
			<frame_corner_BL_fill> :DoMorph Pos = ((<width_tops> * (-1.0, 0.0)) + (0.0, 0.5))
			<frame_corner_BR_fill> :DoMorph Pos = ((<width_tops> * (1.0, 0.0)) + (-0.5, 0.5))
		else
			<frame_corner_TL_fill> :DoMorph Pos = ((<width_tops> * (-1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_TR_fill> :DoMorph Pos = ((<width_tops> * (1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_BL_fill> :DoMorph Pos = ((<width_tops> * (-1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_BR_fill> :DoMorph Pos = ((<width_tops> * (1.0, 0.0)) - (0.5, 0.5))
		endif
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_T>
			just = [RIGHT Bottom]
			Pos = (0.0, 0.0)
			rgba = <frame_rgba>
			z_priority = <z_priority>
		}
		scale_element_to_size Id = <Id> target_width = <width_tops>
		<Id> :DoMorph Pos = (<pos_top> + (<height_side> * (0.0, -1.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_T_fill>
			just = [RIGHT Bottom]
			Pos = (0.0, 0.0)
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
		}
		scale_element_to_size Id = <Id> target_width = <width_tops>
		<Id> :DoMorph Pos = (<pos_top> + (<height_side> * (0.0, -1.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_T>
			just = [LEFT Bottom]
			Pos = (0.0, 0.0)
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_v
		}
		scale_element_to_size Id = <Id> target_width = <width_tops>
		<Id> :DoMorph Pos = (<pos_top> + (<height_side> * (0.0, -1.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_T_fill>
			just = [LEFT Bottom]
			Pos = (0.0, 0.0)
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_v
		}
		scale_element_to_size Id = <Id> target_width = <width_tops>
		<Id> :DoMorph Pos = (<pos_top> + (<height_side> * (0.0, -1.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_T>
			just = [RIGHT Top]
			Pos = <pos_bottom>
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_h
		}
		scale_element_to_size Id = <Id> target_width = <width_tops>
		<Id> :DoMorph Pos = ((-1 * <pos_top>) + (<height_side> * (0.0, 1.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_T_fill>
			just = [RIGHT Top]
			Pos = <pos_bottom>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_h
		}
		scale_element_to_size Id = <Id> target_width = <width_tops>
		<Id> :DoMorph Pos = ((-1 * <pos_top>) + (<height_side> * (0.0, 1.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_T>
			just = [LEFT Top]
			Pos = <pos_bottom>
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_v
			flip_h
		}
		scale_element_to_size Id = <Id> target_width = <width_tops>
		<Id> :DoMorph Pos = ((-1 * <pos_top>) + (<height_side> * (0.0, 1.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_T_fill>
			just = [LEFT Top]
			Pos = <pos_bottom>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_v
			flip_h
		}
		scale_element_to_size Id = <Id> target_width = <width_tops>
		<Id> :DoMorph Pos = ((-1 * <pos_top>) + (<height_side> * (0.0, 1.0)))
	endif
	if ((<frame_dims>.(0.0, 1.0)) > (<min_height>))
		GetScreenElementProps Id = <frame_corner_TL>
		X_TL = (<Pos>.(1.0, 0.0))
		GetScreenElementProps Id = <frame_corner_TR>
		X_TR = (<Pos>.(1.0, 0.0))
		GetScreenElementProps Id = <frame_corner_BL>
		X_BL = (<Pos>.(1.0, 0.0))
		GetScreenElementProps Id = <frame_corner_BR>
		X_BR = (<Pos>.(1.0, 0.0))
		<frame_corner_TL> :DoMorph Pos = (<height_side> * (0.0, -1.0) + (<X_TL> * (1.0, 0.0)))
		<frame_corner_TR> :DoMorph Pos = (<height_side> * (0.0, -1.0) + (<X_TR> * (1.0, 0.0)))
		<frame_corner_BL> :DoMorph Pos = (<height_side> * (0.0, 1.0) + (<X_BL> * (1.0, 0.0)))
		<frame_corner_BR> :DoMorph Pos = (<height_side> * (0.0, 1.0) + (<X_BR> * (1.0, 0.0)))
		if ISPS3
			<frame_corner_TL_fill> :DoMorph Pos = ((<height_side> * (0.0, -1.0) + (<X_TL> * (1.0, 0.0))) + (0.0, -0.5))
			<frame_corner_TR_fill> :DoMorph Pos = ((<height_side> * (0.0, -1.0) + (<X_TR> * (1.0, 0.0))) + (-0.5, -0.5))
			<frame_corner_BL_fill> :DoMorph Pos = ((<height_side> * (0.0, 1.0) + (<X_BL> * (1.0, 0.0))) + (0.0, 0.5))
			<frame_corner_BR_fill> :DoMorph Pos = ((<height_side> * (0.0, 1.0) + (<X_BR> * (1.0, 0.0))) + (-0.5, 0.5))
		else
			<frame_corner_TL_fill> :DoMorph Pos = ((<height_side> * (0.0, -1.0) + (<X_TL> * (1.0, 0.0))) - (0.5, 0.5))
			<frame_corner_TR_fill> :DoMorph Pos = ((<height_side> * (0.0, -1.0) + (<X_TR> * (1.0, 0.0))) - (0.5, 0.5))
			<frame_corner_BL_fill> :DoMorph Pos = ((<height_side> * (0.0, 1.0) + (<X_BL> * (1.0, 0.0))) - (0.5, 0.5))
			<frame_corner_BR_fill> :DoMorph Pos = ((<height_side> * (0.0, 1.0) + (<X_BR> * (1.0, 0.0))) - (0.5, 0.5))
		endif
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_L>
			just = [RIGHT Bottom]
			Pos = <pos_left>
			rgba = <frame_rgba>
			z_priority = <z_priority>
		}
		scale_element_to_size Id = <Id> target_height = <height_side>
		<Id> :DoMorph Pos = (<pos_left> - (<width_tops> * (1.0, 0.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_L_fill>
			just = [RIGHT Bottom]
			Pos = <pos_left>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
		}
		scale_element_to_size Id = <Id> target_height = <height_side>
		<Id> :DoMorph Pos = (<pos_left> - (<width_tops> * (1.0, 0.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_L>
			just = [LEFT Bottom]
			Pos = <pos_left>
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_v
		}
		scale_element_to_size Id = <Id> target_height = <height_side>
		<Id> :DoMorph Pos = ((-1 * <pos_left>) + (<width_tops> * (1.0, 0.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_L_fill>
			just = [LEFT Bottom]
			Pos = <pos_left>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_v
		}
		scale_element_to_size Id = <Id> target_height = <height_side>
		<Id> :DoMorph Pos = ((-1 * <pos_left>) + (<width_tops> * (1.0, 0.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_L>
			just = [RIGHT Top]
			Pos = <pos_right>
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_h
		}
		scale_element_to_size Id = <Id> target_height = <height_side>
		<Id> :DoMorph Pos = (<pos_left> + (<width_tops> * (-1.0, 0.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_L_fill>
			just = [RIGHT Top]
			Pos = <pos_right>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_h
		}
		scale_element_to_size Id = <Id> target_height = <height_side>
		<Id> :DoMorph Pos = (<pos_left> + (<width_tops> * (-1.0, 0.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_L>
			just = [LEFT Top]
			Pos = <pos_right>
			rgba = <frame_rgba>
			z_priority = <z_priority>
			flip_v
			flip_h
		}
		scale_element_to_size Id = <Id> target_height = <height_side>
		<Id> :DoMorph Pos = ((-1 * <pos_left>) + (<width_tops> * (1.0, 0.0)))
		CreateScreenElement {
			Type = SpriteElement
			PARENT = <cont_id>
			texture = <ui_frame_side_L_fill>
			just = [LEFT Top]
			Pos = <pos_right>
			rgba = <fill_rgba>
			z_priority = (<z_priority> - 1)
			flip_v
			flip_h
		}
		scale_element_to_size Id = <Id> target_height = <height_side>
		<Id> :DoMorph Pos = ((-1 * <pos_left>) + (<width_tops> * (1.0, 0.0)))
	endif
	if (((<frame_dims>.(0.0, 1.0)) > (<min_height>)) && ((<frame_dims>.(1.0, 0.0)) > (<min_width>)))
		fill_center_width = ((<width_tops> * 2.0) + (<offset_side> * 2.0))
		fill_center_height = ((<height_side> * 2) + (<offset_top> * 2))
		scale_element_to_size Id = <frame_fill_center> target_width = <fill_center_width> target_height = <fill_center_height>
	elseif (((<frame_dims>.(0.0, 1.0)) > (<min_height>)) && ((<frame_dims>.(1.0, 0.0)) <= (<min_width>)))
		fill_center_height = ((<height_side> * 2) + (<offset_top> * 2))
		fill_center_width = ((<min_width> - <min_fill_pad_width>) - 1)
		scale_element_to_size Id = <frame_fill_center> target_width = <fill_center_width> target_height = <fill_center_height>
	elseif (((<frame_dims>.(0.0, 1.0)) <= (<min_height>)) && ((<frame_dims>.(1.0, 0.0)) > (<min_width>)))
		fill_center_width = ((<width_tops> * 2.0) + (<offset_side> * 2.0))
		fill_center_height = ((<min_height> - <min_fill_pad_height>) - 1)
		scale_element_to_size Id = <frame_fill_center> target_width = <fill_center_width> target_height = <fill_center_height>
	else
		fill_center_width = ((<min_width> - <min_fill_pad_width>) - 1)
		fill_center_height = ((<min_height> - <min_fill_pad_height>) - 1)
		scale_element_to_size Id = <frame_fill_center> target_width = <fill_center_width> target_height = <fill_center_height>
		GetScreenElementProps Id = <frame_corner_TL>
		X_TL = (<Pos>.(1.0, 1.0))
		GetScreenElementProps Id = <frame_corner_TR>
		X_TR = (<Pos>.(1.0, 1.0))
		GetScreenElementProps Id = <frame_corner_BL>
		X_BL = (<Pos>.(1.0, 1.0))
		GetScreenElementProps Id = <frame_corner_BR>
		X_BR = (<Pos>.(1.0, 1.0))
		if ISPS3
			<frame_corner_TL_fill> :DoMorph Pos = ((<X_TL> * (1.0, 0.0)) + (0.0, -0.5))
			<frame_corner_TR_fill> :DoMorph Pos = ((<X_TR> * (1.0, 0.0)) + (-0.5, -0.5))
			<frame_corner_BL_fill> :DoMorph Pos = ((<X_BL> * (1.0, 0.0)) + (0.0, 0.5))
			<frame_corner_BR_fill> :DoMorph Pos = ((<X_BR> * (1.0, 0.0)) + (-0.5, 0.5))
		else
			<frame_corner_TL_fill> :DoMorph Pos = ((<X_TL> * (1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_TR_fill> :DoMorph Pos = ((<X_TR> * (1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_BL_fill> :DoMorph Pos = ((<X_BL> * (1.0, 0.0)) - (0.5, 0.5))
			<frame_corner_BR_fill> :DoMorph Pos = ((<X_BR> * (1.0, 0.0)) - (0.5, 0.5))
		endif
	endif
	if (<need_swap>)
		Wait \{2
			Seconds}
		<cont_id> :DoMorph Rot_Angle = 90 Time = 5
	endif
	return Id = <cont_id>
endscript

script do_ui_frame_morph {
		start_dims = (0.0, 0.0)
		end_dims = (300.0, 500.0)
		start_pos = (0.0, 0.0)
		end_pos = (640.0, 360.0)
		frame_rgba = (($G_menu_colors).frame_rgba)
		fill_rgba = (($G_menu_colors).fill_rgba)
		frames = 10
		PARENT = root_window
		z_priority = 0
		suffix = 0
	}
	<float_frames> = (<frames> * 1.0)
	<x_dims_diff> = (((<end_dims>.(1.0, 0.0)) - (<start_dims>.(1.0, 0.0))) / <float_frames>)
	<y_dims_diff> = (((<end_dims>.(0.0, 1.0)) - (<start_dims>.(0.0, 1.0))) / <float_frames>)
	<x_pos_diff> = (((<end_pos>.(1.0, 0.0)) - (<start_pos>.(1.0, 0.0))) / <float_frames>)
	<y_pos_diff> = (((<end_pos>.(0.0, 1.0)) - (<start_pos>.(0.0, 1.0))) / <float_frames>)
	<I> = 1
	begin
	frame_dims = (<start_dims> + (((<x_dims_diff> * (1.0, 0.0)) + (<y_dims_diff> * (0.0, 1.0))) * <I>))
	center_pos = (<start_pos> + (((<x_pos_diff> * (1.0, 0.0)) + (<y_pos_diff> * (0.0, 1.0))) * <I>))
	create_UI_frame {
		PARENT = <PARENT>
		frame_dims = <frame_dims>
		center_pos = <center_pos>
		frame_rgba = <frame_rgba>
		fill_rgba = <fill_rgba>
		z_priority = <z_priority>
		suffix = <suffix>
	}
	<I> = (<I> + 1)
	Wait \{1
		Frame}
	repeat <frames>
endscript

script random_ui_frame_morph_test 
	<start_dims> = (280.0, 600.0)
	<start_pos> = (640.0, 200.0)
	begin
	GetRandomValue \{Name = frames
		A = 60
		B = 240
		Integer}
	GetRandomValue \{Name = rand_x_dims
		A = 256
		B = 600
		Integer}
	GetRandomValue \{Name = rand_y_dims
		A = 256
		B = 600
		Integer}
	GetRandomValue \{Name = rand_x_pos
		A = 340
		B = 940
		Integer}
	GetRandomValue \{Name = rand_y_pos
		A = 180
		B = 580
		Integer}
	if (<rand_x_dims> > <rand_y_dims>)
		<temp> = <rand_x_dims>
		<rand_x_dims> = <rand_y_dims>
		<rand_y_dims> = <temp>
	endif
	<end_dims> = ((<rand_x_dims> * (1.0, 0.0)) + (<rand_y_dims> * (0.0, 1.0)))
	<end_pos> = ((<rand_x_pos> * (1.0, 0.0)) + (<rand_y_pos> * (0.0, 1.0)))
	do_ui_frame_morph {
		start_dims = <start_dims>
		end_dims = <end_dims>
		start_pos = <start_pos>
		end_pos = <end_pos>
		frames = <frames>
	}
	Wait \{1
		Frame}
	<start_dims> = <end_dims>
	<start_pos> = <end_pos>
	repeat
endscript

script create_wide_ui_frame 
	if ScreenElementExists \{Id = dummy_white}
		DestroyScreenElement \{Id = dummy_white}
	endif
	CreateScreenElement {
		Type = SpriteElement
		Id = dummy_white
		PARENT = root_window
		just = [LEFT Top]
		Pos = (0.0, 0.0)
		Dims = (1280.0, 720.0)
		texture = White
		rgba = (($G_menu_colors).White)
		z_priority = 0
	}
	create_UI_frame {
		frame_dims = (700.0, 300.0)
		frame_rgba = (($G_menu_colors).frame_rgba)
		fill_rgba = (($G_menu_colors).fill_rgba)
	}
endscript

script create_gamertag_frame \{PARENT = root_window
		text_width = 100
		text_height = 50
		rgba = [
			0
			0
			0
			70
		]
		Player = 1
		Pos = (0.0, 0.0)
		Z = 0}
	vfudge = -2
	Dims = ((<text_width> * (1.0, 0.0)) + (<text_height> * (0.0, 1.0)))
	if (<Player> = 1)
		Offset = ((<text_width> * (0.5, 0.0)) + (<text_height> * (0.0, 0.5)) + (<vfudge> * (0.0, 1.0)))
	else
		Offset = ((<text_width> * (-0.5, 0.0)) + (<text_height> * (0.0, 0.5)) + (<vfudge> * (0.0, 1.0)))
	endif
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Pos = ((0.0, 0.0) + <Pos> + <Offset>)
		z_priority = <Z>
	}
	gamerframe_container = <Id>
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <gamerframe_container>
		texture = Control_pill_body
		Pos = (0.0, 0.0)
		just = [Center Center]
		Dims = <Dims>
		rgba = <rgba>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <gamerframe_container>
		texture = Control_pill_end
		Pos = ((0.0, 0.0) + (<text_width> * (0.5, 0.0)))
		just = [LEFT Center]
		Dims = ((16.0, 0.0) + (<text_height> * (0.0, 1.0)))
		rgba = <rgba>
	}
	CreateScreenElement {
		Type = SpriteElement
		PARENT = <gamerframe_container>
		texture = Control_pill_end
		Pos = ((0.0, 0.0) - (<text_width> * (0.5, 0.0)))
		just = [RIGHT Center]
		Dims = ((16.0, 0.0) + (<text_height> * (0.0, 1.0)))
		rgba = <rgba>
		flip_v
	}
endscript
