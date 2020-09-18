accessing
exampleTwoWords
	<gtExample>
	| doc result |
	doc := XMLDOMParser
		parse:
			'<span xmlns="http://www.w3.org/1999/xhtml" class="ocr_line" id="line_1_11" title="bbox 417 1017 833 1062; baseline 0.002 -10; x_size 36.38298; x_descenders 5.3829789; x_ascenders 8">
      <span class="ocrx_word" id="word_1_39" title="bbox 417 1017 567 1062; x_wconf 58">Subtotal</span>
      <span class="ocrx_word" id="word_1_40" title="bbox 742 1023 833 1053; x_wconf 60">11.99</span>
     </span>'.
	result := self on: doc root.
	self assert: result boundingBox left equals: 417.
	^ result