
var fruits = ["Apple", "Grape", "Banana", "Grape"]
var filteredArray = fruits.filter({ $0 != "Grape" })
print(filteredArray)  // "["Apple", "Banana"]"
