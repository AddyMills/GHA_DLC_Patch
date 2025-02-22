note_scores = [
	1.0
	1.25
	1.5
	1.75
	2.0
]
note_distance_score = [
	0.0
	1.25
	1.5
	1.75
	4.0
]
repeat_degradation = 0.25
rd_threshold = 350
note_bits = [
	1
	2
	4
	8
	16
	32
]
current_da_diff = EASY

script difficulty_analyzer_show \{song_name = Barracuda}
	destroy_difficulty_analyzer
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = diff_analyzer_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		PARENT = diff_analyzer_container
		Pos = (0.0, 0.0)
		just = [
			LEFT
			Top
		]
		Dims = (1280.0, 720.0)
		rgba = [
			0
			0
			0
			255
		]}
	if (<song_name> = JamSession)
		return
	endif
	load_songqpak song_name = <song_name>
	text_params = {PARENT = diff_analyzer_container just = [Top LEFT] Z = 9999}
	displayText {
		<text_params>
		Type = TextBlockElement
		Id = diff_analyzer_loading_text
		Text = "NUMBER CRUNCHING..."
		Pos = (230.0, 320.0)
		Scale = 1.5
		just = [LEFT Top]
		rgba = [200 50 50 255]
	}
	Wait \{1
		Frame}
	if (<DIFFICULTY> = All)
		diff_analyzer_show_all_diffs <...>
	else
		diff_analyzer_show_diff <...>
	endif
	if ScreenElementExists \{Id = diff_analyzer_loading_text}
		DestroyScreenElement \{Id = diff_analyzer_loading_text}
	endif
endscript

script destroy_difficulty_analyzer 
	if ScreenElementExists \{Id = diff_analyzer_container}
		DestroyScreenElement \{Id = diff_analyzer_container}
	endif
endscript

script diff_analyzer_show_diff 
	Change current_da_diff = ($difficulty_list [($difficulty_list_props.<DIFFICULTY>.Index)])
	array_index = 0
	text_pos = (220.0, 120.0)
	loaded_song = $current_song_qpak
	ExtendCRC <loaded_song> '_song_' out = loaded_song
	ExtendCRC <loaded_song> ($difficulty_list_props.<DIFFICULTY>.text_nl) out = loaded_song
	displayText {
		<text_params>
		Text = ($difficulty_list_props.<DIFFICULTY>.Text)
		Pos = (<text_pos>)
	}
	loaded_marker = $current_song_qpak
	ExtendCRC <loaded_marker> '_markers' out = loaded_marker
	loaded_fretbar = $current_song_qpak
	ExtendCRC <loaded_fretbar> '_fretbars' out = loaded_fretbar
	calc_difficulty_from_all_song_sections {
		song_array = <loaded_song>
		marker_array = <loaded_marker>
		fretbar_array = <loaded_fretbar>
		for_graph = 1
	}
	FormatText TextName = score_text "Difficulty Score: %d" D = <diff_score>
	displayText {
		<text_params>
		Text = <score_text>
		Pos = (<text_pos> + (20.0, 40.0))
		rgba = [255 255 255 255]
	}
endscript

script diff_analyzer_show_all_diffs 
	array_index = 0
	text_pos = (220.0, 160.0)
	begin
	Change current_da_diff = ($difficulty_list [<array_index>])
	loaded_song = $current_song_qpak
	ExtendCRC <loaded_song> '_song_' out = loaded_song
	ExtendCRC <loaded_song> ($difficulty_list_props.($difficulty_list [<array_index>]).text_nl) out = loaded_song
	displayText {
		<text_params>
		Text = ($difficulty_list_props.($difficulty_list [<array_index>]).Text)
		Pos = (<text_pos> + ((0.0, 120.0) * <array_index>))
	}
	loaded_marker = $current_song_qpak
	ExtendCRC <loaded_marker> '_markers' out = loaded_marker
	loaded_fretbar = $current_song_qpak
	ExtendCRC <loaded_fretbar> '_fretbars' out = loaded_fretbar
	calc_difficulty_from_all_song_sections {
		song_array = <loaded_song>
		marker_array = <loaded_marker>
		fretbar_array = <loaded_fretbar>
	}
	FormatText TextName = score_text "Difficulty Score: %d" D = <diff_score>
	displayText {
		<text_params>
		Text = <score_text>
		Pos = (<text_pos> + (20.0, 40.0) + ((0.0, 120.0) * <array_index>))
		rgba = [255 255 255 255]
	}
	<array_index> = (<array_index> + 1)
	repeat 4
	get_bpm_from_song loaded_fretbar = <loaded_fretbar>
	if NOT (<avg> = 0)
		FormatText TextName = bpm_text "Low: %a  High: %b  Avg: %c" A = <low> B = <high> C = <avg>
		displayText {
			<text_params>
			Text = "BPM"
			Pos = (<text_pos> + (0.0, -90.0))
		}
		displayText {
			<text_params>
			Text = <bpm_text>
			Pos = (<text_pos> + (20.0, -60.0))
			rgba = [255 255 255 255]
		}
	endif
endscript

script calc_difficulty_from_all_song_sections \{song_array = NONE
		marker_array = NONE
		fretbar_array = NONE
		for_graph = 0
		output_section_scores = 0}
	Score = 0
	if (<marker_array> = NONE || <song_array> = NONE || <fretbar_array> = NONE)
		return diff_score = <Score>
	endif
	if NOT GlobalExists Name = <song_array> Type = Array
		Printf Channel = da_errors "global song_array does not exist for song %s" S = ($current_song_qpak)
		return diff_score = <Score>
	endif
	if NOT GlobalExists Name = <fretbar_array> Type = Array
		Printf Channel = da_errors "global fretbar_array does not exist for song %s" S = ($current_song_qpak)
		return diff_score = <Score>
	endif
	if NOT GlobalExists Name = <marker_array> Type = Array
		Printf Channel = da_errors "global marker_array does not exist for song %s" S = ($current_song_qpak)
		return diff_score = <Score>
	endif
	array_index = 0
	section_index = 0
	fretbar_index = 0
	GetArraySize $<song_array>
	if (<array_Size> = 0)
		return diff_score = <Score>
	endif
	GetArraySize $<fretbar_array>
	if (<array_Size> = 0)
		return diff_score = <Score>
	endif
	GetArraySize $<marker_array>
	if (<array_Size> = 0)
		calc_difficulty_from_song_section {
			Array = <song_array>
			fretbar_array = <fretbar_array>
		}
		return diff_score = <diff_score>
	endif
	text_pos = (230.0, 230.0)
	text_spacing = (0.0, 20.0)
	begin
	section_begin = ($<marker_array> [<array_index>].Time)
	if (<array_index> + 1 < <array_Size>)
		section_end = ($<marker_array> [(<array_index> + 1)].Time)
	else
		section_end = 0
	endif
	calc_difficulty_from_song_section {
		Array = <song_array>
		section_begin = <section_begin>
		section_end = <section_end>
		index_begin = <section_index>
		fretbar_array = <fretbar_array>
		fretbar_index = <fretbar_index>
	}
	<section_index> = <last_section_index>
	<fretbar_index> = <last_fretbar_index>
	<Score> = (<Score> + <diff_score>)
	if (<output_section_scores> = 1)
		get_song_struct Song = <song_checksum>
		get_song_title Song = <song_checksum>
		Printf {
			Channel = diffanalyzersection
			"%a; %b; %c; %d; %e" A = ($difficulty_list_props.<DIFFICULTY>.Text) B = <Song_Title> C = (<array_index> + 1) D = ($<marker_array> [<array_index>].marker) E = <diff_score>
		}
	endif
	if (<for_graph> = 1)
		FormatText TextName = diff_score_text "%n  - %d" N = (<array_index> + 1) D = <diff_score>
		if (<diff_score> < 200)
			rgba = [50 200 50 255]
		elseif (<diff_score> < 300)
			rgba = [250 240 60 255]
		else
			rgba = [200 50 50 255]
		endif
		extra_text_pos = (0.0, 0.0)
		if (<array_index> >= 40)
			<extra_text_pos> = ((240.0, 0.0) - (<text_spacing> * 40))
		elseif (<array_index> >= 20)
			<extra_text_pos> = ((120.0, 0.0) - (<text_spacing> * 20))
		endif
		displayText {
			PARENT = diff_analyzer_container
			Pos = (<text_pos> + (<text_spacing> * <array_index>) + <extra_text_pos>)
			Text = <diff_score_text>
			rgba = <rgba>
			Scale = 0.5
			Z = 9999
		}
	endif
	<array_index> = (<array_index> + 1)
	repeat <array_Size>
	return diff_score = <Score>
endscript

script calc_difficulty_from_song_section \{Array = NONE
		section_begin = 0
		section_end = 0
		index_begin = 0
		fretbar_array = NONE
		fretbar_index = 0}
	Score = 0
	if (<Array> = NONE || <fretbar_array> = NONE)
		return diff_score = <Score>
	endif
	array_index = <index_begin>
	GetArraySize $<fretbar_array>
	fretbar_array_size = <array_Size>
	if (<array_Size> = 0)
		return diff_score = <Score>
	endif
	GetArraySize $<Array>
	if (<array_Size> = 0)
		return diff_score = <Score>
	endif
	Mod A = <array_Size> B = 3
	if NOT (<Mod> = 0)
		return diff_score = <Score>
	endif
	repeat_num = ((<array_Size> - <index_begin>) / 3)
	in_begin = 0
	current_note = -1
	current_time = -1
	current_fretbar_time = -1
	last_note = -1
	last_time = -1
	begin
	if (<array_index> >= <array_Size>)
		return diff_score = <Score> last_section_index = <array_index> last_fretbar_index = <fretbar_index>
	endif
	<current_time> = ($<Array> [<array_index>])
	<current_note> = ($<Array> [(<array_index> + 2)])
	<current_fretbar_time> = ($<fretbar_array> [<fretbar_index>])
	if (<in_begin> = 0)
		if (($<Array> [<array_index>]) >= <section_begin>)
			<in_begin> = 1
			calc_score_for_note note = <current_note>
			<Score> = (<Score> + <note_score>)
			<last_note> = <current_note>
			<last_time> = <current_time>
		endif
	else
		if (($<Array> [<array_index>]) >= <section_end>)
			if NOT (<section_end> = 0)
				return diff_score = <Score> last_section_index = <array_index> last_fretbar_index = <fretbar_index>
			endif
		endif
		calc_score_for_note note = <current_note>
		note_time_distance = (<current_time> - <last_time>)
		if (<last_note> = <current_note>)
			if (<note_time_distance> < $rd_threshold)
				<note_score> = (<note_score> * $repeat_degradation)
			endif
		endif
		if (<current_fretbar_time> < <current_time>)
			begin
			<fretbar_index> = (<fretbar_index> + 1)
			<current_fretbar_time> = ($<fretbar_array> [<fretbar_index>])
			if (<current_fretbar_time> >= <current_time>)
				break
			endif
			if (<fretbar_array_size> - <fretbar_index> <= 0)
				break
			endif
			repeat
		endif
		fretbar_distance = (<current_fretbar_time> - ($<fretbar_array> [(<fretbar_index> - 1)]))
		if (<note_time_distance> < <fretbar_distance>)
			<note_score> = (<note_score> + (<note_score> - (<note_time_distance> / <fretbar_distance>)))
		endif
		if (<single_note> = 1)
			get_note_placement_value note1 = <current_note> Note2 = <last_note>
			<note_score> = (<note_score> * <note_placement_value>)
		else
			make_orange_4 = 0
			only_different_notes = 0
			if is_any_note_the_same note1 = <current_note> Note2 = <last_note>
				get_num_of_notes_in_chord note = <current_note>
				current_num_notes = <num_notes>
				get_num_of_notes_in_chord note = <last_note>
				if (<current_num_notes> >= <num_notes>)
					if (<current_note> && ($note_bits [4]))
						if NOT (<last_note> && ($note_bits [4]))
							<make_orange_4> = 1
							<only_different_notes> = 1
						endif
					else
						<only_different_notes> = 1
					endif
				endif
			endif
			get_note_placement_value {
				note1 = <current_note>
				Note2 = <last_note>
				Chord
				make_orange_4 = <make_orange_4>
				only_different_notes = <only_different_notes>
			}
			<note_score> = (<note_score> * <note_placement_value>)
		endif
		<Score> = (<Score> + <note_score>)
		<last_note> = <current_note>
		<last_time> = <current_time>
	endif
	<array_index> = (<array_index> + 3)
	repeat <repeat_num>
	return diff_score = <Score> last_section_index = <array_index> last_fretbar_index = <fretbar_index>
endscript

script calc_score_for_note 
	da_check_for_errors note = <note>
	array_index = 0
	begin
	if (<note> = ($note_bits [<array_index>]))
		return note_score = ($note_scores [<array_index>]) single_note = 1
	endif
	<array_index> = (<array_index> + 1)
	repeat 5
	Score = 0
	<array_index> = 0
	begin
	if (<note> && ($note_bits [<array_index>]))
		<Score> = (<Score> + ($note_scores [<array_index>]))
	endif
	<array_index> = (<array_index> + 1)
	repeat 5
	return note_score = <Score> single_note = 0
endscript

script get_note_placement_value \{note1 = 0
		Note2 = 0
		make_orange_4 = 0
		only_different_notes = 0}
	note_placement = 0
	array_index = 0
	array_index2 = 0
	begin
	if (<note1> && ($note_bits [<array_index>]))
		if (<array_index> = 4)
			if (<make_orange_4> = 1)
				<note_placement> = (<note_placement> + 4)
			endif
		else
			begin
			if (<array_index2> >= 5)
				break
			endif
			if (<Note2> && ($note_bits [<array_index2>]))
				temp_placement = -1
				if GotParam \{Chord}
					if (<only_different_notes> = 1)
						if ((<note1> && ($note_bits [<array_index2>])) && (<Note2> && ($note_bits [<array_index2>])))
							break
						endif
					endif
				endif
				<temp_placement> = (<array_index> - <array_index2>)
				if (<temp_placement> < 0)
					<temp_placement> = (0 - <temp_placement>)
				endif
				if NOT (<temp_placement> = -1)
					<note_placement> = (<note_placement> + ($note_distance_score [<temp_placement>]))
					<array_index2> = (<array_index2> + 1)
				endif
				if GotParam \{Chord}
					break
				else
					return note_placement_value = <note_placement>
				endif
			endif
			<array_index2> = (<array_index2> + 1)
			repeat
		endif
	endif
	<array_index> = (<array_index> + 1)
	repeat 5
	return note_placement_value = <note_placement>
endscript

script is_any_note_the_same \{note1 = 0
		Note2 = 0}
	if (<note1> && <Note2>)
		return \{TRUE}
	endif
	return \{FALSE}
endscript

script get_num_of_notes_in_chord \{note = 0}
	num_notes = 0
	array_index = 0
	begin
	if (<note> && ($note_bits [<array_index>]))
		<num_notes> = (<num_notes> + 1)
	endif
	<array_index> = (<array_index> + 1)
	repeat 5
	return num_notes = <num_notes>
endscript

script output_diff_scores 
	DIFFICULTY = 3
	repeat_num = 1
	if GotParam \{EASY}
		<DIFFICULTY> = 0
	elseif GotParam \{MEDIUM}
		<DIFFICULTY> = 1
	elseif GotParam \{HARD}
		<DIFFICULTY> = 2
	elseif GotParam \{All}
		<DIFFICULTY> = 0
		<repeat_num> = 4
	endif
	begin
	Change current_da_diff = ($difficulty_list [<DIFFICULTY>])
	array_entry = 0
	get_songlist_size
	begin
	get_songlist_checksum Index = <array_entry>
	if NOT (<song_checksum> = JamSession)
		load_songqpak song_name = <song_checksum>
		loaded_song = $current_song_qpak
		ExtendCRC <loaded_song> '_song_' out = loaded_song
		ExtendCRC <loaded_song> ($difficulty_list_props.($difficulty_list [<DIFFICULTY>]).text_nl) out = loaded_song
		loaded_marker = $current_song_qpak
		ExtendCRC <loaded_marker> '_markers' out = loaded_marker
		loaded_fretbar = $current_song_qpak
		ExtendCRC <loaded_fretbar> '_fretbars' out = loaded_fretbar
		calc_difficulty_from_all_song_sections {
			song_array = <loaded_song>
			marker_array = <loaded_marker>
			fretbar_array = <loaded_fretbar>
			song_checksum = <song_checksum>
			DIFFICULTY = ($difficulty_list [<DIFFICULTY>])
			output_section_scores = 1
		}
		get_song_struct Song = <song_checksum>
		get_song_title Song = <song_checksum>
		Printf {
			Channel = diffanalyzersection
			"%s; %a; %x; TOTAL SCORE; %d"
			S = ($difficulty_list_props.($difficulty_list [<DIFFICULTY>]).Text)
			A = <Song_Title>
			X = 0
			D = <diff_score>
		}
		get_bpm_from_song loaded_fretbar = <loaded_fretbar>
		if NOT (<avg> = 0)
			Printf {
				Channel = diffanalyzersectiontempo
				"%d; %s; BPM - Low: %a; High: %b; Avg: %c;"
				D = ($difficulty_list_props.($difficulty_list [<DIFFICULTY>]).Text)
				S = <Song_Title>
				A = <low>
				B = <high>
				C = <avg>
			}
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_Size>
	if GotParam \{All}
		<DIFFICULTY> = (<DIFFICULTY> + 1)
	endif
	repeat <repeat_num>
endscript

script get_bpm_from_song \{loaded_fretbar = NONE}
	if NOT GlobalExists Name = <loaded_fretbar> Type = Array
		Printf Channel = da_errors "global loaded_fretbar does not exist for song %s" S = ($current_song_qpak)
		return \{low = 0
			high = 0
			avg = 0}
	endif
	beattime_low = 9999999
	beattime_high = 0
	beattime_avg = 0
	GetArraySize $<loaded_fretbar>
	array_index = 1
	begin
	beattime = (($<loaded_fretbar> [<array_index>]) - ($<loaded_fretbar> [(<array_index> - 1)]))
	<beattime> = ((1.0 / <beattime>) * 60000.0)
	CastToInteger \{beattime}
	<beattime_avg> = (<beattime_avg> + <beattime>)
	if (<beattime> < <beattime_low>)
		<beattime_low> = <beattime>
	endif
	if (<beattime> > <beattime_high>)
		<beattime_high> = <beattime>
	endif
	<array_index> = (<array_index> + 1)
	repeat (<array_Size> - 1)
	<beattime_avg> = (<beattime_avg> / <array_Size>)
	return low = <beattime_low> high = <beattime_high> avg = <beattime_avg>
endscript

script da_check_for_errors \{note = 0}
	is_chord = 1
	array_index = 0
	begin
	if (<note> = ($note_bits [<array_index>]))
		<is_chord> = 0
		break
	endif
	<array_index> = (<array_index> + 1)
	repeat 5
	if (<is_chord>)
		get_num_of_notes_in_chord note = <note>
		if (<num_notes> >= 4)
			Printf Channel = da_errors "WARNING: %c note chord found in song %a on difficulty %b" C = <num_notes> A = $current_song_qpak B = $current_da_diff
		endif
		if (<note> && ($note_bits [0]) && <note> && ($note_bits [3]) && <note> && ($note_bits [4]))
			Printf \{Channel = da_errors
				"WARNING: Green, Blue, Orange chord found in song %a on difficulty %b"
				A = $current_song_qpak
				B = $current_da_diff}
		elseif (<note> && ($note_bits [0]) && <note> && ($note_bits [1]) && <note> && ($note_bits [4]))
			Printf \{Channel = da_errors
				"WARNING: Green, Red, Orange chord found in song %a on difficulty %b"
				A = $current_song_qpak
				B = $current_da_diff}
		elseif (<note> && ($note_bits [0]) && <note> && ($note_bits [2]) && <note> && ($note_bits [4]))
			Printf \{Channel = da_errors
				"WARNING: Green, Yellow, Orange chord found in song %a on difficulty %b"
				A = $current_song_qpak
				B = $current_da_diff}
		elseif (<note> && ($note_bits [0]) && <note> && ($note_bits [4]))
			Printf \{Channel = da_errors
				"WARNING: Green, Orange chord found in song %a on difficulty %b"
				A = $current_song_qpak
				B = $current_da_diff}
		endif
		if ($current_da_diff = EASY || $current_da_diff = MEDIUM)
			if (<note> && ($note_bits [0]) && <note> && ($note_bits [3]))
				Printf \{Channel = da_errors
					"WARNING: Green, Blue chord found in song %a on difficulty %b"
					A = $current_song_qpak
					B = $current_da_diff}
			endif
			if (<num_notes> >= 3)
				Printf Channel = da_errors "WARNING: %c note chord found in song %a on difficulty %b" C = <num_notes> A = $current_song_qpak B = $current_da_diff
			endif
			if ($current_da_diff = EASY)
				if (<note> && ($note_bits [0]) && <note> && ($note_bits [2]))
					Printf \{Channel = da_errors
						"WARNING: Green, Yellow chord found in song %a on difficulty %b"
						A = $current_song_qpak
						B = $current_da_diff}
				endif
			endif
		endif
	else
		if ($current_da_diff = EASY || $current_da_diff = MEDIUM)
			if (<note> && ($note_bits [4]))
				Printf \{Channel = da_errors
					"WARNING: Orange note found in song %a on difficulty %b"
					A = $current_song_qpak
					B = $current_da_diff}
			endif
		endif
		if ($current_da_diff = EASY)
			if (<note> && ($note_bits [3]))
				Printf \{Channel = da_errors
					"WARNING: Blue note found in song %a on difficulty %b"
					A = $current_song_qpak
					B = $current_da_diff}
			endif
		endif
	endif
endscript
