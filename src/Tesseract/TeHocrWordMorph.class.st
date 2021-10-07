Class {
	#name : #TeHocrWordMorph,
	#superclass : #Morph,
	#instVars : [
		'model'
	],
	#category : 'Tesseract-UI'
}

{ #category : #'instance creation' }
TeHocrWordMorph class >> on: line [

	^ self new
		model: line;
		yourself
]

{ #category : #'as yet unclassified' }
TeHocrWordMorph >> beCash [

	self model receipt beCash
]

{ #category : #'as yet unclassified' }
TeHocrWordMorph >> beDate [

	^ self model beDate
]

{ #category : #'as yet unclassified' }
TeHocrWordMorph >> bePaymentType [

	self model bePaymentType
]

{ #category : #'as yet unclassified' }
TeHocrWordMorph >> beTotalAmount [

	^ self model beTotalAmount
]

{ #category : #'submorphs-add/remove' }
TeHocrWordMorph >> delete [

	self owner changed. "Otherwise we leave weird border-like trails"
	super delete
]

{ #category : #'event handling' }
TeHocrWordMorph >> handlesMouseDown: anEvent [

	^ true
]

{ #category : #'event handling' }
TeHocrWordMorph >> handlesMouseOver: event [

	^ true
]

{ #category : #initialization }
TeHocrWordMorph >> initialize [

	| highlightColor |
	highlightColor := Color yellow alpha: 0.2.
	super initialize.
	self color: highlightColor.
]

{ #category : #accessing }
TeHocrWordMorph >> model [
	^ model
]

{ #category : #private }
TeHocrWordMorph >> model: anObject [
	model := anObject.
	self bounds: model boundingBox.
	self setBalloonText: model string
]

{ #category : #'event handling' }
TeHocrWordMorph >> mouseDown: evt [

	evt yellowButtonPressed ifTrue: [ self showContextMenu ]
]

{ #category : #'event handling' }
TeHocrWordMorph >> mouseLeave: anEvent [

	self hasHalo ifTrue: [ ^ self ]. "Or the halos would disappear before we could click"
	self delete
]

{ #category : #'event handling' }
TeHocrWordMorph >> showContextMenu [

	| menu |
	menu := UIManager default newMenuIn: self for: self.
	
	self model isValidDate ifTrue: [ menu add: 'Date' selector: #beDate ].
	self model isValidAmount ifTrue: [ menu add: 'Total Amount' selector: #beTotalAmount ].
	self model isValidPaymentType ifTrue: [ menu add: 'Be payment type' selector: #bePaymentType ].
	
	menu popUpEvent: self activeHand lastEvent in: self world.
]
