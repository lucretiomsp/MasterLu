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
	#classVars : [
		'MLuInstance'
	],
	#category : 'MasterLu',
	#package : 'MasterLu'
}

{ #category : 'as yet unclassified' }
SynthesisFundamentals class >> fiveTypeOfSynthesis [

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
**Generators** are sources of sound. They include `Oscillators`, `Noise` generators, and Samplers (such as `TpSampler`). In essence, they are components that produce audio signals.

	'.
	^ lessonText
]

{ #category : 'as yet unclassified' }
SynthesisFundamentals class >> lesson1 [

<script>
self new open.
]

{ #category : 'initialization' }
SynthesisFundamentals >> initialize [

	super initialize.
   self text: (Microdown asRichText: self class fiveTypeOfSynthesis)
]
