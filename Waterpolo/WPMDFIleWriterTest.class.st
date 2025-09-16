Class {
	#name : 'WPMDFIleWriterTest',
	#superclass : 'Object',
	#category : 'Waterpolo',
	#package : 'Waterpolo'
}

{ #category : 'actions' }
WPMDFIleWriterTest >> write [

	FileLocator home / 'obsidian' / 'geo-vault' / 'Test' / 'tests'
	/ 'test' , 'md' writeStreamDo: [ :stream | self writeMDOn: stream ]
]

{ #category : 'actions' }
WPMDFIleWriterTest >> writeMDOn: ws [

	ws
		nextPutAll: '---';
		cr.

	ws
		nextPutAll: 'name: test';
		cr;
		nextPutAll: 'team: team';
		cr.

	ws nextPutAll: '---'
]
