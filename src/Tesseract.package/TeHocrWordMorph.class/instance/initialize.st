initialization
initialize

	| highlightColor |
	highlightColor := Color yellow alpha: 0.2.
	super initialize.
	self color: highlightColor.