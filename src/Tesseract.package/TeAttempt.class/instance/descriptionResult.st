accessing-magritte
descriptionResult
	<magritteDescription>
	^ MAToOneRelationDescription new
		accessor: #result;
		priority: 200;
		classes: { Hocr };
		yourself