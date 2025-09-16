Class {
	#name : 'WPLedenlijstReader',
	#superclass : 'Object',
	#category : 'Waterpolo',
	#package : 'Waterpolo'
}

{ #category : 'examples' }
WPLedenlijstReader class >> exampleAllPlayers [

	(self readDolfijnSportlink , self readHetY) inspect
]

{ #category : 'examples' }
WPLedenlijstReader class >> exampleDolfijn [

	self readDolfijnSportlink inspect
]

{ #category : 'examples' }
WPLedenlijstReader class >> exampleHetY [

	self readHetY inspect
]

{ #category : 'examples' }
WPLedenlijstReader class >> examplePlayers [

	self players inspect
]

{ #category : 'examples' }
WPLedenlijstReader class >> exampleSpelersTeam [

	self readSpelersTeams inspect
]

{ #category : 'accessing' }
WPLedenlijstReader class >> players [

	| players teams |
	players := self readDolfijnSportlink , self readHetY.

	teams := self readSpelersTeams.

	players do: [ :player |
			| team |
			team := teams
				        detect: [ :each |
				        each knzbRelationId = player knzbRelationId ]
				        ifNone: nil.
			team ifNotNil: [ player team: team team] ].

	^WPCollection on:  players
]

{ #category : 'accessing' }
WPLedenlijstReader class >> readDolfijnAllUnited [

	| file players |
	file := FileLocator home / 'waterpolo'
	        / 'ledenlijst_dolfijn_allUnited.csv'.

	players := file readStreamDo: [ :stream |
			           (NeoCSVReader on: stream)
				           recordClass: WPPlayer;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #surname:;
				           addField: #name:;
				           addField: #prefix:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #category:;
				           addField: #knzbRelationId:;
				           separator: $;;
				           skipHeader;
				           upToEnd ].

	^ players
]

{ #category : 'accessing' }
WPLedenlijstReader class >> readDolfijnSportlink [

	| file players |
	file := FileLocator home / 'obsidian' / 'geo-vault'
	        / 'Waterpolo' / 'files' / 'ledenlijst_dolfijn_sportlink.csv'.



	players := file readStreamDo: [ :stream |
			           (NeoCSVReader on: stream)
				           recordClass: WPPlayer;
				           addField: #knzbRelationId:;
				           addField: #stub:;
				           addField: #dolfijnSportlinkFullName:;
				           addField: #dolfijnGender:;
				           addField: #dolfijnSportlinkDateOfBirth:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #phoneNumber:;
				           addField: #email:;
				           separator: $;;
				           skipHeader;
				           upToEnd ].
			
		players do: [ : each | each homeClub: 'De Dolfijn' ].

	^ players
]

{ #category : 'accessing' }
WPLedenlijstReader class >> readHetY [

	| file players |
	file := FileLocator home / 'obsidian' / 'geo-vault' / 'Waterpolo'
	        / 'files' / 'ledenlijst-het-y.csv'.

	players := file readStreamDo: [ :stream |
			           (NeoCSVReader on: stream)
				           recordClass: WPPlayer;
				           addField: #knzbRelationId:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #discipline:;
				           addField: #surname:;
				           addField: #prefix:;
				           addField: #name:;
				           addField: #hetYGender:;
				           addField: #hetYDateOfBirth:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #email:;
				           addField: #stub:;
				           addField: #phoneNumber:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           separator: $;;
				           skipHeader;
				           upToEnd ].
			
			players do: [ : each | each homeClub: 'Het Y' ].
			

	^ players select: [ : each | each discipline = 'W' ]
]

{ #category : 'accessing' }
WPLedenlijstReader class >> readSpelersTeams [

	| file players |
	file := FileLocator home / 'obsidian' / 'geo-vault' / 'Waterpolo'
	        / 'files' / 'spelers-year.csv'.

	players := file readStreamDo: [ :stream |
			           (NeoCSVReader on: stream)
				           recordClass: WPPlayerTeam;
				           addField: #knzbRelationId:;
				           addField: #team:;
				           separator: $,;
				           skipHeader;
				           upToEnd ].
			
		

	^ players 
]
