private
tempFile
	^ tempFile
		ifNil: [ tempFile := Tempfile withSuffix: self tempFileExtension ]