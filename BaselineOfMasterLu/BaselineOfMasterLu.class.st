Class {
	#name : 'BaselineOfMasterLu',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMasterLu',
	#package : 'BaselineOfMasterLu'
}

{ #category : 'baselines' }
BaselineOfMasterLu >> baseline: spec

	<baseline>
	spec for: #common do: [
		spec
			package: 'Coypu'
			with: [ spec repository: 'github://lucretiomsp/Coypu' ];
			package: 'Phausto'
			with: [ spec repository: 'github://lucretiomsp/phausto' ];
			package: 'CoypuIDE' with: [ spec repository: 'github://lucretiomsp/CoypuIDE'] .


		"Internal dependencies"
		spec package: 'MasterLu' ]
]
