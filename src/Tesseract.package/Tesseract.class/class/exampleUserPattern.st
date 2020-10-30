examples
exampleUserPattern
	"<gtExample> Failing, but may be an issue with Tesseract. There are many issues about this not working"
	| result hocr |
	
	result := self examplehOCR
		userPatterns: #('\d\d*.\d\d*');
		yourself.
	hocr := result run.
	self assert: (hocr words anySatisfy: [ :e | e string = '12.43' ]).
	self assert: (hocr words noneSatisfy: [ :e | e string = '12-43' ]).
	^ result