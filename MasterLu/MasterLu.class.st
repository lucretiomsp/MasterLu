"
MasterLu is your electronic music teacher in Pharo. MasterLu will teach you Phausto, to program you own DSP (Digital Signal Processors) and Coypu to program music on-the-fly with Pharo.
To start the Phausto tutrial evaluate:
MasterLu go. 
"
Class {
	#name : 'MasterLu',
	#superclass : 'ProfStef',
	#category : 'MasterLu',
	#package : 'MasterLu'
}

{ #category : 'class initialization' }
MasterLu class >> default [

	
	^ self new
]

{ #category : 'navigating' }
MasterLu >> go [
'executed' traceCr.
	^ self goOn: PhaustoTutorial
]

{ #category : 'accessing' }
MasterLu >> lessonView [

	^ lessonView ifNil: [ lessonView := MLuLessonView new ]
]
