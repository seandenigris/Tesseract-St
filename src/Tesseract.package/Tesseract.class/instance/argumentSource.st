accessing
argumentSource
	^ { 
		#flags -> self flagString.
		#inputFile -> self inputFile fullName.
		#outputFile -> self tempFile withoutExtension fullName.
		#hOCR -> (self isHocr ifTrue: [ ' hocr' ] ifFalse: [ '' ]) } asDictionary