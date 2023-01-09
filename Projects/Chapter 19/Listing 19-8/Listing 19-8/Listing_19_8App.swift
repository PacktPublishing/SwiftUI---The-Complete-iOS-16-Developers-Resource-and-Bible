
import SwiftUI

@main
struct Listing_19_8App: App {
   @StateObject var appData = ApplicationData()

   var body: some Scene {
      WindowGroup {
         ContentView()
            .environmentObject(appData)
      }
      #if os(macOS)
      .commands {
         CommandGroup(after: .newItem, addition: {
            Picker("Options", selection: $appData.selectedOption) {
               Text("Option 1").tag(1)
               Text("Option 2").tag(2)
               Text("Option 3").tag(3)
            }
         })
      }
      #endif
   }
}

