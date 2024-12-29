Class {
	#name : #HocrWord,
	#superclass : #HocrNode,
	#category : #'Tesseract-Core'
}

{ #category : #accessing }
HocrWord class >> exampleBoundingBox [
	<gtExample>
	| word |
	word := self exampleFromString.
	self assert: word boundingBox left equals: 29.
	self assert: word boundingBox top equals: 61.
	self assert: word boundingBox right equals: 111.
	self assert: word boundingBox bottom equals: 98.
	^ word
]

{ #category : #examples }
HocrWord class >> exampleFromString [
	<gtExample>
	^ self on: self exampleInput.
]

{ #category : #examples }
HocrWord class >> exampleFromString2 [
	<gtExample>
	^ self on: self exampleInput2.
]

{ #category : #examples }
HocrWord class >> exampleFromXMLElement [
	<gtExample>
	^ self on: self exampleInput teAsXMLElement.
]

{ #category : #examples }
HocrWord class >> exampleInput [
	^ '<span class="ocrx_word" id="word_1_39" title="bbox 29 61 111 98; x_wconf 58">Subtotal</span>'
]

{ #category : #examples }
HocrWord class >> exampleInput2 [
	^ '<span class="ocrx_word" id="word_1_39" title="bbox 127 61 227 98; x_wconf 58">Subtotal</span>'
]

{ #category : #'as yet unclassified' }
HocrWord >> amountRule [

	| number dollars cents |
	dollars := number := #digit asPParser plus flatten.
	cents := $. asPParser, number.
	^ $$ asPParser optional, (dollars, cents optional) flatten end ==> #second.
]

{ #category : #converting }
HocrWord >> asAmount [

	| parseResult |
	parseResult := self amountRule parse: self string.
	^ parseResult asNumber
]

{ #category : #converting }
HocrWord >> asDate [

	^ Date pp2Parser parse: self string.
]

{ #category : #converting }
HocrWord >> asMorph [

	^ TeHocrWordMorph on: self
]

{ #category : #'as yet unclassified' }
HocrWord >> extractDate [

	| parseResult |
	parseResult := Date parser parse: self model string.
	^ UIManager default inform: parseResult
]

{ #category : #testing }
HocrWord >> isValidAmount [

	^ self amountRule matches: self string.
]

{ #category : #testing }
HocrWord >> isValidDate [

	^ Date parser matches: self string.
]
