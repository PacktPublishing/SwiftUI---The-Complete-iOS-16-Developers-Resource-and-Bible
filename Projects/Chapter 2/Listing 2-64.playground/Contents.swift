
var mytext = "Hello"
var counter = 0

for letter in mytext where letter != "l" {
   counter += 1
}
var message = "The string contains \(counter) letters"  // 3
