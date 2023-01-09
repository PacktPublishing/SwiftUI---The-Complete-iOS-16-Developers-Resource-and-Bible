
import SwiftUI

@main
struct Listing_8_2App: App {
   @StateObject var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(appData)
      }
   }
}

