examples
example_hOCR_Convenience
	<gtExample>
	| hocr |
	hocr := Tesseract hocr: RlPDF exampleReceipt.
	self assert: (hocr words anySatisfy: [ :w | w string = 'CASH' ]).
	^ hocr