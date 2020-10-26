examples
exampleCharacterWhitelist
	<gtExample>
	| result |
	result := self exampleHOCR
		characterWhitelist: '1234567890.';
		yourself.
	self assert: (result run words anySatisfy: [ :e | e string = '12.43' ]).
	self assert: (result run words noneSatisfy: [ :e | e string = '12-43' ]).
	^ result