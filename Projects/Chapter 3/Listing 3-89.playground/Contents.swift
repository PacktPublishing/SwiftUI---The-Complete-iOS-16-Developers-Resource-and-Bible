
var fruits = ["Banana", "Orange", "Apple"]

let total = fruits.count
let newArray = Array(repeating: "Cherry", count: total)
fruits.replaceSubrange(0..<total, with: newArray)

print(fruits)  // "["Cherry", "Cherry", "Cherry"]"
