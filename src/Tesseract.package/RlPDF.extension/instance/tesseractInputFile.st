*Tesseract-Core
tesseractInputFile
	| target commandTemplate command suffix |
	suffix := '-000.tiff'.
	target := Tempfile endingWith: suffix.
	RlPdfToImageConverter convert: self file to: target.
	^ target