Extension { #name : #HocrNode }

{ #category : #'*Tesseract-Bloc' }
HocrNode >> asElement [
	| tip result |
	tip := BrLabel new
			aptitude: BrGlamorousLabelAptitude new glamorousRegularFontAndSize;
			padding: (BlInsets all: 2);
			text: self string;
			alignCenter.
	result := BlElement new
			aptitude: (BrGlamorousWithTooltipAptitude content: tip);
			size: self boundingBox extent;
			relocate: self boundingBox topLeft;
			yourself.	"border: (BlBorder paint: Color red width: 1);
		"
	result userData at: #node put: self.
	^ result
]

{ #category : #'*Tesseract-Bloc' }
HocrNode >> textElementForDimension: aPointOrNumber alignV: vSymbol alignH: hSymbol [
	^ BlTextElement new
		text: aPointOrNumber printString asRopedText;
		constraintsDo: [ :c | 
			"to even better align the text within the cell"
			c grid horizontal perform: hSymbol.
			c grid vertical perform: vSymbol ];
		yourself
]
