
var fruits = ["Apple", "Raspberry", "Banana", "Grape"]
var newArray = fruits.sorted(by: { $0 > $1 })
print(newArray[0])  // "Raspberry"
