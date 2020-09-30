accessing
exampleBoundingBox
	<gtExample>
	| word |
	word := self exampleFromString.
	self assert: word boundingBox left equals: 29.
	self assert: word boundingBox top equals: 61.
	self assert: word boundingBox right equals: 111.
	self assert: word boundingBox bottom equals: 98.
	^ word