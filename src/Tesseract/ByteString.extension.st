Extension { #name : #ByteString }

{ #category : #'*Tesseract' }
ByteString >> teAsXMLElement [
	| doc |
	doc := XMLDOMParser parse: self.
	^ doc root
]
