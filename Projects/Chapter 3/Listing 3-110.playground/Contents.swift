
var fruits: Set = ["Apple", "Banana"]
var newSet = fruits.union(["Grapes"])  // "Banana", "Grapes", "Apple"
newSet.subtract(["Apple", "Banana"])  // "Grapes"
