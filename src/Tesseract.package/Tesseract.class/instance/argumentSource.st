accessing
argumentSource
	^ { 
		#flags -> self flagString.
		#inputFile -> self inputFile.
		#outputFile -> self tempFile withoutExtension.
		#hOCR -> (self isHocr ifTrue: [ 'hocr' ] ifFalse: [ '' ]) } asDictionary