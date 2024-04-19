Extension { #name : #RlPNG }

{ #category : #'*Tesseract' }
RlPNG class >> tesseractExampleWord [
	<gtExample>
	^ self on: Tesseract exampleSupportFolder / 'word.png'
]

{ #category : #'*Tesseract-Core' }
RlPNG >> tesseractInputFile [
	^ self file
]
