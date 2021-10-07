Extension { #name : #HocrNode }

{ #category : #'*Tesseract-Bloc' }
HocrNode >> asElement [
	| tip result |
	tip := BrLabel new
		look: BrGlamorousLabelLook new glamorousRegularFontAndSize;
		padding: (BlInsets all: 2);
		text: self string;
		alignCenter.
	result := BlElement new
		"border: (BlBorder paint: Color red width: 1);
		"look: (BrGlamorousWithTooltipLook2 content: tip);
		size: self boundingBox extent;
		relocate: self boundingBox topLeft;
		yourself.
	result userData at: #node put: self.
	^ result
]

{ #category : #'*Tesseract-Bloc' }
HocrNode >> asElementWithLabels [
	| text box |
	text := text := BlTextElement new
	text: self string asRopedText; asScalableElement.
	box := self asElement
		addChild: text;
		yourself.
	
	^ BlElement new
		layout: (BlGridLayout horizontal columnCount: 3);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		addChildren:
			{
			"top row"
			(self textElementForDimension: self boundingBox topLeft alignV: #alignBottom alignH: #alignRight).
			(self textElementForDimension: self boundingBox width alignV: #alignBottom alignH: #alignCenter).
			(self textElementForDimension: self boundingBox topRight alignV: #alignBottom alignH: #alignLeft).

			"middle row"
			(self textElementForDimension: self boundingBox height alignV: #alignCenter alignH: #alignRight).
			box.
			(self textElementForDimension: self boundingBox height alignV: #alignCenter alignH: #alignLeft).

			"bottom row"
			(self textElementForDimension: self boundingBox bottomLeft alignV: #alignTop alignH: #alignRight).
			(self textElementForDimension: self boundingBox width alignV: #alignTop alignH: #alignCenter).
			(self textElementForDimension: self boundingBox bottomRight alignV: #alignTop alignH: #alignLeft).}
]
