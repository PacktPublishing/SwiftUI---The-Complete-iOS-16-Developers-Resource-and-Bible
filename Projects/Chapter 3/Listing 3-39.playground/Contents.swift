
struct Price {
   var USD: Double
   var CAD: Double

   init(americans: Double) {
      USD = americans
      CAD = USD * 1.29
   }
}
var myprice = Price(americans: 5)
