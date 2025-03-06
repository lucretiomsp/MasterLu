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
PhaustoTutorial >> additiveSynthesis [

	^ Lesson
		  title: 'Additive Synthesis basics'
		  lesson:
			  '
"Additive synthesis creates complex sounds by combining multiple simple waveforms—typically sine waves—each with its own frequency, amplitude, and phase. It is fundamentally based on Fourier''s theorem"

"We can stack a set of SineOsc leveraging Pharo basic syntax for Intervals and Phausto sum (+) operator for summing signals"

"first we create the first Sine sScillator"
sine1 := SineOsc new freq: 200; uLevel: 0.5.

"we combine it in parallel with other 9, detuned by 2Hz and with the same amplitude (uLevel)"
detuning := 90.
( 1 to: 9) do: [ :i | sine1  := sine1 + (SineOsc new freq: 200 + (i * detuning); uLevel: 0.05) ].
"sine1 has become the sum  of 10 detuned Sine Oscillators"
"we create a stereo ds with them".
dsp := sine1 stereo asDsp.
"we initialize the dsp".
dsp init.
"we start it."
dsp start.
"we stop it"
dsp stop.

"Now try to change the detune value or the amplitudes or to not define the frequency value and change it in the UI"

MasterLu next

	'
]

{ #category : 'lessons' }
PhaustoTutorial >> additiveSynthesis2 [

	^ Lesson
		  title: 'TpSampler basics'
		  lesson: '	
"TpSampler is a quick-and-dirty multisampler created as part of TurboPhausto. When we create a new instance of TpSampler, we need to provide a path to a folder containing only .wav or .aiff samples. If you drag and drop a folder into the playground, Phausto will automatically generate the path as a string for you."
sp := TpSampler new pathToFolder: ''/Users/domenicocipriani/MyStuff/samples/SP1200 From Mars/WAV/Drums/Sp1200-Kits/Factory Kit 1''.
"we create a stereo dsp from the sampler"
dsp := sp stereo asDsp.
"we initialize it".
dsp init.
"we start it".
dsp start.
"we can play it from its UI".
dsp displayUI.

"Click the gate button to hear a sample. Change the SamplerIndex to hear a different sound, and adjust the SamplerNote to change its pitch.
You may notice that if SamplerIndex is greater than 10, no sound is played. This is because the folder contains only 10 samples."

"Alternatively, we can close the UI and play the TpSampler algorithmically."
[128 timesRepeat: [ dsp trig: ''TpSamplerGate'' . dsp setValue: (Random new nextIntegerBetween: 1  and: 10 ) parameter: ''TpSamplerIndex'' . (Random new nextIntegerBetween: 80 and: 310 ) milliSeconds wait ]] fork.

"Or we can play a random melody using the same sample:"
dsp setValue: 8 parameter: ''TpSamplerIndex'' .
[128 timesRepeat: [ dsp playNote: (Random new nextIntegerBetween: 35  and: 78 ) prefix: ''TpSampler''  dur: 0.1 . 110 milliSeconds wait ]] fork.


MasterLu next

	
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> atTheControls [

	^ Lesson
		  title: 'At the Controls'
		  lesson:
			  '"We create a new Pulse Oscillator, a Square Oscillator with variable Duty Cycle"
	"Execute the following lines one at the time"
	pulse := PulseOsc new.
	"We create a DSP from that Oscillator"
	dsp := pulse asDsp.
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
"How the Unit Generators connect depends on the receiver - here we connect an ElectricGuitar into a reverberator effects"
	synth := ElecGuitar new => GreyHole  new.
	"We create a DSP from this synth"
	dsp := synth asDsp.
	"We initialize the DSP"
	dsp init.
	dsp start.
	"We display its UI"
	dsp displayUI.
	"Now press the ElecGuitarTrigger button to trigger the sound"
	"Feel free to modify the reverb parameters by turning the knobs"
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
PhaustoTutorial >> ourFirstSynth [

	^ Lesson
		  title: 'Our First Synthesiser'
		  lesson:
'"lets create our first subtractive synthesiser"

"first we need at least one oscillator"
oscillator := PulseOsc new.
"then we need an envelope, in this case a linear Attack-Decay-Sustain-Release envelope"
envelope := ADSREnv new.
"also we create a filter, in this case a Moog Vcf lowpass filter"
filter := MoogVcf new.

"to construct our synthesyser we chuck the Oscillator into the Envelope (hence the Oscillator is multiplied by the evelope - and we chuck this composite Unit Generator into the filter, this means that the composite Unit Generator is the input of the filter".

synth := oscillator => envelope => filter.
"binary operators have left-to-right precedence in Pharo, so we just place the Unit Generators in chain"

"now we create a steereo DSP"
dsp := synth stereo asDsp.
"we initialize the DSP"
dsp init.
"we start it"
dsp start.

"to hear the sound we need to trigger the envelope, so we must open the UI and press the button"
dsp displayUI .

"now have fun tweaking the sliders, try to understand what happens to the sound".

"and then we stop the DSP before jumping to the next lesson"
dsp stop.
MasterLu next.'
]

{ #category : 'lessons' }
PhaustoTutorial >> playNotes101 [

	^ Lesson
		  title: 'PlayNotes 101'
		  lesson:
			  '"What if we want to play a melody with this guitar ?"
"Using a symbol as the argument of a UnitGenerator setter we change its label"
	synth := ElecGuitar new freq: #ElecGuitarNote; trigger: #ElecGuitarGate.
	"We create a DSP from this synth"
	dsp := synth asDsp.
	"We initialize the DSP"
	dsp init.
	dsp start.
	
	"We create a Pharo block with the instruction to play a Random MIDI note between 28 and 76 every 125 milliseconds"
	"We had to change the ElecGuitar freq and gate labels to use Phausto playNote:prefix:dur: method"
	"This methid is taking care of converting the MIDI note number to a frequency"
	pattern := [ dsp playNote: (Random new nextIntegerBetween: 28 and: 76 ) prefix: ''ElecGuitar''  dur: 0.11. (Delay   forMilliseconds: 125)  wait ].
   "We repeat the pattern 64 times"
   [128 timesRepeat: pattern] fork.
	dsp stop.
	
	MasterLu next.
	
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
	     #chuckInto #playNotes101 #ourFirstSynth #additiveSynthesis
	     #additiveSynthesis2 #tpSamplerBasics)
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
