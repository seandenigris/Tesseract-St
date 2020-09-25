accessing
argumentSource
	^ { 
		#inputFile -> self inputFile fullName.
		#outputFile -> self tempFile withoutExtension fullName.
		#hOCR -> (self isHocr ifTrue: [ ' hocr' ] ifFalse: [ '' ]) } asDictionary