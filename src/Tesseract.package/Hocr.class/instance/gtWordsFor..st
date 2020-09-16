accessing
gtWordsFor: aView
	<gtView>
	^ aView list
			title: 'Words' translated;
			priority: 9;
			items: [ self words ];
			itemText: [ :line | line string ]