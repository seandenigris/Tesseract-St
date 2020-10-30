accessing
template
	^ self binary fullName surroundedByDoubleQuotes, ' {inputFile} {outputFile} {flags} {hOCR}'