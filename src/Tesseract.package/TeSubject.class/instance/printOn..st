as yet unclassified
printOn: aStream
	self file ifNotNil: [ :f | aStream nextPutAll: f basename ].