Class {
	#name : 'TeExperiment',
	#superclass : 'Object',
	#instVars : [
		'subjects'
	],
	#classInstVars : [
		'current'
	],
	#category : 'Tesseract-Experimenting',
	#package : 'Tesseract',
	#tag : 'Experimenting'
}

{ #category : 'accessing' }
TeExperiment class >> current [
	^ current ifNil: [ current := self new ]
]

{ #category : 'as yet unclassified' }
TeExperiment >> addFiles: aCollection [ 
	aCollection do: [ :e |
		| subject |
		subject := TeSubject new
			file: e;
			yourself.
		self subjects add: subject ]
]

{ #category : 'accessing' }
TeExperiment >> subjects [
	^ subjects ifNil: [ subjects := OrderedCollection new ]
]

{ #category : 'accessing-magritte' }
TeExperiment >> subjectsDescription [
	<magritteDescription>
	<gtInspectorPresentationOrder: 3>

	^ MAToManyRelationDescription new
		accessor: #subjects;
		default: #();
		priority: 100;
		yourself
]
