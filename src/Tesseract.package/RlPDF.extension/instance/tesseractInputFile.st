*Tesseract-Core
tesseractInputFile
	| target |
	target := Tempfile withSuffix: '.tiff'.
	SuImageMagick teConvert: self file to: target.
	^ target