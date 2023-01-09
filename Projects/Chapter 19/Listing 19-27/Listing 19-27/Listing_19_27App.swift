
import SwiftUI

@main
struct Listing_19_27App: App {
   var body: some Scene {
      WindowGroup {
         ContentView()
      }
      #if os(macOS)
      Window("My Window", id: "mywindow") {
         AuxiliaryView()
      }
      .defaultSize(width: 200, height: 200)
      .defaultPosition(.topLeading)
      .commandsRemoved()
      #endif
   }
}

