Class {
	#name : #TeSegmentationMode,
	#superclass : #Object,
	#instVars : [
		'code',
		'description'
	],
	#category : 'Tesseract-Core'
}

{ #category : #'instance creation' }
TeSegmentationMode class >> block [
	^ self new
		code: 6;
		description: 'single uniform block of text';
		yourself.
]

{ #category : #'instance creation' }
TeSegmentationMode class >> line [
	^ self new
		code: 7;
		description: 'single text line';
		yourself.
]

{ #category : #'instance creation' }
TeSegmentationMode class >> word [
	^ self new
		code: 8;
		description: 'single word';
		yourself.
]

{ #category : #accessing }
TeSegmentationMode >> code [
	^ code
]

{ #category : #accessing }
TeSegmentationMode >> code: anObject [
	code := anObject
]

{ #category : #accessing }
TeSegmentationMode >> description [
	^ description
]

{ #category : #accessing }
TeSegmentationMode >> description: anObject [
	description := anObject
]
