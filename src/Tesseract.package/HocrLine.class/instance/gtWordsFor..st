accessing
gtWordsFor: aView
	<gtView>
	^ aView columnedList
			title: 'Words' translated;
			priority: 8;
			items: [ self words ];
			column: 'Text' text: [ :w | w displayString ];
		column: 'Position' text: [ :w | w boundingBox displayString ]