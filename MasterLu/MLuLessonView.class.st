"
An MLuLessonView display a Lesson instance in a Playground
"
Class {
	#name : 'MLuLessonView',
	#superclass : 'StPlaygroundPresenter',
	#category : 'MasterLu',
	#package : 'MasterLu'
}

{ #category : 'accessing' }
MLuLessonView class >> defaultTitle [

	^ 'Master Lu'
]

{ #category : 'gui' }
MLuLessonView >> showLesson: aLesson withTitle: aString [
	"self window setLabel: aString."

	self firstPage contents: aLesson lesson.
	self open
	"self isOpenInWindow ifFalse: [ self open ]"
]
