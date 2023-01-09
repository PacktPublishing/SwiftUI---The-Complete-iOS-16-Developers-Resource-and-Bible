
import SwiftUI

@main
struct Listing_18_18App: App {
   @StateObject var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(appData)
      }
   }
}

