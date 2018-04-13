as yet unclassified
extractDate

	| separator number dateRule parseResult |
	separator := $/ asParser.
	number := #digit asParser star flatten.
	dateRule := (number, separator, number, separator, number) flatten.
	parseResult := dateRule parse: self model string.
	^ UIManager default inform: parseResult asDate