event handling
showContextMenu

	| menu |
	menu := UIManager default newMenuIn: self for: self.
	
	self model isValidDate ifTrue: [ menu add: 'Date' selector: #beDate ].
	self model isValidAmount ifTrue: [ menu add: 'Total Amount' selector: #beTotalAmount ].
	self model isValidPaymentType ifTrue: [ menu add: 'Be payment type' selector: #bePaymentType ].
	
	menu popUpEvent: self activeHand lastEvent in: self world.