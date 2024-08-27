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
PhaustoTutorial >> displayTheUI [

	^ Lesson
		  title: 'Display the UI'
		  lesson:
			  '"We display (and play) a Djembe from its UI, an instrument based on a physical model of the goblet drum originally from West Africa"
	"Execute the following lines one at the time"
	djembe := Djembe new.
	"We create a DSP from the djembe"
	dsp := sine asDsp.
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

{ #category : 'tutorial' }
PhaustoTutorial >> tutorial [

	^ #( #helloPhausto #atTheControls #displayUI )
]
