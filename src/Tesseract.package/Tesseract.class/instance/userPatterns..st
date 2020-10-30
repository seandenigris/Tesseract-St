accessing
userPatterns: aCollection
	"From https://github.com/tesseract-ocr/tesseract/blob/5761880676639ba6845dfcfc03f9c8989c9aa23b/src/dict/trie.h#L187 (add_word_list method comment):
	// Each pattern can contain any non-whitespace characters, however only the
  // patterns that contain characters from the unicharset of the corresponding
  // language will be useful.
  // The only meta character is '\'. To be used in a pattern as an ordinary
  // string it should be escaped with '\' (e.g. string ""C:\Documents"" should
  // be written in the patterns file as ""C:\\Documents"").
  // This function supports a very limited regular expression syntax. One can
  // express a character, a certain character class and a number of times the
  // entity should be repeated in the pattern.
  //
  // To denote a character class use one of:
  // \c - unichar for which UNICHARSET::get_isalpha() is true (character)
  // \d - unichar for which UNICHARSET::get_isdigit() is true
  // \n - unichar for which UNICHARSET::get_isdigit() or
  //      UNICHARSET::isalpha() are true
  // \p - unichar for which UNICHARSET::get_ispunct() is true
  // \a - unichar for which UNICHARSET::get_islower() is true
  // \A - unichar for which UNICHARSET::get_isupper() is true
  //
  // \* could be specified after each character or pattern to indicate that
  // the character/pattern can be repeated any number of times before the next
  // character/pattern occurs.
  //
  // Examples:
  // 1-8\d\d-GOOG-411 will be expanded to strings:
  // 1-800-GOOG-411, 1-801-GOOG-411, ... 1-899-GOOG-411.
  //
  // http://www.\n\*.com will be expanded to strings like:
  // http://www.a.com http://www.a123.com ... http://www.ABCDefgHIJKLMNop.com
  //
  // Note: In choosing which patterns to include please be aware of the fact
  // providing very generic patterns will make tesseract run slower.
  // For example \n\* at the beginning of the pattern will make Tesseract
  // consider all the combinations of proposed character choices for each
  // of the segmentations, which will be unacceptably slow.
  // Because of potential problems with speed that could be difficult to
  // identify, each user pattern has to have at least kSaneNumConcreteChars
  // concrete characters from the unicharset at the beginning."
	userPatterns := aCollection