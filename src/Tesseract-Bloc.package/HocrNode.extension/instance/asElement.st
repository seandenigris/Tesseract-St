*Tesseract-Bloc
asElement
	| tip |
	tip := BrLabel new
		look: BrGlamorousLabelLook new glamorousRegularFontAndSize;
		padding: (BlInsets all: 2);
		text: self string;
		alignCenter.
	^ BlElement new
		border: (BlBorder paint: Color red width: 1);
		look: (BrGlamorousWithTooltipLook2 content: tip);
		size: self boundingBox extent;
		relocate: self boundingBox topLeft;
		yourself