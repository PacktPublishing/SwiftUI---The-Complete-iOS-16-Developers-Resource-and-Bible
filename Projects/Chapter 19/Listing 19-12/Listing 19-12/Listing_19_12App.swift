
import SwiftUI

@main
struct Listing_19_12App: App {
   @StateObject var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(appData)
      }
      #if os(macOS)
      .commands {
         CommandGroup(after: .newItem, addition: {
            Button("Option 1") {
               print("This is option 1")
            }.disabled(appData.inputMessage.isEmpty)
         })
      }
      #endif
   }
}

