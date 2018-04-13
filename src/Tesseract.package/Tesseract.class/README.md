I am an OOP interface to Google's Tesseract OCR Library

Collaborators
- Client: provides the input file via #tesseractInputFile and a factory method (#newHocrFrom:) to reify hocr string output; for the simple case, just set to the file itself (e.g. a FileLocator or FileReference)