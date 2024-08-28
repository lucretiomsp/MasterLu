"
The default MasterLu tutorial to learn about Phausto, audio synthesis, and Digital Signal Processing
"
Class {
	#name : 'PhaustoTutorial',
	#superclass : 'AbstractTutorial',
	#category : 'MasterLu',
	#package : 'MasterLu'
}

{ #category : 'lessons' }
PhaustoTutorial >> atTheControls [

	^ Lesson
		  title: 'At the Controls'
		  lesson:
			  '"We create a new Pulse Oscillator, a Square Oscillator with variable Duty Cycle"
	"Execute the following lines one at the time"
	sine := PulseOsc new.
	"We create a DSP from that Oscillator"
	dsp := sine asDsp.
	"We initialize the DSP"
	dsp init.
	"We start the DSP, now we can hear the SineWave Oscillator"
	dsp start.
	"We modify its Duty Cycle"
	dsp setValue: 0.2 parameter: ''PulseOscDuty''.
	"We modify its frequency"
	dsp setValue: 120 parameter: ''PulseOscFreq''.
	"Finally we can turn off the sound"
	dsp stop.
	
	"We can check the parameters of a UnitGenerator in its class comments, or with:"
	dsp traceAllParams.
	MasterLu next.
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> chuckInto [

	^ Lesson
		  title: 'chuckInto'
		  lesson:
			  '"We can connect Unit Generators with the ChucK operator =>"
			  "We kindly borrowed this operator from our friend audio programming language called ChucK"
			  "https://chuck.stanford.edu"
	"Execute the following lines one at the time"
	"how the Unit Generators connect depends on the receiver"
	synth := FrenchBell new => GreyHoleDW new .
	"We create a DSP from this synth"
	dsp := synth asDsp.
	"We initialize the DSP"
	dsp init.
	"We start the DSP, now we can hear the SineWave Oscillator"
	dsp start.
	"We display its UI"
	dsp displayUI.
	"Now press the DjembeTrigger button to trigger the sound"
	"Feel free to modify its parameters by turning the knobs"
	"Finally we can turn off the sound"
	dsp stop.
	"Close the UI by pressong the X on its top left corner"
	"We will see ho to connect different classes of Unit Generators in the folowing lessons"
	MasterLu next.
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> displayTheUI [

	^ Lesson
		  title: 'Display the UI'
		  lesson:
			  '"We display (and play) a Djembe from its UI, an instrument based on a physical model of the goblet drum originally from West Africa"
	"Execute the following lines one at the time"
	perc := Djembe new.
	"We create a DSP from the djembe"
	dsp := perc asDsp.
	"We initialize the DSP"
	dsp init.
	"We start the DSP"
	dsp start.
	"We display its UI"
	dsp displayUI.
	"Now press the DjembeTrigger button to trigger the sound"
	"Feel free to modify its parameters by turning the knobs"
	"Finally we can turn off the sound"
	dsp stop.
	"Close the UI by pressong the X on its top left corner"
	
	"Now You can try to start again from line 3 , substituting Djembe with Marimba, an idiophone with origins in the sub-Saharian Africa "
	
	MasterLu next.
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> helloPhausto [

	^ Lesson
	title: 'Hello Phausto'
	lesson: 
	'"We create a new SineWave Oscillator, by default iy has a frequency of 440 Hz - or A4"
	"Execute the following lines one at the time"
	sine := SineOsc new.
	"We create a DSP from that Oscillator"
	dsp := sine asDsp.
	"We initialize the DSP"
	dsp init.
	"We start the DSP, now we can hear the SineWave Oscillator"
	dsp start.
	"Finally we can turn off the sound"
	dsp stop.
	
	MasterLu next.
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> stereo [

	^ Lesson
		  title: 'Hello Stereo'
		  lesson:
			  '"We create a new Sawtooth oscillator, but with a stereo output"
	"Execute the following lines one at the time"
	saw := SawOsc new.
	"We create a stereo DSP from that Oscillator"
	dsp := saw stereo asDsp.
	"We initialize the DSP"
	dsp init.
	"We start the DSP, now we can hear the SineWave Oscillator"
	dsp start.
	"Finally we can turn off the sound"
	dsp stop.
	
	MasterLu next.
	'
]

{ #category : 'tutorial' }
PhaustoTutorial >> tutorial [

	^ #( #helloPhausto #stereo #atTheControls #displayTheUI #whatAreUGens
	      #chuckInto )
]

{ #category : 'lessons' }
PhaustoTutorial >> whatAreUGens [

	^ Lesson
		  title: 'Unit Generators 101'
		  lesson:
			  '"Unit Generators are the basic unit to create sounds in Phausto."
			  "One or more Unit Generator connected together can become a DSP, a Digital SIgnal Processor."
			  "A DSP is a program that computes sounds"
	"Execute the following lines one at the time"
	noise  := Noise new.
	"We create a DSP from that Oscillator"
	dsp := noise stereo asDsp.
	"We initialize the DSP"
	dsp init.
	"We start the DSP, now we can hear the noise"
	dsp start.
	"If We open its UI  we fill find a knob for the uLevel, that the volume of the UnitGenerators, in a linear fashion."
	"All Unit Generators in Phausto have at least the uLevel parameter controllable in real time."
	 "In audio, a linear increase in a parameter like volume often does not correspond to a linear increase in perceived loudness. Human perception of loudness is more    logarithmic. We will learn more about loudness in a future lesson"
	"Finally we can turn off the sound"
	dsp stop.
	
	"Unit Generators are the building blocks of synthesis; they are oscillators, noise generators, physical models, filters, envelopes, effects."
	"The concept of Unit Generator was first developed by Max Mathews at Bell Labs in 1950s"
	MasterLu next.
	'
]
