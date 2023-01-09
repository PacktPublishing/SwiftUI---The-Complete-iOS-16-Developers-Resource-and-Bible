
import SwiftUI
import UserNotifications

class ApplicationData: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
   override init() {
      super.init()
      let center = UNUserNotificationCenter.current()
      center.delegate = self
   }
   func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
      return [.banner]
   }
}

