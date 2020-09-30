*Tesseract
teAsXMLElement
	| doc |
	doc := XMLDOMParser parse: self.
	^ doc root