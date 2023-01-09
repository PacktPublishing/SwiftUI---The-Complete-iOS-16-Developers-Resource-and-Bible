
let myaddition = { () -> Int in
   var total = 0
   let list = stride(from: 1, through: 9, by: 1)
    
   for number in list {
      total += number
   }
   return total
}()
print("The total is \(myaddition)")  // "The total is 45"
