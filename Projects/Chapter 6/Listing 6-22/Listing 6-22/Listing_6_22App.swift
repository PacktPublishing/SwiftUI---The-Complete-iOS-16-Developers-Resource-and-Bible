
import SwiftUI

@main
struct Listing_6_22App: App {
   @StateObject private var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(appData)
      }
   }
}

