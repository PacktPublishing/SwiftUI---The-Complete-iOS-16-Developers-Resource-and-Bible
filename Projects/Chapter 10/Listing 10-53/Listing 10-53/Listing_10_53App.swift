
import SwiftUI

@main
struct Listing_10_53App: App {
   @StateObject var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(appData)
            .environment(\.managedObjectContext, appData.container.viewContext)
      }
   }
}

