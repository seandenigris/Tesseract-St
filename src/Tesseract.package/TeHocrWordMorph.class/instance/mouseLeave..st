event handling
mouseLeave: anEvent

	self hasHalo ifTrue: [ ^ self ]. "Or the halos would disappear before we could click"
	self delete