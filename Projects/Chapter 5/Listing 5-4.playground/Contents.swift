
func reverseit(mylist: [Int]) -> ReversedCollection<Array<Int>> {
   let reversed = mylist.reversed()
   return reversed
}
let reversedlist = reverseit(mylist: [1, 2, 3, 4, 5])
print(Array(reversedlist))  // "[5, 4, 3, 2, 1]"
