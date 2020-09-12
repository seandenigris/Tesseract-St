*Tesseract-Core
tesseractInputFile
	| target commandTemplate command |
	target := Tempfile withSuffix: '-000.tiff'.
	RlPdfToImageConverter convert: self file to: target.
	^ target