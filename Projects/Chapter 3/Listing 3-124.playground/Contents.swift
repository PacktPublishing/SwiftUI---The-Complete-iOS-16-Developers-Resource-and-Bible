
var fruits = ["one": "Banana", "two": "Apple", "three": "Pear"]
var list = fruits.sorted(by: { $0.1 < $1.1 })
print(list)
