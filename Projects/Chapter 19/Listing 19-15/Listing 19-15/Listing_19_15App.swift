
import SwiftUI

@main
struct Listing_19_15App: App {
   @StateObject var appData = ApplicationData()
   @FocusedValue(\.address) var addressValue: String?

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
            }.disabled(addressValue == nil)
         })
      }
      #endif
   }
}

