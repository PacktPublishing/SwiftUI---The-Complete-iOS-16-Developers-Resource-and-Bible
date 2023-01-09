
import SwiftUI

@main
struct Listing_19_7App: App {
   var body: some Scene {
      WindowGroup {
         ContentView()
      }
      #if os(macOS)
      .commands {
         CommandGroup(replacing: .newItem, addition: {})
         CommandGroup(after: .newItem, addition: {
            Button("Option 1") {
               print("This is option 1")
            }
         })
      }
      #endif
   }
}

