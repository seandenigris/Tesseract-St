protocol
lines

	| lineNodes |
	lineNodes := self xmlDocument allElementsSelect: [ :e | (e attributeAt: 'class') = 'ocr_line' ].
	^ lineNodes collect: [ :e | self newLineFrom: e ].