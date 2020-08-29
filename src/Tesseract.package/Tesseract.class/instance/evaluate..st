private
evaluate: commandString

	| exitStatus result |
	OSSUnixSubprocess new	
	shellCommand: commandString;
	"redirectStderr;"
	runAndWaitOnExitDo: [ :command :outString :errString |
		command isSuccess ifFalse: [ ^ self error: 'tesseract failed with: ', errString ]	].
	result := self tempFile readStreamDo: [ :str | str contents ].
	self tempFile delete.
	^ result.
	