
import SwiftUI

@main
struct Listing_19_26App: App {
   var body: some Scene {
      WindowGroup {
         ContentView()
      }
      #if os(macOS)
      Window("My Window", id: "mywindow") {
         AuxiliaryView()
      }
      #endif
   }
}

