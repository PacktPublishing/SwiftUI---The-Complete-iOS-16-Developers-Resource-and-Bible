
var fruits: Set = ["Apple", "Orange", "Banana"]
var orderFruits = fruits.sorted()
if let lastItem = orderFruits.last {
   print(lastItem)  // "Orange"
}
