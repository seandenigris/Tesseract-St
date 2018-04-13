as yet unclassified
extractDate

	| separator number dateRule parseResult |
	separator := $/ asParser.
	number := #digit asParser star flatten.
	dateRule := (number, separator, number, separator, number) flatten.
	self model words detect: [ :w | 
		parseResult := dateRule parse: w string.
		parseResult isPetitFailure not ].
	^ UIManager default inform: parseResult asDate