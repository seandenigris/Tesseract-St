accessing
userPatternsFile
	userPatternsFile ifNil: [ userPatternsFile := Tempfile new ensureCreateFile].
	userPatternsFile writeStreamDo: [ :s |
		self userPatterns do: [ :pat | s nextPutAll: pat; crlf ] ].
	^ userPatternsFile