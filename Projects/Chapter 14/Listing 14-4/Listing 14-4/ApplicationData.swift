
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

      for await notification in center.notifications(named: name, object: nil) {
         if let info = notification.userInfo {
            let type = info["type"] as? String
            if type == "Miracle" {
               print("The Miracle title was inserted")
            }
         }
         await MainActor.run {
            total = titles.count
         }
      }
   }
}

