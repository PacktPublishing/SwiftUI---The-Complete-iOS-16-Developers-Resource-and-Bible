
var text = "Hello World"
var start = text.startIndex
var findIndex = text.firstIndex(of: " ")

if let end = findIndex {
   print("First word is \(text[start..<end])")  //"First word is Hello"
}
