Class {
	#name : 'WPCollection',
	#superclass : 'Object',
	#instVars : [
		'players'
	],
	#category : 'Waterpolo',
	#package : 'Waterpolo'
}

{ #category : 'instance creation' }
WPCollection class >> on: aPlayerCollection [

	^super new initializeFor: aPlayerCollection
]

{ #category : 'accessing' }
WPCollection >> dolfijn [

	^self class on: (players select: [: each | each homeClub = 'De Dolfijn'])
]

{ #category : 'accessing' }
WPCollection >> hetY [

	^self class on: (players select: [: each | each homeClub = 'Het Y'])
]

{ #category : 'initialization' }
WPCollection >> initializeFor: aPlayerCollection [

	players := aPlayerCollection
]

{ #category : 'accessing' }
WPCollection >> juniors [

	^self class on: (players select: [: each | each year >= 2007])
]

{ #category : 'actions' }
WPCollection >> writeMDFiles [

	players do: [ :player | (WPMDFIleWriter on: player) write ]
]
