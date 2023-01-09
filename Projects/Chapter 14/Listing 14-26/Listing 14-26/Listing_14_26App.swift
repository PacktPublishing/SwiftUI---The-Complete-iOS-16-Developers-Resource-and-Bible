
import SwiftUI

@main
struct Listing_14_26App: App {
   @Environment(\.scenePhase) var scenePhase

   var body: some Scene {
      WindowGroup {
         ContentView()
            .onChange(of: scenePhase) { phase in
               if phase == .active {
                  print("The app is active")
               } else if phase == .background {
                  print("The app is in the background")
               }
            }
      }
   }
}

