examples
example_WordFuzzy
	<gtExample>
	| result expectedOCR |
	expectedOCR := '12.43'.
	result := Tesseract new
		client: RlJpeg tesseractExampleWordFuzzy;
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