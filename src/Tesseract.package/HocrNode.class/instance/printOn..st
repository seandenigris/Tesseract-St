printing
printOn: aStream

	aStream
		nextPutAll: self string;
		nextPutAll: '(hocr)'.