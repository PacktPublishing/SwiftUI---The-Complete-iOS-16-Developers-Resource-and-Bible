
import SwiftUI

@main
struct Listing_6_19App: App {
   @StateObject private var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView(appData: appData)
      }
   }
}

