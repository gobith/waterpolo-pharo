Class {
	#name : 'WPPlayerTeam',
	#superclass : 'Object',
	#instVars : [
		'knzbRelationId',
		'team'
	],
	#category : 'Waterpolo',
	#package : 'Waterpolo'
}

{ #category : 'accessing' }
WPPlayerTeam >> knzbRelationId [

	^ knzbRelationId
]

{ #category : 'accessing' }
WPPlayerTeam >> knzbRelationId: anObject [

	knzbRelationId := anObject
]

{ #category : 'accessing' }
WPPlayerTeam >> team [

	^ team
]

{ #category : 'accessing' }
WPPlayerTeam >> team: anObject [

	team := anObject
]
