
struct Price {
   var USD: Double
   var CAD: Double

   static func reserved() -> Price {
      return Price(USD: 10.0, CAD: 11.0)
   }
}
var reservedprice = Price.reserved()
print("Price in USD: \(reservedprice.USD) CAD: \(reservedprice.CAD)")
