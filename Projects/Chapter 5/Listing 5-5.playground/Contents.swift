
func reverseit(mylist: [String]) -> some Collection {
   let reversed = mylist.reversed()
   return reversed
}
let reversedlist = reverseit(mylist: ["One", "Two", "Three", "Four", "Five"])
print(Array(reversedlist))  // "["Five", "Four", "Three", "Two", "One"]"
