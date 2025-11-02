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

	^ Lesson title: 'Additive Synthesis basics' lesson: '
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

MasterLu next.
MasterLu previous.

	'
]

{ #category : 'lessons' }
PhaustoTutorial >> additiveSynthesis2 [

	^ Lesson title: 'Additive Synthesis with an Array of Unit Generators' lesson: '
"Additive synthesis creates complex sounds by combining multiple simple waveforms—typically sine waves—each with its own frequency, amplitude, and phase. It is fundamentally based on Fourier''s theorem"
			  
detuning := 14.
groupOfSine :=( 1 to: 10) collect: [ :i | (SineOsc new freq: 200 + (i * detuning); uLevel: 0.05) ].

"We can stack a set of SineOsc leveraging Pharo basic syntax for Intervals and Phausto sum (+) operator for summing signals"
"we send the message asSumOfUgen to the array to sum all the UGen in the array".



"we create a stereo dsp with the froyp  of Sine OScillators".

dsp := groupOfSine asSumOfUGen stereo asDsp.
"we initialize the dsp".
dsp init.
"we start it."
dsp start.
"we stop it"
dsp stop.

"Now try to change the detune value or the amplitudes or to not define the frequency value and change it in the UI"

MasterLu next.
MasterLu previous.

	
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> atTheControls [

	^ Lesson title: 'At the Controls' lesson: '"We create a new Pulse Oscillator, a Square Oscillator with variable Duty Cycle"
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
	MasterLu previous.
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> basicWaveforms [

	^ Lesson title: 'Basic waveforms' lesson: '	
"Listen the difference between the basic waveforms"

"Create the 4 oscillators"
sine := SineOsc new.
tri := TriOsc new.
sqr := SquareOsc new.
saw := SawOsc new.

"Create a NumericalEntry UIPatameter to switch between waveforms. Only UI Parameters can ve changed in real time!"
index := PhNumEntry new label: ''Wave'' init: 0 min: 0 max: 3 step: 1.
"Combine the 4 oscillators in parallel using the comma (,) operator."
oscillators := sine , tri , sqr , saw.

"Create a selector by combining the NumEntry UI parameter with the oscillators and connecting them to the selector."
"This connection closely resembles Faust core syntax. You can use it for low-level connections, but we always recommend using Phausto''s simpler API when possible."
selector :=  index , oscillators connectTo: PhSelect4 new. 


"Create the DSP, initialize it, start it, and display the UI."
dsp := selector stereo asDsp.
dsp init.
dsp start.
dsp displayUI.

"Stop and destroy the DSP to move to the next lesson."
dsp stop. 
dsp destroy


MasterLu next.
MasterLu previous.

	
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> chuckInto [

	^ Lesson title: 'chuckInto' lesson: '"We can connect Unit Generators with the ChucK operator =>"
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
	MasterLu previous.
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
	MasterLu previous.
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> essentialFMSynthesis [

	^ Lesson title: '2-OPerators FM Synthesis' lesson: '"2 operators FM Synthesis with Dx7 operators"
"There are many ways to achieve Frequency Modulation (FM) synthesis in Phausto; one is to use the built-in Dx7 operators."
"First we define a knob to set frequency"
frequencyKnob := PhHSlider new label: ''Freq'' values: #(100 20 4000 0.1).
"Then we set a knob to set frequency of bothe the operators"
ratioKnob := PhHSlider new label: ''Ratio'' values: #(1 0.1 32 0.1).
"We create a modulator using a  SineOSc"
modulator := SineOsc new freq: frequencyKnob * ratio.
"We create a carrier: a Dx7 Operator whose phaseMod is the SineOsc modulator."
carrier := Dx7Op new phaseMod: modulator; freq: frequencyKnob .

"We create the dsp, we initialize it and we start it/"
dsp := carrier stereo asDsp.
dsp init.
dsp start.
"We display the UI and we play with the synth"
dsp displayUI .

"We stop it and destroy itwhen we are done"
dsp stop.
dsp destroy
	MasterLu next.
	MasterLu previous.
	
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
PhaustoTutorial >> modalSynthesis [

	^ Lesson title: 'Modal Syntheis basics' lesson: '
"Modal synthesis is a type of additive synthesis that models sound by simulating the natural resonant modes of physical objects. In essence, it breaks down a sound into a series of resonant frequencies, each with its own amplitude and decay characteristics. This approach is particularly effective for recreating sounds of percussive and resonant objects like bells, drums, and strings."
	  
"first we define trig, that will excite our modes"	
trig := (Pulse new period: 0.18) => Impulsify new.
"we define the modes frequencies in Hertz"
freqs := #(230 600 700 920).
"we define the modes amplitudes"
gains := #(0.5 0.4 0.2 0.5).
"we define the deacy rates, a.k.a t60s"
t60s := #(0.2 0.5 0.3 0.6).
"we create an array of Mode Filters"
modes := (1 to: 4) collect: [ :i |  ModeFilter new freq: (freqs at: i) ; gain: (gains at: i) ; t60: (t60s at: i); input: trig].

"we deifine our synth as a sum of UnitGenerator"
synth := modes asSumOfUGen.

"we create the stero dsp, we initialize and start it"
dsp := synth asDsp.
dsp init.
dsp start.
"we interact with its UI"
dsp displayUI.
"we stop it whn we are done"
dsp stop.


MasterLu next.
MasterLu previous.

	
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> ourFirstSynth [

	^ Lesson title: 'Our First Synthesiser' lesson: '"lets create our first subtractive synthesiser"

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
MasterLu next.
MasterLu previous.'
]

{ #category : 'lessons' }
PhaustoTutorial >> pitchEnvelope [

	^ Lesson title: 'Pitch Envelope' lesson: '	
"Let see hw we can use an ADSR Envelope to modulate a steady Triangular waveform"
"The ADSR signal is multiplied by a constant value to scale the pitch modulation."
pitchEnv := 200 asBox * ADSREnv new.

"This Pitch Envelope is added to a starting frequency (an offset)."
osc := TriOsc new freq: (100 asBox + pitchEnv ).

"We crate a stero dsp, we initialize it, we start it."
dsp := osc stereo asDsp.
dsp init. 
dsp start.

"We can interact with the DSP from its UI. Press the trigger to hear the effects of the Pitch Envelope."
dsp displayUI.
"And we  stop it after."
dsp stop.


MasterLu next.
MasterLu previous.
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> playNotes101 [

	^ Lesson title: 'PlayNotes 101' lesson: '"What if we want to play a melody with this guitar ?"
"Using a symbol as the argument of a UnitGenerator setter we change its label"
	synth := ElecGuitar new freq: #ElecGuitarNote; trigger: #ElecGuitarGate.
	"We create a DSP from this synth"
	dsp := synth asDsp.
	"We initialize the DSP"
	dsp init.
	dsp start.
	
	"We create a Pharo block with the instruction to play a Random MIDI note between 28 and 76 every 125 milliseconds"
	"We had to change the ElecGuitar freq and gate labels to use Phausto playNote:prefix:dur: method"
	"This method is taking care of converting the MIDI note number to a frequency"
	pattern := [ dsp playNote: (Random new nextIntegerBetween: 28 and: 76 ) prefix: ''ElecGuitar''  dur: 0.11. (Delay   forMilliseconds: 125)  wait ].
   "We repeat the pattern 64 times"
   [128 timesRepeat: pattern] fork.
	dsp stop.

	MasterLu next.
	MasterLu previous.
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> stereo [

	^ Lesson title: 'Hello Stereo' lesson: '"We create a new Sawtooth oscillator, but with a stereo output"
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
	MasterLu previous.
	'
]

{ #category : 'lessons' }
PhaustoTutorial >> tpSamplerBasics [

	^ Lesson title: 'TpSampler basics' lesson: '	
"TpSampler is a quick-and-dirty multisampler created as part of TurboPhausto. When we create a new instance of TpSampler, we need to provide a path to a folder containing only .wav or .aiff samples. If you drag and drop a folder into the playground, Phausto will automatically generate the path as a string for you."
"To follow this example please download the MoofLodSamples folder in the Phausto GitHb repository and place it into your Documents folder."
sp := TpSampler new pathToFolder: ''/Users/domenicocipriani/Documents/MoofLodSamples''.
"we create a stereo dsp from the sampler"
dsp := sp stereo asDsp.
"we initialize it".
dsp init.
"we start it".
dsp start.
"we can play it from its UI".
dsp displayUI.


"Alternatively, we can close the UI and play the TpSampler algorithmically."
[128 timesRepeat: [ dsp trig: ''TpSamplerGate'' . dsp setValue: (Random new nextIntegerBetween: 1  and: 10 ) parameter: ''TpSamplerIndex'' . (Random new nextIntegerBetween: 80 and: 310 ) milliSeconds wait ]] fork.

"Or we can play a random melody using the same sample:"
dsp setValue: 8 parameter: ''TpSamplerIndex'' .
[128 timesRepeat: [ dsp playNote: (Random new nextIntegerBetween: 35  and: 78 ) prefix: ''TpSampler''  dur: 0.1 . 110 milliSeconds wait ]] fork.

"stop and destroy the dsp"
dsp stop.
dsp destroy .



MasterLu next.
MasterLu previous.

	
	'
]

{ #category : 'tutorial' }
PhaustoTutorial >> tutorial [

	^ #( #helloPhausto #stereo #atTheControls #displayTheUI #whatAreUGens
	     #chuckInto #playNotes101 #ourFirstSynth #additiveSynthesis
	     #additiveSynthesis2 #modalSynthesis #tpSamplerBasics #basicWaveforms
	     #pitchEnvelope #essentialFMSynthesis )
]

{ #category : 'lessons' }
PhaustoTutorial >> whatAreUGens [

	^ Lesson title: 'Unit Generators 101' lesson: '"Unit Generators are the basic unit to create sounds in Phausto."
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
	MasterLu previous.
	'
]
