private
inputFile
	"Cache because the client may be creating a file just for me, and it may be a Tempfile (which we don't want to be garbage collected before we're done)"
	^ inputFile ifNil: [ inputFile := self client tesseractInputFile ]