
import UIKit

class CustomAppDelegate: NSObject, UIApplicationDelegate {
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      print("App has launched")
      return true
   }
   func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
      let config = UISceneConfiguration(name: "Custom Delegate", sessionRole: connectingSceneSession.role)
      if connectingSceneSession.role == .windowApplication {
         config.delegateClass = CustomSceneDelegate.self
      }
      return config
   }
}
