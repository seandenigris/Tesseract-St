examples
exampleInSitu
	<gtExample>
	^ BlElement new
		size: 500 @ 500;
		addChild: self exampleTwoWords asElement;
		yourself