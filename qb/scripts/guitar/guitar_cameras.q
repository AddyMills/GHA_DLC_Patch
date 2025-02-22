CameraCuts_Good_Array = Default_Cameras_Good
CameraCuts_Normal_Array = Default_Cameras_Normal
CameraCuts_Poor_Array = Default_Cameras_Poor
CameraCuts_Performance = GOOD
CameraCuts_LastArray = CameraCuts_Good_Array
CameraCuts_LastPerformance = GOOD
CameraCuts_Enabled = FALSE
CameraCuts_LastIndex = 0
CameraCuts_LastType = NONE
CameraCuts_LastDownbeatIndex = 0
CameraCuts_ChangeTime = 0
CameraCuts_ChangeNow = FALSE
CameraCuts_ForceTime = 0
CameraCuts_NextTime = 0
CameraCuts_ArrayPrefix = 'Cameras'
CameraCuts_ForceType = NONE
CameraCuts_NextName = NONE
CameraCuts_ChangeCamEnable = TRUE
CameraCuts_AllowNoteScripts = TRUE
CameraCuts_LastCameraStartTime = 0.0
CameraCuts_ForceChangeTime = 0.0
CameraCuts_ShadowCasters = NONE
CameraCuts_NextNoteCameraTime = -1
CameraCuts_NoteMapping = [
	{
		MidiNote = 0
		Scr = CameraCuts_EnableChangeCam
		Params = {
			Enable = TRUE
		}
	}
	{
		MidiNote = 1
		Scr = CameraCuts_EnableChangeCam
		Params = {
			Enable = FALSE
		}
	}
	{
		MidiNote = 3
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_rhythm'
			changenow
			Type = RHYTHM_Vert_Down
		}
	}
	{
		MidiNote = 4
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_rhythm'
			changenow
			Type = RHYTHM_Vert_Up
		}
	}
	{
		MidiNote = 5
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_rhythm'
			changenow
			Type = RHYTHM_Orbit_CCW
		}
	}
	{
		MidiNote = 6
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_rhythm'
			changenow
			Type = RHYTHM_Orbit_CW
		}
	}
	{
		MidiNote = 7
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_rhythm'
			changenow
			Type = RHYTHM_CloseUp
		}
	}
	{
		MidiNote = 8
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_rhythm'
			changenow
			Type = RHYTHM_Medium
		}
	}
	{
		MidiNote = 10
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_bassist'
			changenow
			Type = BASSIST_Vert_Down
		}
	}
	{
		MidiNote = 11
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_bassist'
			changenow
			Type = BASSIST_Vert_Up
		}
	}
	{
		MidiNote = 12
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_bassist'
			changenow
			Type = BASSIST_Orbit_CCW
		}
	}
	{
		MidiNote = 13
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_bassist'
			changenow
			Type = BASSIST_Orbit_CW
		}
	}
	{
		MidiNote = 14
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_bassist'
			changenow
			Type = BASSIST_CloseUp
		}
	}
	{
		MidiNote = 15
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_bassist'
			changenow
			Type = BASSIST_Medium
		}
	}
	{
		MidiNote = 17
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_drummer'
			changenow
			Type = DRUMMER_Vert_Down
		}
	}
	{
		MidiNote = 18
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_drummer'
			changenow
			Type = DRUMMER_Vert_Up
		}
	}
	{
		MidiNote = 19
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_drummer'
			changenow
			Type = DRUMMER_Orbit_CCW
		}
	}
	{
		MidiNote = 20
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_drummer'
			changenow
			Type = DRUMMER_Orbit_CW
		}
	}
	{
		MidiNote = 21
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_drummer'
			changenow
			Type = DRUMMER_CloseUp
		}
	}
	{
		MidiNote = 22
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_drummer'
			changenow
			Type = DRUMMER_Medium
		}
	}
	{
		MidiNote = 24
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_singer'
			changenow
			Type = SINGER_Vert_Down
		}
	}
	{
		MidiNote = 25
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_singer'
			changenow
			Type = SINGER_Vert_Up
		}
	}
	{
		MidiNote = 26
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_singer'
			changenow
			Type = SINGER_Orbit_CCW
		}
	}
	{
		MidiNote = 27
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_singer'
			changenow
			Type = SINGER_Orbit_CW
		}
	}
	{
		MidiNote = 28
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_singer'
			changenow
			Type = SINGER_CloseUp
		}
	}
	{
		MidiNote = 29
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_singer'
			changenow
			Type = SINGER_Medium
		}
	}
	{
		MidiNote = 31
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_guitarist'
			changenow
			Type = GUITARIST_Vert_Down
		}
	}
	{
		MidiNote = 32
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_guitarist'
			changenow
			Type = GUITARIST_Vert_Up
		}
	}
	{
		MidiNote = 33
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_guitarist'
			changenow
			Type = GUITARIST_Orbit_CCW
		}
	}
	{
		MidiNote = 34
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_guitarist'
			changenow
			Type = GUITARIST_Orbit_CW
		}
	}
	{
		MidiNote = 35
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_guitarist'
			changenow
			Type = GUITARIST_CloseUp
		}
	}
	{
		MidiNote = 36
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_guitarist'
			changenow
			Type = GUITARIST_Medium
		}
	}
	{
		MidiNote = 38
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_guitar'
			changenow
			Type = GUITAR_CloseUp
		}
	}
	{
		MidiNote = 39
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_guitar'
			changenow
			Type = GUITAR_Solo_Neck
		}
	}
	{
		MidiNote = 40
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_guitar'
			changenow
			Type = GUITAR_Solo_Body
		}
	}
	{
		MidiNote = 42
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_stage'
			changenow
			Type = STAGE_Vert_Down
		}
	}
	{
		MidiNote = 43
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_stage'
			changenow
			Type = STAGE_Vert_Up
		}
	}
	{
		MidiNote = 44
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_stage'
			changenow
			Type = STAGE_Orbit_CCW
		}
	}
	{
		MidiNote = 45
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_stage'
			changenow
			Type = STAGE_Orbit_CW
		}
	}
	{
		MidiNote = 46
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_stage'
			changenow
			Type = STAGE_Low
		}
	}
	{
		MidiNote = 47
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_stage'
			changenow
			Type = STAGE_High
		}
	}
	{
		MidiNote = 49
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_mid'
			changenow
			Type = MID_Vert_Down
		}
	}
	{
		MidiNote = 50
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_mid'
			changenow
			Type = MID_Vert_Up
		}
	}
	{
		MidiNote = 51
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_mid'
			changenow
			Type = MID_Orbit_CCW
		}
	}
	{
		MidiNote = 52
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_mid'
			changenow
			Type = MID_Orbit_CW
		}
	}
	{
		MidiNote = 53
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_mid'
			changenow
			Type = MID_Low
		}
	}
	{
		MidiNote = 54
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_mid'
			changenow
			Type = MID_High
		}
	}
	{
		MidiNote = 56
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_longshot'
			changenow
			Type = LONGSHOT_Low
		}
	}
	{
		MidiNote = 57
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_longshot'
			changenow
			Type = LONGSHOT_High
		}
	}
	{
		MidiNote = 59
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_zoom'
			changenow
			Type = ZOOM_In_Fast
		}
	}
	{
		MidiNote = 60
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_zoom'
			changenow
			Type = ZOOM_In_Slow
		}
	}
	{
		MidiNote = 61
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_zoom'
			changenow
			Type = ZOOM_Out_Fast
		}
	}
	{
		MidiNote = 62
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_zoom'
			changenow
			Type = ZOOM_Out_Slow
		}
	}
	{
		MidiNote = 64
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_pan'
			changenow
			Type = PAN_Singer_Guitarist
		}
	}
	{
		MidiNote = 65
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_pan'
			changenow
			Type = PAN_Guitarist_Singer
		}
	}
	{
		MidiNote = 67
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_dolly'
			changenow
			Type = DOLLY_Front_R
		}
	}
	{
		MidiNote = 68
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_dolly'
			changenow
			Type = DOLLY_Front_L
		}
	}
	{
		MidiNote = 69
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_dolly'
			changenow
			Type = DOLLY_Rear_R
		}
	}
	{
		MidiNote = 70
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_dolly'
			changenow
			Type = DOLLY_Rear_L
		}
	}
	{
		MidiNote = 72
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_special'
			changenow
			Type = SPECIAL_A
		}
	}
	{
		MidiNote = 73
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_special'
			changenow
			Type = SPECIAL_B
		}
	}
	{
		MidiNote = 74
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_special'
			changenow
			Type = SPECIAL_C
		}
	}
	{
		MidiNote = 75
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_special'
			changenow
			Type = SPECIAL_D
		}
	}
	{
		MidiNote = 77
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_mocap'
			changenow
			Name = MOCAP01
		}
	}
	{
		MidiNote = 78
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_mocap'
			changenow
			Name = MOCAP02
		}
	}
	{
		MidiNote = 79
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_mocap'
			changenow
			Name = MOCAP03
		}
	}
	{
		MidiNote = 80
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_mocap'
			changenow
			Name = MOCAP04
		}
	}
	{
		MidiNote = 82
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_audience'
			changenow
			Type = AUDIENCE
		}
	}
	{
		MidiNote = 84
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_boss_battle'
			changenow
			Type = PLAYER_CloseUp
		}
	}
	{
		MidiNote = 85
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_boss_battle'
			changenow
			Type = BOSS_CloseUp
		}
	}
	{
		MidiNote = 87
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_singer'
			changenow
			Name = SINGER_CloseUp01
		}
	}
	{
		MidiNote = 88
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_singer'
			changenow
			Name = SINGER_CloseUp02
		}
	}
	{
		MidiNote = 89
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_singer'
			changenow
			Name = SINGER_CloseUp03
		}
	}
	{
		MidiNote = 91
		Scr = CameraCuts_SetArrayPrefix
		Params = {
			prefix = 'cameras_stagediver'
			changenow
		}
	}
]

script cameracuts_iterator 
	Printf "Cameras Iterator started with time %d" D = <time_offset>
	Change \{CameraCuts_NextNoteCameraTime = -1}
	get_song_prefix Song = <song_name>
	FormatText ChecksumName = event_array '%s_cameras_notes' S = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = Array
		return
	endif
	array_entry = 0
	fretbar_count = 0
	GetArraySize $<event_array>
	GetSongTimeMS time_offset = <time_offset>
	if NOT (<array_Size> = 0)
		begin
		if ((<Time> - <skipleadin>) < $<event_array> [<array_entry>] [0])
			break
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
		array_Size = (<array_Size> - <array_entry>)
		if NOT (<array_Size> = 0)
			begin
			Change CameraCuts_NextNoteCameraTime = ($<event_array> [<array_entry>] [0] - <time_offset>)
			TimeMarkerReached_SetParams time_offset = <time_offset> Array = <event_array> array_entry = <array_entry> ArrayOfArrays
			begin
			if TimeMarkerReached
				GetSongTimeMS time_offset = <time_offset>
				break
			endif
			Wait \{1
				GameFrame}
			repeat
			TimeMarkerReached_ClearParams
			note = ($<event_array> [<array_entry>] [1])
			if ($CameraCuts_AllowNoteScripts = TRUE)
				if GetNoteMapping section = Cameras note = <note>
					SpawnScriptNow (<note_data>.Scr) Params = {(<note_data>.Params) Length = ($<event_array> [<array_entry>] [2])}
				endif
			endif
			<array_entry> = (<array_entry> + 1)
			repeat <array_Size>
		endif
	endif
	Change \{CameraCuts_NextNoteCameraTime = -1}
endscript

script CameraCuts_GetNextNoteCameraTime 
	return camera_time = ($CameraCuts_NextNoteCameraTime)
endscript

script CameraCuts_SetArray \{Type = GOOD
		Array = Default_Cameras_Good}
	if (<Type> = GOOD)
		Change CameraCuts_Good_Array = <Array>
	endif
	if (<Type> = MEDIUM)
		Change CameraCuts_Normal_Array = <Array>
	endif
	if (<Type> = POOR)
		Change CameraCuts_Poor_Array = <Array>
	endif
endscript

script CameraCuts_SetParams \{performance = MEDIUM}
	Change CameraCuts_Performance = <performance>
endscript

script CameraCuts_SetArrayPrefix \{prefix = 'cameras'
		Type = NONE
		Name = NONE
		Length = 0}
	if GotParam \{selectguitartype}
		if ($player1_status.instrument_id = Instrument_Guitar_Demonik)
			Type = demonik
		else
			Type = Random (@ GUITAR_Solo_Body @ GUITAR_Solo_Neck)
		endif
	endif
	Change CameraCuts_ArrayPrefix = <prefix>
	Change CameraCuts_ForceType = <Type>
	Change CameraCuts_NextName = <Name>
	set_defaultcameracuts
	Change \{allow_4x_effect = TRUE}
	if GotParam \{changetime}
		Change CameraCuts_ForceChangeTime = <changetime>
	endif
	if GotParam \{changenow}
		if (<Length> > 200)
			Change CameraCuts_NextTime = <Length>
		endif
		CameraCuts_EnableChangeCam \{Enable = TRUE}
	endif
endscript

script set_defaultcameracut_perf_debug \{perf = 'good'
		perf_checksum = GOOD}
	GetPakManCurrentName \{map = Zones}
	if ($current_num_players = 2)
		FormatText ChecksumName = Cameras_Array '%s_%p_%c_2p' P = $CameraCuts_ArrayPrefix C = <perf> S = <pakname>
		if GlobalExists Name = <Cameras_Array> Type = Array
			FormatText TextName = Cameras_Array2 '%s_%p_%c_2p' P = $CameraCuts_ArrayPrefix C = <perf> S = <pakname>
			Printf "set_defaultcameracut_perf_debug %t %i" T = <perf_checksum> I = <Cameras_Array2>
			return
		endif
		FormatText ChecksumName = Cameras_Array '%s_%p_2p' P = $CameraCuts_ArrayPrefix S = <pakname>
		if GlobalExists Name = <Cameras_Array> Type = Array
			FormatText TextName = Cameras_Array2 '%s_%p_2p' P = $CameraCuts_ArrayPrefix S = <pakname>
			Printf "set_defaultcameracut_perf_debug %t %i" T = <perf_checksum> I = <Cameras_Array2>
			return
		endif
	endif
	FormatText ChecksumName = Cameras_Array '%s_%p_%c' P = $CameraCuts_ArrayPrefix C = <perf> S = <pakname>
	if GlobalExists Name = <Cameras_Array> Type = Array
		FormatText ChecksumName = Cameras_Array2 '%s_%p_%c' P = $CameraCuts_ArrayPrefix C = <perf> S = <pakname>
		Printf "set_defaultcameracut_perf_debug %t %i" T = <perf_checksum> I = <Cameras_Array2>
		return
	endif
	FormatText ChecksumName = Cameras_Array '%s_%p' P = $CameraCuts_ArrayPrefix S = <pakname>
	if GlobalExists Name = <Cameras_Array> Type = Array
		FormatText TextName = Cameras_Array2 '%s_%p' P = $CameraCuts_ArrayPrefix S = <pakname>
		Printf "set_defaultcameracut_perf_debug %t %i" T = <perf_checksum> I = <Cameras_Array2>
		return
	endif
	FormatText ChecksumName = Cameras_Array '%s_%p_%c' P = $CameraCuts_ArrayPrefix C = <perf> S = 'default'
	if GlobalExists Name = <Cameras_Array> Type = Array
		FormatText TextName = Cameras_Array2 '%s_%p_%c' P = $CameraCuts_ArrayPrefix C = <perf> S = 'default'
		Printf "set_defaultcameracut_perf_debug %t %i" T = <perf_checksum> I = <Cameras_Array2>
		return
	endif
	FormatText \{ChecksumName = Cameras_Array
		'%s_%p'
		P = $CameraCuts_ArrayPrefix
		S = 'default'}
	if GlobalExists Name = <Cameras_Array> Type = Array
		FormatText \{TextName = Cameras_Array2
			'%s_%p'
			P = $CameraCuts_ArrayPrefix
			S = 'default'}
		Printf "set_defaultcameracut_perf_debug %t %i" T = <perf_checksum> I = <Cameras_Array2>
		return
	endif
	PrintStruct <...> prefix = ($CameraCuts_ArrayPrefix)
	ScriptAssert \{"CameraCut Array not found"}
endscript

script set_defaultcameracut_perf \{perf = 'good'
		perf_checksum = GOOD}
	GetPakManCurrentName \{map = Zones}
	if ($current_num_players = 2)
		FormatText ChecksumName = Cameras_Array '%s_%p_%c_2p' P = $CameraCuts_ArrayPrefix C = <perf> S = <pakname>
		if GlobalExists Name = <Cameras_Array> Type = Array
			CameraCuts_SetArray Type = <perf_checksum> Array = <Cameras_Array>
			return
		endif
		FormatText ChecksumName = Cameras_Array '%s_%p_2p' P = $CameraCuts_ArrayPrefix S = <pakname>
		if GlobalExists Name = <Cameras_Array> Type = Array
			CameraCuts_SetArray Type = <perf_checksum> Array = <Cameras_Array>
			return
		endif
	endif
	FormatText ChecksumName = Cameras_Array '%s_%p_%c' P = $CameraCuts_ArrayPrefix C = <perf> S = <pakname>
	if GlobalExists Name = <Cameras_Array> Type = Array
		CameraCuts_SetArray Type = <perf_checksum> Array = <Cameras_Array>
		return
	endif
	FormatText ChecksumName = Cameras_Array '%s_%p' P = $CameraCuts_ArrayPrefix S = <pakname>
	if GlobalExists Name = <Cameras_Array> Type = Array
		CameraCuts_SetArray Type = <perf_checksum> Array = <Cameras_Array>
		return
	endif
	FormatText ChecksumName = Cameras_Array '%s_%p_%c' P = $CameraCuts_ArrayPrefix C = <perf> S = 'default'
	if GlobalExists Name = <Cameras_Array> Type = Array
		CameraCuts_SetArray Type = <perf_checksum> Array = <Cameras_Array>
		return
	endif
	FormatText \{ChecksumName = Cameras_Array
		'%s_%p'
		P = $CameraCuts_ArrayPrefix
		S = 'default'}
	if GlobalExists Name = <Cameras_Array> Type = Array
		CameraCuts_SetArray Type = <perf_checksum> Array = <Cameras_Array>
		return
	endif
	PrintStruct <...> prefix = ($CameraCuts_ArrayPrefix)
	ScriptAssert \{"CameraCut Array not found"}
endscript

script set_defaultcameracuts 
	set_defaultcameracut_perf \{perf = 'good'
		perf_checksum = GOOD}
	set_defaultcameracut_perf \{perf = 'normal'
		perf_checksum = MEDIUM}
	set_defaultcameracut_perf \{perf = 'poor'
		perf_checksum = POOR}
endscript

CurrCameraMap = $CameraCuts_NoteMapping

script set_camera_notemapping \{song_name = invalid}
	get_song_struct song = <song_name>
	if StructureContains structure = <song_struct> gh3_convert
		change \{CurrCameraMap = $CameraCuts_NoteMapping_GH3}
	else
		change \{CurrCameraMap = $CameraCuts_NoteMapping}
	endif
endscript

script create_cameracuts 
	Change \{CameraCuts_ArrayPrefix = 'cameras'}
	set_defaultcameracuts
	set_camera_notemapping song_name = ($current_song)
	SetNoteMappings \{section = Cameras
		mapping = $CurrCameraMap}
	kill_dummy_bg_camera
	Change \{CameraCuts_LastType = NONE}
	Change \{CameraCuts_LastDownbeatIndex = 0}
	Change \{CameraCuts_ForceChangeTime = 0.0}
	Change \{CameraCuts_ForceType = NONE}
	Change \{CameraCuts_NextName = NONE}
	if ($game_mode = training)
		Change \{CameraCuts_ChangeCamEnable = FALSE}
		Change \{CameraCuts_AllowNoteScripts = FALSE}
	else
		Change \{CameraCuts_ChangeCamEnable = TRUE}
		Change \{CameraCuts_AllowNoteScripts = TRUE}
	endif
	Change \{CameraCuts_Enabled = TRUE}
	CameraCuts_StartCallback
endscript

script CameraCuts_GetNextDownbeat 
	get_song_prefix Song = ($current_song)
	FormatText ChecksumName = event_array '%s_lightshow_notes' S = <song_prefix> AddToStringLookup
	if NOT GlobalExists Name = <event_array> Type = Array
		return endtime = <endtime>
	endif
	GetArraySize $<event_array>
	array_count = ($CameraCuts_LastDownbeatIndex)
	array_Size = (<array_Size> - <array_count>)
	if (<array_Size> > 0)
		begin
		if ($<event_array> [<array_count>] [1] = 58)
			if ($<event_array> [<array_count>] [0] > <endtime>)
				Change CameraCuts_LastDownbeatIndex = <array_count>
				return endtime = ($<event_array> [<array_count>] [0])
			endif
		endif
		array_count = (<array_count> + 1)
		repeat <array_Size>
	endif
	return endtime = <endtime>
endscript

script CameraCuts_StartCallback 
	Change \{CameraCuts_ChangeNow = FALSE}
	if ($CameraCuts_Enabled = FALSE)
		return
	endif
	if ($CameraCuts_Performance = POOR)
		Camera_Array = CameraCuts_Poor_Array
	else
		if ($CameraCuts_Performance = GOOD)
			Camera_Array = CameraCuts_Good_Array
		else
			Camera_Array = CameraCuts_Normal_Array
		endif
	endif
	if CompositeObjectExists \{Name = GUITARIST}
		GUITARIST :get_target_node
	endif
	if NOT ($CameraCuts_NextName = NONE)
		CameraCut_GetArraySize Camera_Array = <Camera_Array> Name = ($CameraCuts_NextName) target_node = <target_node>
	elseif NOT ($CameraCuts_ForceType = NONE)
		CameraCut_GetArraySize Camera_Array = <Camera_Array> includetype = $CameraCuts_ForceType target_node = <target_node>
	else
		CameraCut_GetArraySize Camera_Array = <Camera_Array> excludetype = $CameraCuts_LastType target_node = <target_node>
	endif
	if (<array_Size> = 0)
		newIndex = 0
	else
		GetRandomValue Name = newIndex Integer A = 0 B = (<array_Size> - 1)
		CameraCut_GetCameraIndex Camera_Array = <Camera_Array> newIndex = <newIndex>
	endif
	debug_flags = NONE
	if NOT ($debug_camera_array = NONE)
		found = 0
		FormatText \{ChecksumName = New_Camera_Array
			'%s_%p'
			S = $debug_camera_array_pakname
			P = $debug_camera_array}
		if GlobalExists Name = <New_Camera_Array>
			GetArraySize $<New_Camera_Array>
			Index = ($debug_camera_array_count)
			if (<Index> < <array_Size>)
				Camera_Array = <New_Camera_Array>
				newIndex = ($debug_camera_array_count)
				found = 1
				debug_flags = update_when_paused
			endif
		endif
		if (found = 0)
			Change \{debug_camera_array = NONE}
			Change \{debug_camera_array_pakname = NONE}
			Change \{debug_camera_array_count = NONE}
		endif
	endif
	Change CameraCuts_LastArray = <Camera_Array>
	Change \{CameraCuts_LastPerformance = $CameraCuts_Performance}
	Change CameraCuts_LastIndex = <newIndex>
	if StructureContains Structure = (<Camera_Array> [<newIndex>]) Type
		Change CameraCuts_LastType = ($<Camera_Array> [<newIndex>].Type)
	elseif StructureContains Structure = (<Camera_Array> [<newIndex>]) Params
		if StructureContains Structure = (<Camera_Array> [<newIndex>].Params) Type
			Change CameraCuts_LastType = ($<Camera_Array> [<newIndex>].Params.Type)
		else
			Change \{CameraCuts_LastType = NONE}
		endif
	else
		Change \{CameraCuts_LastType = NONE}
	endif
	if ($debug_showcameraname = ON)
		CameraCuts_UpdateDebugCameraName
	endif
	if ($output_gpu_log = 1)
		CameraCuts_OutputGPULog
	endif
	if StructureContains Structure = (<Camera_Array> [<newIndex>]) Params
		camStruct = ((<Camera_Array> [<newIndex>]).Params)
		if NOT StructureContains Structure = <camStruct> DOF
			camStruct = (<Camera_Array> [<newIndex>])
		endif
	endif
	if StructureContains Structure = <camStruct> DOF
		if StructureContains Structure = (<camStruct>.DOF) screen_FX
			dofType = (<camStruct>.DOF)
			dofParam = (<dofType>.screen_FX [0])
		endif
	else
		dofParam = ($DOF_OFF_TOD_Manager.screen_FX [0])
	endif
	if NOT ScreenFX_FXInstanceExists \{viewport = Bg_Viewport
			Name = venue_DOF}
		ScreenFX_AddFXInstance {
			viewport = Bg_Viewport
			Name = venue_DOF
			<dofParam>
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = Bg_Viewport
			Name = venue_DOF
			<dofParam>
		}
	endif
	if StructureContains Structure = (<Camera_Array> [<newIndex>]) CrowdOff
		enable_crowd_models_cfunc \{Active = FALSE}
	else
		enable_crowd_models_cfunc \{Active = TRUE}
	endif
	if StructureContains Structure = (<Camera_Array> [<newIndex>]) ShadowCasters
		Change CameraCuts_ShadowCasters = (<Camera_Array> [<newIndex>].ShadowCasters)
	else
		Change \{CameraCuts_ShadowCasters = NONE}
	endif
	Change \{StructureName = guitarist_info
		waiting_for_cameracut = FALSE}
	Change \{StructureName = bassist_info
		waiting_for_cameracut = FALSE}
	GetSongTimeMS
	Change CameraCuts_LastCameraStartTime = <Time>
	CamParams = (<Camera_Array> [<newIndex>])
	CameraCut_SwapLookAts
	PlayIGCCam {
		Time = <camera_time>
		viewport = Bg_Viewport
		ControlScript = CameraCuts_StaticCamControl
		Params = {CamParams = <CamParams>}
		<CamParams>
		ExitScript = CameraCuts_StartCallback
		Play_hold = 0
		Name = CameraCutCam
		<debug_flags>
	}
endscript

script CameraCuts_UpdateDebugCameraName 
	if ScreenElementExists \{Id = debug_camera_name_text}
		GetArraySize ($CameraCuts_LastArray)
		cameraname = NONE
		if ($CameraCuts_LastIndex < <array_Size>)
			if StructureContains Structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) Params
				if StructureContains Structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex].Params) Name
					cameraname = ($CameraCuts_LastArray [$CameraCuts_LastIndex].Params.Name)
				endif
			endif
			if StructureContains Structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) Name
				cameraname = ($CameraCuts_LastArray [$CameraCuts_LastIndex].Name)
			endif
		endif
		<Crowd> = 1
		if StructureContains Structure = ($CameraCuts_LastArray [$CameraCuts_LastIndex]) CrowdOff
			<Crowd> = 0
		endif
		FormatText TextName = cameraname "%s type=%t crowd=%c" S = <cameraname> T = $CameraCuts_LastType C = <Crowd> DontAssertForChecksums
		debug_camera_name_text :SetProps Text = <cameraname>
	endif
endscript

script CameraCuts_OutputGPULog 
	GetArraySize ($CameraCuts_LastArray)
	cameraname = NONE
	if ($CameraCuts_LastIndex < <array_Size>)
		if StructureContains Structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) Params
			if StructureContains Structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex].Params) Name
				cameraname = ($CameraCuts_LastArray [$CameraCuts_LastIndex].Params.Name)
			endif
		endif
		if StructureContains Structure = (($CameraCuts_LastArray) [$CameraCuts_LastIndex]) Name
			cameraname = ($CameraCuts_LastArray [$CameraCuts_LastIndex].Name)
		endif
	endif
	<Crowd> = 1
	if StructureContains Structure = ($CameraCuts_LastArray [$CameraCuts_LastIndex]) CrowdOff
		<Crowd> = 0
	endif
	FormatText TextName = Text "Cam: %s, type: %t, crowd: %c ; ; ; 16.667" S = <cameraname> T = $CameraCuts_LastType C = <Crowd> DontAssertForChecksums
	TextOutput Text = <Text>
endscript

script destroy_cameracuts 
	Change \{CameraCuts_Enabled = FALSE}
	KillSpawnedScript \{Name = CameraCuts_StartCallback}
	KillCamAnim \{Name = CameraCutCam}
	kill_dummy_bg_camera
	ClearNoteMappings \{section = Cameras}
	KillSpawnedScript \{Name = cameracuts_iterator}
endscript
profiling_cameracuts = FALSE

script profile_camera_cuts \{FileName = "ProfileCameras"}
	if ($profiling_cameracuts = TRUE)
		return
	endif
	Change \{profiling_cameracuts = TRUE}
	hide_analog_options
	SetSlomo \{0.001}
	setslomo_song \{slomo = 0.001}
	dumpprofilestart
	GetPakManCurrentName \{map = Zones}
	camera_count = 0
	begin
	switch <camera_count>
		case 0
		suffix = "cameras_good"
		case 1
		suffix = "cameras_normal"
		case 2
		suffix = "cameras_poor"
		case 3
		suffix = "cameras_good_2p"
		case 4
		suffix = "cameras_normal_2p"
		case 5
		suffix = "cameras_poor_2p"
	endswitch
	FormatText ChecksumName = Camera_Array '%s_%p' S = <pakname> P = <suffix>
	if GlobalExists Name = <Camera_Array>
		GetArraySize $<Camera_Array>
		array_count = 0
		begin
		profile_cameracut Camera_Array_pakname = <pakname> Camera_Array = <suffix> array_count = <array_count>
		<array_count> = (<array_count> + 1)
		repeat <array_Size>
	endif
	camera_count = (<camera_count> + 1)
	repeat 6
	Change \{debug_camera_array = NONE}
	destroy_cameracuts
	Wait \{3
		GameFrames}
	create_cameracuts
	dumpprofileend output_text output_file FileName = <FileName>
	SetSlomo \{$current_speedfactor}
	setslomo_song \{slomo = $current_speedfactor}
	Change \{profiling_cameracuts = FALSE}
endscript

script profile_cameracut 
	Change debug_camera_array = <Camera_Array>
	Change debug_camera_array_pakname = <Camera_Array_pakname>
	Change debug_camera_array_count = <array_count>
	cpu = $current_cpu
	ToggleMetrics \{mode = 2}
	Change \{current_cpu = 6}
	destroy_cameracuts
	Wait \{2
		GameFrames}
	create_cameracuts
	Wait \{3
		GameFrames}
	profile_camera_gpu
	ToggleMetrics \{mode = 0}
	Change current_cpu = <cpu>
endscript

script profile_camera_gpu 
	FormatText \{ChecksumName = New_Camera_Array
		'%s_%p'
		S = $debug_camera_array_pakname
		P = $debug_camera_array}
	Camera_Array = $<New_Camera_Array>
	if StructureContains Structure = (<Camera_Array> [$debug_camera_array_count]) Name
		FormatText TextName = Title "Camera %n Profile Dump" N = ((<Camera_Array> [$debug_camera_array_count]).Name) DontAssertForChecksums
	else
		FormatText TextName = Title "Camera %n Profile Dump" N = ((<Camera_Array> [$debug_camera_array_count]).Params.Name) DontAssertForChecksums
	endif
	dumpprofile cpu = 6 Title = <Title> current_time_only
endscript

script CameraCuts_EnableChangeCam 
	Change CameraCuts_ChangeCamEnable = <Enable>
	Change \{CameraCuts_ChangeNow = TRUE}
endscript

script CameraCuts_CalcTime 
	if ($CameraCuts_ChangeNow = TRUE)
		camera_time = 0
		GetSongTimeMS
		camera_songtime = (<Time> + <camera_time> * 1000)
		return camera_time = <camera_time> camera_songtime = <camera_songtime>
	endif
	if ($CameraCuts_ForceTime = 0)
		if ($CameraCuts_NextTime = 0)
			if NOT ($debug_camera_array = NONE)
				camera_time = 5.0
			else
				camera_time = RandomRange (3.0, 8.0)
				GetSongTimeMS
				endtime = (<Time> + <camera_time> * 1000)
				CameraCuts_GetNextDownbeat endtime = <endtime>
				camera_time = ((<endtime> - <Time>) / 1000.0)
			endif
		else
			camera_time = ($CameraCuts_NextTime / 1000.0)
			Change \{CameraCuts_NextTime = 0}
		endif
	else
		camera_time = ($CameraCuts_ForceTime)
	endif
	GetSongTimeMS
	camera_songtime = (<Time> + <camera_time> * 1000)
	return camera_time = <camera_time> camera_songtime = <camera_songtime>
endscript

script CameraCuts_WaitScript \{camera_time = 0
		camera_songtime = 0}
	GetSongTimeMS
	Change CameraCuts_ChangeTime = <camera_songtime>
	begin
	GetSongTimeMS
	if (<Time> >= $CameraCuts_ChangeTime ||
			$CameraCuts_ChangeNow = TRUE)
		if ($CameraCuts_ChangeCamEnable = TRUE)
			break
		endif
	endif
	if NOT ($CameraCuts_ForceChangeTime = 0.0)
		if ($CameraCuts_ForceChangeTime < (<Time> - $CameraCuts_LastCameraStartTime))
			Change \{CameraCuts_ForceChangeTime = 0.0}
			break
		endif
	endif
	if GotParam \{noWait}
		return \{FALSE}
	endif
	Wait \{1
		GameFrame}
	repeat
	return \{TRUE}
endscript

script CameraCuts_StaticCamControl 
	CameraCuts_CalcTime
	CCam_DoMorph {
		<CamParams>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript
allow_4x_effect = TRUE

script CameraCuts_HandCam \{Name = NONE}
	CameraCuts_CalcTime
	Change \{allow_4x_effect = TRUE}
	if GotParam \{LockToBone}
		if (<LockToBone> = BONE_GUITAR_NECK)
			hide_fourx_effect
			Change \{allow_4x_effect = FALSE}
		endif
	endif
	CCam_DoMorph <...>
	zooming = FALSE
	if GotParam \{Type}
		if (<Type> = LongShot)
			GetRandomValue \{Name = random_value
				Integer
				A = 0
				B = 100}
			if (<random_value> < 25)
				CCam_DoMorph <...> FOV = 62 Time = <camera_time>
				zooming = TRUE
			endif
			if (<random_value> > 95)
				CCam_DoMorph <...> FOV = 78 Time = <camera_time>
				zooming = TRUE
			endif
		endif
		if (<Type> = Mid)
			GetRandomValue \{Name = random_value
				Integer
				A = 0
				B = 100}
			if (<random_value> < 5)
				CCam_DoMorph <...> FOV = 64 Time = <camera_time>
				zooming = TRUE
			endif
			if (<random_value> > 85)
				CCam_DoMorph <...> FOV = 82 Time = <camera_time>
				zooming = TRUE
			endif
		endif
	endif
	if (<zooming> = TRUE)
		amplitudePosition = 0.01
		amplitudeRotation = -0.01
	else
		amplitudePosition = 0.24000001
		amplitudeRotation = -0.38400003
	endif
	CameraCuts_SetHandCamParams <...>
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
	if GotParam \{LockToBone}
		if (<LockToBone> = BONE_GUITAR_NECK)
			show_fourx_effect
			Change \{allow_4x_effect = TRUE}
		endif
	endif
endscript

script CameraCuts_HandCamSmooth \{Name = NONE}
	CameraCuts_CalcTime
	CCam_DoMorph <...>
	zooming = FALSE
	if GotParam \{Type}
		if (<Type> = LongShot)
			GetRandomValue \{Name = random_value
				Integer
				A = 0
				B = 100}
			if (<random_value> < 25)
				CCam_DoMorph <...> FOV = 62 Time = <camera_time>
				zooming = TRUE
			endif
			if (<random_value> > 95)
				CCam_DoMorph <...> FOV = 78 Time = <camera_time>
				zooming = TRUE
			endif
		endif
		if (<Type> = Mid)
			GetRandomValue \{Name = random_value
				Integer
				A = 0
				B = 100}
			if (<random_value> < 5)
				CCam_DoMorph <...> FOV = 64 Time = <camera_time>
				zooming = TRUE
			endif
			if (<random_value> > 85)
				CCam_DoMorph <...> FOV = 82 Time = <camera_time>
				zooming = TRUE
			endif
		endif
	endif
	if (<zooming> = TRUE)
		amplitudePosition = 0.01
		amplitudeRotation = -0.01
	else
		amplitudePosition = 0.05
		amplitudeRotation = -0.08
	endif
	CameraCuts_SetHandCamParams <...>
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_TwoCam 
	if GotParam \{UseHandCam}
		CameraCuts_SetHandCamParams \{amplitudePosition = 0.24000001
			amplitudeRotation = -0.38400003}
	endif
	if GotParam \{UseHandCamSmooth}
		CameraCuts_SetHandCamParams \{amplitudePosition = 0.05
			amplitudeRotation = -0.08}
	endif
	CameraCuts_CalcTime
	CCam_DoMorph {
		<Cam1>
	}
	CCam_WaitMorph
	CCam_DoMorph {
		<Cam2>
		Time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_Encore 
	CameraCuts_CalcTime
	CCam_DoMorph {
		<Cam1>
	}
	Wait \{3
		Seconds}
	CCam_DoMorph {
		<Cam2>
	}
	Wait \{2.5
		Seconds}
	CCam_DoMorph {
		<Cam3>
	}
	Wait \{3
		Seconds}
	CCam_DoMorph {
		<Cam4>
	}
	Wait \{2
		Seconds}
	CCam_DoMorph {
		<Cam5>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_Orbit 
	CameraCuts_CalcTime
	CCam_DoMorph {
		<...>
	}
	orbitangle = (3.1409998 * <orbitangle> / 180.0)
	if (<camera_time> > 0)
		CCam_Orbit axis = (0.0, 1.0, 0.0) SPEED = (<orbitangle> / <camera_time>)
	endif
	CameraCuts_SetHandCamDriftOnly
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_OrbitAndMorphTwoCam 
	CameraCuts_CalcTime
	if (<camera_time> > 0)
		<orbitangle> = (3.1409998 * <orbitangle> / 180.0)
		<orbitparams> = {axis = (0.0, 1.0, 0.0) SPEED = (<orbitangle> / <camera_time>)}
	endif
	CCam_DoMorph {
		<Cam1>
	}
	if (<camera_time> > 0)
		if GotParam \{DisableOrbit1}
			CCam_Orbit \{OFF}
		else
			CCam_Orbit <orbitparams>
		endif
	endif
	CameraCuts_SetHandCamDriftOnly
	CCam_DoMorph {
		<Cam2>
		Time = <camera_time>
	}
	if (<camera_time> > 0)
		if GotParam \{DisableOrbit2}
			CCam_Orbit \{OFF}
		else
			CCam_Orbit <orbitparams>
		endif
	endif
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_SplineMorph 
	CameraCuts_CalcTime
	CCam_SplineMorph {
		<...>
		total_time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_SpecialStepMove 
	CCam_SetSmoothing \{Type = All
		ON = 1
		slow_lerp_factor = 0.7
		fast_lerp_factor = 0.7
		lerp_dropoff = 2.0}
	CameraCuts_CalcTime
	CCam_DoMorph {
		<Cam1>
	}
	CameraCuts_SetHandCamParams \{amplitudePosition = 0.0
		amplitudeRotation = -0.8}
	origpos = (<Cam1>.Pos)
	diry = <StepDir>
	count = 0.0
	timestep = 0.05
	step = (<timestep> / <StepTime>)
	num_jumps = <StepNum>
	dirx = ((<Cam2>.Pos) - (<Cam1>.Pos))
	Printf "timestep %i" I = <timestep>
	jump_multiplier = (<num_jumps> * 360.0)
	count = (<count> + <step>)
	begin
	if (<count> >= 1.0)
		break
	endif
	Sin (<count> * <jump_multiplier>)
	Pos = (<origpos> + <dirx> * <count> + <diry> * <Sin>)
	CCam_DoMorph {
		<...>
		Time = <timestep>
		Motion = Linear
	}
	CCam_WaitMorph
	if CameraCuts_WaitScript camera_songtime = <camera_songtime> noWait
		return
	endif
	count = (<count> + <step>)
	repeat
	CCam_DoMorph {
		<Cam2>
		Time = <FinalRotTime>
		Motion = smooth
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_ApplyDOF \{DOF = $DOF_Medium02_TOD_Manager
		Time = 0.0}
	dofType = <DOF>
	dofParam = (<dofType>.screen_FX [0])
	if NOT ScreenFX_FXInstanceExists \{viewport = Bg_Viewport
			Name = venue_DOF}
		ScreenFX_AddFXInstance {
			viewport = Bg_Viewport
			Name = venue_DOF
			<dofParam>
			Time = <Time>
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = Bg_Viewport
			Name = venue_DOF
			<dofParam>
			Time = <Time>
		}
	endif
endscript

script CameraCuts_SetHandCamDriftOnly 
	CCam_EnableHandcam \{ShakeEnabled = FALSE
		DriftEnabled = TRUE}
	driftSlerpMap = [
		(0.1, 0.3)
		(0.2, 0.3)
	]
	if GotParam \{DriftZoneAngles}
		SetArrayElement ArrayName = driftSlerpMap Index = 1 NewValue = <DriftZoneAngles>
	endif
	CCam_SetHandcamParams {
		$cinematic_camera_default_handcam_params
		driftSlerpMap = <driftSlerpMap>
	}
endscript

script CameraCuts_SetHandCamParams \{amplitudePosition = 0.01
		amplitudeRotation = -0.01}
	CCam_EnableHandcam \{ShakeEnabled = TRUE
		DriftEnabled = TRUE}
	CCam_SetHandcamParams {
		motionX = {
			amplitude = 0.033999998
			Center = 0.0
			periodBase = 0.012999999
			periodMultiples = [
				1 , 3 , 4
			]
		}
		motionY = {
			amplitude = 0.04
			Center = 0.0
			periodBase = 0.016999999
			periodMultiples = [
				1 , 3 , 4
			]
		}
		amplitudePosition = {
			amplitude = <amplitudePosition>
			Center = 0.0
			periodBase = 0.0023
			periodMultiples = [
				1 , 16
			]
		}
		amplitudeRotation = {
			amplitude = <amplitudeRotation>
			Center = 0.0
			periodBase = 0.0023
			periodMultiples = [
				1
			]
		}
		zoomStabilityMap = [
			(1.3, 0.7)
			(30.0, 100.0)
		]
		driftSlerpMap = [
			(0.0, 0.8)
			(0.05, 1.0)
		]
		zoomDriftMap = [
			(1.2, 0.6)
			(30.0, 100.0)
		]
		driftAllowedAmplitude = {
			amplitude = 0.4
			Center = 1.0
			periodBase = 0.02
			periodMultiples = [
				1
			]
		}
	}
endscript

script CameraCuts_HandCamZoom2 
	CCam_DoMorph <...>
	zooming = FALSE
	if (<zooming> = TRUE)
		amplitudePosition = 0.01
		amplitudeRotation = -0.01
	else
		amplitudePosition = 0.05
		amplitudeRotation = -0.08
	endif
	CameraCuts_SetHandCamParams <...>
	Wait \{2
		Seconds}
	CCam_DoMorph <...> FOV = 50 Time = 0.6 Motion = smooth
	CCam_WaitMorph
	Wait \{0.1
		Seconds}
	CCam_DoMorph <...> FOV = 53 Time = 0.25 Motion = smooth
	CCam_WaitMorph
	Wait \{0.03
		Seconds}
	CCam_DoMorph <...> FOV = 51 Time = 0.3 Motion = smooth
	CCam_WaitMorph
	CCam_DoMorph <...> FOV = 51
	CameraCuts_CalcTime
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_QuickZoom 
	CCam_DoMorph <...>
	zooming = FALSE
	if (<zooming> = TRUE)
		amplitudePosition = 0.01
		amplitudeRotation = -0.01
	else
		amplitudePosition = 0.05
		amplitudeRotation = -0.08
	endif
	CameraCuts_SetHandCamParams <...>
	CCam_DoMorph {
		<Cam1>
	}
	CCam_WaitMorph
	Wait \{2
		Seconds}
	CCam_DoMorph {
		<Cam1>
	}
	CCam_WaitMorph
	CCam_DoMorph {
		<Cam2>
		Time = 0.75
		Motion = smooth
	}
	CCam_WaitMorph
	CCam_DoMorph {
		<Cam2>
	}
	CCam_WaitMorph
	CameraCuts_CalcTime
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_Pan 
	CameraCuts_SetHandCamParams \{amplitudePosition = 0.05
		amplitudeRotation = -0.08}
	CCam_DoMorph {
		<Cam1>
		Time = 0
	}
	Wait \{2
		Seconds}
	CCam_DoMorph {
		<Cam2>
		Time = 1
		Motion = smooth
	}
	CCam_WaitMorph
	CameraCuts_CalcTime
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_ThreePos 
	CameraCuts_CalcTime
	CCam_SplineMorph {
		keyframes =
		[
			{
				<Cam1>
			}
			{
				<Cam2>
			}
			{
				<Cam3>
			}
		]
		total_time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_FourPos 
	CameraCuts_CalcTime
	CCam_SplineMorph {
		keyframes =
		[
			{
				<Cam1>
			}
			{
				<Cam2>
			}
			{
				<Cam3>
			}
			{
				<Cam4>
			}
		]
		total_time = <camera_time>
	}
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script CameraCuts_FastIntroHold 
	CameraCuts_SetHandCamParams \{amplitudePosition = 0.05
		amplitudeRotation = -0.08}
	CCam_DoMorph {
		<Cam1>
	}
	CCam_WaitMorph
	CCam_DoMorph {
		<Cam2>
		Time = 1.5
		Motion = smooth
	}
	CCam_WaitMorph
	CameraCuts_CalcTime
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script default_camera_aerosmith_entrance 
	CCam_DoMorph \{LockTo = World
		Pos = (0.67134696, 1.0173221, 8.3327055)
		Quat = (-0.011763, -0.9972829, -0.071651004)
		FOV = 82.0}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = World
		Pos = (0.71067595, 1.138438, 9.816325)
		Quat = (-0.011763, -0.9972829, -0.071651004)
		FOV = 82.0
		Time = 4}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = BASSIST
		Pos = (2.9936182, 1.3600678, 2.0988438)
		Quat = (0.096046, -0.85081804, -0.083159)
		FOV = 28.0}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = BASSIST
		Pos = (2.9936182, 1.3600678, 2.0988438)
		Quat = (0.096046, -0.85081804, -0.083159)
		FOV = 28.0
		Time = 1.5}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = DRUMMER
		Pos = (0.156794, 1.697572, 1.8627019)
		Quat = (0.002087, 0.98201394, -0.18847503)
		FOV = 72.0}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = DRUMMER
		Pos = (0.156794, 1.697572, 1.8627019)
		Quat = (0.002087, 0.98201394, -0.18847503)
		FOV = 72.0
		Time = 1.5}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = GUITARIST
		Pos = (0.369664, 0.93793094, 1.2052851)
		Quat = (0.116242, -0.97601897, -0.173646)
		FOV = 63.0
		LookAt = GUITARIST
		LookAtBone = BONE_CHEST
		ScreenOffset = (-0.35383105, 0.278159)}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = GUITARIST
		Pos = (0.369664, 0.93793094, 1.2052851)
		Quat = (0.116242, -0.97601897, -0.173646)
		FOV = 63.0
		LookAt = GUITARIST
		LookAtBone = BONE_CHEST
		ScreenOffset = (-0.35383105, 0.278159)
		Time = 2}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = VOCALIST
		Pos = (-0.013245, 1.287552, 2.5607681)
		Quat = (0.100522, 0.994561, 0.019)
		FOV = 48.0
		LookAt = VOCALIST
		LookAtBone = BONE_CHEST
		ScreenOffset = (0.255681, 0.201958)}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = VOCALIST
		Pos = (-0.013245, 1.287552, 2.5607681)
		Quat = (0.100522, 0.994561, 0.019)
		FOV = 48.0
		LookAt = VOCALIST
		LookAtBone = BONE_CHEST
		ScreenOffset = (0.255681, 0.201958)
		Time = 2}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = World
		Pos = (0.71067595, 1.138438, 9.816325)
		Quat = (-0.011763, -0.9972829, -0.071651004)
		FOV = 82.0}
	CCam_WaitMorph
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript

script default_camera_boss 
	CCam_DoMorph \{LockTo = BASSIST
		Pos = (0.415953, 0.67239296, 0.951549)
		Quat = (0.060255, -0.9329389, 0.29930598)
		FOV = 72.0}
	CameraCuts_SetHandCamParams \{amplitudePosition = 0.2
		amplitudeRotation = -0.32000002}
	CCam_WaitMorph
	Wait \{0.65000004
		Seconds}
	CCam_DoMorph \{LockTo = BASSIST
		Pos = (0.415953, 0.67239296, 0.951549)
		Quat = (0.060255, -0.9329389, 0.29930598)
		FOV = 72.0}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = BASSIST
		Pos = (0.49457502, 1.167327, 1.1275209)
		Quat = (-0.01335, -0.977757, -0.060676996)
		FOV = 72.0
		Time = 3}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = BASSIST
		Pos = (0.49457502, 1.167327, 1.1275209)
		Quat = (-0.01335, -0.977757, -0.060676996)
		FOV = 72.0}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = BASSIST
		Pos = (0.495756, 1.1663411, 1.12688)
		Quat = (-0.013029, -0.97811204, -0.058653)
		FOV = 80.0
		Time = 3}
	CCam_WaitMorph
	CCam_DoMorph \{LockTo = BASSIST
		Pos = (0.495756, 1.1663411, 1.12688)
		Quat = (-0.013029, -0.97811204, -0.058653)
		FOV = 80.0}
	CCam_WaitMorph
	CameraCuts_WaitScript camera_songtime = <camera_songtime>
endscript
Default_Cameras_Good = [
	{
		Name = good_from_stage
		Play_hold = 1
		LockTo = GUITARIST
		Pos = (1.5175159, 4.1361775, -4.089658)
		Quat = (0.130047, -0.018706, 0.0024160002)
		FOV = 72.0
	}
]
Default_Cameras_Normal = [
	{
		Name = normal_crowd_center
		Play_hold = 1
		LockTo = GUITARIST
		Pos = (5.108431, 1.485993, 13.082112)
		Quat = (0.0025400002, -0.9918739, 0.019756)
		FOV = 72.0
	}
]
Default_Cameras_Poor = [
	{
		Name = poor_crowd_center
		Play_hold = 1
		LockTo = GUITARIST
		Pos = (-1.573781, 1.4759071, 20.610792)
		Quat = (-0.00064900005, 0.998182, 0.010279999)
		FOV = 72.0
	}
]
Default_cameras = [
	{
		Name = CLOSEUP_01
		Type = CLOSEUP
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = World
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
]
Default_cameras_longshot = [
	{
		Name = LONGSHOT_High01
		Type = LONGSHOT_High
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (-0.57198894, 3.954246, 25.20223)
				Quat = (-0.000391, -0.9862749, 0.165061)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (-0.45701203, 3.954003, 25.201323)
				Quat = (-0.000391, -0.9862749, 0.165061)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = LONGSHOT_Low01
		Type = LONGSHOT_Low
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (-1.2919222, -0.24732801, 26.979486)
				Quat = (0.002151, 0.99731797, -0.07157)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (-1.5034659, -0.24687901, 26.973026)
				Quat = (0.002151, 0.99731797, -0.07157)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_mid = [
	{
		Name = MID_High01
		Type = MID_High
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (-0.49241504, 5.681637, 15.161047)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (-0.358149, 5.6813536, 15.163934)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = MID_High02
		Type = MID_High
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (-0.49241504, 5.681637, 15.161047)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (-0.358149, 5.6813536, 15.163934)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = MID_Low01
		Type = MID_Low
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (-0.238645, 1.380729, 16.519836)
				Quat = (0.002289, 0.993116, -0.116648)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (-0.395918, 1.381063, 16.516504)
				Quat = (0.002289, 0.993116, -0.116648)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = MID_Orbit_CCW01
			Type = MID_Orbit_CCW
			LockTo = DRUMMER
			Pos = (5.8004093, 2.342972, 15.428842)
			Quat = (0.030534998, -0.968155, 0.16403799)
			FOV = 72.0
			orbitangle = -50
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = MID_Orbit_CW01
			Type = MID_Orbit_CW
			LockTo = DRUMMER
			Pos = (-3.629889, 2.363242, 15.843865)
			Quat = (0.01824, 0.9812179, -0.16114299)
			FOV = 72.0
			orbitangle = 50
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = MID_Vert_Up01
		Type = MID_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (3.229095, 1.135073, 16.748884)
				Quat = (0.010959, -0.98798496, 0.109562)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (3.107956, 3.7773118, 16.177395)
				Quat = (0.020343998, -0.97472, 0.195036)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = MID_Vert_Down01
		Type = MID_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (3.107956, 3.7773118, 16.177395)
				Quat = (0.020343998, -0.97472, 0.195036)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (3.229095, 1.135073, 16.748884)
				Quat = (0.010959, -0.98798496, 0.109562)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_stage = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = STAGE_High01
			Type = STAGE_High
			LockTo = GUITARIST
			Pos = (-0.331379, 2.1398208, -2.9350684)
			Quat = (0.21009701, -0.053707, 0.011462)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.283846, -0.06725301)
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = STAGE_Low01
			Type = STAGE_Low
			LockTo = GUITARIST
			Pos = (-0.381286, 0.425256, -2.519796)
			Quat = (-0.10694, -0.058470998, -0.0063960003)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.365109, -0.27589303)
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = STAGE_Orbit_CCW01
			Type = STAGE_Orbit_CCW
			LockTo = GUITARIST
			Pos = (-1.390305, 1.247357, -2.320251)
			Quat = (0.043256998, 0.222721, -0.009962)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.22146101, -0.058813)
			orbitangle = -50
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = STAGE_Orbit_CW01
			Type = STAGE_Orbit_CW
			LockTo = GUITARIST
			Pos = (1.1497709, 1.5669589, -2.5368068)
			Quat = (0.093412, -0.302062, 0.029615)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.118136, -0.017852)
			orbitangle = 50
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = STAGE_Vert_Up01
		Type = STAGE_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.89921296, 0.622014, -2.6956532)
				Quat = (-0.072645, 0.017495997, 0.001188)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.9092429, 2.642869, -2.9914842)
				Quat = (0.27269104, 0.016848, -0.0048660003)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = STAGE_Vert_Down01
		Type = STAGE_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.9092429, 2.642869, -2.9914842)
				Quat = (0.27269104, 0.016848, -0.0048660003)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.89921296, 0.622014, -2.6956532)
				Quat = (-0.072645, 0.017495997, 0.001188)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_guitar = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITAR_Solo_Body01
			Type = GUITAR_Solo_Body
			LockTo = GUITARIST
			LockToBone = BONE_GUITAR_BODY
			Pos = (-0.411937, 0.25536898, 0.113419)
			Quat = (0.035701, 0.765104, -0.314193)
			FOV = 69.0
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITAR_Solo_Neck01
			Type = GUITAR_Solo_Neck
			LockTo = GUITARIST
			LockToBone = BONE_GUITAR_NECK
			Pos = (0.6295221, 0.141155, 0.036870994)
			Quat = (-0.515311, -0.48547202, 0.643777)
			FOV = 59.0
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITAR_Closeup01
			Type = GUITAR_CloseUp
			LockTo = GUITARIST
			Pos = (1.2061551, 1.830135, 2.4996212)
			Quat = (0.032743998, -0.969021, 0.16408199)
			FOV = 23.0
			LookAt = GUITARIST
			LookAtBone = BONE_GUITAR_BODY
			ScreenOffset = (-0.308609, -0.110810995)
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_guitarist = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITARIST_Medium01
			Type = GUITARIST_Medium
			LockTo = GUITARIST
			Pos = (0.568493, 1.413887, 2.069787)
			Quat = (0.023573, -0.96751004, 0.103691004)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.338886, -0.30280703)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITARIST_CloseUp01
			Type = GUITARIST_CloseUp
			LockTo = GUITARIST
			Pos = (0.61056405, 1.2063072, 0.73351)
			Quat = (-0.011779, -0.937494, -0.029049)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_HEAD
			ScreenOffset = (0.19106, -0.425305)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = GUITARIST_Orbit_CCW01
			Type = GUITARIST_Orbit_CCW
			LockTo = GUITARIST
			Pos = (0.568493, 1.413887, 2.069787)
			Quat = (0.017220998, -0.98019695, 0.108353004)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.12937102, -0.33291003)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = GUITARIST_Orbit_CW01
			Type = GUITARIST_Orbit_CW
			LockTo = GUITARIST
			Pos = (-1.046432, 1.384884, 1.9220159)
			Quat = (0.029545998, 0.958008, -0.102428995)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.24229202, -0.33644602)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = GUITARIST_Vert_Up01
		Type = GUITARIST_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.488286, 0.30742103, 2.617984)
				Quat = (-0.016588999, -0.98285997, -0.09915401)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.59022295, 2.1093469, 2.9224093)
				Quat = (0.040925, -0.95809203, 0.201243)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = GUITARIST_Vert_Down01
		Type = GUITARIST_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.59022295, 2.1093469, 2.9224093)
				Quat = (0.040925, -0.95809203, 0.201243)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.488286, 0.30742103, 2.617984)
				Quat = (-0.016588999, -0.98285997, -0.09915401)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
]
Default_cameras_singer = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = SINGER_Medium01
			Type = SINGER_Medium
			LockTo = VOCALIST
			Pos = (0.76937497, 1.058248, 2.108929)
			Quat = (0.0024680002, -0.975066, 0.015652)
			FOV = 72.0
			LookAt = VOCALIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.38290703, -0.371808)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = SINGER_CloseUp01
			Type = SINGER_CloseUp
			LockTo = VOCALIST
			Pos = (0.51758003, 1.618211, 0.616831)
			Quat = (0.012169001, -0.9712839, 0.055753)
			FOV = 72.0
			LookAt = VOCALIST
			LookAtBone = BONE_HEAD
			ScreenOffset = (0.417869, -0.345862)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = SINGER_Orbit_CCW01
			Type = SINGER_Orbit_CCW
			LockTo = VOCALIST
			Pos = (1.064897, 1.4607079, 1.941088)
			Quat = (0.02007, -0.96802, 0.087443)
			FOV = 72.0
			LookAt = VOCALIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.230507, -0.35726503)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = SINGER_Orbit_CW01
			Type = SINGER_Orbit_CW
			LockTo = VOCALIST
			Pos = (-0.99324894, 1.5038509, 1.7319051)
			Quat = (0.032038998, 0.937449, -0.086307)
			FOV = 72.0
			LookAt = VOCALIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.298856, -0.31489903)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = SINGER_Vert_Up01
		Type = SINGER_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = VOCALIST
				Pos = (0.20753399, 0.27587602, 2.459351)
				Quat = (-0.017328998, -0.9836369, -0.119853005)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = VOCALIST
				Pos = (0.264459, 2.7206302, 2.661429)
				Quat = (0.038757, -0.95208496, 0.26838097)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = SINGER_Vert_Down01
		Type = SINGER_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = VOCALIST
				Pos = (0.264459, 2.7206302, 2.661429)
				Quat = (0.038757, -0.95208496, 0.26838097)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = VOCALIST
				Pos = (0.20753399, 0.27587602, 2.459351)
				Quat = (-0.017328998, -0.9836369, -0.119853005)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
]
Default_cameras_drummer = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = DRUMMER_Medium01
			Type = DRUMMER_Medium
			LockTo = DRUMMER
			Pos = (0.222421, 1.513564, 2.327249)
			Quat = (0.013893999, -0.983884, 0.147923)
			FOV = 72.0
			LookAt = DRUMMER
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.224311, -0.229782)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = DRUMMER_CloseUp01
			Type = DRUMMER_CloseUp
			LockTo = DRUMMER
			Pos = (-0.20566, 1.3390739, 1.4644548)
			Quat = (0.012424001, 0.98862296, -0.102515)
			FOV = 72.0
			LookAt = DRUMMER
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.061589997, 0.036165)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = DRUMMER_Orbit_CCW01
			Type = DRUMMER_Orbit_CCW
			LockTo = DRUMMER
			Pos = (1.1982142, 2.287699, 2.516386)
			Quat = (0.071181, -0.927455, 0.27218598)
			FOV = 72.0
			LookAt = DRUMMER
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.17088601, -0.39122102)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = DRUMMER_Orbit_CW01
			Type = DRUMMER_Orbit_CW
			LockTo = DRUMMER
			Pos = (-1.033128, 2.2700999, 2.4955552)
			Quat = (0.067911, 0.93188894, -0.276048)
			FOV = 72.0
			LookAt = DRUMMER
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.10158, -0.42090502)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = DRUMMER_Vert_Up01
		Type = DRUMMER_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (-0.200713, 0.22366, 2.602559)
				Quat = (-0.019181, 0.97748697, 0.11121701)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (-0.24826102, 1.752702, 2.738014)
				Quat = (0.038087, 0.9626029, -0.20308802)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = DRUMMER_Vert_Down01
		Type = DRUMMER_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (-0.24826102, 1.752702, 2.738014)
				Quat = (0.038087, 0.9626029, -0.20308802)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (-0.200713, 0.22366, 2.602559)
				Quat = (-0.019181, 0.97748697, 0.11121701)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
]
Default_cameras_bassist = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = BASSIST_Medium01
			Type = BASSIST_Medium
			LockTo = BASSIST
			Pos = (-0.44130397, 1.5022471, 2.1888866)
			Quat = (0.015552999, 0.97714204, -0.070612)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.35030103, -0.33996502)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = BASSIST_CloseUp01
			Type = BASSIST_CloseUp
			LockTo = BASSIST
			Pos = (-0.0051089996, 1.621796, 1.1483951)
			Quat = (0.0064429995, 0.9916849, -0.044035)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.40118998, 0.14046001)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = BASSIST_Orbit_CCW01
			Type = BASSIST_Orbit_CCW
			LockTo = BASSIST
			Pos = (0.474889, 1.3453529, 2.0212908)
			Quat = (0.003438, -0.97328895, 0.019135999)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.36560303, -0.251627)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = BASSIST_Orbit_CW01
			Type = BASSIST_Orbit_CW
			LockTo = BASSIST
			Pos = (-1.410602, 1.3496668, 1.465308)
			Quat = (0.0070640002, 0.950463, -0.018121999)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.161898, -0.25292102)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = BASSIST_Vert_Up01
		Type = BASSIST_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = BASSIST
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = BASSIST
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = BASSIST_Vert_Down01
		Type = BASSIST_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = BASSIST
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = BASSIST
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
]
Default_cameras_rhythm = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = RHYTHM_Medium01
			Type = RHYTHM_Medium
			LockTo = World
			Pos = (-2.303154, 0.764982, 4.8603663)
			Quat = (-0.012736999, 0.9809339, 0.112639)
			FOV = 72.0
			LookAt = RHYTHM
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.40689602, -0.21984601)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = RHYTHM_CloseUp01
			Type = RHYTHM_CloseUp
			LockTo = World
			Pos = (-1.700512, 0.235937, 4.5619025)
			Quat = (-0.074879, -0.929315, -0.231359)
			FOV = 72.0
			LookAt = RHYTHM
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.39920303, -0.28451303)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = RHYTHM_Orbit_CCW01
			Type = RHYTHM_Orbit_CCW
			LockTo = BASSIST
			Pos = (-0.8169869, 1.8065109, 1.984302)
			Quat = (0.049500998, 0.95019, -0.207611)
			FOV = 72.0
			LookAt = RHYTHM
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.087603, -0.23554099)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = RHYTHM_Orbit_CW01
			Type = RHYTHM_Orbit_CW
			LockTo = BASSIST
			Pos = (-0.8169869, 1.8065109, 1.984302)
			Quat = (0.049500998, 0.95019, -0.207611)
			FOV = 72.0
			LookAt = RHYTHM
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.087603, -0.23554099)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = RHYTHM_Vert_Up01
		Type = RHYTHM_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = World
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = RHYTHM_Vert_Down01
		Type = RHYTHM_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = World
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
]
Default_cameras_dolly = [
	{
		Name = DOLLY_Rear_L01
		Type = DOLLY_Rear_L
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-4.226099, 2.76196, -2.4963582)
				Quat = (0.216053, 0.382162, -0.092458)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.834532, 2.6632998, -3.10608)
				Quat = (0.19763198, -0.258669, 0.054020002)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = DOLLY_Rear_R01
		Type = DOLLY_Rear_R
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.834532, 2.6632998, -3.10608)
				Quat = (0.19763198, -0.258669, 0.054020002)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-4.226099, 2.76196, -2.4963582)
				Quat = (0.216053, 0.382162, -0.092458)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = DOLLY_Front_L01
		Type = DOLLY_Front_L
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (1.881293, 2.3065019, 4.1567903)
				Quat = (0.054615, -0.940841, 0.18255)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-3.5599792, 2.2152371, 4.445907)
				Quat = (0.034560997, 0.964024, -0.15983601)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = DOLLY_Front_R01
		Type = DOLLY_Front_R
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-3.5599792, 2.2152371, 4.445907)
				Quat = (0.034560997, 0.964024, -0.15983601)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (1.881293, 2.3065019, 4.1567903)
				Quat = (0.054615, -0.940841, 0.18255)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_pan = [
	{
		Name = PAN_Guitarist_Singer01
		Type = PAN_Guitarist_Singer
		ControlScript = CameraCuts_Pan
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.221304, 1.2147759, 1.6710881)
				Quat = (-1E-06, 0.99944097, -0.006206)
				FOV = 62.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (-0.42091504, 0.147356)
			}
			Cam2 = {
				LockTo = VOCALIST
				Pos = (2.1242719, 1.214955, 1.3240658)
				Quat = (0.0031050001, -0.880311, 0.0054469993)
				FOV = 62.0
				LookAt = VOCALIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.358489, -0.170862)
			}
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		Name = PAN_Singer_Guitarist01
		Type = PAN_Singer_Guitarist
		ControlScript = CameraCuts_Pan
		Params = {
			Cam1 = {
				LockTo = VOCALIST
				Pos = (2.1242719, 1.214955, 1.3240658)
				Quat = (0.0031050001, -0.880311, 0.0054469993)
				FOV = 62.0
				LookAt = VOCALIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.358489, -0.170862)
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.221304, 1.2147759, 1.6710881)
				Quat = (-1E-06, 0.99944097, -0.006206)
				FOV = 62.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (-0.42091504, 0.147356)
			}
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
]
Default_cameras_zoom = [
	{
		Name = ZOOM_Out_Slow01
		Type = ZOOM_Out_Slow
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.37269202, 0.11745)
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.303226, -0.470842)
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = ZOOM_Out_Fast01
		Type = ZOOM_Out_Fast
		ControlScript = CameraCuts_QuickZoom
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.37269202, 0.11745)
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.303226, -0.470842)
			}
		}
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		Name = ZOOM_In_Slow01
		Type = ZOOM_In_Slow
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.303226, -0.470842)
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.37269202, 0.11745)
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = ZOOM_In_Fast01
		Type = ZOOM_In_Fast
		ControlScript = CameraCuts_QuickZoom
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.303226, -0.470842)
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.37269202, 0.11745)
			}
		}
		DOF = $DOF_Medium02_TOD_Manager
	}
]
Default_cameras_special = [
	{
		Name = SPECIAL01
		Type = SPECIAL_A
		ControlScript = CameraCuts_ThreePos
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (7.91994, 4.0722446, 15.780664)
				Quat = (0.043356, -0.954315, 0.156901)
				FOV = 52.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (4.605281, 1.9775009, 9.89547)
				Quat = (0.037202, -0.957874, 0.13346401)
				FOV = 52.0
			}
			Cam3 = {
				LockTo = GUITARIST
				Pos = (1.5902342, 1.2208471, 4.5518465)
				Quat = (0.016259, -0.9656329, 0.053746)
				FOV = 52.0
			}
		}
	}
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		Params = {
			Name = SPECIAL02
			Type = SPECIAL_B
			orbitangle = 90
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-3.7134671, 1.561098, 5.2489767)
				Quat = (0.022261, 0.94396603, -0.111006)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-1.6345519, 0.98434895, 2.433505)
				Quat = (-0.013397, 0.950469, -0.0021470003)
				FOV = 72.0
			}
		}
	}
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		Params = {
			Name = SPECIAL03
			Type = SPECIAL_C
			orbitangle = -40
			Cam1 = {
				LockTo = GUITARIST
				Pos = (2.1238008, 3.287695, 5.0177402)
				Quat = (0.076614, -0.92003894, 0.22002399)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.615803, 1.9095379, 2.403839)
				Quat = (0.043414995, -0.957317, 0.186884)
				FOV = 72.0
			}
		}
	}
	{
		ControlScript = CameraCuts_SpecialStepMove
		Params = {
			Name = SPECIAL04
			Type = SPECIAL_D
			Cam1 = {
				LockTo = GUITARIST
				Pos = (3.3718438, 1.241465, 7.8585925)
				Quat = (0.017955, -0.950063, 0.048733)
				FOV = 52.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (3.3718438, 1.241465, 7.8585925)
				Quat = (0.017955, -0.950063, 0.048733)
				FOV = 52.0
			}
			StepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_OFF_TOD_Manager
		}
	}
]
Default_cameras_mocap = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = MOCAP01
			Type = MOCAP
			LockTo = GUITARIST
			Pos = (-0.24607702, 3.316178, 0.92423993)
			Quat = (0.021933999, 0.868847, -0.49323303)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = MOCAP02
			Type = MOCAP
			LockTo = VOCALIST
			Pos = (0.0024010001, 3.3782017, 1.199096)
			Quat = (0.009012999, 0.84305805, -0.53760797)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = MOCAP03
			Type = MOCAP
			LockTo = BASSIST
			Pos = (-0.0057200002, 3.355163, 2.1156142)
			Quat = (0.008965001, 0.8438061, -0.53643596)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = MOCAP04
			Type = MOCAP
			LockTo = DRUMMER
			Pos = (0.107346, 3.4477382, 1.783761)
			Quat = (0.008895, 0.84684604, -0.53162295)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_stagedive = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = STAGEDIVER01
			Type = STAGEDIVER
			LockTo = World
			Pos = (0.161384, -0.255694, 7.6203847)
			Quat = (-0.019520998, 0.9806339, 0.12749502)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_audience = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = AUDIENCE01
			Type = AUDIENCE
			LockTo = GUITARIST
			Pos = (-2.8780198, 1.042694, -0.18393801)
			Quat = (0.074025996, 0.014415, -0.0029910002)
			FOV = 52.0
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_starpower = [
	{
		Name = STARPOWER
		Type = STARPOWER
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = World
				Pos = (2.58572, 1.1694639, 6.018505)
				Quat = (-0.001818, -0.97748, 0.008785)
				FOV = 72.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.33652902, -0.198419)
			}
			Cam2 = {
				LockTo = World
				Pos = (2.126417, 1.151183, 5.003499)
				Quat = (-0.003998, -0.97537994, -0.0012250001)
				FOV = 104.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.43471202, -0.20290701)
			}
			DOF = $DOF_CloseUp02_TOD_Manager
			CrowdOff
		}
	}
]
Default_cameras_intro = [
	{
		Name = INTRO
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_fastintro = [
	{
		Name = FASTINTRO
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_preboss = [
	{
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_boss = [
	{
		ControlScript = default_camera_boss
		DOF = $DOF_Medium02_TOD_Manager
	}
]
Default_cameras_preencore = [
	{
		Name = PREENCORE
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_preaerosmith = [
	{
		Name = PREAEROSMITH
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_encore = [
	{
		Name = ENCORE
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_aerosmith_entrance = [
	{
		ControlScript = default_camera_aerosmith_entrance
		DOF = $DOF_Medium02_TOD_Manager
	}
]
Default_cameras_walk = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = WALK01
			Type = WALK
			LockTo = World
			Pos = (-4.908679, -0.015424, 6.3657885)
			Quat = (-0.06930599, 0.891852, 0.112707995)
			FOV = 71.0
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_win = [
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		Params = {
			Name = WIN
			orbitangle = 10
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.206255, 0.082557, 3.0024462)
				Quat = (-0.030819999, -0.96920395, -0.1256)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.96568394, -0.40605003, 4.6806836)
				Quat = (-0.030819999, -0.96920395, -0.1256)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium02_TOD_Manager
		CrowdOff
	}
]
Default_cameras_lose = [
	{
		ControlScript = CameraCuts_TwoCam
		Params = {
			Name = LOSE
			Cam1 = {
				LockTo = World
				Pos = (-1.7738701, 2.2631419, 2.070564)
				Quat = (0.19757299, 0.477018, -0.111905)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-4.2446136, 4.020077, 0.17742501)
				Quat = (0.214849, 0.45659703, -0.11555701)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_stagediver = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = STAGEDIVER01
			Type = STAGEDIVER
			LockTo = World
			Pos = (-4.908679, -0.015424, 6.3657885)
			Quat = (-0.06930599, 0.891852, 0.112707995)
			FOV = 71.0
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_boss_closeup_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = Boss_CloseUp_Center
			Type = BOSS_CloseUp
			LockTo = World
			Pos = (1.9525208, 1.3101209, 5.1531973)
			Quat = (0.000106, 0.9994329, -0.033504)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.18728602, -0.056658)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_player_closeup_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = Player_CloseUp_Center
			Type = PLAYER_CloseUp
			LockTo = World
			Pos = (-1.4694958, 1.3221949, 5.2663136)
			Quat = (0.000139, 0.99899393, -0.044736)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.132887, 0.027633999)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_2p = [
	{
		Name = CLOSEUP_01
		Type = CLOSEUP
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = World
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
	}
]
Default_cameras_mid_2p = [
	{
		Name = MID_High01
		Type = MID_High
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (-0.49241504, 5.681637, 15.161047)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (-0.358149, 5.6813536, 15.163934)
				Quat = (0.003945, 0.96217096, -0.27223304)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = MID_Low01
		Type = MID_Low
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (-0.238645, 1.380729, 16.519836)
				Quat = (0.002289, 0.993116, -0.116648)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (-0.395918, 1.381063, 16.516504)
				Quat = (0.002289, 0.993116, -0.116648)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = MID_Orbit_CCW01
			Type = MID_Orbit_CCW
			LockTo = DRUMMER
			Pos = (5.8004093, 2.342972, 15.428842)
			Quat = (0.030534998, -0.968155, 0.16403799)
			FOV = 72.0
			orbitangle = -50
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = MID_Orbit_CW01
			Type = MID_Orbit_CW
			LockTo = DRUMMER
			Pos = (-3.629889, 2.363242, 15.843865)
			Quat = (0.01824, 0.9812179, -0.16114299)
			FOV = 72.0
			orbitangle = 50
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = MID_Vert_Up01
		Type = MID_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (3.229095, 1.135073, 16.748884)
				Quat = (0.010959, -0.98798496, 0.109562)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (3.107956, 3.7773118, 16.177395)
				Quat = (0.020343998, -0.97472, 0.195036)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = MID_Vert_Down01
		Type = MID_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = DRUMMER
				Pos = (3.107956, 3.7773118, 16.177395)
				Quat = (0.020343998, -0.97472, 0.195036)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = DRUMMER
				Pos = (3.229095, 1.135073, 16.748884)
				Quat = (0.010959, -0.98798496, 0.109562)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_stage_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = STAGE_High01
			Type = STAGE_High
			LockTo = GUITARIST
			Pos = (-0.331379, 2.1398208, -2.9350684)
			Quat = (0.21009701, -0.053707, 0.011462)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.283846, -0.06725301)
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = STAGE_Low01
			Type = STAGE_Low
			LockTo = GUITARIST
			Pos = (-0.381286, 0.425256, -2.519796)
			Quat = (-0.10694, -0.058470998, -0.0063960003)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.365109, -0.27589303)
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = STAGE_Orbit_CCW01
			Type = STAGE_Orbit_CCW
			LockTo = GUITARIST
			Pos = (-1.390305, 1.247357, -2.320251)
			Quat = (0.043256998, 0.222721, -0.009962)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.22146101, -0.058813)
			orbitangle = -50
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = STAGE_Orbit_CW01
			Type = STAGE_Orbit_CW
			LockTo = GUITARIST
			Pos = (1.1497709, 1.5669589, -2.5368068)
			Quat = (0.093412, -0.302062, 0.029615)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.118136, -0.017852)
			orbitangle = 50
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = STAGE_Vert_Up01
		Type = STAGE_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.89921296, 0.622014, -2.6956532)
				Quat = (-0.072645, 0.017495997, 0.001188)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.9092429, 2.642869, -2.9914842)
				Quat = (0.27269104, 0.016848, -0.0048660003)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = STAGE_Vert_Down01
		Type = STAGE_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.9092429, 2.642869, -2.9914842)
				Quat = (0.27269104, 0.016848, -0.0048660003)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.89921296, 0.622014, -2.6956532)
				Quat = (-0.072645, 0.017495997, 0.001188)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_guitar_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITAR_Solo_Body01
			Type = GUITAR_Solo_Body
			LockTo = GUITARIST
			LockToBone = BONE_GUITAR_BODY
			Pos = (-0.411937, 0.25536898, 0.113419)
			Quat = (0.035701, 0.765104, -0.314193)
			FOV = 69.0
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITAR_Solo_Neck01
			Type = GUITAR_Solo_Neck
			LockTo = GUITARIST
			LockToBone = BONE_GUITAR_NECK
			Pos = (0.6295221, 0.141155, 0.036870994)
			Quat = (-0.515311, -0.48547202, 0.643777)
			FOV = 59.0
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITAR_Closeup01
			Type = GUITAR_CloseUp
			LockTo = GUITARIST
			Pos = (1.2061551, 1.830135, 2.4996212)
			Quat = (0.032743998, -0.969021, 0.16408199)
			FOV = 23.0
			LookAt = GUITARIST
			LookAtBone = BONE_GUITAR_BODY
			ScreenOffset = (-0.308609, -0.110810995)
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_guitarist_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITARIST_Medium01
			Type = GUITARIST_Medium
			Player = 1
			LockTo = GUITARIST
			Pos = (0.568493, 1.413887, 2.069787)
			Quat = (0.023573, -0.96751004, 0.103691004)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.338886, -0.30280703)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITARIST_Medium01
			Type = GUITARIST_Medium
			Player = 2
			LockTo = BASSIST
			Pos = (-0.44130397, 1.5022471, 2.1888866)
			Quat = (0.015552999, 0.97714204, -0.070612)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.35030103, -0.33996502)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITARIST_CloseUp01
			Type = GUITARIST_CloseUp
			Player = 1
			LockTo = GUITARIST
			Pos = (0.61056405, 1.2063072, 0.73351)
			Quat = (-0.011779, -0.937494, -0.029049)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_HEAD
			ScreenOffset = (0.19106, -0.425305)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = GUITARIST_CloseUp01
			Type = GUITARIST_CloseUp
			Player = 2
			LockTo = BASSIST
			Pos = (-0.0051089996, 1.621796, 1.1483951)
			Quat = (0.0064429995, 0.9916849, -0.044035)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.40118998, 0.14046001)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = GUITARIST_Orbit_CCW01
			Type = GUITARIST_Orbit_CCW
			Player = 1
			LockTo = GUITARIST
			Pos = (0.568493, 1.413887, 2.069787)
			Quat = (0.017220998, -0.98019695, 0.108353004)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.12937102, -0.33291003)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = GUITARIST_Orbit_CCW01
			Type = GUITARIST_Orbit_CCW
			Player = 2
			LockTo = BASSIST
			Pos = (0.474889, 1.3453529, 2.0212908)
			Quat = (0.003438, -0.97328895, 0.019135999)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.36560303, -0.251627)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = GUITARIST_Orbit_CW01
			Type = GUITARIST_Orbit_CW
			Player = 1
			LockTo = GUITARIST
			Pos = (-1.046432, 1.384884, 1.9220159)
			Quat = (0.029545998, 0.958008, -0.102428995)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.24229202, -0.33644602)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = GUITARIST_Orbit_CW01
			Type = GUITARIST_Orbit_CW
			Player = 2
			LockTo = BASSIST
			Pos = (-1.410602, 1.3496668, 1.465308)
			Quat = (0.0070640002, 0.950463, -0.018121999)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.161898, -0.25292102)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = GUITARIST_Vert_Up01
		Type = GUITARIST_Vert_Up
		Player = 1
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.488286, 0.30742103, 2.617984)
				Quat = (-0.016588999, -0.98285997, -0.09915401)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.59022295, 2.1093469, 2.9224093)
				Quat = (0.040925, -0.95809203, 0.201243)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = GUITARIST_Vert_Up01
		Type = GUITARIST_Vert_Up
		Player = 2
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = BASSIST
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = BASSIST
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = GUITARIST_Vert_Down01
		Type = GUITARIST_Vert_Down
		Player = 1
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.59022295, 2.1093469, 2.9224093)
				Quat = (0.040925, -0.95809203, 0.201243)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.488286, 0.30742103, 2.617984)
				Quat = (-0.016588999, -0.98285997, -0.09915401)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = GUITARIST_Vert_Down01
		Type = GUITARIST_Vert_Down
		Player = 2
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = BASSIST
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = BASSIST
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
]
Default_cameras_singer_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = SINGER_Medium01
			Type = SINGER_Medium
			LockTo = VOCALIST
			Pos = (0.76937497, 1.058248, 2.108929)
			Quat = (0.0024680002, -0.975066, 0.015652)
			FOV = 72.0
			LookAt = VOCALIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.38290703, -0.371808)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = SINGER_CloseUp01
			Type = SINGER_CloseUp
			LockTo = VOCALIST
			Pos = (0.51758003, 1.618211, 0.616831)
			Quat = (0.012169001, -0.9712839, 0.055753)
			FOV = 72.0
			LookAt = VOCALIST
			LookAtBone = BONE_HEAD
			ScreenOffset = (0.417869, -0.345862)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = SINGER_Orbit_CCW01
			Type = SINGER_Orbit_CCW
			LockTo = VOCALIST
			Pos = (1.064897, 1.4607079, 1.941088)
			Quat = (0.02007, -0.96802, 0.087443)
			FOV = 72.0
			LookAt = VOCALIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.230507, -0.35726503)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = SINGER_Orbit_CW01
			Type = SINGER_Orbit_CW
			LockTo = VOCALIST
			Pos = (-0.99324894, 1.5038509, 1.7319051)
			Quat = (0.032038998, 0.937449, -0.086307)
			FOV = 72.0
			LookAt = VOCALIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.298856, -0.31489903)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = SINGER_Vert_Up01
		Type = SINGER_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = VOCALIST
				Pos = (0.20753399, 0.27587602, 2.459351)
				Quat = (-0.017328998, -0.9836369, -0.119853005)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = VOCALIST
				Pos = (0.264459, 2.7206302, 2.661429)
				Quat = (0.038757, -0.95208496, 0.26838097)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = SINGER_Vert_Down01
		Type = SINGER_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = VOCALIST
				Pos = (0.264459, 2.7206302, 2.661429)
				Quat = (0.038757, -0.95208496, 0.26838097)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = VOCALIST
				Pos = (0.20753399, 0.27587602, 2.459351)
				Quat = (-0.017328998, -0.9836369, -0.119853005)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
]
Default_cameras_bassist_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = BASSIST_Medium01
			Type = BASSIST_Medium
			LockTo = BASSIST
			Pos = (-0.44130397, 1.5022471, 2.1888866)
			Quat = (0.015552999, 0.97714204, -0.070612)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.35030103, -0.33996502)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = BASSIST_CloseUp01
			Type = BASSIST_CloseUp
			LockTo = BASSIST
			Pos = (-0.0051089996, 1.621796, 1.1483951)
			Quat = (0.0064429995, 0.9916849, -0.044035)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.40118998, 0.14046001)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = BASSIST_Orbit_CCW01
			Type = BASSIST_Orbit_CCW
			LockTo = BASSIST
			Pos = (0.474889, 1.3453529, 2.0212908)
			Quat = (0.003438, -0.97328895, 0.019135999)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.36560303, -0.251627)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = BASSIST_Orbit_CW01
			Type = BASSIST_Orbit_CW
			LockTo = BASSIST
			Pos = (-1.410602, 1.3496668, 1.465308)
			Quat = (0.0070640002, 0.950463, -0.018121999)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.161898, -0.25292102)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = BASSIST_Vert_Up01
		Type = BASSIST_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = BASSIST
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = BASSIST
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = BASSIST_Vert_Down01
		Type = BASSIST_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = BASSIST
				Pos = (0.883989, 3.015893, 2.6785629)
				Quat = (0.00117, -0.95310104, 0.302564)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = BASSIST
				Pos = (0.858407, 0.2837, 2.433893)
				Quat = (-0.0040740003, -0.99326897, -0.11267199)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
]
Default_cameras_rhythm_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = RHYTHM_Medium01
			Type = RHYTHM_Medium
			LockTo = World
			Pos = (-2.303154, 0.764982, 4.8603663)
			Quat = (-0.012736999, 0.9809339, 0.112639)
			FOV = 72.0
			LookAt = RHYTHM
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.40689602, -0.21984601)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = RHYTHM_CloseUp01
			Type = RHYTHM_CloseUp
			LockTo = World
			Pos = (-1.700512, 0.235937, 4.5619025)
			Quat = (-0.074879, -0.929315, -0.231359)
			FOV = 72.0
			LookAt = RHYTHM
			LookAtBone = BONE_CHEST
			ScreenOffset = (0.39920303, -0.28451303)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = RHYTHM_Orbit_CCW01
			Type = RHYTHM_Orbit_CCW
			LockTo = BASSIST
			Pos = (-0.8169869, 1.8065109, 1.984302)
			Quat = (0.049500998, 0.95019, -0.207611)
			FOV = 72.0
			LookAt = RHYTHM
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.087603, -0.23554099)
			orbitangle = -50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_Orbit
		Params = {
			Name = RHYTHM_Orbit_CW01
			Type = RHYTHM_Orbit_CW
			LockTo = BASSIST
			Pos = (-0.8169869, 1.8065109, 1.984302)
			Quat = (0.049500998, 0.95019, -0.207611)
			FOV = 72.0
			LookAt = RHYTHM
			LookAtBone = BONE_CHEST
			ScreenOffset = (-0.087603, -0.23554099)
			orbitangle = 50
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		Name = RHYTHM_Vert_Up01
		Type = RHYTHM_Vert_Up
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = World
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
	{
		Name = RHYTHM_Vert_Down01
		Type = RHYTHM_Vert_Down
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = World
				Pos = (-0.17172, 1.7125509, 3.530145)
				Quat = (0.030365998, 0.969155, -0.15807201)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-0.192414, 0.92213994, 3.5821917)
				Quat = (-0.0016310001, 0.98192793, 0.008088)
				FOV = 72.0
			}
		}
		DOF = $DOF_CloseUp02_TOD_Manager
		CrowdOff
	}
]
Default_cameras_dolly_2p = [
	{
		Name = DOLLY_Rear_L01
		Type = DOLLY_Rear_L
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-4.226099, 2.76196, -2.4963582)
				Quat = (0.216053, 0.382162, -0.092458)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.834532, 2.6632998, -3.10608)
				Quat = (0.19763198, -0.258669, 0.054020002)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = DOLLY_Rear_R01
		Type = DOLLY_Rear_R
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.834532, 2.6632998, -3.10608)
				Quat = (0.19763198, -0.258669, 0.054020002)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-4.226099, 2.76196, -2.4963582)
				Quat = (0.216053, 0.382162, -0.092458)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = DOLLY_Front_L01
		Type = DOLLY_Front_L
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (1.881293, 2.3065019, 4.1567903)
				Quat = (0.054615, -0.940841, 0.18255)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-3.5599792, 2.2152371, 4.445907)
				Quat = (0.034560997, 0.964024, -0.15983601)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = DOLLY_Front_R01
		Type = DOLLY_Front_R
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-3.5599792, 2.2152371, 4.445907)
				Quat = (0.034560997, 0.964024, -0.15983601)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (1.881293, 2.3065019, 4.1567903)
				Quat = (0.054615, -0.940841, 0.18255)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_pan_2p = [
	{
		Name = PAN_Guitarist_Singer01
		Type = PAN_Guitarist_Singer
		ControlScript = CameraCuts_Pan
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.221304, 1.2147759, 1.6710881)
				Quat = (-1E-06, 0.99944097, -0.006206)
				FOV = 62.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (-0.42091504, 0.147356)
			}
			Cam2 = {
				LockTo = VOCALIST
				Pos = (2.1242719, 1.214955, 1.3240658)
				Quat = (0.0031050001, -0.880311, 0.0054469993)
				FOV = 62.0
				LookAt = VOCALIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.358489, -0.170862)
			}
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
	{
		Name = PAN_Singer_Guitarist01
		Type = PAN_Singer_Guitarist
		ControlScript = CameraCuts_Pan
		Params = {
			Cam1 = {
				LockTo = VOCALIST
				Pos = (2.1242719, 1.214955, 1.3240658)
				Quat = (0.0031050001, -0.880311, 0.0054469993)
				FOV = 62.0
				LookAt = VOCALIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.358489, -0.170862)
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.221304, 1.2147759, 1.6710881)
				Quat = (-1E-06, 0.99944097, -0.006206)
				FOV = 62.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (-0.42091504, 0.147356)
			}
		}
		DOF = $DOF_CloseUp01_TOD_Manager
	}
]
Default_cameras_zoom_2p = [
	{
		Name = ZOOM_Out_Slow01
		Type = ZOOM_Out_Slow
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.37269202, 0.11745)
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.303226, -0.470842)
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = ZOOM_Out_Fast01
		Type = ZOOM_Out_Fast
		ControlScript = CameraCuts_QuickZoom
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.37269202, 0.11745)
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.303226, -0.470842)
			}
		}
		DOF = $DOF_Medium02_TOD_Manager
	}
	{
		Name = ZOOM_In_Slow01
		Type = ZOOM_In_Slow
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.303226, -0.470842)
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.37269202, 0.11745)
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		Name = ZOOM_In_Fast01
		Type = ZOOM_In_Fast
		ControlScript = CameraCuts_QuickZoom
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (0.012666, -0.979612, 0.193192)
				FOV = 52.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.303226, -0.470842)
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-0.608687, 4.565676, 12.706401)
				Quat = (-0.0014460001, 0.99146694, -0.13027)
				FOV = 7.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.37269202, 0.11745)
			}
		}
		DOF = $DOF_Medium02_TOD_Manager
	}
]
Default_cameras_special_2p = [
	{
		Name = SPECIAL01
		Type = SPECIAL_A
		ControlScript = CameraCuts_ThreePos
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (7.91994, 4.0722446, 15.780664)
				Quat = (0.043356, -0.954315, 0.156901)
				FOV = 52.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (4.605281, 1.9775009, 9.89547)
				Quat = (0.037202, -0.957874, 0.13346401)
				FOV = 52.0
			}
			Cam3 = {
				LockTo = GUITARIST
				Pos = (1.5902342, 1.2208471, 4.5518465)
				Quat = (0.016259, -0.9656329, 0.053746)
				FOV = 52.0
			}
		}
	}
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		Params = {
			Name = SPECIAL02
			Type = SPECIAL_B
			orbitangle = 90
			Cam1 = {
				LockTo = GUITARIST
				Pos = (-3.7134671, 1.561098, 5.2489767)
				Quat = (0.022261, 0.94396603, -0.111006)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (-1.6345519, 0.98434895, 2.433505)
				Quat = (-0.013397, 0.950469, -0.0021470003)
				FOV = 72.0
			}
		}
	}
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		Params = {
			Name = SPECIAL03
			Type = SPECIAL_C
			orbitangle = -40
			Cam1 = {
				LockTo = GUITARIST
				Pos = (2.1238008, 3.287695, 5.0177402)
				Quat = (0.076614, -0.92003894, 0.22002399)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.615803, 1.9095379, 2.403839)
				Quat = (0.043414995, -0.957317, 0.186884)
				FOV = 72.0
			}
		}
	}
	{
		ControlScript = CameraCuts_SpecialStepMove
		Params = {
			Name = SPECIAL04
			Type = SPECIAL_D
			Cam1 = {
				LockTo = GUITARIST
				Pos = (3.3718438, 1.241465, 7.8585925)
				Quat = (0.017955, -0.950063, 0.048733)
				FOV = 52.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (3.3718438, 1.241465, 7.8585925)
				Quat = (0.017955, -0.950063, 0.048733)
				FOV = 52.0
			}
			StepTime = 6.0
			FinalRotTime = 1.0
			StepNum = 6.0
			StepDir = (0.0, 0.07, 0.05)
			DOF = $DOF_OFF_TOD_Manager
		}
	}
]
Default_cameras_mocap_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = MOCAP01
			Type = MOCAP
			LockTo = GUITARIST
			Pos = (-0.24607702, 3.316178, 0.92423993)
			Quat = (0.021933999, 0.868847, -0.49323303)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = MOCAP02
			Type = MOCAP
			LockTo = VOCALIST
			Pos = (0.0024010001, 3.3782017, 1.199096)
			Quat = (0.009012999, 0.84305805, -0.53760797)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = MOCAP03
			Type = MOCAP
			LockTo = BASSIST
			Pos = (-0.0057200002, 3.355163, 2.1156142)
			Quat = (0.008965001, 0.8438061, -0.53643596)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = MOCAP04
			Type = MOCAP
			LockTo = DRUMMER
			Pos = (0.107346, 3.4477382, 1.783761)
			Quat = (0.008895, 0.84684604, -0.53162295)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_stagedive_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = STAGEDIVER01
			Type = STAGEDIVER
			LockTo = World
			Pos = (0.161384, -0.255694, 7.6203847)
			Quat = (-0.019520998, 0.9806339, 0.12749502)
			FOV = 72.0
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_starpower_2p = [
	{
		Name = STARPOWER
		Type = STARPOWER
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = World
				Pos = (2.58572, 1.1694639, 6.018505)
				Quat = (-0.001818, -0.97748, 0.008785)
				FOV = 72.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.33652902, -0.198419)
			}
			Cam2 = {
				LockTo = World
				Pos = (2.126417, 1.151183, 5.003499)
				Quat = (-0.003998, -0.97537994, -0.0012250001)
				FOV = 104.0
				LookAt = GUITARIST
				LookAtBone = BONE_CHEST
				ScreenOffset = (0.43471202, -0.20290701)
			}
			DOF = $DOF_CloseUp02_TOD_Manager
			CrowdOff
		}
	}
]
Default_cameras_intro_2p = [
	{
		Name = INTRO
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_fastintro_2p = [
	{
		Name = FASTINTRO
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_boss_2p = [
	{
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_encore_2p = [
	{
		Name = ENCORE
		ControlScript = CameraCuts_TwoCam
		Params = {
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.310654, 1.548265, 5.166498)
				Quat = (0.018204998, -0.979563, 0.114463)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (2.027228, 3.356204, 10.107616)
				Quat = (0.034807995, -0.963447, 0.206313)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_walk_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = WALK01
			Type = WALK
			LockTo = World
			Pos = (-4.908679, -0.015424, 6.3657885)
			Quat = (-0.06930599, 0.891852, 0.112707995)
			FOV = 71.0
		}
		DOF = $DOF_Medium01_TOD_Manager
		CrowdOff
	}
]
Default_cameras_win_2p = [
	{
		ControlScript = CameraCuts_OrbitAndMorphTwoCam
		Params = {
			Name = WIN
			orbitangle = 10
			Cam1 = {
				LockTo = GUITARIST
				Pos = (0.206255, 0.082557, 3.0024462)
				Quat = (-0.030819999, -0.96920395, -0.1256)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = GUITARIST
				Pos = (0.96568394, -0.40605003, 4.6806836)
				Quat = (-0.030819999, -0.96920395, -0.1256)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium02_TOD_Manager
		CrowdOff
	}
]
Default_cameras_lose_2p = [
	{
		ControlScript = CameraCuts_TwoCam
		Params = {
			Name = LOSE
			Cam1 = {
				LockTo = World
				Pos = (-1.7738701, 2.2631419, 2.070564)
				Quat = (0.19757299, 0.477018, -0.111905)
				FOV = 72.0
			}
			Cam2 = {
				LockTo = World
				Pos = (-4.2446136, 4.020077, 0.17742501)
				Quat = (0.214849, 0.45659703, -0.11555701)
				FOV = 72.0
			}
		}
		DOF = $DOF_Medium01_TOD_Manager
	}
]
Default_cameras_boss_battle_2p = [
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = PLAYER_CloseUp01
			Type = PLAYER_CloseUp
			LockTo = GUITARIST
			Pos = (0.61056405, 1.2063072, 0.73351)
			Quat = (-0.011779, -0.937494, -0.029049)
			FOV = 72.0
			LookAt = GUITARIST
			LookAtBone = BONE_HEAD
			ScreenOffset = (0.19106, -0.425305)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
	{
		ControlScript = CameraCuts_HandCam
		Params = {
			Name = BOSS_CloseUp01
			Type = BOSS_CloseUp
			LockTo = BASSIST
			Pos = (-0.145081, 1.3932941, 1.119517)
			Quat = (-0.0023100001, 0.9869389, 0.020386)
			FOV = 72.0
			LookAt = BASSIST
			LookAtBone = BONE_HEAD
			ScreenOffset = (-0.36468503, -0.38086903)
		}
		DOF = $DOF_CloseUp01_TOD_Manager
		CrowdOff
	}
]