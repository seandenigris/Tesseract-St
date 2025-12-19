Extension { #name : 'RlJPEG' }

{ #category : '*Tesseract' }
RlJPEG class >> tesseractExampleWordFuzzy [
	<gtExample>
	^ self on: Tesseract exampleSupportFolder / 'word_fuzzy.jpg'
]

{ #category : '*Tesseract-Core' }
RlJPEG >> tesseractInputFile [
	^ self file
]
