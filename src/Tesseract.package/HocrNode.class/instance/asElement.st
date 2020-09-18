accessing
asElement
	| box text |
	box := BlElement new
		border: (BlBorder paint: Color red width: 1);
		"size: self boundingBox extent;"
		constraintsDo: [ :c | 
			c horizontal exact: self boundingBox width.
			c vertical exact: self boundingBox height ];
		yourself.
	text := BlTextElement new
	text: self string asRopedText;
	asScalableElement.
	^ box
		addChild: text;
		yourself