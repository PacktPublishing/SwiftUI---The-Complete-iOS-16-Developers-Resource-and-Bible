
import SwiftUI

@main
struct Listing_19_4App: App {
   var body: some Scene {
      WindowGroup {
         ContentView()
      }
      #if os(macOS)
      .commands {
         CommandMenu("Options") {
            Button("Option 1") {
               print("This is the option 1")
            }
            Button("Option 2") {
               print("This is the option 2")
            }
         }
      }
      #endif
   }
}

