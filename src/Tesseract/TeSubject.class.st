Class {
	#name : 'TeSubject',
	#superclass : 'Object',
	#instVars : [
		'file',
		'ocrAttempts'
	],
	#category : 'Tesseract-Experimenting',
	#package : 'Tesseract',
	#tag : 'Experimenting'
}

{ #category : 'accessing-magritte' }
TeSubject >> descriptionFile [
	<magritteDescription>
	^ MAToOneRelationDescription new
		accessor: #file;
		priority: 100;
		classes: { RlPDF. FileReference. FileLocator };
		yourself
]

{ #category : 'accessing-magritte' }
TeSubject >> descriptionOcrAttempts [
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
]

{ #category : 'as yet unclassified' }
TeSubject >> printOn: aStream [
	self file ifNotNil: [ :f | aStream nextPutAll: f basename ].
]
