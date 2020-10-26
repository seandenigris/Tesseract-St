examples
exampleHOCR
	<gtExample>
	| result |
	result := Tesseract new
		client: RlPDF exampleReceipt;
		isHocr: true;
		yourself.
	self assert: (result run words anySatisfy: [ :e | e string = '12-43' ]).
	^ result