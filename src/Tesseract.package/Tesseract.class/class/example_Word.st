examples
example_Word
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