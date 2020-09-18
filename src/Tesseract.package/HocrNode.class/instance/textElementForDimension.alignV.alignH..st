accessing
textElementForDimension: aPointOrNumber alignV: vSymbol alignH: hSymbol
	^ BlTextElement new
		text: aPointOrNumber printString asRopedText;
		constraintsDo: [ :c | 
			"to even better align the text within the cell"
			c grid horizontal perform: hSymbol.
			c grid vertical perform: vSymbol ];
		yourself