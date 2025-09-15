Class {
	#name : 'WPPlayer',
	#superclass : 'Object',
	#instVars : [
		'knzbRelationId',
		'name',
		'prefix',
		'surname',
		'gender',
		'dateOfBirth',
		'year',
		'phoneNumber',
		'email',
		'category',
		'homeClub',
		'discipline'
	],
	#category : 'Waterpolo',
	#package : 'Waterpolo'
}

{ #category : 'accessing' }
WPPlayer >> category [

	^ category
]

{ #category : 'accessing' }
WPPlayer >> category: anObject [

	category := anObject
]

{ #category : 'accessing' }
WPPlayer >> dateOfBirth [

	^ dateOfBirth
]

{ #category : 'accessing' }
WPPlayer >> dateOfBirth: anObject [

	dateOfBirth := anObject
]

{ #category : 'accessing' }
WPPlayer >> discipline [

	^ discipline
]

{ #category : 'accessing' }
WPPlayer >> discipline: anObject [

	discipline := anObject
]

{ #category : 'accessing' }
WPPlayer >> dolfijnGender: anObject [

	gender := anObject
]

{ #category : 'accessing reader' }
WPPlayer >> dolfijnSportlinkDateOfBirth: anObject [

	| array |
	array := anObject substrings: '/'.

	dateOfBirth := DateAndTime
		               year: (array at: 3) asInteger
		               month: (array at: 1) asInteger
		               day: (array at: 2) asInteger.
		
	year := dateOfBirth year
]

{ #category : 'accessing reader' }
WPPlayer >> dolfijnSportlinkFullName: anObject [

	| array nameAndPrefix ws |
	array := (anObject substrings: ',') collect: [ :s | s trimBoth ].

	nameAndPrefix := array last substrings: ' '.


	surname := array first.
	name := nameAndPrefix first.

	nameAndPrefix size > 1
		ifTrue: [
				ws := '' writeStream.
				nameAndPrefix from: 2 to: nameAndPrefix size do: [ :str |
						ws
							nextPutAll: str trimBoth;
							space ].
				prefix := ws contents trimBoth ]
		ifFalse: [ prefix := '' ]
]

{ #category : 'accessing' }
WPPlayer >> email [

	^ email
]

{ #category : 'accessing' }
WPPlayer >> email: anObject [

	email := anObject
]

{ #category : 'accessing' }
WPPlayer >> fullName [

	^prefix isEmpty ifTrue: [ name , ' ' , surname ] ifFalse: [ name , ' ' , prefix , ' ' , surname ]
]

{ #category : 'accessing reader' }
WPPlayer >> fullName: anObject [

	| array |
	array := (anObject substrings:  ',' ) collect: [ :s | s trimBoth ].
	surname := array first.
	name := array last
]

{ #category : 'accessing' }
WPPlayer >> gender [

	^ gender
]

{ #category : 'accessing' }
WPPlayer >> gender: anObject [

	gender := anObject
]

{ #category : 'accessing reader' }
WPPlayer >> hetYDateOfBirth: anObject [

	| array |
	array := anObject substrings: '/'.

	dateOfBirth := DateAndTime
		               year: (array at: 3) asInteger
		               month: (array at: 2) asInteger
		               day: (array at: 1) asInteger.
		
	year := dateOfBirth year
]

{ #category : 'accessing' }
WPPlayer >> hetYGender: anObject [

	gender := anObject
]

{ #category : 'accessing' }
WPPlayer >> homeClub [

	^ homeClub
]

{ #category : 'accessing' }
WPPlayer >> homeClub: anObject [

	homeClub := anObject
]

{ #category : 'initialization' }
WPPlayer >> initialize [ 

	super initialize .
	prefix := ''.
]

{ #category : 'accessing' }
WPPlayer >> knzbRelationId [

	^ knzbRelationId
]

{ #category : 'accessing' }
WPPlayer >> knzbRelationId: anObject [

	knzbRelationId := anObject
]

{ #category : 'accessing' }
WPPlayer >> name [

	^ name
]

{ #category : 'accessing' }
WPPlayer >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
WPPlayer >> phoneNumber [

	^ phoneNumber
]

{ #category : 'accessing' }
WPPlayer >> phoneNumber: anObject [

	phoneNumber := anObject
]

{ #category : 'accessing' }
WPPlayer >> prefix [

	^ prefix
]

{ #category : 'accessing' }
WPPlayer >> prefix: anObject [

	prefix := anObject
]

{ #category : 'printing' }
WPPlayer >> printOn: aStream [

	super printOn: aStream.
	aStream
		tab;
		nextPutAll: self fullName
]

{ #category : 'accessing' }
WPPlayer >> stub: anObject [

	"Stub"
]

{ #category : 'accessing' }
WPPlayer >> surname [

	^ surname
]

{ #category : 'accessing' }
WPPlayer >> surname: anObject [

	surname := anObject
]
