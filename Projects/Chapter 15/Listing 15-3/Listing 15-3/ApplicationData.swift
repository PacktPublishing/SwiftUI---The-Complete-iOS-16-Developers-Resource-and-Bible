
import SwiftUI

struct PersonalInfo: Codable {
   var name: String
   var address: String
   var city: String
}
class ApplicationData: ObservableObject {
   @Published var userInfo: PersonalInfo
   let storage: NSUbiquitousKeyValueStore

   init() {
      storage = NSUbiquitousKeyValueStore()

      userInfo = PersonalInfo(name: "", address: "", city: "")
      if let dataInfo = storage.data(forKey: "info") {
         let decoder = JSONDecoder()
         if let info = try? decoder.decode(PersonalInfo.self, from: dataInfo) {
            userInfo = info
         }
      }
   }
   func setInfo() {
      let encoder = JSONEncoder()
      if let data = try? encoder.encode(userInfo) {
         storage.set(data, forKey: "info")
      }
   }
   func valueReceived() async {
      let center = NotificationCenter.default
      let name = NSUbiquitousKeyValueStore.didChangeExternallyNotification
      for await notification in center.notifications(named: name, object: storage) {
         if notification.name == name {
            await MainActor.run {
               if let dataInfo = storage.data(forKey: "info") {
                  let decoder = JSONDecoder()
                  if let info = try? decoder.decode(PersonalInfo.self, from: dataInfo) {
                     userInfo = info
                  }
               }
            }
         }
      }
   }
}

