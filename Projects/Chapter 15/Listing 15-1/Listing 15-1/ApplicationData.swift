
import SwiftUI

class ApplicationData: ObservableObject {
   @Published var control: Double = 0
   let storage: NSUbiquitousKeyValueStore

   init() {
      storage = NSUbiquitousKeyValueStore()
      control = storage.double(forKey: "control")
   }
   func valueChanged(value: Double) {
      if control != storage.double(forKey: "control") {
         storage.set(value, forKey: "control")
         storage.synchronize()
      }
   }
   func valueReceived() async {
      let center = NotificationCenter.default
      let name = NSUbiquitousKeyValueStore.didChangeExternallyNotification
      for await notification in center.notifications(named: name, object: storage) {
         if notification.name == name {
            await MainActor.run {
               control = storage.double(forKey: "control")
            }
         }
      }
   }
}

