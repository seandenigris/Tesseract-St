examples
exampleCharacterWhitelist
	<gtExample>
	| result |
	result := self examplehOCR.
	"The default processing mistakes a bizzare looking dot for a dash"
	self assert: (result run words anySatisfy: [ :e | e string = '12-43' ]).
	
	result
		characterWhitelist: '1234567890.';
		yourself.
	self assert: (result run words anySatisfy: [ :e | e string = '12.43' ]).
	^ result