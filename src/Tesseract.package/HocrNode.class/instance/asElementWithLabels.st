views
asElementWithLabels
	^ BlElement new
		layout: (BlGridLayout horizontal columnCount: 3);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		addChildren:
			{
			"top row"
			(self textElementForDimension: self boundingBox topLeft alignV: #alignBottom alignH: #alignRight).
			(self textElementForDimension: self boundingBox width alignV: #alignBottom alignH: #alignCenter).
			(self textElementForDimension: self boundingBox topRight alignV: #alignBottom alignH: #alignLeft).

			"middle row"
			(self textElementForDimension: self boundingBox height alignV: #alignCenter alignH: #alignRight).
			self asElement.
			(self textElementForDimension: self boundingBox height alignV: #alignCenter alignH: #alignLeft).

			"bottom row"
			(self textElementForDimension: self boundingBox bottomLeft alignV: #alignTop alignH: #alignRight).
			(self textElementForDimension: self boundingBox width alignV: #alignTop alignH: #alignCenter).
			(self textElementForDimension: self boundingBox bottomRight alignV: #alignTop alignH: #alignLeft).}