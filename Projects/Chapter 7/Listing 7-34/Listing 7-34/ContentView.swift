
import SwiftUI

struct MainItems: Identifiable {
   var id = UUID()
   var name: String!
   var options: [MainItems]!
}
class ContentViewData: ObservableObject {
   @Published var items: [MainItems]

   init() {
      items = [
         MainItems(name: "Food", options: [
            MainItems(name: "Oatmeal", options: nil),
            MainItems(name: "Bagels", options: nil),
            MainItems(name: "Brownies", options: nil),
            MainItems(name: "Cheese", options: [
               MainItems(name: "Roquefort", options: nil),
               MainItems(name: "Mozzarella", options: nil),
               MainItems(name: "Cheddar", options: nil)
            ]),
            MainItems(name: "Cookies", options: nil),
            MainItems(name: "Donuts", options: nil)
         ]),
         MainItems(name: "Beverages", options: [
            MainItems(name: "Coffee", options: nil),
            MainItems(name: "Juice", options: nil),
            MainItems(name: "Lemonade", options: nil)
         ])
      ]
   }
}
struct ContentView: View {
   @ObservedObject var contentData = ContentViewData()

   var body: some View {
     List {
        ForEach(contentData.items) { section in
             Section(header: Text(section.name)) {
                 OutlineGroup(section.options ?? [], children: \.options) { item in
                    Text(item.name)
                 }
             }
         }
     }.listStyle(.sidebar)
   }
}
struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}

