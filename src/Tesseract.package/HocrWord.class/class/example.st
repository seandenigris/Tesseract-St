accessing
example
	<gtExample>
	| doc result |
	doc := XMLDOMParser
		parse:
			'<span class="ocrx_word" id="word_1_39" title="bbox 417 1017 567 1062; x_wconf 58">Subtotal</span>'.
	result := self on: doc root.
	self assert: result boundingBox left equals: 417.
	^ result