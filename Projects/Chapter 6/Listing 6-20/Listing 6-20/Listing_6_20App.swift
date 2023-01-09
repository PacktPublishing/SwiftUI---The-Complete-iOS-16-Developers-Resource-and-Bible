
import SwiftUI

@main
struct Listing_6_20App: App {
   @StateObject private var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(appData)
      }
   }
}

