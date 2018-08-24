accessing-magritte
descriptionSubjects
	<magritteDescription>
	<gtInspectorPresentationOrder: 3>

	^ MAToManyRelationDescription new
		accessor: #subjects;
		default: #();
		priority: 100;
		glmPresentation: [ :a |
			a list
				"title: 'Lines';"
				"display: [ self lines ];
				column: 'Value' evaluated: #string" ];
		yourself