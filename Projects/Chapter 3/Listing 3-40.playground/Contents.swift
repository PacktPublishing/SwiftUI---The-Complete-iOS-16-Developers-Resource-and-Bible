
struct Price {
   var USD: Double
   var CAD: Double

   init(americans: Double) {
      USD = americans
      CAD = USD * 1.29
   }
   init(canadians: Double) {
      CAD = canadians
      USD = CAD * 0.7752
   }
}
var myprice = Price(canadians: 5)
