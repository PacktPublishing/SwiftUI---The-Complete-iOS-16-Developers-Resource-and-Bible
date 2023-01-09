
import Foundation

var text = "The Suitcase is Black"
var search = "black  "
search = search.trimmingCharacters(in: .whitespacesAndNewlines)

var range = text.range(of: search, options: .caseInsensitive)
if let rangeToReplace = range {
   text.replaceSubrange(rangeToReplace, with: "Red")
}
print(text)  // "The Suitcase is Red"
