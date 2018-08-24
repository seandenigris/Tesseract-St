*Tesseract-Core
vsImageFile
	| target commandTemplate command suffix output |
	suffix := '-000.jpg'.
	target := Tempfile endingWith: suffix.
	output := target fullName allButLast: suffix size.
	commandTemplate := '/usr/local/bin/pdfimages -j "{input}" "{output}"'.
	command := commandTemplate format: { 
		#input -> self file fullName.
		#output -> output } asDictionary.
	LibC system: command.
	^ target