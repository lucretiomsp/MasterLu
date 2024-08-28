Class {
	#name : 'BaselineOfMasterLu',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMasterLu',
	#package : 'BaselineOfMasterLu'
}

{ #category : 'baselines' }
BaselineOfMasterLu >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			package: 'Coypu'
			with: [ spec repository: 'https://github.com/lucretiomsp/Coypu' ];
			package: 'Phausto'
			with: [ spec repository: 'https://github.com/lucretiomsp/phausto' ];
			package: 'CoypuIDE' with: [ spec requires: 'Toplo' . spec repository: 'https://github.com/pharo-graphics/CoypuIDE'] .


		"Internal dependencies"
		spec package: 'MasterLu' ]
]
