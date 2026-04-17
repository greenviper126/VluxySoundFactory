--!strict

------------------------------------------------------------------------------------------------------------------------
--SCHEMA----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

export type SoundSchema = {
	UnattachedSounds: Configuration,
	SoundGroupContainer: Configuration,
	SoundGroups: SoundGroups,
	PreloadIds: { string },

	SoundDefinitions: SoundDefinitions,
	DefinitionsGroupHash: Dictionary<Dictionary<string>>,
}

------------------------------------------------------------------------------------------------------------------------

export type SoundDefinitionInstanced = Sound & SoundChildrenInstanced

export type SoundChildrenInstanced = {
	ChorusSoundEffect: ChorusSoundEffect?,
	CompressorSoundEffect: CompressorSoundEffect?,
	DistortionSoundEffect: DistortionSoundEffect?,
	EchoSoundEffect: EchoSoundEffect?,
	EqualizerSoundEffect: EqualizerSoundEffect?,
	FlangeSoundEffect: FlangeSoundEffect?,
	PitchShiftSoundEffect: PitchShiftSoundEffect?,
	ReverbSoundEffect: ReverbSoundEffect?,
	TremoloSoundEffect: TremoloSoundEffect?,
}

------------------------------------------------------------------------------------------------------------------------

export type SoundGroups = Dictionary<SoundGroup>

------------------------------------------------------------------------------------------------------------------------

export type SoundDefinitions = Dictionary<SoundDefinition>

export type SoundDefinition = {
	Properties: SoundSerialized,
	Effects: SoundChildrenSerialized,
}

------------------------------------------------------------------------------------------------------------------------

export type SoundChildrenSerialized = {
	ChorusSoundEffect: ChorusSoundEffectSerialized?,
	CompressorSoundEffect: CompressorSoundEffectSerialized?,
	DistortionSoundEffect: DistortionSoundEffectSerialized?,
	EchoSoundEffect: EchoSoundEffectSerialized?,
	EqualizerSoundEffect: EqualizerSoundEffectSerialized?,
	FlangeSoundEffect: FlangeSoundEffectSerialized?,
	PitchShiftSoundEffect: PitchShiftSoundEffectSerialized?,
	ReverbSoundEffect: ReverbSoundEffectSerialized?,
	TremoloSoundEffect: TremoloSoundEffectSerialized?,
}

------------------------------------------------------------------------------------------------------------------------

export type SoundSerialized = BaseInstance & SoundProperties

export type ChorusSoundEffectSerialized = BaseEffect & ChorusSoundEffectProperties

export type CompressorSoundEffectSerialized = BaseEffect & CompressorSoundEffectProperties

export type DistortionSoundEffectSerialized = BaseEffect & DistortionSoundEffectProperties

export type EchoSoundEffectSerialized = BaseEffect & EchoSoundEffectProperties

export type EqualizerSoundEffectSerialized = BaseEffect & EqualizerSoundEffectProperties

export type FlangeSoundEffectSerialized = BaseEffect & FlangeSoundEffectProperties

export type PitchShiftSoundEffectSerialized = BaseEffect & PitchShiftSoundEffectProperties

export type ReverbSoundEffectSerialized = BaseEffect & ReverbSoundEffectProperties

export type TremoloSoundEffectSerialized = BaseEffect & TremoloSoundEffectProperties

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

type Dictionary<T> = { [string]: T }

type BaseInstance = ObjectProperties & InstanceProperties

type BaseEffect = BaseInstance & SoundEffectProperties

------------------------------------------------------------------------------------------------------------------------

type SoundProperties = {
	AcousticSimulationEnabled: boolean,
	AudioContent: string,
	EmitterSize: number,
	IsLoaded: boolean,
	IsPaused: boolean,
	IsPlaying: boolean,
	isPlaying: boolean,
	Looped: boolean,
	LoopRegion: NumberRange,
	MaxDistance: number,
	MinDistance: number,
	Pitch: number,
	PlaybackLoudness: number,
	PlaybackRegion: NumberRange,
	PlaybackRegionsEnabled: boolean,
	PlaybackSpeed: number,
	Playing: boolean,
	PlayOnRemove: boolean,
	RollOffMaxDistance: number,
	RollOffMinDistance: number,
	RollOffMode: Enum.RollOffMode,
	SoundGroup: string,
	SoundId: string,
	TimeLength: number,
	TimePosition: number,
	Volume: number,
}

------------------------------------------------------------------------------------------------------------------------

type ChorusSoundEffectProperties = {
	Depth: number,
	Mix: number,
	Rate: number,
	Priority: number,
}

type CompressorSoundEffectProperties = {
	Attack: number,
	GainMakeup: number,
	Ratio: number,
	Release: number,
	Threshold: number,
	Priority: number,
}

type DistortionSoundEffectProperties = {
	Level: number,
	Priority: number,
}

type EchoSoundEffectProperties = {
	Delay: number,
	Feedback: number,
	WetLevel: number,
	DryLevel: number,
	Priority: number,
}

type EqualizerSoundEffectProperties = {
	HighGain: number,
	LowGain: number,
	MidGain: number,
	Priority: number,
}

type FlangeSoundEffectProperties = {
	Depth: number,
	Mix: number,
	Rate: number,
	Priority: number,
}

type PitchShiftSoundEffectProperties = {
	Octave: number,
	Priority: number,
}

type ReverbSoundEffectProperties = {
	DecayTime: number,
	Density: number,
	Diffusion: number,
	DryLevel: number,
	WetLevel: number,
	Priority: number,
}

type TremoloSoundEffectProperties = {
	Depth: number,
	Duty: number,
	Frequency: number,
	Priority: number,
}

------------------------------------------------------------------------------------------------------------------------

type SoundEffectProperties = {
	Enabled: boolean,
	Priority: number,
}

type InstanceProperties = {
	Archivable: boolean,
	archivable: boolean,
	Capabilities: SecurityCapabilities,
	Name: string,
	Parent: Instance,
	PredictionMode: Enum.PredictionMode,
	RobloxLocked: boolean,
	Sandboxed: boolean,
}

type ObjectProperties = {
	ClassName: string,
}

------------------------------------------------------------------------------------------------------------------------

return nil
