
import SwiftUI

@main
struct Listing_19_10App: App {
   @StateObject var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(appData)
      }
      #if os(macOS)
      .commands {
         ImportFromDevicesCommands()
      }
      #endif
   }
}

