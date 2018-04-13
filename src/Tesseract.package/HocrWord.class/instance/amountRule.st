as yet unclassified
amountRule

	| number dollars cents |
	dollars := number := #digit asParser plus flatten.
	cents := $. asParser, number.
	^ $$ asParser optional, (dollars, cents optional) flatten end ==> #second.