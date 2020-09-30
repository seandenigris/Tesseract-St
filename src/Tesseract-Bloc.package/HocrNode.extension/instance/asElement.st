*Tesseract-Bloc
asElement
	| box |
	^ BlElement new
		border: (BlBorder paint: Color red width: 1);
		size: self boundingBox extent;
		relocate: self boundingBox center;"
		constraintsDo: [ :c | 
			c horizontal exact: self boundingBox width.
			c vertical exact: self boundingBox height ];"
		yourself.