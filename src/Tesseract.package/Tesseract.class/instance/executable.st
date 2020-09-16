private
executable
	| reference |
	"This is the location for both Homebrew and Macports"
	reference := '/usr/local/bin/tesseract' asFileReference.
	^ reference exists 
		ifTrue: [ reference ]
		ifFalse: [ self error: 'Tesseract not installed!' ]