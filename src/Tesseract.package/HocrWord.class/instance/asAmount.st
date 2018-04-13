as yet unclassified
asAmount

	| parseResult |
	parseResult := self amountRule parse: self string.
	^ parseResult asNumber