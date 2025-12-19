Extension { #name : 'Object' }

{ #category : '*Tesseract' }
Object >> teNewHocrFrom: aString [
	"This hook allows per-object customization of Hocr instantiation. For example, a Receipt object might want to override this with `^ ReceiptHocr on: aString: for: self`"

	^ Hocr on: aString
]

{ #category : '*Tesseract' }
Object >> tesseract [
	^ Tesseract new
			client: self;
			yourself
]
