accessing-magritte
descriptionFile
	<magritteDescription>
	^ MAToOneRelationDescription new
		accessor: #file;
		priority: 100;
		classes: { RlPDF. FileReference. FileLocator };
		yourself