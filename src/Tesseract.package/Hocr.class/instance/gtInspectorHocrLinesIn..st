accessing
gtInspectorHocrLinesIn: composite
	<gtInspectorPresentationOrder: 3>
	^ composite table
		title: 'Lines';
		display: [ self lines ];
		column: 'Value' evaluated: #string