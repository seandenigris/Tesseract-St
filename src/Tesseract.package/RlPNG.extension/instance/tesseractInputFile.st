*Tesseract-Core
tesseractInputFile
	| target |
	target := Tempfile withSuffix: '.tiff'.
	SuImageMagick teConvert: self to: target.
	^ target