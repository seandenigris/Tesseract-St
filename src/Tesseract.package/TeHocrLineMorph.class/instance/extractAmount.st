as yet unclassified
extractAmount

	| number dollars cents amountRule parseResult |
	dollars := number := #digit asParser plus flatten.
	cents := $. asParser, number.
	amountRule := $$ asParser optional, (dollars, cents optional) flatten end ==> #second.
	self model words detect: [ :w | 
		parseResult := amountRule parse: w string.
		parseResult isPetitFailure not ].
	^ UIManager default inform: parseResult asNumber