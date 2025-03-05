"
I am a **MicroDown Text Presenter** (`MicTextPresenter`) that displays useful lessons about **Sound Synthesis**.
These lessons serve as a compendium for `MasterLu` and to learn using **Phausto**, while also offering insights into sound synthesis in general.

The main inspiration for these leasons is the super cool [YouTube channel](https://www.youtube.com/playlist?list=PL7w4cOVVxL6HWGokiABmiZnssYQjo_UFd) by Professor [Simon Hutchinson](https://simonhutchinson.com/) 

To explore the lessons, just open a Playground and evaluate
```language=Pharo
SynthesisFundamentals new open.
```

Alternatiely, you can click on one of the executable examples available on the class side.
"
Class {
	#name : 'SynthesisFundamentals',
	#superclass : 'MicTextPresenter',
	#instVars : [
		'content'
	],
	#classVars : [
		'MLuInstance'
	],
	#category : 'MasterLu',
	#package : 'MasterLu'
}

{ #category : 'accessing - text' }
SynthesisFundamentals class >> fiveTypeOfSynthesis [

	| lessonText |
	lessonText := '
# Five Types of Synthesis 

There are tons of synthesizers and software out there, but a really helpful way to approach them is by thinking about categories of modules.
We can break down any synthesizer into these 5 Synthesis Modules:
- **Generators**
- **Combiners**
- **Modifiers**
- **Time-Variant Controllers (TVCs)**
- **Storers (Storage)**

## Generators
**Generators** are sources of sound. They include `Oscillators`, `PhysicalModels` , `Noise` generators, and Samplers (such as `TpSampler`). In essence, they are components that produce audio signals.

## Combiners
**Combiners** are synthesis modules that combine audio from two ore more sources. _Mixers_ and _Crossfaders_ are example of **Combiners**. Most synthesizers use multiple *Generators** which  are then combined together to form the output.

## Modifiers
`Saturators` , _Filters_ (all the subclasses of `PhFilter`) , _Effects_ (such as `FlangerMono`, `CryBaby` or `AutoWah`) are all  **Modifiers**. These synthesis modules change the sound material sent into them.

## Time-Variant Controllers (TVCs)
These are synthesis s that generates a **control signal**. These are modules such as _Envelope Generators_(like `ADSREnv` or `AREnv`) _Low Frequency Oscillators_(`LFOForModulation`). They generate control signals that vary over time that can modulate parameters and reproduce _vibrato_ (a modulation of the pitch), _tremolo_(a modulation of the amplitude) or _timbre modulation_(which alter harmonic or spectral content).

## Storers (Storage)
A synthesis module that holds data (such as _wavetables_ , _soundfiles_ and so on)

	'.
	^ lessonText
]

{ #category : 'accessing - text' }
SynthesisFundamentals class >> fiveTypeOfSynthesisModules [

	| lessonText |
	lessonText := '
# Five Types of Synthesis Modules

There are tons of synthesizers and software out there, but a really helpful way to approach them is by thinking about categories of modules.
We can break down any synthesizer into these 5 Synthesis Modules:
- **Generators**
- **Combiners**
- **Modifiers**
- **Time-Variant Controllers (TVCs)**
- **Storers (Storage)**

## Generators
**Generators** are sources of sound. They include `Oscillators`, `PhysicalModels` , `Noise` generators, and Samplers (such as `TpSampler`). In essence, they are components that produce audio signals.

## Combiners
**Combiners** are synthesis modules that combine audio from two ore more sources. _Mixers_ and _Crossfaders_ are example of **Combiners**. Most synthesizers use multiple *Generators** which  are then combined together to form the output.

## Modifiers
`Saturators` , _Filters_ (all the subclasses of `PhFilter`) , _Effects_ (such as `FlangerMono`, `CryBaby` or `AutoWah`) are all  **Modifiers**. These synthesis modules change the sound material sent into them.

## Time-Variant Controllers (TVCs)
These are synthesis s that generates a **control signal**. These are modules such as _Envelope Generators_(like `ADSREnv` or `AREnv`) _Low Frequency Oscillators_(`LFOForModulation`). They generate control signals that vary over time that can modulate parameters and reproduce _vibrato_ (a modulation of the pitch), _tremolo_(a modulation of the amplitude) or _timbre modulation_(which alter harmonic or spectral content).

## Storers (Storage)
A synthesis module that holds data (such as _wavetables_ , _soundfiles_ and so on)

	'.
	^ lessonText
]

{ #category : 'example' }
SynthesisFundamentals class >> lesson1 [

<script>
self new open.
]

{ #category : 'example' }
SynthesisFundamentals class >> lesson2 [

<script>
self new content: self fiveTypeOfSynthesis; open.
]

{ #category : 'accessing' }
SynthesisFundamentals >> content [ 

^ content
]

{ #category : 'accessing' }
SynthesisFundamentals >> content: aString [

content := (Microdown asRichText: aString )
]

{ #category : 'initialization' }
SynthesisFundamentals >> initialize [

	super initialize.
   self text: (Microdown asRichText: self class fiveTypeOfSynthesis)
]
