as yet unclassified
dateRule

	| separator number |
	separator := $/ asParser.
	number := #digit asParser star flatten.
	^ (number, separator, number, separator, number) flatten