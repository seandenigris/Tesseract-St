*Tesseract
teConvert: inputFile to: outputFile
	^ self convertForOCR
		argumentSource: { 
			#inputFile -> inputFile.
			#outputFile -> outputFile } asDictionary;
		run