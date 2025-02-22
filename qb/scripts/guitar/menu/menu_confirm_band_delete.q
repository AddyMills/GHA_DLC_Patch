confirm_band_delete_menu_font = fontgrid_title_gh3

script create_confirm_band_delete_menu 
	set_focus_color \{Color = pink}
	set_unfocus_color \{Color = dk_violet_grey}
	Text = [
		"You are about to permanently delete the selected band. "
		"All progress associated with that band will be lost. "
		"Are you sure you want to continue?"
	]
	create_popup_warning_menu {
		textblock = {
			Text = <Text>
			Dims = (700.0, 500.0)
			Scale = 0.6
		}
		Menu_pos = <Menu_pos>
		dialog_dims = (600.0, 80.0)
		pad_back_script = menu_confirm_band_delete_select_no
		options = [
			{
				func = menu_confirm_band_delete_select_no
				Text = "NO"
			}
			{
				func = menu_confirm_band_delete_select_yes
				Text = "YES"
			}
		]
	}
endscript

script destroy_confirm_band_delete_menu 
	destroy_popup_warning_menu
endscript

script menu_confirm_band_delete_select_no 
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script menu_confirm_band_delete_select_yes 
	band_count = ($current_band)
	GetArraySize \{$difficulty_list}
	array_count = 0
	begin
	get_difficulty_text_nl DIFFICULTY = ($difficulty_list [<array_count>])
	FormatText ChecksumName = bandname 'p1_career_band%i_%d' I = ($num_career_bands + 1) D = <difficulty_text_nl> AddToStringLookup = TRUE
	pop_bandtags bandname = <bandname>
	FormatText ChecksumName = bandname 'p1_career_band%i_%d' I = <band_count> D = <difficulty_text_nl> AddToStringLookup = TRUE
	push_bandtags bandname = <bandname> mode = p1_career
	FormatText ChecksumName = default_bandname 'band%i_info_p1_career' I = <band_count> AddToStringLookup = TRUE
	SetGlobalTags <default_bandname> Params = {($default_bandtags)}
	array_count = (<array_count> + 1)
	repeat <array_Size>
	ui_flow_manager_respond_to_action \{action = Continue}
endscript
