
var message = ""
var range = 0..<10

for item in range.reversed() {
   message += "\(item) "
}
print(message)  // "9 8 7 6 5 4 3 2 1 0 "
