
import SwiftUI
import UserNotifications

class ApplicationData: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
   override init() {
      super.init()
      let center = UNUserNotificationCenter.current()
      center.delegate = self
   }
   @MainActor
   func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
      let identifier = response.actionIdentifier
      if identifier == "deleteButton" {
         print("Delete Message")
      }
   }
}

