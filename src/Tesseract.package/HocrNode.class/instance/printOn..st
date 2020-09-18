printing
printOn: aStream

	self displayStringOn: aStream.
	aStream nextPutAll: '(hocr)'.