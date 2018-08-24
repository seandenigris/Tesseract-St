as yet unclassified
addFiles: aCollection 
	aCollection do: [ :e |
		| subject |
		subject := TeSubject new
			file: e;
			yourself.
		self subjects add: subject ]