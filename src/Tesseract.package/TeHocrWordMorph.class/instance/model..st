private
model: anObject
	model := anObject.
	self bounds: model boundingBox.
	self setBalloonText: model string