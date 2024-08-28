"
An MLuLessonView display a Lesson instance in a Playground
"
Class {
	#name : 'MLuLessonView',
	#superclass : 'StPlaygroundPresenter',
	#instVars : [
		'isOpenInWindow'
	],
	#category : 'MasterLu',
	#package : 'MasterLu'
}

{ #category : 'accessing' }
MLuLessonView class >> defaultTitle [

	^ 'Master Lu'
]

{ #category : 'initialization' }
MLuLessonView >> initializeWindow: aWindowPresenter [

	aWindowPresenter initialExtent: 900 @ 800
]

{ #category : 'accessing' }
MLuLessonView >> isOpenInWindow [

	^ isOpenInWindow
]

{ #category : 'accessing' }
MLuLessonView >> isOpenInWindow: aBoolean [

	isOpenInWindow := aBoolean 
]

{ #category : 'gui' }
MLuLessonView >> showLesson: aLesson withTitle: aString [
	"self window setLabel: aString."

	self firstPage contents: aLesson lesson.
	self isOpenInWindow ifFalse: [ self open ].
	self window title: aString.
	self isOpenInWindow: true
]

{ #category : 'accessing' }
MLuLessonView >> withHeaderBar [

	^ true
]
