views
gtBasicFor: aView
	<gtView>
	^ aView columnedList
		title: 'Basic' translated;
		priority: 8;
		items: [ { self } ];
		column: 'Text' text: [ :w | w displayString ];
		column: 'Position' text: [ :w | w boundingBox displayString ]