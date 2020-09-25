private
tempFileExtension
	^ self isHocr
		ifTrue: [ '.hocr' ]
		ifFalse: [ '.txt' ]