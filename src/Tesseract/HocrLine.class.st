Class {
	#name : 'HocrLine',
	#superclass : 'HocrNode',
	#category : 'Tesseract-Core',
	#package : 'Tesseract',
	#tag : 'Core'
}

{ #category : 'examples' }
HocrLine class >> exampleBoundingBox [
	<gtExample>
	| result |
	result := self exampleTwoWords.
	self assert: result boundingBox left equals: 29.
	^ result
]

{ #category : 'examples' }
HocrLine class >> exampleInputTwoWords [
	^ '<span xmlns="http://www.w3.org/1999/xhtml" class="ocr_line" id="line_1_11" title="bbox 29 61 227 98; baseline 0.002 -10; x_size 36.38298; x_descenders 5.3829789; x_ascenders 8">
      ', HocrWord exampleInput, HocrWord exampleInput2, '
     </span>'.
]

{ #category : 'examples' }
HocrLine class >> exampleTwoWords [
	<gtExample>
	^ self on: self exampleInputTwoWords.
]

{ #category : 'as yet unclassified' }
HocrLine >> asMorph [

	^ TeHocrLineMorph on: self
]

{ #category : 'GT-Pharo' }
HocrLine >> gtInspectorHocrWordsIn: composite [
        <gtInspectorPresentationOrder: 5>
        ^ composite table
                title: 'Words';
                display: [ self words ];
                column: 'Value' evaluated: #string
]

{ #category : 'accessing' }
HocrLine >> gtWordsFor: aView [
	<gtView>
	^ aView columnedList
			title: 'Words' translated;
			priority: 8;
			items: [ self words ];
			column: 'Text' text: [ :w | w displayString ];
		column: 'Position' text: [ :w | w boundingBox displayString ]
]

{ #category : 'as yet unclassified' }
HocrLine >> newWordFrom: anXmlElement [

	^ HocrWord on: anXmlElement
]

{ #category : 'as yet unclassified' }
HocrLine >> words [

	| wordNodes |
	wordNodes := xmlElement allElementsSelect: [ :e | (e attributeAt: 'class') = 'ocrx_word' ].
	^ wordNodes collect: [ :e | self newWordFrom: e ].
]
