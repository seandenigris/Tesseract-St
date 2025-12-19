Extension { #name : 'RlPDF' }

{ #category : '*Tesseract-Core' }
RlPDF >> tesseractInputFile [
	| target |
	target := Tempfile withSuffix: '.tiff'.
	SuImageMagick teConvert: self file to: target.
	^ target
]
