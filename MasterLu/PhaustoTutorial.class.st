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
		  title: 'Hello Phausto'
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
	dsp setValue: 0.2 parameter: ''PulseOscFreq''.
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
^ #(
helloPhausto 
atTheControls 
)

]
