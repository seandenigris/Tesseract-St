"
''hOCR is an open standard of data representation for formatted text obtained from optical character recognition (OCR). The definition encodes text, style, layout information, recognition confidence metrics and other information using Extensible Markup Language (XML) in the form of Hypertext Markup Language (HTML) or XHTML.'' - *per Wikipedia>https://en.wikipedia.org/wiki/HOCR*
"
Class {
	#name : #Hocr,
	#superclass : #Object,
	#instVars : [
		'string',
		'xmlDocument'
	],
	#category : 'Tesseract-Core'
}

{ #category : #'as yet unclassified' }
Hocr class >> on: aString [

	^ self new
		string: aString;
		yourself.
]

{ #category : #accessing }
Hocr >> exampleInput [
	^ '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
 <head>
  <title></title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
  <meta name=''ocr-system'' content=''tesseract 4.1.1'' />
  <meta name=''ocr-capabilities'' content=''ocr_page ocr_carea ocr_par ocr_line ocrx_word ocrp_wconf''/>
 </head>
 <body>
  <div class=''ocr_page'' id=''page_1'' title=''image "/tmp/pharo-tempfile/2020-09-29T153428269067-0400.tiff"; bbox 0 0 933 1700; ppageno 0''>
   <div class=''ocr_carea'' id=''block_1_1'' title="bbox 65 156 859 326">
    <p class=''ocr_par'' id=''par_1_1'' lang=''eng'' title="bbox 65 156 859 326">
      ', HocrLine exampleInputTwoWords, '
    </p>
   </div>
  </div>
 </body>
</html>
'
]

{ #category : #accessing }
Hocr >> gtInspectorHocrLinesIn: composite [
	<gtInspectorPresentationOrder: 3>
	^ composite table
		title: 'Lines';
		display: [ self lines ];
		column: 'Value' evaluated: #string
]

{ #category : #'as yet unclassified' }
Hocr >> gtInspectorHocrWordsIn: composite [
	<gtInspectorPresentationOrder: 6>
	^ composite table
		title: 'Words';
		display: [ self words ];
		column: 'Value' evaluated: #string
]

{ #category : #accessing }
Hocr >> gtLinesFor: aView [
	<gtView>
	^ aView list
			title: 'Lines' translated;
			priority: 8;
			items: [ self lines ];
			itemText: [ :line | line string ]
]

{ #category : #accessing }
Hocr >> gtWordsFor: aView [
	<gtView>
	^ aView list
			title: 'Words' translated;
			priority: 9;
			items: [ self words ];
			itemText: [ :line | line string ]
]

{ #category : #protocol }
Hocr >> lines [

	| lineNodes |
	lineNodes := self xmlDocument allElementsSelect: [ :e | (e attributeAt: 'class') = 'ocr_line' ].
	^ lineNodes collect: [ :e | self newLineFrom: e ].
]

{ #category : #private }
Hocr >> newLineFrom: anXmlElement [

	^ HocrLine on: anXmlElement
]

{ #category : #private }
Hocr >> string [
	^ string
]

{ #category : #private }
Hocr >> string: aWideString [ 

	string := aWideString.
]

{ #category : #protocol }
Hocr >> words [

	^ self lines flatCollect: [ :l | l words ]
]

{ #category : #protocol }
Hocr >> xmlDocument [

	| parser |
	xmlDocument ifNotNil: [ ^ xmlDocument ].
	
	parser := XMLDOMParser on: string.
	^ xmlDocument := parser parseDocument.
]
