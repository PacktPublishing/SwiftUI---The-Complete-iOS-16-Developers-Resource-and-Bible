
var fruits: [String: [String]] = ["A": ["Apple", "Apricot"], "B": ["Banana", "Blueberries"]]
if let list = fruits["A"] {
   print(list[0])  // "Apple"
}
