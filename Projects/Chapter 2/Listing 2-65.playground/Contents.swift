
var mytext = "Hello"
var counter = 0

for letter in mytext {
   if letter == "l" {
      continue
   }
   counter += 1
}
var message = "The string contains \(counter) letters"  // 3
