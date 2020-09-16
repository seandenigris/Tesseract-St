*Tesseract-Core
tesseractInputFile
	| target |
	target := Tempfile withSuffix: '.tiff'.
	RlImageMagick convert: self file to: target.
	^ target