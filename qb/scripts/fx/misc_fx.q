jowBlue = 717488127
jowGreen = 771697407
jowOrange = -6149377
jowRed = -15061505
jowYellow = -3267073

script JOW_Stars 
	Printf \{"*******************************************************************"}
	Printf <...>
	Printf \{"*******************************************************************"}
endscript

script SafeGetUniqueCompositeObjectID \{PreferredId = safeFXID01}
	if NOT GotParam \{ObjID}
		GetUniqueCompositeObjectID PreferredId = <PreferredId>
		return UniqueId = <UniqueId>
	endif
	I = 0
	FormatText TextName = Index '%i' I = <I>
	ExtendCRC <PreferredId> <Index> out = PreferredId
	begin
	MangleChecksums A = <PreferredId> B = <ObjID>
	if NOT ObjectExists Id = <mangled_ID>
		return UniqueId = <PreferredId>
	else
		I = (<I> + 1)
		FormatText TextName = Index '%i' I = <I>
		ExtendCRC <PreferredId> <Index> out = PreferredId
	endif
	repeat
endscript

script LoseFX_GuitarSmoke_01 
	Obj_GetID
	GetUniqueCompositeObjectID \{PreferredId = FX_LoseSmoke_01}
	CreateParticleSystem Name = <UniqueId> ObjID = <ObjID> Bone = BONE_GUITAR_BODY params_Script = $GP_FX_LoseSmoke_01
endscript

script LoseFX_GuitarSparks_01 
	Obj_GetID
	GetUniqueCompositeObjectID \{PreferredId = FX_LoseSparks_01}
	CreateParticleSystem Name = <UniqueId> ObjID = <ObjID> Bone = BONE_GUITAR_BODY params_Script = $GP_FX_LoseSparks_01
endscript

script SetLightIntensityOverTime \{I = 1.0
		Time = 2.0
		StepTime = 0.05}
	targetI = <I>
	GetLightIntensity Name = <Name>
	numSteps = (<Time> / <StepTime>)
	CastToInteger \{numSteps}
	stepSize = ((<targetI> - <I>) / <numSteps>)
	begin
	I = (<I> + <stepSize>)
	SetLightIntensity Name = <Name> Intensity = <I>
	Wait <StepTime> Seconds
	repeat (<numSteps> -1)
	SetLightIntensity Name = <Name> Intensity = <targetI>
endscript
