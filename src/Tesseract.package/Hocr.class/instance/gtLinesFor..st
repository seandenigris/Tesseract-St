accessing
gtLinesFor: aView
	<gtView>
	^ aView list
			title: 'Lines' translated;
			priority: 8;
			items: [ self lines ];
			itemText: [ :line | line string ]