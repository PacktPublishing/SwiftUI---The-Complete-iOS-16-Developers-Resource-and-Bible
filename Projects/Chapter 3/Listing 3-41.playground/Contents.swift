
struct Price {
   var USD: Double
   var ratetoCAD: Double

   var canadians: Double {
      get {
         return USD * ratetoCAD
      }
   }
}
var purchase = Price(USD: 11, ratetoCAD: 1.29)
print("Price in CAD: \(purchase.canadians)")  // "Price in CAD: 14.19"
