
import SwiftUI

@main
struct Listing_10_72App: App {
   @StateObject var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(appData)
            .environment(\.managedObjectContext, appData.container.viewContext)
      }
   }
}

