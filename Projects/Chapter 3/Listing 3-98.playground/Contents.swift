
var numbers = [55, 12, 32, 5, 9]
var newArray = numbers.sorted(by: { $0 < $1 })
print(newArray[0])  // 5
