
import SwiftUI

class ApplicationData: ObservableObject {
   @Published var picturesList: [String]

   init() {
      picturesList = ["bagels", "brownies", "butter", "cheese", "coffee", "cookies", "donuts", "granola", "juice", "lemonade", "lettuce", "milk", "oatmeal", "potato", "tomato", "yogurt"]
   }
}

