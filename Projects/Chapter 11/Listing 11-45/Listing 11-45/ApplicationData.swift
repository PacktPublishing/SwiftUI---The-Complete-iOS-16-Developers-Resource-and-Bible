
import SwiftUI

struct Sales: Identifiable {
   let id = UUID()
   var date: Date
   var amount: Int
}
struct Products: Identifiable {
   let id = UUID()
   var name: String
   var sales: [Sales]
}
class ApplicationData: ObservableObject {
   @Published var sales: [Products]

   init() {
      let salesBagels = [
         Sales(date: Date(timeInterval: -86400 * 7, since: Date()), amount: 10),
         Sales(date: Date(timeInterval: -86400 * 6, since: Date()), amount: 12),
         Sales(date: Date(timeInterval: -86400 * 5, since: Date()), amount: 8),
         Sales(date: Date(timeInterval: -86400 * 4, since: Date()), amount: 13),
         Sales(date: Date(timeInterval: -86400 * 3, since: Date()), amount: 9),
         Sales(date: Date(timeInterval: -86400 * 2, since: Date()), amount: 7),
         Sales(date: Date(timeInterval: -86400 * 1, since: Date()), amount: 8) ]
      let salesBrownies = [
         Sales(date: Date(timeInterval: -86400 * 7, since: Date()), amount: 3),
         Sales(date: Date(timeInterval: -86400 * 6, since: Date()), amount: 5),
         Sales(date: Date(timeInterval: -86400 * 5, since: Date()), amount: 2),
         Sales(date: Date(timeInterval: -86400 * 4, since: Date()), amount: 8),
         Sales(date: Date(timeInterval: -86400 * 3, since: Date()), amount: 6),
         Sales(date: Date(timeInterval: -86400 * 2, since: Date()), amount: 5),
         Sales(date: Date(timeInterval: -86400 * 1, since: Date()), amount: 9) ]
      sales = [
         Products(name: "Bagels", sales: salesBagels),
         Products(name: "Brownies", sales: salesBrownies) ]
   }
}

