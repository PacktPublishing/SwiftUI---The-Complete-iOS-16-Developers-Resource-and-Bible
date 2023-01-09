
import SwiftUI

class ApplicationData: ObservableObject {
   @Published var total: Int = 0
   var titles: [String] = []

   init() {
      Task(priority: .background) {
         await readNotifications()
      }
   }
   func readNotifications() async {
      let center = NotificationCenter.default
      let name = Notification.Name("Update Data")

      for await _ in center.notifications(named: name, object: nil) {
         await MainActor.run {
            total = titles.count
         }
      }
   }
}

