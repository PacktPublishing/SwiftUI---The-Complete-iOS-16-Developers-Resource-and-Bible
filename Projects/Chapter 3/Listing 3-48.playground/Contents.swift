
struct MyStructure<T> {
   var myvalue:T

   func description() {
      print("The value is: \(myvalue)")  // "The value is: 5"
   }
}
let instance = MyStructure<Int>(myvalue: 5)
instance.description()
