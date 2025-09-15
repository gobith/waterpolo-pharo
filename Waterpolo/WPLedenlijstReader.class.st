Class {
	#name : 'WPLedenlijstReader',
	#superclass : 'Object',
	#category : 'Waterpolo',
	#package : 'Waterpolo'
}

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
				           addField: #clientId:;
				           separator: $;;
				           skipHeader;
				           upToEnd ].

	^ players
]

{ #category : 'accessing' }
WPLedenlijstReader class >> readDolfijnSportlink [

	| file players |
	file := FileLocator home / 'waterpolo' / 'ledenlijst_dolfijn_sportlink.csv'.

	players := file readStreamDo: [ :stream |
			           (NeoCSVReader on: stream)
				           recordClass: WPPlayer;
				           addField: #clientId:;
				           addField: #stub:;
				           addField: #dolfijnSportlinkFullName:;
				           addField: #gender:;
				           addField: #dolfijnSportlinkDateOfBirth:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #stub:;
				           addField: #phoneNumber:;
				           addField: #email:;
				           separator: $;;
				           skipHeader;
				           upToEnd ].

	^ players
]
