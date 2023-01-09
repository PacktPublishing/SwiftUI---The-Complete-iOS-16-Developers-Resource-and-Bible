
import SwiftUI

@main
struct Listing_15_20App: App {
   @StateObject var appData = ApplicationData()
   
   var body: some Scene {
      WindowGroup {
         ContentView()
            .environment(\.managedObjectContext, appData.container.viewContext)
      }
   }
}

