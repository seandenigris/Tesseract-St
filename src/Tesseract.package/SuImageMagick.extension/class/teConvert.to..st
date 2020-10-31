*Tesseract
teConvert: inputFile to: outputFile
	^ self convertForOCR
		argumentAt: #inputFile put: inputFile;
		argumentAt: #outputFile put: outputFile;
		run