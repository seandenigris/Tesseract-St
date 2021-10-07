Class {
	#name : #TeAttempt,
	#superclass : #Object,
	#instVars : [
		'conversionCommand',
		'result',
		'result3'
	],
	#category : 'Tesseract-Experimenting'
}

{ #category : #'accessing-magritte' }
TeAttempt >> descriptionResult [
	<magritteDescription>
	^ MAToOneRelationDescription new
		accessor: #result;
		priority: 200;
		classes: { Hocr };
		yourself
]

{ #category : #accessing }
TeAttempt >> result3 [
	^ self maLazyFromDescriptionOf: #result3
]

{ #category : #accessing }
TeAttempt >> result3: anObject [
	result3 := anObject
]
