
var mynumber: Int = 0
var attempts = 0

while mynumber != 5 {
   mynumber = Int.random(in: 1...10)
   attempts += 1
}
print("It took \(attempts) attempts to get the number 5")
