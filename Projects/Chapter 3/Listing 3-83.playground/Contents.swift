
var list = [55, 12, 32, 5, 9]
let found = list.contains(where: { value in
   value > 60
})
print(found)  // false
