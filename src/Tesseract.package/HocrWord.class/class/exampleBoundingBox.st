accessing
exampleBoundingBox
	<gtExample>
	| word |
	word := self exampleFromString.
	self assert: word boundingBox left equals: 17.
	self assert: word boundingBox top equals: 101.
	self assert: word boundingBox right equals: 167.
	self assert: word boundingBox bottom equals: 162.