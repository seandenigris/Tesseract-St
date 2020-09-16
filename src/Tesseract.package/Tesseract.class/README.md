I am an OOP interface to Google's *Tesseract OCR Library>https://en.wikipedia.org/wiki/HOCR*
!Input Files
My client provides me with an input file, the quality of which is paramount to my effectiveness. There are many relevant aspects, and different blends might be appropriate for different applications, which would be best known by the client. 
!!Properties
In general:
- Resolution: 300dpi (or maybe 400 for small fonts)^^1^^.
- Color: grayscale or B&W^^1^^
- Format: TIFF^^3^^ (or PNG?), uncompressed^^1^^
- Size: There may be a 4Kx4K pixel upper limit^^2^^ 
!!Improving Quality
- Preprocessing can help^^5,4^^
- Other techniques like page segmentation and dictionary use^^5^^
!Collaborators
- My ==client== provides:
  - the input file via #tesseractInputFile; for the simple case, just set to the file itself (e.g. a FileLocator or FileReference)
  - a factory method (#newHocrFrom:) to reify hocr string output

# *https://stackoverflow.com/q/18620977*
# *https://stackoverflow.com/q/56581779*
# *https://stackoverflow.com/q/10193001*
# *https://stackoverflow.com/a/10233208*
# *https://tesseract-ocr.github.io/tessdoc/ImproveQuality.html*