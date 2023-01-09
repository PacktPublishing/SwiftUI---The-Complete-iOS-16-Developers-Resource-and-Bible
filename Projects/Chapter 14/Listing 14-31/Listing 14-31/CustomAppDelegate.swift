
import UIKit

class CustomAppDelegate: NSObject, UIApplicationDelegate {
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      let appData = ApplicationData.shared
      appData.maintext = "Text From Delegate"
      return true
   }
}

