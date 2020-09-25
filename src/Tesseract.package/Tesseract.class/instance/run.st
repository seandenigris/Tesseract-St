private
run
	| exitStatus result |
	OSSUnixSubprocess new
		shellCommand: self string;
		redirectStderr;
		runAndWaitOnExitDo: [ :command :outString :errString | 
			command isSuccess
				ifFalse: [ self error: 'tesseract failed with: ' , errString ] ].
	result := self tempFile readStreamDo: [ :str | str contents ].
	^ self isHocr
		ifTrue: [ client teNewHocrFrom: result ]
		ifFalse: [ result ]