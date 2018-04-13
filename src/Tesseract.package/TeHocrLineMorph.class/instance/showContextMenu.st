as yet unclassified
showContextMenu

	| menu |
	menu := UIManager default newMenuIn: self for: self.
	
	menu
		add: 'Extract Date' selector: #extractDate;
		add: 'Extract Amount' selector: #extractAmount.
	
	menu popUpEvent: self activeHand lastEvent in: self world.