accessing
exampleHOCR
	<gtExample>
	| hocr |
	hocr := Tesseract hocr: RlPDF exampleReceipt.
	self assert: (hocr words anySatisfy: [ :w | w string = 'CASH' ]).
	^ hocr