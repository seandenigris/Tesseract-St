examples
examplehOCR
	<gtExample>
	| result |
	result := Tesseract new
		client: RlPDF exampleReceipt;
		yourself.
	self assert: (result run words anySatisfy: [ :e | e string = 'CASH' ]).
	^ result