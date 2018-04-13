as yet unclassified
asDate

	| parseResult |
	parseResult := self dateRule parse: self string.
	^ parseResult asDate