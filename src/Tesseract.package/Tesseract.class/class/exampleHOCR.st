examples
exampleHOCR
	<gtExample>
	| result |
	result := Tesseract new
		client: RlPDF exampleReceipt;
		isHocr: true;
		yourself.
	"self assert: (hocr words anySatisfy: [ :w | w string = 'CASH' ])."
	^ result