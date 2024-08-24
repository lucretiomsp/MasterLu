"
MasterLu is your electronic music teacher in Pharo. MasterLu will teach you Phausto, to program you own DSP (Digital Signal Processors) and Coypu to program music on-the-fly with Pharo.
To start the Phausto tutrial evaluate:
MasterLu go. 
"
Class {
	#name : 'MasterLu',
	#superclass : 'ProfStef',
	#classVars : [
		'MLuInstance'
	],
	#category : 'MasterLu',
	#package : 'MasterLu'
}

{ #category : 'class initialization' }
MasterLu class >> default [

	
	^ MLuInstance ifNil: [ MLuInstance := self new ]
]

{ #category : 'navigating' }
MasterLu >> go [

	self lessonView isOpenInWindow: false. 
	^ self goOn: PhaustoTutorial
]

{ #category : 'accessing' }
MasterLu >> lessonView [

	^ lessonView ifNil: [ lessonView := MLuLessonView new ]
]
