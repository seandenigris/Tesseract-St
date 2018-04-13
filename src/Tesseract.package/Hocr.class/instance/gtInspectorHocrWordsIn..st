as yet unclassified
gtInspectorHocrWordsIn: composite
	<gtInspectorPresentationOrder: 6>
	^ composite table
		title: 'Words';
		display: [ self words ];
		column: 'Value' evaluated: #string