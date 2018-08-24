accessing-magritte
descriptionOcrAttempts
	<magritteDescription>
	^ MAToManyRelationDescription new
		accessor: #ocrAttempts;
		label: 'OCR Attempts';
		default: #();
		priority: 200;
		reference:
			(MAContainer basicNew
				instVarAt: 1 put: Dictionary new;
				instVarAt: 2 put: MAIdentityAccessor new;
				instVarAt: 3 put: OrderedCollection new;
				yourself);
		classes:
			(Set new
				add: TeAttempt;
				yourself);
		yourself