
var fruits = ["Apple", "Blueberry", "Banana", "Grape"]
var newArray = fruits.sorted(by: { $0.count < $1.count })
print(newArray)  // ["Apple", "Grape", "Banana", "Blueberry"]
