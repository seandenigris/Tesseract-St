*Tesseract
teConvert: inputFile to: outputFile
	^ self convertForOCR
		argumentSource: { 
			#input -> inputFile.
			#output -> outputFile } asDictionary;
		run