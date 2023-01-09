
func sumCharacters(word: String) -> (String, Int) {
   var characters = ""
   var counter = 0
   for letter in word {
      characters += "\(letter) "
      counter += 1
   }
   return (characters, counter)
}
var (list, total) = sumCharacters(word: "Hello")
var message = "There are \(total) characters (\(list))"
