examples
exampleBoundingBox
	<gtExample>
	| result |
	result := self exampleTwoWords.
	self assert: result boundingBox left equals: 29.
	^ result