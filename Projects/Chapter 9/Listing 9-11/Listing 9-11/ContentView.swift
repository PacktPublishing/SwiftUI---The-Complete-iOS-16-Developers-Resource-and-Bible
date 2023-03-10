
import SwiftUI

final class Product: Sendable {
   let name: String

   init(name: String) {
      self.name = name
   }
}
actor ItemData {
   var stock: Int = 100

   func sellProduct(product: Product, quantity: Int) {
      stock = stock - quantity
      print("Stock: \(stock) \(product.name)")
   }
}
struct ContentView: View {
   var item: ItemData = ItemData()

   var body: some View {
      Button("Start Process") {
         Task(priority: .background) {
            let product = Product(name: "Lamp")
            await item.sellProduct(product: product, quantity: 5)
         }
      }
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

