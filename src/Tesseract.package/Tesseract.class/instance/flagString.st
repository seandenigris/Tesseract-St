accessing
flagString
	^ String streamContents: [ :str |
		
		"Adapted from https://stackoverflow.com/a/39387424"
		self characterWhitelist ifNotEmpty: [ :chars |
			"Encloseing whitelist in single quotes prevents shell from processing e.g. $"
			str nextPutAll: '-c tessedit_char_whitelist='''.
			chars do: [ :c | str nextPut: c ].
			str nextPut: $' ].
		str space.
		self userPatterns ifNotEmpty: [ :pats | 
			str nextPutAll: '--user-patterns ', self userPatternsFile suForCommand ].
		str space.
		self segmentationMode ifNotNil: [ :psm | 
			str nextPutAll: '--psm ', psm code suForCommand ] ]