*Tesseract-Core
tesseractInputFile
	| target |
	target := Tempfile withSuffix: '.tiff'.
	RlImageMagick teConvert: self file to: target.
	^ target