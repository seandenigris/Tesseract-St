examples
exampleTwoWordsInSitu
	<gtExample>
	^ BlElement new
		size: 1000 @ 1000;
		addChild: self exampleFromString asElement;
		addChild: self exampleFromString2 asElement;
		yourself