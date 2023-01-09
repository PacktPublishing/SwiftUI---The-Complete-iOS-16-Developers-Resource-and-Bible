
import SwiftUI

@main
struct Listing_6_18App: App {
   @StateObject private var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView(appData: appData)
      }
   }
}

