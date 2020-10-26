accessing
flagString
	^ String streamContents: [ :str |
		
		"Adapted from https://stackoverflow.com/a/39387424"
		self characterWhitelist ifNotEmpty: [ :chars |
			str nextPutAll: ' -c tessedit_char_whitelist='.
			chars do: [ :c | str nextPut: c ] ] ]