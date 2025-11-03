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
            package: 'Phausto' with: [ 
                spec repository: 'github://lucretiomsp/phausto:main' 
            ];
            package: 'Coypu' with: [ 
                spec repository: 'github://lucretiomsp/coypu:master' 
            ];
           baseline: 'CoypuIDE';
	repository: 'github://pharo-graphics/CoypuIDE:master';
            package: 'MasterLu'
    ]


]
