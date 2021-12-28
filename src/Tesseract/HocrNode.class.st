"
Do we need a pointer back to our container? One reason we might is if we wanted to show our position relative to the entire page we appear in. This info is available in the XML in the first div of the body, but let's wait and see if we actually want this info in practice.
"
Class {
	#name : #HocrNode,
	#superclass : #Object,
	#instVars : [
		'xmlElement'
	],
	#category : #'Tesseract-Core'
}

{ #category : #'instance creation' }
HocrNode class >> on: convertibleToXMLElement [ 

	^ self new
		xmlElement: convertibleToXMLElement teAsXMLElement;
		yourself.
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

{ #category : #accessing }
HocrNode >> boundingBox [

	| propertiesString tokens |
	propertiesString := xmlElement attributeAt: 'title'.
	tokens := Character space split: propertiesString.
	tokens first = 'bbox' ifFalse: [ self error: 'missing bbox tag' ].
	^ Rectangle left: tokens second asNumber right: tokens fourth asNumber top: tokens third asNumber bottom: tokens fifth asNumber. 
]

{ #category : #printing }
HocrNode >> displayStringOn: aStream [

	aStream nextPutAll: self string
]

{ #category : #views }
HocrNode >> gtBasicFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Basic' translated;
		priority: 8;
		items: [ { self } ];
		column: 'Text' text: [ :w | w displayString ];
		column: 'Position' text: [ :w | w boundingBox displayString ]
]

{ #category : #views }
HocrNode >> gtVisualFor: aView [
	<gtView>
	^ aView explicit
		title: 'Visual' translated;
		priority: -8;
		stencil: [ self asElementWithLabels ];
		yourself
]

{ #category : #printing }
HocrNode >> printOn: aStream [

	self displayStringOn: aStream.
	aStream nextPutAll: '(hocr)'.
]

{ #category : #accessing }
HocrNode >> string [

	^ xmlElement contentString.
]

{ #category : #private }
HocrNode >> xmlElement: aXMLElement [ 

	xmlElement := aXMLElement.
]
