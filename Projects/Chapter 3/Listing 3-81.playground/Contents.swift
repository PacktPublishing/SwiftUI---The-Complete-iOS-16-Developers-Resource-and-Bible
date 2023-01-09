
var fruits = ["Banana", "Orange"]
if !fruits.isEmpty {
   fruits.append("Apple")  // ["Banana", "Orange", "Apple"]
   fruits.removeFirst()  // "Banana"
   fruits.insert("Pear", at: 1)  // ["Orange", "Pear", "Apple"]
   fruits.insert(contentsOf: ["Cherry", "Peach"], at: 2)
   // ["Orange", "Pear", "Cherry", "Peach", "Apple"]
}
