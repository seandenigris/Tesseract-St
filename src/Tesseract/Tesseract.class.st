"
I am an OOP interface to Google's *Tesseract OCR Library>https://en.wikipedia.org/wiki/HOCR*
!Input Files
My client provides me with an input file, the quality of which is paramount to my effectiveness. There are many relevant aspects, and different blends might be appropriate for different applications, which would be best known by the client. 
!!Properties
In general:
- Resolution: 300dpi (or maybe 400 for small fonts)^^1^^.
- Color: grayscale or B&W^^1^^
- Format: TIFF^^3^^ (or PNG?), uncompressed^^1^^
- Size: There may be a 4Kx4K pixel upper limit^^2^^ 
!!Improving Quality
- Preprocessing can help^^5,4^^
- Other techniques like page segmentation and dictionary use^^5^^
!Collaborators
- My ==client== provides:
  - the input file via #tesseractInputFile; for the simple case, just set to the file itself (e.g. a FileLocator or FileReference)
  - a factory method (#newHocrFrom:) to reify hocr string output

# *https://stackoverflow.com/q/18620977*
# *https://stackoverflow.com/q/56581779*
# *https://stackoverflow.com/q/10193001*
# *https://stackoverflow.com/a/10233208*
# *https://tesseract-ocr.github.io/tessdoc/ImproveQuality.html*
"
Class {
	#name : #Tesseract,
	#superclass : #SuGenericUnixCommand,
	#instVars : [
		'client',
		'inputFile',
		'isHocr',
		'tempFile',
		'characterWhitelist',
		'userPatterns',
		'userPatternsFile',
		'segmentationMode'
	],
	#category : #'Tesseract-Core'
}

{ #category : #private }
Tesseract class >> binaryName [
	^ 'tesseract'
]

{ #category : #examples }
Tesseract class >> exampleCharacterWhitelist [
	<gtExample>
	| result |
	result := self examplehOCR.
	"The default processing mistakes a bizzare looking dot for a dash"
	self assert: (result run words anySatisfy: [ :e | e string = '12-43' ]).
	
	result
		characterWhitelist: '1234567890.';
		yourself.
	self assert: (result run words anySatisfy: [ :e | e string = '12.43' ]).
	^ result
]

{ #category : #accessing }
Tesseract class >> exampleSupportFolder [
	^ BaselineOfTesseract exampleSupportFolder
]

{ #category : #examples }
Tesseract class >> exampleUserPattern [
	"<gtExample> Failing, but may be an issue with Tesseract. There are many issues about this not working"
	| result hocr |
	
	result := self examplehOCR
		userPatterns: #('\d\d*.\d\d*');
		yourself.
	hocr := result run.
	self assert: (hocr words anySatisfy: [ :e | e string = '12.43' ]).
	self assert: (hocr words noneSatisfy: [ :e | e string = '12-43' ]).
	^ result
]

{ #category : #examples }
Tesseract class >> example_Word [
	<gtExample>
	| result expectedOCR |
	expectedOCR := '12.43'.
	result := Tesseract new
		client: RlPNG tesseractExampleWord;
		isHocr: false;
		yourself.
	"Tesseract does not handle a single word well by default"
	self assert: result run trim equals: ''.
		
	result segmentationMode: TeSegmentationMode word.
	"With clear text, just setting segmentation mode is enough"
	self assert: result run trim equals: expectedOCR.
	^ result
]

{ #category : #examples }
Tesseract class >> example_WordFuzzy [
	<gtExample>
	| result expectedOCR |
	expectedOCR := '12.43'.
	result := Tesseract new
		client: RlJPEG tesseractExampleWordFuzzy;
		segmentationMode: TeSegmentationMode word;
		isHocr: false;
		yourself.
	"With fuzzy text, just setting segmentation mode is not enough"
	self assert: result run trim equals: '12 _ 4ii3'.
	
	"User patterns seem to have no effect"
	result userPatterns: #('\d\d*.\d\d*').
	self assert: result run trim equals: '12 _ 4ii3'.
	result userPatterns: nil.
	
	"Restricting the character whitelist produces the expected OCR"
	result characterWhitelist: '1234567890.'.
	self assert: result run trim equals: expectedOCR.
	^ result
]

{ #category : #examples }
Tesseract class >> example_hOCR_Convenience [
	<gtExample>
	| hocr |
	hocr := Tesseract hocr: RlPDF exampleReceipt.
	self assert: (hocr words anySatisfy: [ :w | w string = 'CASH' ]).
	^ hocr
]

{ #category : #examples }
Tesseract class >> examplehOCR [
	<gtExample>
	| result |
	result := Tesseract new
		client: RlPDF exampleReceipt;
		yourself.
	self assert: (result run words anySatisfy: [ :e | e string = 'CASH' ]).
	^ result
]

{ #category : #convenience }
Tesseract class >> hocr: aClient [

	^ self new
		client: aClient;
		isHocr: true;
		run.
]

{ #category : #'class initialization' }
Tesseract class >> initialize [
	Smalltalk tools register: self as: #ocr
]

{ #category : #convenience }
Tesseract class >> newHocr [

	^ self new
		isHocr: true;
		yourself.
]

{ #category : #convencience }
Tesseract class >> ocr: aClient [ 

	^ self new
		client: aClient;
		isHocr: false;
		run.
]

{ #category : #accessing }
Tesseract >> argumentSource [
	^ { 
		#flags -> self flagString.
		#inputFile -> self inputFile.
		#outputFile -> self tempFile withoutExtension.
		#hOCR -> (self isHocr ifTrue: [ 'hocr' ] ifFalse: [ '' ]) } asDictionary
]

{ #category : #accessing }
Tesseract >> binary [
	^ self class binary
]

{ #category : #accessing }
Tesseract >> characterWhitelist [
	^ characterWhitelist ifNil: [ characterWhitelist := OrderedCollection new ]
]

{ #category : #accessing }
Tesseract >> characterWhitelist: aString [
	characterWhitelist := aString
]

{ #category : #accessing }
Tesseract >> client [
	^ client ifNil: [ self ]
]

{ #category : #private }
Tesseract >> client: aTesseractClient [
	"See my class comment"

	client := aTesseractClient
]

{ #category : #accessing }
Tesseract >> flagString [
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
]

{ #category : #private }
Tesseract >> inputFile [
	"Cache because the client may be creating a file just for me, and it may be a Tempfile (which we don't want to be garbage collected before we're done)"
	^ inputFile ifNil: [ inputFile := self client tesseractInputFile ]
]

{ #category : #accessing }
Tesseract >> isHocr [
	^ isHocr ifNil: [ true ]
]

{ #category : #examples }
Tesseract >> isHocr: aBoolean [
	"Otherwise I will create plain text OCR without style info"
	isHocr := aBoolean
]

{ #category : #private }
Tesseract >> run [
	| exitStatus result |
	OSSUnixSubprocess new
		shellCommand: self string;
		redirectStderr;
		runAndWaitOnExitDo: [ :command :outString :errString | 
			command isSuccess
				ifFalse: [ self error: 'tesseract failed with: ' , errString ] ].
	result := self tempFile readStreamDo: [ :str | str contents ].
	^ self isHocr
		ifTrue: [ client teNewHocrFrom: result ]
		ifFalse: [ result ]
]

{ #category : #accessing }
Tesseract >> segmentationMode [
	^ segmentationMode
]

{ #category : #accessing }
Tesseract >> segmentationMode: anObject [
	segmentationMode := anObject
]

{ #category : #private }
Tesseract >> tempFile [
	^ tempFile
		ifNil: [ tempFile := Tempfile withSuffix: self tempFileExtension ]
]

{ #category : #private }
Tesseract >> tempFileExtension [
	^ self isHocr
		ifTrue: [ '.hocr' ]
		ifFalse: [ '.txt' ]
]

{ #category : #accessing }
Tesseract >> template [
	^ self binary fullName surroundedByDoubleQuotes, ' {inputFile} {outputFile} {flags} {hOCR}'
]

{ #category : #accessing }
Tesseract >> userPatterns [
	^ userPatterns ifNil: [ userPatterns := OrderedCollection new ]
]

{ #category : #accessing }
Tesseract >> userPatterns: aCollection [
	"From https://github.com/tesseract-ocr/tesseract/blob/5761880676639ba6845dfcfc03f9c8989c9aa23b/src/dict/trie.h#L187 (add_word_list method comment):
	// Each pattern can contain any non-whitespace characters, however only the
  // patterns that contain characters from the unicharset of the corresponding
  // language will be useful.
  // The only meta character is '\'. To be used in a pattern as an ordinary
  // string it should be escaped with '\' (e.g. string ""C:\Documents"" should
  // be written in the patterns file as ""C:\\Documents"").
  // This function supports a very limited regular expression syntax. One can
  // express a character, a certain character class and a number of times the
  // entity should be repeated in the pattern.
  //
  // To denote a character class use one of:
  // \c - unichar for which UNICHARSET::get_isalpha() is true (character)
  // \d - unichar for which UNICHARSET::get_isdigit() is true
  // \n - unichar for which UNICHARSET::get_isdigit() or
  //      UNICHARSET::isalpha() are true
  // \p - unichar for which UNICHARSET::get_ispunct() is true
  // \a - unichar for which UNICHARSET::get_islower() is true
  // \A - unichar for which UNICHARSET::get_isupper() is true
  //
  // \* could be specified after each character or pattern to indicate that
  // the character/pattern can be repeated any number of times before the next
  // character/pattern occurs.
  //
  // Examples:
  // 1-8\d\d-GOOG-411 will be expanded to strings:
  // 1-800-GOOG-411, 1-801-GOOG-411, ... 1-899-GOOG-411.
  //
  // http://www.\n\*.com will be expanded to strings like:
  // http://www.a.com http://www.a123.com ... http://www.ABCDefgHIJKLMNop.com
  //
  // Note: In choosing which patterns to include please be aware of the fact
  // providing very generic patterns will make tesseract run slower.
  // For example \n\* at the beginning of the pattern will make Tesseract
  // consider all the combinations of proposed character choices for each
  // of the segmentations, which will be unacceptably slow.
  // Because of potential problems with speed that could be difficult to
  // identify, each user pattern has to have at least kSaneNumConcreteChars
  // concrete characters from the unicharset at the beginning."
	userPatterns := aCollection
]

{ #category : #accessing }
Tesseract >> userPatternsFile [
	userPatternsFile ifNil: [ userPatternsFile := Tempfile new ensureCreateFile].
	userPatternsFile writeStreamDo: [ :s |
		self userPatterns do: [ :pat | s nextPutAll: pat; crlf ] ].
	^ userPatternsFile
]
