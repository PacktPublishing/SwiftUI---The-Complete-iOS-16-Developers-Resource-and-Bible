
import SwiftUI

@main
struct Listing_19_29App: App {
   var body: some Scene {
      WindowGroup {
         ContentView()
      }
      #if os(macOS)
      MenuBarExtra("My Control", systemImage: "phone") {
         Button("Option 1") {
            print("Option 1")
         }
         Button("Option 2") {
            print("Option 2")
         }
         Divider()
         Button("Quit") {
            NSApplication.shared.terminate(nil)
         }
      }
      #endif
   }
}

