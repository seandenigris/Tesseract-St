Class {
	#name : #BaselineOfTesseract,
	#superclass : #BaselineOf,
	#category : #BaselineOfTesseract
}

{ #category : #accessing }
BaselineOfTesseract class >> exampleSupportFolder [
	^ FileLocator localDirectory / 'iceberg' / 'seandenigris' / 'Tesseract-St'/ 'example support'
]

{ #category : #baseline }
BaselineOfTesseract >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Magritte' with: [
				spec repository: 'github://seandenigris/Magritte' ];
			baseline: 'OSShell' with: [ "Cross-platform process handling on Pharo and GT"
				spec repository: 'github://seandenigris/Pharo-Shell' ];
			"baseline: 'ResourcesLive' with: [
				spec repository: 'github://seandenigris/ResourcesLive' ];"
			baseline: 'Superuser' with: [
				spec repository: 'github://seandenigris/Superuser' ];
			baseline: 'Tempfile' with: [
				spec repository: 'github://seandenigris/TempfileSt' ].
		spec
			package: 'Tesseract' with: [ 
				spec requires: #('Magritte' #'OSShell' "'ResourcesLive'" 'Superuser' 'Tempfile') ] ].
				
	spec for: #GToolkit do: [
		spec 
			package: 'Tesseract-Bloc' with: [ spec requires: #('Tesseract') ] ]

]

{ #category : #accessing }
BaselineOfTesseract >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #(notGToolkit) ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : #testing }
BaselineOfTesseract >> isGTImage [
	
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ].
	"Implementation note: used to check for GToolkit prefix, but P7 has a GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"
]
