Class {
	#name : 'WPMDFIleWriter',
	#superclass : 'Object',
	#instVars : [
		'player'
	],
	#category : 'Waterpolo',
	#package : 'Waterpolo'
}

{ #category : 'instance creation' }
WPMDFIleWriter class >> on: aPlayer [

	^self new initializeFor: aPlayer
]

{ #category : 'initialization' }
WPMDFIleWriter >> initializeFor: aPlayer [

	player := aPlayer
]

{ #category : 'accessing' }
WPMDFIleWriter >> path [


	^FileLocator home  / 'obsidian' / 'geo-vault' / 'Waterpolo' / '25-26' / 'jo18' / 'spelers'
]

{ #category : 'accessing' }
WPMDFIleWriter >> properties [

	^ #( 'knzbRelationId' 'name' 'prefix' 'surname' 'gender' 'dateOfBirth'
	     'year' 'team' 'phoneNumber' 'email' 'homeClub' )
]

{ #category : 'actions' }
WPMDFIleWriter >> write [

	self path / player fullName , 'md' writeStreamDo: [ :stream |
		self writeMDOn: stream ]
]

{ #category : 'actions' }
WPMDFIleWriter >> writeMDOn: ws [

	ws
		nextPutAll: '---';
		lf.

	self properties do: [ :property |
			ws
				nextPutAll: property;
				nextPut: $:;
				space.
			self writeProperty: property on: ws.
			ws lf ].


	ws nextPutAll: '---'
]

{ #category : 'actions' }
WPMDFIleWriter >> writeProperty: property on: ws [

	

	(player instVarNamed: property) isNil ifTrue: [ ^ self ].
	
	property = 'dateOfBirth' ifTrue: [
		^ ws nextPutAll: player dateOfBirthString ].

	property = 'year' ifTrue: [
		^ ws nextPutAll: (player instVarNamed: property) printString ].

	property = 'phoneNumber' ifTrue: [
			^ ws
				  nextPut: $";
				  nextPutAll: (player instVarNamed: property);
				  nextPut: $" ].

	ws nextPutAll: (player instVarNamed: property)
]
