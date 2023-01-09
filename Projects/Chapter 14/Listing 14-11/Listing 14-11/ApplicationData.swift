
import SwiftUI

class ApplicationData: ObservableObject {
   @Published var isLandscape: Bool = false

   init() {
      Task(priority: .background) {
         await receiveNotification()
      }
   }
   func receiveNotification() async {
      let center = NotificationCenter.default
      let name = await UIDevice.orientationDidChangeNotification
      for await _ in center.notifications(named: name, object: nil) {
         await MainActor.run {
            let device = UIDevice.current
            let orientation = device.orientation
            isLandscape = orientation.isLandscape
         }
      }
   }
}

