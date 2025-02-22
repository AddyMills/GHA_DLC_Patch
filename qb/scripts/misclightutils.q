curReviewLighting = 0

script CycleReviewLighting 
	Change curReviewLighting = ($curReviewLighting + 1)
	if ($curReviewLighting = 7)
		Change \{curReviewLighting = 0}
	endif
	GetPakManCurrentName \{map = Zones}
	FormatText ChecksumName = lightPrefix '%p_GFX_L' P = <pakname>
	CallScriptOnNode prefix = <lightPrefix> callBack_Script = CB_CycleReviewLighting Params = {}
endscript

script CB_CycleReviewLighting 
	GetLightColor Name = <NodeName>
	big = <R>
	if (<big> < <G>)
		big = <G>
	endif
	if (<big> < <B>)
		big = <B>
	endif
	switch $curReviewLighting
		case 0
		SetLightColor Name = <NodeName> R = <big> G = <big> B = <big>
		case 1
		SetLightColor Name = <NodeName> R = <big> G = (<big> / 6.0) B = (<big> / 6.0)
		case 2
		SetLightColor Name = <NodeName> R = (<big> / 6.0) G = <big> B = (<big> / 6.0)
		case 3
		SetLightColor Name = <NodeName> R = (<big> / 6.0) G = (<big> / 6.0) B = <big>
		case 4
		SetLightColor Name = <NodeName> R = (<big> / 6.0) G = <big> B = <big>
		case 5
		SetLightColor Name = <NodeName> R = <big> G = (<big> / 6.0) B = <big>
		case 6
		SetLightColor Name = <NodeName> R = <big> G = <big> B = (<big> / 6.0)
	endswitch
endscript

script SafeCreate 
	if IsInNodeArray <NodeName>
		if NOT IsCreated <NodeName>
			Create Name = <NodeName>
		endif
	endif
endscript

script SafeKill 
	if IsCreated <NodeName>
		Kill Name = <NodeName>
	endif
endscript

script ScreenFlash \{Time = 1}
	KillSpawnedScript \{Id = ScreenFlash}
	SpawnScriptLater ScreenFlashOn Id = ScreenFlash Params = {Time = <Time>}
endscript

script ScreenFlashOn 
	if NOT ScreenFX_FXInstanceExists \{viewport = Bg_Viewport
			Name = FlashBS}
		ScreenFX_AddFXInstance {
			viewport = Bg_Viewport
			Name = FlashBS
			($ScreenFlash_TOD_Manager.screen_FX [0])
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = Bg_Viewport
			Name = FlashBS
			($ScreenFlash_TOD_Manager.screen_FX [0])
		}
	endif
	Wait (0.1 * <Time>) Seconds
	if ScreenFX_FXInstanceExists \{viewport = Bg_Viewport
			Name = FlashBS}
		ScreenFX_UpdateFXInstanceParams {
			viewport = Bg_Viewport
			Name = FlashBS
			Time = <Time>
			($ScreenFlash_TOD_Manager.screen_FX [0])
			Contrast = 1
			Brightness = 1
		}
	endif
	Wait <Time> Seconds
	SpawnScriptLater \{ScreenFlashOff
		Id = ScreenFlash}
endscript

script ScreenFlashOff 
	if ViewportExists \{Id = Bg_Viewport}
		if ScreenFX_FXInstanceExists \{viewport = Bg_Viewport
				Name = FlashBS}
			ScreenFX_RemoveFXInstance \{viewport = Bg_Viewport
				Name = FlashBS}
		endif
	endif
endscript

script ScreenToBlack \{Time = 0.4
		viewport = UI}
	KillSpawnedScript \{Id = ScreenToBlack}
	SpawnScriptLater Call_ScreenToBlack Id = ScreenToBlack Params = {<...>}
endscript

script Call_ScreenToBlack 
	Time = (0.5 * <Time>)
	SpawnScriptLater Do_ScreenToBlack Id = ScreenToBlack Params = {ON Time = <Time> <...>}
	Wait <Time> Seconds
	SpawnScriptLater Do_ScreenToBlack Id = ScreenToBlack Params = {OFF Time = <Time> <...>}
endscript

script Do_ScreenToBlack 
	if NOT (<viewport> = 0)
		if NOT ViewportExists Id = <viewport>
			return
		endif
	endif
	if GotParam \{ON}
		if NOT ScreenFX_FXInstanceExists viewport = <viewport> Name = blackFX
			ScreenFX_AddFXInstance {
				viewport = <viewport>
				Name = blackFX
				($ScreenToBlack_TOD_Manager.screen_FX [0])
			}
		endif
		ScreenFX_UpdateFXInstanceParams {
			viewport = <viewport>
			Name = blackFX
			Time = <Time>
			($ScreenToBlack_TOD_Manager.screen_FX [0])
			Inner_Radius = 0
			Outer_Radius = 0
			Alpha = 1
		}
	else
		if ScreenFX_FXInstanceExists viewport = <viewport> Name = blackFX
			ScreenFX_UpdateFXInstanceParams {
				viewport = <viewport>
				Name = blackFX
				Time = <Time>
				($ScreenToBlack_TOD_Manager.screen_FX [0])
				Inner_Radius = 1
				Outer_Radius = 1.5
				Alpha = 0
			}
			if GotParam \{OFF}
				Wait <Time> Seconds
				ScreenFX_RemoveFXInstance viewport = <viewport> Name = blackFX
			endif
		endif
	endif
endscript

script Reset_Transition_FXandLighting 
	GetPakManCurrent \{map = Zones}
	switch <pak>
		case Z_HOF
		popworldlights
		DisableLightGroup \{Name = defaultgroup}
		Kill \{prefix = Z_HOF_GFX_FX_BlueSmoke}
		Kill \{prefix = Z_HOF_GFX_FX_GreenSmoke}
		Kill \{prefix = Z_HOF_GFX_FX_YellowSmoke}
		Kill \{Name = Z_HOF_GFX_FX_Snow}
		Kill \{Name = Z_HOF_GFX_FX_DrummerGlow_01}
		Kill \{Name = Z_HOF_GFX_FX_DrummerSmoke_02}
		DestroyParticlesByGroupID \{groupID = PyroFountains
			IfEmpty = 0}
		DestroyParticlesByGroupID \{groupID = FireworksAmbient
			IfEmpty = 0}
		DestroyParticlesByGroupID \{groupID = FireworksLaunch
			IfEmpty = 0}
		DestroyParticlesByGroupID \{groupID = FireworksLaunchSmoke
			IfEmpty = 0}
		DestroyParticlesByGroupID \{groupID = FireworksLaunch03
			IfEmpty = 0}
		DestroyParticlesByGroupID \{groupID = FireworksLaunchSmoke03
			IfEmpty = 0}
		DestroyParticlesByGroupID \{groupID = FireworksLaunchSmoke04
			IfEmpty = 0}
		DestroyParticlesByGroupID \{groupID = FireworksLaunchSmoke04
			IfEmpty = 0}
		SetDynamicShadowIntensity \{I = 0.35000002}
		case Z_Fenway
		popworldlights
		DisableLightGroup \{Name = defaultgroup}
		Kill \{prefix = z_fenway_GFX_FX_BandTrans}
		SetShadowDirFromLight \{Name = Z_Fenway_GFX_L_Band_Center_Direct01}
		case Z_MaxsKC
		popworldlights
		DisableLightGroup \{Name = defaultgroup}
		Kill \{prefix = Z_MaxsKC_GFX_FX_BandTrans_Smoke}
		case Z_JPPlay
		popworldlights
		DisableLightGroup \{Name = defaultgroup}
		SetShadowDirFromLight \{Name = Z_JPPlay_GFX_L_Band_Center_Direct01}
		DestroyParticlesByGroupID \{groupID = AE_Pyro
			IfEmpty = 0}
		DestroyParticlesByGroupID \{groupID = PyroFountains
			IfEmpty = 0}
		case Z_Soundcheck
		popworldlights
		DisableLightGroup \{Name = defaultgroup}
		case Z_Nine_lives
		popworldlights
		DisableLightGroup \{Name = defaultgroup}
		SafeKill \{NodeName = Z_Nine_Lives_GFX_FX_BandTrasition_Smoke_01}
		SafeKill \{NodeName = Z_Nine_Lives_GFX_FX_BandTrasition_Glow_01}
		case Z_Nipmuc
		popworldlights
		DisableLightGroup \{Name = defaultgroup}
		SetShadowDir \{heading = 15
			Pitch = 45.0}
		Kill \{prefix = Z_Nipmuc_GFX_FX_Fog}
		Kill \{prefix = Z_Nipmuc_GFX_Party}
	endswitch
endscript
