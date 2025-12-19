Class {
	#name : 'TeHocrLineMorph',
	#superclass : 'BorderedMorph',
	#instVars : [
		'model'
	],
	#category : 'Tesseract-UI',
	#package : 'Tesseract',
	#tag : 'UI'
}

{ #category : 'instance creation' }
TeHocrLineMorph class >> on: line [

	^ self new
		model: line;
		yourself
]

{ #category : 'as yet unclassified' }
TeHocrLineMorph >> extractAmount [

	| number dollars cents amountRule parseResult |
	dollars := number := #digit asPParser plus flatten.
	cents := $. asPParser, number.
	amountRule := $$ asPParser optional, (dollars, cents optional) flatten end ==> #second.
	self model words detect: [ :w | 
		parseResult := amountRule parse: w string.
		parseResult isPetitFailure not ].
	^ UIManager default inform: parseResult asNumber
]

{ #category : 'as yet unclassified' }
TeHocrLineMorph >> extractDate [

	| separator number dateRule parseResult |
	separator := $/ asPParser.
	number := #digit asPParser star flatten.
	dateRule := (number, separator, number, separator, number) flatten.
	self model words detect: [ :w | 
		parseResult := dateRule parse: w string.
		parseResult isPetitFailure not ].
	^ UIManager default inform: parseResult asDate
]

{ #category : 'as yet unclassified' }
TeHocrLineMorph >> handlesMouseDown: anEvent [

	^ true
]

{ #category : 'initialization' }
TeHocrLineMorph >> initialize [

	super initialize.
	self color: Color transparent.
]

{ #category : 'accessing' }
TeHocrLineMorph >> model [
	^ model
]

{ #category : 'accessing' }
TeHocrLineMorph >> model: anObject [
	model := anObject.
	self bounds: model boundingBox
]

{ #category : 'as yet unclassified' }
TeHocrLineMorph >> mouseDown: evt [

	evt yellowButtonPressed ifTrue: [ self showContextMenu ]
]

{ #category : 'as yet unclassified' }
TeHocrLineMorph >> showContextMenu [

	| menu |
	menu := UIManager default newMenuIn: self for: self.
	
	menu
		add: 'Extract Date' selector: #extractDate;
		add: 'Extract Amount' selector: #extractAmount.
	
	menu popUpEvent: self activeHand lastEvent in: self world.
]
