
import SwiftUI

@main
struct Listing_15_35App: App {
   @UIApplicationDelegateAdaptor(CustomAppDelegate.self) var appDelegate
   @StateObject var appData = ApplicationData.shared

   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(appData)
      }
   }
}

