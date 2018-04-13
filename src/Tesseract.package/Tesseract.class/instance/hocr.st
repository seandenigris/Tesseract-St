protocol
hocr

	| hocrString |
	tempFileExtension := 'hocr'.
	hocrString := self evaluate: self hocrCommand.
	^ client newHocrFrom: hocrString