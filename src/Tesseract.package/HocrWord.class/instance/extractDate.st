as yet unclassified
extractDate

	| parseResult |
	parseResult := Date parser parse: self model string.
	^ UIManager default inform: parseResult