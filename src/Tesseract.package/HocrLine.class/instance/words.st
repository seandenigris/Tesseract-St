as yet unclassified
words

	| wordNodes |
	wordNodes := xmlElement allElementsSelect: [ :e | (e attributeAt: 'class') = 'ocrx_word' ].
	^ wordNodes collect: [ :e | self newWordFrom: e ].