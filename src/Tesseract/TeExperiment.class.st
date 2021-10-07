Class {
	#name : #TeExperiment,
	#superclass : #Object,
	#instVars : [
		'subjects'
	],
	#classInstVars : [
		'current'
	],
	#category : 'Tesseract-Experimenting'
}

{ #category : #accessing }
TeExperiment class >> current [
	^ current ifNil: [ current := self new ]
]

{ #category : #'as yet unclassified' }
TeExperiment >> addFiles: aCollection [ 
	aCollection do: [ :e |
		| subject |
		subject := TeSubject new
			file: e;
			yourself.
		self subjects add: subject ]
]

{ #category : #'accessing-magritte' }
TeExperiment >> descriptionSubjects [
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
]

{ #category : #accessing }
TeExperiment >> subjects [
	^ subjects ifNil: [ subjects := OrderedCollection new ]
]
