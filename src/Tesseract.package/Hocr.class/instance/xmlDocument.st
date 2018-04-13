protocol
xmlDocument

	| parser |
	xmlDocument ifNotNil: [ ^ xmlDocument ].
	
	parser := XMLDOMParser on: string.
	^ xmlDocument := parser
		resolvesExternalEntities: false;
		parseDocument.